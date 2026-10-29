# IEEE/CIGRE DLL ("real code") model libraries of OpenIPSL

This folder holds the C sources, the build project and the test of the external libraries used by
`OpenIPSL.Electrical.Controls.IEEE_CIGRE`: controller models written according to the IEEE/CIGRE DLL Modeling
Standard (API V2), each compiled together with a small OpenIPSL adapter into one shared library per model. The
prebuilt libraries are in `../../Library/win64` and `../../Library/linux64`; their provenance is in
`../../Library/README.md`.

| Library | Model | Origin | Sample time (compile-time constant) |
|---|---|---|---|
| `SCRX9` | SCRX bus-fed or solid-fed static exciter, 7 inputs, 1 output, 8 parameters, 6 double states | example model of the standard (G. Irwin, Electranix, 2021), CIGRE JWG B4.82 example code `DLL_V1_1`; another revision is printed in CIGRE TB 958, Appendix E | 0.005 s |
| `GFM_GFL_IBR` | grid-forming / grid-following inverter-based resource (EMT), 12 inputs, 12 outputs, 41 parameters, 36 double states | EPRI `GFM-GFL-IBR-PWM-Model` (D. Ramasubramanian, 2022), CIGRE JWG B4.82 example code `DLL_V1_1`; cite [EPRI2023], [Ramasubramanian2022] | 1e-5 s |

Where each source comes from and every difference from its original: provenance block at the top of each file,
and the class `OpenIPSL.Electrical.Controls.IEEE_CIGRE.Provenance`.

## Files

| Path | Content |
|---|---|
| `include/IEEE_Cigre_DLLInterface.h`, `include/IEEE_Cigre_DLLInterface_types.h` | the standard's two headers (API V2) as distributed by CIGRE JWG B4.82 (`DLL_V1_1`) and in OpenIPSL PR #362, with the PR's non-standard `rec_struct` removed and an OpenIPSL provenance block added at the top; the code matches TB 958 Appendix D token for token |
| `include/ieee_cigre_export.h` | export and calling-convention macros (`IEEE_CIGRE_EXPORT <type> IEEE_CIGRE_CALL <name>`) and the prototypes of the standard's eight entry points |
| `include/oipsl_cigre_adapter.h` | prototypes of the OpenIPSL adapter, prefixed per library with `-DOIPSL_PREFIX=<Name>` |
| `src/oipsl_cigre_adapter.c` | the generic adapter (one source for every model) |
| `src/SCRX9.c`, `src/GFM_GFL_IBR.c` | the model sources; the provenance block at the top of each file lists every difference from the CIGRE JWG B4.82 original and every change against PR #362 |
| `test/adapter_test.c` | test program, built once per library and run by `ctest` |
| `test/layout_test.c` | layout test, built once per library: the model's private structures against the adapter's block layout |
| `test/two_libraries_test.c` | one program linked against both libraries (both link orders) |
| `CMakeLists.txt` | build project: one SHARED library and one test per model; `install()` into `../../Library/<platform>` |
| `build_win64.bat`, `build_linux64.sh` | the two builds as they were run for the shipped binaries |

## The OpenIPSL adapter

Every IEEE/CIGRE DLL exports the same eight names (`Model_GetInfo`, `Model_CheckParameters`,
`Model_Initialize`, `Model_Outputs`, ...), so a Modelica model that links two of them could not tell them
apart. Each library therefore also exports six adapter functions with the library name as prefix, compiled
from the one generic source `src/oipsl_cigre_adapter.c` with `-DOIPSL_PREFIX=<Name>`; the Modelica wrappers call
only these (all but `status`, which is there for other hosts), through `annotation(Library="<Name>", LibraryDirectory="modelica://OpenIPSL/Resources/Library")`.
The model source stays a valid IEEE/CIGRE DLL for any other simulation tool. On Linux the libraries are linked
with `-Bsymbolic`, so that the adapter in each library calls the `Model_*` functions of its own library: without
it, ELF symbol interposition made the adapter of the second library loaded into a process drive the model of the
first one (measured with the libraries of 2026-10-25 11:31; Windows DLLs bind their internal calls at link time
and were not affected). `test/two_libraries_test.c` checks this on every platform.

| Function (`P` = library name) | What it does |
|---|---|
| `void* P_oipsl_create(const double* parameters, size_t nParameters, const double* initialInputs, size_t nInputs, const double* initialOutputs, size_t nOutputs, int simToolMode)` | refuses a `simToolMode` other than 1 (EMT) or 2 (RMS); reads `Model_GetInfo()`; lays out the input, output and parameter blocks with the natural alignment of C structures (offset rounded up to each field's type alignment, `Width` scalars per port), which reproduces the model's private structures, e.g. SCRX9's 64-byte parameter block with the `int32` `CSwitch` at byte 48 and `RCdRFD` at byte 56; converts the doubles to each `DataType`; allocates the state arrays; sets `Time = 0` and `SimTool_EMT_RMS_Mode = simToolMode` (1 = EMT, 2 = RMS); calls `Model_CheckParameters` and `Model_Initialize`. Returns NULL on a size mismatch, an unknown data type, an invalid `simToolMode` or a return code 2 |
| `int P_oipsl_step(void* obj, double t, const double* inputs, size_t nInputs, double* outputs, size_t nOutputs)` | one step of `FixedStepBaseSampleTime`: copies the inputs, sets `Time = t`, calls `Model_Outputs` once, copies the outputs. Returns the model's code (0 OK, 1 message, 2 error), -1 for a NULL object, -2 for a size mismatch |
| `void P_oipsl_free(void* obj)` | `Model_Terminate`, then frees everything; NULL is a no-op |
| `double P_oipsl_sampleTime(void)` | `Model_GetInfo()->FixedStepBaseSampleTime` |
| `int P_oipsl_count(int what)` | 0 scalar inputs, 1 scalar outputs, 2 parameters, 3 double states, 4 int states, 5 float states, 6/7 input/output ports, 10/11/12 input/output/parameter block bytes, 1000+i / 2000+i / 3000+i byte offset of parameter i / input port i / output port i; -1 otherwise |
| `int P_oipsl_status(void* obj)` | status of the last call (codes as for `step`; -1 for NULL) |

The adapter reports only through return codes and the standard error stream (one line per distinct message,
with the library name, the model name and the time): `LastErrorMessage`, `LastGeneralMessage`, size
mismatches, and parameters outside the `[MinValue, MaxValue]` range of `ParametersInfo` (a warning, the value
is used). It does not call ModelicaUtilities (a DLL cannot import functions from the simulation executable that
loads it; in OpenModelica 1.27.1 a `ModelicaFormatError` inside an ExternalObject constructor terminates the
simulation without a message), opens no files and keeps no global state of its own. Before every call of the
model it sets `LastErrorMessage` and `LastGeneralMessage` to an empty string, not NULL: the SCRX9 example printed
in TB 958 Appendix E tests `instance->LastErrorMessage[0]` before setting it and crashed (access violation) with
NULL pointers (measured 2026-10-28; with empty strings it gives the same outputs as the shipped SCRX9).

## Building

Requirements: a C11 compiler and CMake 3.20 or newer (`ctest --test-dir` needs 3.20).
Build outside folders synchronised by Dropbox, OneDrive and the like: their file locks make compilers and
linkers fail at random.

Windows, MSVC x64: Visual Studio 2022 or later with the C++ workload and its component "C++ CMake tools for
Windows" (CMake and Ninja), or any CMake 3.20 or newer on PATH; the shipped binaries were built with Visual Studio
Community 2026 18.11.2:

```bat
build_win64.bat [build folder]
```

which puts the Visual Studio Installer folder (where `vcvarsall.bat` finds `vswhere.exe`) on PATH and runs, after
`"C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build\vcvarsall.bat" x64`
(set `VCVARSALL` for another installation; default build folder `%TEMP%\cigre_build\win64`):

```bat
cmake -S . -B <build> -G Ninja -DCMAKE_BUILD_TYPE=Release
cmake --build <build> --config Release
ctest --test-dir <build> -C Release --output-on-failure
cmake --install <build> --config Release
```

Linux, gcc; the shipped `linux64` libraries were built on Ubuntu 26.04.1 LTS under WSL2. From Windows:

```sh
wsl.exe -d Ubuntu-26.04 -- sh /mnt/<drive>/<checkout>/OpenIPSL/Resources/C-Sources/IEEE_CIGRE/build_linux64.sh
```

(`/mnt/<drive>/<checkout>` is the Windows checkout as WSL sees it), or inside Linux `sh build_linux64.sh [build folder]` (default
`/tmp/cigre_build_linux64`), which runs

```sh
cmake -S . -B <build> -DCMAKE_BUILD_TYPE=Release
cmake --build <build>
ctest --test-dir <build> --output-on-failure
cmake --install <build>
```

`cmake --install` copies `<Name>.dll` + `<Name>.lib` (Windows) or `lib<Name>.so` (Linux) to
`OpenIPSL/Resources/Library/<platform>/` (platform `win64`, `linux64`, ... from the target system and pointer
size). With `--prefix <stage>` they go to `<stage>/Library/<platform>/` instead. A CI job that builds, tests
and installs this way on `ubuntu-latest` and `windows-latest` and uploads `stage` as an artifact is proposed
separately; it would not commit binaries. The committed binaries are those listed below.

Compiler settings (from `CMakeLists.txt`): C11; MSVC `/O2 /Ob2 /DNDEBUG /W4 /utf-8 /Brepro`, linked with
`/Brepro`, and the static C runtime `/MT` (`CMAKE_MSVC_RUNTIME_LIBRARY = MultiThreaded`), so the DLLs depend on
`KERNEL32.dll` only and contain no time stamps; gcc `-O3 -DNDEBUG -Wall -Wextra -fvisibility=hidden -fPIC`,
linked with `-Wl,-Bsymbolic -lm` (Linux). With MinGW the libraries get the same names (`<Name>.dll`, import
library `<Name>.lib`). The sources also build with OpenModelica's MinGW-w64 gcc 16.1.0 (ucrt64; put
`tools\msys\ucrt64\bin` first on PATH), where all six tests pass too.

Warnings: the adapter and the three test programs compile without warnings with all three compilers. The model sources keep
their own warnings, left alone on purpose (the control logic is not edited to silence them): unused local
variables (MSVC C4189 / gcc `-Wunused-variable`), the unused `instance` argument of `Model_Terminate` (C4100 /
`-Wunused-parameter`) and, in `GFM_GFL_IBR.c`, "potentially uninitialized" variables (C4701 /
`-Wmaybe-uninitialized`) that belong to the `Wtype` and `PQflag` branches; `Model_CheckParameters` now rejects
flag values outside {0, 1}, which are the only ones the code implements.

## Tests

`test/adapter_test.c` links against the shared library like a simulation tool and calls only exported
functions. For each model it checks the `count()` values and the block layout (SCRX9: 64 bytes, `CSwitch` at
48, `RCdRFD` at 56; GFM_GFL_IBR: 41 doubles = 328 bytes), creates an instance with the `ParametersInfo`
defaults and the initial inputs and outputs that `Model_Initialize` works back from, runs 2000 steps with
constant inputs and checks that the outputs stay finite and settle (SCRX9: EFD stays at EFD0 = 1.3;
GFM_GFL_IBR at rest: outputs 4-12 constant, Freq_pll = 60 Hz, Ea/Eb/Ec a balanced set of amplitude
0.2 Vdcbase/2), then model-specific behaviour (SCRX9: a VT step changes EFD only with CSwitch = 0, IFD < 0 gives
EFD = -IFD RCdRFD; GFM_GFL_IBR: initial Pout/Qout seed Idref/Iqref; droop mode) and the error paths (size
mismatches, rejected parameters, `simToolMode` other than 1 or 2, NULL objects).

`test/layout_test.c` compiles the model source itself (entry points renamed, nothing exported) and compares
`offsetof`/`sizeof` of the model's private structures `MyModelParameters`, `MyModelInputs` and `MyModelOutputs`
with the offsets and block sizes that the adapter in the library computes from `Model_GetInfo()` (`count(10..12)`,
`count(1000 + i)`, `count(2000 + i)`, `count(3000 + i)`), so a layout difference of any compiler that builds the
libraries shows up. `test/two_libraries_test.c` links one program against both libraries, in both orders, as a Modelica tool
does when one model uses both, and checks that each adapter reaches its own model (counts, sample time, create,
2000 interleaved steps). Linked against the `linux64` libraries of 2026-10-25 11:31 (without `-Bsymbolic`) it
fails 5 of its checks in either order.

Results on 2026-10-25 (after the review fixes): `ctest` 6 of 6 passed with MSVC, gcc (WSL) and MinGW gcc;
`adapter_test` 55 (SCRX9) and 60 (GFM_GFL_IBR) checks, `layout_test` 27 and 76 checks, `two_libraries_test`
14 checks in each link order.

## Shipped binaries

Built on 2026-10-28 with `build_win64.bat` (Visual Studio Community 2026 18.11.2) and `build_linux64.sh`, after
the adapter change of that day (message pointers start as an empty string, not NULL; the outputs are bit-identical
to the libraries of 2026-10-25); details, sizes and the tool lookups are in `../../Library/README.md`.
Both builds are reproducible with the same tool chain: two build folders gave bit-identical DLLs, import
libraries and shared objects. A newer Visual Studio or Windows SDK gives DLLs that differ in a few bytes (import
hints and the hash derived from them; see `../../Library/README.md`). The libraries are meant to be rebuilt and
re-shipped with the current tool chain when the tools are updated, so that they never become stale binaries;
`../../Library/README.md`, section "Rebuilding", explains why.

| File | Built with | SHA-256 |
|---|---|---|
| `win64/SCRX9.dll` | MSVC 19.51.36260 x64, `/MT /Brepro` | `04eda5535a0a9e7d56f881759def04a023c768d77b4b4b6be98634b72cb2bec8` |
| `win64/SCRX9.lib` | (import library) | `cacc6b290ae6f613b98efe3ac4aea667700267cda39162fd350f896d41d5eda8` |
| `win64/GFM_GFL_IBR.dll` | MSVC 19.51.36260 x64, `/MT /Brepro` | `87f1004d0b2dfc2d14590406b81e9669ca6b9f1f7431f77928baa9af8cc82369` |
| `win64/GFM_GFL_IBR.lib` | (import library) | `307dc68ef7c447adf2db325e3f2a144508f909380da212b83edcdc5f1efffee4` |
| `linux64/libSCRX9.so` | gcc 15.2.0, `-Wl,-Bsymbolic`, Ubuntu 26.04.1 (WSL2), glibc 2.43 | `171f5e3209d74b7397175a09c7d7d3e3066eb4381f55eb8b9a91708e9da5e7e4` |
| `linux64/libGFM_GFL_IBR.so` | gcc 15.2.0, `-Wl,-Bsymbolic`, Ubuntu 26.04.1 (WSL2), glibc 2.43 | `3e4435d94695d1cfe0853ef871ee9d190796afbba2347accc9bc761c3d4a2e32` |

After a rebuild, update both tables (here and in `../../Library/README.md`).

## How the Modelica tools find the libraries (measured on Windows 11, 2026-10-25)

All three tools link the import library `win64/<Name>.lib` named by `annotation(Library="<Name>",
LibraryDirectory="modelica://OpenIPSL/Resources/Library")` and load `win64/<Name>.dll` from the library folder;
nothing is copied. Dymola 2026x Refresh 1 delay-loads the DLL from its absolute path compiled into the simulator
and selects 64-bit by itself; OpenModelica 1.27.1 links the MSVC `.lib` with MinGW ld and puts the folder on
PATH in the generated `.bat`; System Modeler 15.0 needs both `<Name>.lib` and `<Name>.dll` in the folder, puts
it on PATH, and asks to trust the library before it evaluates external functions. Details in
`../../Library/README.md`. On Ubuntu 24.04 LTS under WSL2 (glibc 2.39, 2026-10-25) the three tools ran the
tests with the shipped `linux64` libraries and reproduced their Windows results; Dymola and OpenModelica write the
library folder into the executable, System Modeler does not, so a System Modeler executable run outside the tool
needs `Resources/Library/linux64` on `LD_LIBRARY_PATH`.

## Known limitations

- The sample time of each model is a compile-time constant of the model (`Model_Info.FixedStepBaseSampleTime`):
  1e-5 s for GFM_GFL_IBR, 0.005 s for SCRX9. The PSCAD test setup of PR #362 used 2e-5 s for the GFM model;
  that step cannot be selected by a parameter. It needs an edited copy of `src/GFM_GFL_IBR.c` built as a
  library with another name.
- The models implement six of the standard's eight entry points (`Model_FirstCall` and `Model_Iterate` are
  optional in the standard and absent here), so each library exports these six plus the six adapter functions.
  The adapter never calls `Model_FirstCall` or `Model_Iterate`, also for other models built with it.
- The vendor models keep a file-scope message buffer (`ErrorMessage`) shared by all instances of one library;
  states, inputs, outputs and parameters are per instance. Stepping instances of one library from several
  threads at once (for example parallel FMU instances) keeps states and outputs correct, but messages can be
  lost, printed empty or reported by the wrong instance (measured by the review of 2026-10-25 with 2000
  instances on two threads).
- The adapter is generic, but three cases are handled only as follows (none occurs in SCRX9 or GFM_GFL_IBR, whose
  ports are all `real64_T` and whose only other parameter type is the `int32_T` `CSwitch`): a `c_string_T`
  parameter always receives its `ParametersInfo` default and the double passed for it is ignored, and a
  `c_string_T` input port receives NULL; inputs of integer or `real32_T` ports are rounded and saturated to
  the type's range (or rounded to float) without a message (parameters get a warning on stderr).
- `GFM_GFL_IBR` implements only `Wtype` 0 (PLL) and 1 (droop) and `PQflag` 0 and 1, hard-codes 60 Hz and
  `PI = 3.14159265` (vendor code, unchanged).

## Provenance, licences and citations

- `IEEE_Cigre_DLLInterface.h`, `IEEE_Cigre_DLLInterface_types.h`: the interface files of the IEEE/CIGRE DLL
  Modeling Standard, published by CIGRE JWG B4.82/IEEE in Technical Brochure 958, "Guidelines for use of
  real-code in EMT models for HVDC, FACTs and inverter based generators in power systems analysis", 2025,
  Appendix D. Copyright CIGRE and IEEE; they are not covered by the OpenIPSL licence. They are kept as
  distributed by CIGRE JWG B4.82 (example code `DLL_V1_1`) and in OpenIPSL PR #362, with the PR's `rec_struct`
  removed and an OpenIPSL provenance block added at the top; their code matches TB 958 Appendix D token for
  token (compared on 2026-10-28).
- `SCRX9.c`: example model of the standard by Garth D. Irwin (Electranix), 2021, in the revision of the CIGRE
  JWG B4.82 example code `DLL_V1_1`; TB 958, Appendix E prints another revision with the same control code
  (return-code tests and empty `Model_FirstCall`, `Model_Iterate` added). Copyright of its author and of
  CIGRE/IEEE; not covered by the OpenIPSL licence.
- `GFM_GFL_IBR.c`: EPRI's `GFM-GFL-IBR-PWM-Model` by Deepak Ramasubramanian, 2022, as distributed in the CIGRE
  JWG B4.82 example code `DLL_V1_1`. EPRI (D. Ramasubramanian, S. Thakar) gave written permission on 2026-06-09
  to distribute it in the OpenIPSL repository on condition that [EPRI2023] and [Ramasubramanian2022] are cited.
  The source is not printed in [EPRI2023] (its Appendix B holds a different model), so the report's CC BY 4.0
  licence does not extend to it. Not covered by the OpenIPSL licence.
- Every difference of the three files from their originals, and who made it, is listed in the provenance block of
  each file and in `OpenIPSL.Electrical.Controls.IEEE_CIGRE.Provenance`.
- `ieee_cigre_export.h`, `oipsl_cigre_adapter.h`, `oipsl_cigre_adapter.c`, `adapter_test.c`, the CMake project
  and the scripts: OpenIPSL, BSD 3-Clause License.

Cite:

- H. Chang and L. Vanfretti, "Integrating the IEEE/CIGRE DLL Modeling Standard to Use 'Real Code' Models for
  Power System Analysis in Modelica Tools," Proceedings of the American Modelica Conference 2024, October 14-16,
  2024, Storrs, Connecticut, USA. DOI: [10.3384/ecp20772](https://doi.org/10.3384/ecp20772)
- H. Chang and L. Vanfretti, "EMT Modelling and Simulation of Grid Following Converters in Modelica Integrating
  the IEEE/CIGRE 'Real Code'/DLL Modelling Guidelines," CIGRE Paris Session 2026, paper C4-10724, Paris, France,
  August 2026.
  [e-cigre](https://www.e-cigre.org/publications/detail/c4-10724-2026-emt-modelling-and-simulation-of-grid-following-converters-in-modelica-integrating-the-ieeecigre-real-codedll-modelling-guidelines.html)
- [EPRI2023] EPRI, "Code Based Generic Inverter Based Resource Model," Technical Update 3002028322, Palo Alto,
  CA, November 2023 (CC BY 4.0). <https://www.epri.com/research/products/000000003002028322>
- [Ramasubramanian2022] D. Ramasubramanian, "Differentiating between plant level and inverter level voltage
  control to bring about operation of 100% inverter-based resource grids," Electric Power Systems Research,
  vol. 205, 107739, April 2022. DOI: [10.1016/j.epsr.2021.107739](https://doi.org/10.1016/j.epsr.2021.107739)
