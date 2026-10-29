# Prebuilt external libraries of OpenIPSL

This folder is the `LibraryDirectory` of OpenIPSL's external functions
(`LibraryDirectory="modelica://OpenIPSL/Resources/Library"`, the default location of the Modelica
specification), with one sub-folder per platform (`win64`, `linux64`; MLS 3.6, section 12.9.4).

It holds the IEEE/CIGRE DLL ("real code") model libraries used by `OpenIPSL.Electrical.Controls.IEEE_CIGRE`.
Each library is one model written according to the IEEE/CIGRE DLL Modeling Standard (API V2) plus the OpenIPSL
adapter, built from the sources in `../C-Sources/IEEE_CIGRE/` (see the README there for the sources, the
adapter interface and the licences). The Modelica wrappers call only adapter functions (`<Name>_oipsl_create`,
`_step`, `_free`, `_sampleTime`, `_count`; `_status` is exported for other hosts).

| File | Size (bytes) | SHA-256 |
|---|---|---|
| `win64/SCRX9.dll` | 155,648 | `04eda5535a0a9e7d56f881759def04a023c768d77b4b4b6be98634b72cb2bec8` |
| `win64/SCRX9.lib` | 3,996 | `cacc6b290ae6f613b98efe3ac4aea667700267cda39162fd350f896d41d5eda8` |
| `win64/GFM_GFL_IBR.dll` | 184,832 | `87f1004d0b2dfc2d14590406b81e9669ca6b9f1f7431f77928baa9af8cc82369` |
| `win64/GFM_GFL_IBR.lib` | 4,314 | `307dc68ef7c447adf2db325e3f2a144508f909380da212b83edcdc5f1efffee4` |
| `linux64/libSCRX9.so` | 34,480 | `171f5e3209d74b7397175a09c7d7d3e3066eb4381f55eb8b9a91708e9da5e7e4` |
| `linux64/libGFM_GFL_IBR.so` | 45,496 | `3e4435d94695d1cfe0853ef871ee9d190796afbba2347accc9bc761c3d4a2e32` |

## Provenance (all built on 2026-10-28)

`win64` (MSVC):

- Machine: Windows 11 Pro 10.0.26300, x64.
- Tool chain: Visual Studio Community 2026 18.11.2 (installation version 18.11.12324.101), MSVC `cl` 19.51.36260
  for x64 (tools 14.51.36231), `link` 14.51.36260.0, Windows SDK 10.0.26100.0; CMake 4.3.1-msvc1 and Ninja 1.13.2
  as bundled with Visual Studio.
- Compile: `/O2 /Ob2 /DNDEBUG -std:c11 -MT /W4 /utf-8 /Brepro -DOIPSL_PREFIX=<Name>`; link: `/dll /machine:x64
  /INCREMENTAL:NO /Brepro`. Static C runtime (`/MT`): each DLL depends on `KERNEL32.dll` only (`dumpbin
  /dependents`), no Visual C++ redistributable is needed. PE32+ x64 (`8664 machine`). `/Brepro` replaces the time
  stamps of the PE file by a hash of its content, so the build is reproducible with the same tool chain: a
  second build folder gave bit-identical DLLs and import libraries. A different tool chain gives different files
  from the same sources: the DLLs built on 2026-10-25 with Visual Studio 18.10.4 (same `cl` 19.51.36260) and a
  rebuild of the same sources with 18.11.2 had an identical code section and differed in 120 bytes each, the
  `KERNEL32` import hints taken from the SDK's `kernel32.lib` and the `/Brepro` hash and time stamps derived from
  them; the import libraries were identical.
- Exports (`dumpbin /exports`, 12 names each): `Model_CheckParameters`, `Model_GetInfo`, `Model_Initialize`,
  `Model_Outputs`, `Model_PrintInfo`, `Model_Terminate` and `<Name>_oipsl_count`, `_create`, `_free`,
  `_sampleTime`, `_status`, `_step`. `<Name>.lib` is the import library of `<Name>.dll` (same 12 names).

`linux64` (gcc):

- Machine: Ubuntu 26.04.1 LTS under WSL2 (kernel 6.18.33.2-microsoft-standard-WSL2), x86-64.
- Tool chain: gcc (Ubuntu 15.2.0-16ubuntu1) 15.2.0, GNU ld 2.46, glibc 2.43 (Ubuntu GLIBC 2.43-2ubuntu2.4),
  CMake 4.2.3, GNU Make 4.4.1.
- Compile: `-O3 -DNDEBUG -std=c11 -fPIC -fvisibility=hidden -Wall -Wextra -DOIPSL_PREFIX=<Name>`; link:
  `-shared -Wl,-Bsymbolic -Wl,-soname,lib<Name>.so -lm`. `-Bsymbolic` (dynamic section `FLAGS SYMBOLIC`, no
  `JUMP_SLOT` relocation against a `Model_*` name) makes the adapter call the `Model_*` functions of its own
  library; without it, a program that loads two of these libraries had the second library's adapter drive the
  first library's model (ELF symbol interposition; found by the review of 2026-10-25, fixed the same day).
- ELF64 x86-64 shared objects; `NEEDED libc.so.6` (and `libm.so.6` for GFM_GFL_IBR); highest symbol version
  required: `GLIBC_2.4` (`objdump -T`), so they should load on any x86-64 Linux with glibc 2.4 or newer (only
  Ubuntu 26.04 was tried). Exports (`nm -D --defined-only`): the same 12 names as on Windows. The build is
  reproducible: a second build tree gave bit-identical files.

Both platforms: `ctest` ran six tests against these libraries (2026-10-28), all passed: `adapter_test_SCRX9` (55 checks),
`adapter_test_GFM_GFL_IBR` (60), `layout_test_SCRX9` (27), `layout_test_GFM_GFL_IBR` (76) and
`two_libraries_test` linked in both orders (14 each). The sources also build and pass the six tests with
OpenModelica's MinGW-w64 gcc 16.1.0 (not shipped; checked with the sources of 2026-10-25).

Rebuilt on 2026-10-28 because the adapter now sets `LastErrorMessage` and `LastGeneralMessage` to an empty
string instead of NULL before each call of the model (see `../C-Sources/IEEE_CIGRE/README.md`). The model code is
unchanged. Against the libraries of 2026-10-25, the new ones give bit-identical outputs (all outputs, every
sample: SCRX9 1201 samples; GFM_GFL_IBR 100 001 samples in PLL and in droop mode; a C program stepping both with
identical inputs), and OpenModelica 1.27.1 on Windows gives identical result files for
`Tests.Controls.IEEE_CIGRE.GFM.GFL_FaultPSCAD` (5.8 s) and `Tests.Controls.IEEE_CIGRE.SCRX9.SCRX9`. The runs of
Dymola and System Modeler, and those on Linux, were made with the libraries of 2026-10-25.

## Rebuilding

The binaries here are not meant to stay as they are. Real-code models are often distributed only as compiled
DLLs: a single platform, sometimes 32-bit only, sometimes linked against the Visual Studio debug runtime, which
may not be redistributed, and without a way to rebuild them when the tools change. OpenIPSL ships instead the
sources, the build project and the tests, uses only freely available tools (Visual Studio Community or any CMake
with MSVC, MinGW-w64 or gcc), and links the C runtime statically on Windows, so the libraries need no Visual
Studio on the user's machine. Whenever Visual Studio, the Windows SDK, gcc or CMake are updated, the libraries
can be rebuilt and re-shipped with the most recent tool chain (run the tests, update the tables), instead of
remaining stale binaries that only their original build machine could reproduce.

From `../C-Sources/IEEE_CIGRE/` (CMake 3.20 or newer; build outside Dropbox/OneDrive-synchronised folders):

- Windows (Visual Studio 2022 or later with the C++ workload and its component "C++ CMake tools for Windows"):
  `build_win64.bat [build folder]`, i.e. `"C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build\vcvarsall.bat" x64`, then
  `cmake -S . -B <build> -G Ninja -DCMAKE_BUILD_TYPE=Release`, `cmake --build <build> --config Release`,
  `ctest --test-dir <build> -C Release --output-on-failure`, `cmake --install <build> --config Release`.
- WSL Ubuntu 26.04: `wsl.exe -d Ubuntu-26.04 -- sh /mnt/<drive>/<checkout>/OpenIPSL/Resources/C-Sources/IEEE_CIGRE/build_linux64.sh`,
  i.e. `cmake -S . -B /tmp/cigre_build_linux64 -DCMAKE_BUILD_TYPE=Release`, `cmake --build /tmp/cigre_build_linux64`,
  `ctest --test-dir /tmp/cigre_build_linux64 --output-on-failure`, `cmake --install /tmp/cigre_build_linux64`.

`cmake --install` writes into this folder. A CI job that runs the same steps on `ubuntu-latest` and
`windows-latest` and uploads the result as an artifact is proposed separately; it would not replace the files
here. After a rebuild, update the table above and the one in `../C-Sources/IEEE_CIGRE/README.md`.

## How the Modelica tools find these libraries

Measured on Windows 11 on 2026-10-25 with a test library of the same form (import library + DLL in `win64`,
`annotation(Library="<Name>", LibraryDirectory="modelica://.../Resources/Library")`); the verification of the
IEEE/CIGRE models themselves in the three tools is recorded separately.

- Dymola 2026x Refresh 1 (compiles with MSVC): links `win64/<Name>.lib`. Because only a `win64` library exists,
  Dymola switches to a 64-bit simulator by itself ("Some 32-bit libraries are missing ... automatically
  switching to 64-bit mode"). It delay-loads `<Name>.dll`: the DLL's absolute path is compiled into `dsmodel.c`
  and the DLL is loaded from this folder before the first model evaluation. Nothing is copied, PATH is not
  changed, and `dymosim.exe` also runs outside Dymola. A missing DLL shows up at translation as "Process Setting
  up default experiment stopped without any error indication"; run-time errors of the Modelica model
  (assertions) are in `dslog.txt`, the library's messages on the standard error stream are not (see below).
- OpenModelica 1.27.1 (MinGW-w64 ucrt64 tool chain): `Library="<Name>"` becomes `-l<Name>` and
  `LibraryDirectory` becomes `-L<dir>/mingw64 -L<dir>/ucrt64 -L<dir>/win64 -L<dir>`; MinGW ld links the MSVC
  import library `<Name>.lib`. At run time the generated `<Model>.bat` puts the same folders first on PATH, so
  `simulate()` and OMEdit find `<Name>.dll` here; nothing is copied. An executable started by hand needs
  `Resources\Library\win64` on PATH (otherwise it exits with 0xC0000135, DLL not found). omc warns "Could not
  find library <Name>" at translation only if `<Name>.dll` is missing. A `ModelicaFormatError` raised inside an
  external object's constructor ends the simulation with 0xC0000005 and no message, which is why the adapter
  reports through status codes and the standard error stream instead.
- Wolfram System Modeler 15.0 (compiles with MSVC, `/MT`): links `<Name>.lib` with
  `/LIBPATH:<package>\Resources\Library\win64` (or `Resources\Library` itself when there is no platform
  folder); a DLL without `<Name>.lib` does not link (LNK1181). Only when `<Name>.dll` is in that folder does
  System Modeler record it in the `.sim` file and put the folder on the simulation executable's PATH; nothing is
  copied. External functions without arguments, such as `sampleTime()`, are evaluated at translation by a
  separate evaluator program that loads the DLL. System Modeler asks to trust a library before it evaluates its
  external functions ("Untrusted call to external function ... Enable evaluation of external functions for this
  library"): confirm in Model Center, or in Wolfram Language call
  ``WSMLink`Library`ConfigureExternalFunctionEvaluationForLibrary["OpenIPSL", True]`` once (the setting persists
  under `HKCU\Software\Wolfram\SystemModeler150002\LibrarySetup\trustedLibraries`). The standalone kernel
  `WSMKernelX.exe` run with a `.mos` script does not ask.
- Linux: Dymola 2026x Refresh 1, OpenModelica 1.27.1 and System Modeler 15.0 ran the tests with the `linux64`
  libraries on Ubuntu 24.04 LTS under WSL2 (glibc 2.39, 2026-10-25) and reproduced their Windows results to
  4.5e-9 relative. Dymola writes the library folder into the executable as `RUNPATH`, OpenModelica as `RPATH`;
  System Modeler writes none, so a System Modeler simulation executable run outside the tool needs
  `LD_LIBRARY_PATH=<OpenIPSL>/Resources/Library/linux64`.
- Dymola does not copy the simulator's standard error stream into `dslog.txt` or its log window, so the messages
  of the adapter (and of the model) do not show up there; run `dymosim.exe` from a command prompt in the working
  directory to see them. OpenModelica shows them among the simulation messages (measured with Dymola 2026x
  Refresh 1 and OpenModelica 1.27.1 on 2026-10-25).

## Known limitations

- The fixed step of each model is a compile-time constant of the library (`Model_Info.FixedStepBaseSampleTime`):
  GFM_GFL_IBR steps at 1e-5 s, SCRX9 at 0.005 s. The Modelica wrappers read it with `sampleTime()` and call the
  library once per step; a different step (e.g. the 2e-5 s of the PSCAD setup in PR #362) needs a rebuilt
  library from an edited source.
- Only `win64` and `linux64` are provided (no 32-bit, no macOS).
- The vendor models share one message buffer between instances of the same library (states and data are per
  instance). Stepping instances of one library from several threads at once (for example parallel FMU
  instances) keeps states and outputs correct, but messages can be lost or reported by the wrong instance.

## Licences and citations

The model code in these binaries is not covered by the OpenIPSL licence: SCRX9 is the example model of the
IEEE/CIGRE DLL Modeling Standard (G. Irwin, Electranix, 2021; copyright of its author and of CIGRE/IEEE), in the
revision of the CIGRE JWG B4.82 example code (another revision is printed in CIGRE Technical Brochure 958,
Appendix E); GFM_GFL_IBR is EPRI's model (D. Ramasubramanian, 2022) from the same example code, distributed
with EPRI's written permission of 2026-06-09 on condition that [EPRI2023] and [Ramasubramanian2022] are cited
(the source is not printed in [EPRI2023]). Origins and differences from the originals: provenance blocks of the
sources and `OpenIPSL.Electrical.Controls.IEEE_CIGRE.Provenance`. The adapter and build files are OpenIPSL's
(BSD 3-Clause). Cite:

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
