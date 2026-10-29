within OpenIPSL.Electrical.Controls.IEEE_CIGRE;
class README "Build, binaries and tool notes for the IEEE/CIGRE DLL models"
  extends Modelica.Icons.Information;

  annotation (DocumentationClass=true, Documentation(info="<html>
<h4>What is shipped</h4>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\">
<tr><th>Path (under <code>OpenIPSL/Resources/</code>)</th><th>Content</th></tr>
<tr><td><code>C-Sources/IEEE_CIGRE/</code></td><td>the C sources (<code>src/SCRX9.c</code>, <code>src/GFM_GFL_IBR.c</code>,
the generic adapter <code>src/oipsl_cigre_adapter.c</code>), the standard's headers (<code>include/</code>), the C tests
(<code>test/adapter_test.c</code>, <code>test/layout_test.c</code>, <code>test/two_libraries_test.c</code>), the CMake project <code>CMakeLists.txt</code>, the scripts
<code>build_win64.bat</code> and <code>build_linux64.sh</code>, and <code>README.md</code> with the provenance and
licence of every file</td></tr>
<tr><td><code>Library/win64/</code></td><td><code>SCRX9.dll</code>, <code>SCRX9.lib</code>, <code>GFM_GFL_IBR.dll</code>,
<code>GFM_GFL_IBR.lib</code> (DLL and MSVC import library of each model)</td></tr>
<tr><td><code>Library/linux64/</code></td><td><code>libSCRX9.so</code>, <code>libGFM_GFL_IBR.so</code></td></tr>
<tr><td><code>Library/README.md</code></td><td>what the binaries are and how they were built</td></tr>
</table>
<h4>Build platform of the shipped binaries</h4>
<ul>
<li>win64: Microsoft C/C++ compiler 19.51 for x64 (Visual Studio Community 2026 18.11.2), static C runtime
<code>/MT</code>, so the DLLs depend on no Visual C++ redistributable, and <code>/Brepro</code>, so a rebuild of the
same sources with the same tool chain gives bit-identical files (a newer Visual Studio or Windows SDK changes a few
bytes outside the code).</li>
<li>linux64: gcc 15.2.0 on Ubuntu 26.04.1 LTS under WSL2 (glibc 2.43), <code>-fPIC -fvisibility=hidden</code>,
linked with <code>-Wl,-Bsymbolic</code> so that each library's adapter calls the model functions of its own library
when a simulation loads both libraries. The libraries use glibc symbol versions up to <code>GLIBC_2.4</code> only
(<code>objdump -T</code>), so they load with any current C library (the three tools ran them on glibc 2.39); rebuild
from source if one does not load on a particular distribution.</li>
</ul>
<p>
A CI job is proposed separately: a GitHub Actions job that builds and tests the same sources on
<code>windows-latest</code> and <code>ubuntu-latest</code> and uploads the libraries as artifacts, without committing
them.
</p>
<h4>Building on Windows (MSVC and CMake)</h4>
<p>
Requirements: Visual Studio 2022 or later with the C++ workload and its component &quot;C++ CMake tools for
Windows&quot; (or any CMake 3.20 or newer on <code>PATH</code>). From a command prompt in
<code>OpenIPSL/Resources/C-Sources/IEEE_CIGRE</code>:
</p>
<pre>
build_win64.bat
</pre>
<p>
The script sets up the x64 compiler environment with <code>vcvarsall.bat x64</code> (set the environment variable
<code>VCVARSALL</code> to its full path if Visual Studio is not in the default folder of Visual Studio 2026),
configures and builds with CMake (Ninja when available, NMake otherwise), runs the C tests with <code>ctest</code> and
installs the DLL and import library of each model into <code>OpenIPSL/Resources/Library/win64/</code>. The build
tree goes to <code>%TEMP%\\cigre_build\\win64</code> unless a folder is given as the first argument. The equivalent
commands in an &quot;x64 Native Tools Command Prompt&quot; are:
</p>
<pre>
cmake -S . -B %TEMP%\\cigre_build\\win64 -G &quot;NMake Makefiles&quot; -DCMAKE_BUILD_TYPE=Release
cmake --build %TEMP%\\cigre_build\\win64 --config Release
ctest --test-dir %TEMP%\\cigre_build\\win64 -C Release --output-on-failure
cmake --install %TEMP%\\cigre_build\\win64 --config Release
</pre>
<p>
The default install prefix of the CMake project is <code>OpenIPSL/Resources</code>, so the last line writes to
<code>Resources/Library/win64</code>; pass <code>--prefix &lt;folder&gt;</code> to install elsewhere. Keep the build
tree out of folders that a cloud client synchronises (Dropbox, OneDrive): their file locks make compilers and linkers
fail at random.
</p>
<h4>Building on Linux or WSL (gcc and CMake)</h4>
<p>
Requirements: gcc and CMake 3.20 or newer (on Ubuntu: <code>sudo apt-get install build-essential cmake</code>). From
a shell in <code>OpenIPSL/Resources/C-Sources/IEEE_CIGRE</code> (under WSL the Windows drive F: is <code>/mnt/f</code>):
</p>
<pre>
sh build_linux64.sh
</pre>
<p>
The script configures, builds, tests and installs <code>lib&lt;Name&gt;.so</code> into
<code>OpenIPSL/Resources/Library/linux64/</code>, with the build tree in <code>/tmp/cigre_build_linux64</code> unless
a folder is given as the first argument; the equivalent commands are the four CMake lines above with that build
directory and without <code>-G</code>.
</p>
<h4>How each tool finds the library</h4>
<p>
Every external function carries <code>annotation(Library=&quot;&lt;Name&gt;&quot;,
LibraryDirectory=&quot;modelica://OpenIPSL/Resources/Library&quot;)</code>; the tools add the platform folder
(<code>win64</code>, <code>linux64</code>) themselves. Nothing has to be copied and no environment variable has to be
set inside the tools. Measured on Windows 11 and, with the shipped <code>linux64</code> libraries, on Ubuntu 24.04
LTS under WSL2 (glibc 2.39), both on 2026-10-25: each tool reproduced its Windows results on Linux to 4.5e-9
relative.
</p>
<ul>
<li><strong>Dymola</strong> (2026x Refresh 1, MSVC): links <code>&lt;Name&gt;.lib</code>, switches to a 64-bit
<code>dymosim</code> by itself because the library exists only for win64, delay-loads the DLL and compiles its absolute
path into the simulator, so <code>dymosim.exe</code> also runs outside Dymola while the library stays where it is. A
missing DLL shows up as the translation error &quot;Process Setting up default experiment stopped without any error
indication&quot;.</li>
<li><strong>OpenModelica</strong> (1.27.1, its bundled clang/MinGW tool chain): links the MSVC import library through
<code>-L.../Resources/Library/win64 -l&lt;Name&gt;</code>; the generated <code>&lt;Model&gt;.bat</code> puts the library
folders on <code>PATH</code>, so <code>simulate()</code> and OMEdit find the DLL. To run the simulation executable by
hand, put <code>Resources/Library/win64</code> on <code>PATH</code> first.</li>
<li><strong>Wolfram System Modeler</strong> (15.0, MSVC): needs both <code>&lt;Name&gt;.lib</code> and
<code>&lt;Name&gt;.dll</code> with the stem of the <code>Library</code> annotation in the same folder, records that
folder in the <code>.sim</code> file and puts it on the simulation's <code>PATH</code>. The first simulation reports
&quot;Untrusted call to external function&quot;: enable the evaluation of external functions for the OpenIPSL library
in Model Center when asked (from the Wolfram Language:
<code>WSMLink`Library`ConfigureExternalFunctionEvaluationForLibrary[&quot;OpenIPSL&quot;, True]</code>; the setting is
stored per user). Parameters bound to external functions without arguments, such as <code>Ts =
Functions.sampleTime()</code>, are evaluated at translation by a helper program, which adds a few seconds to the
model check.</li>
<li><strong>On Linux</strong> Dymola and OpenModelica write the library folder into the simulation executable
(<code>RUNPATH</code>, <code>RPATH</code>), so it also runs outside the tool. System Modeler does not: to run a
System Modeler simulation executable outside the tool, put <code>Resources/Library/linux64</code> on
<code>LD_LIBRARY_PATH</code> first.</li>
</ul>
<h4>The fixed-step contract</h4>
<p>
An IEEE/CIGRE DLL is a discrete controller with a fixed base sample time (SCRX9: 0.005 s, GFM_GFL_IBR: 1e-5 s) that
advances its states by exactly one sample per call of <code>Model_Outputs</code>. The wrappers therefore call the DLL
once per sample in <code>when sample(0, Ts)</code>, with <code>Ts</code> read from the library: inputs are sampled at
the sample instants and outputs are held in between. Every sample is a time event, so variable-step solvers (DASSL,
CVODE) step the DLL at exactly the same instants as a fixed-step solver; only the accuracy of the network solution
between samples depends on the solver. Explicit Euler with step <code>Ts</code> is the cheapest choice for the EMT
model, and the tests say so in their experiment annotations
(<code>__Dymola_Algorithm=&quot;Euler&quot;</code>, <code>__Dymola_fixedstepsize</code>). In OpenModelica a fixed step is
chosen with <code>method=&quot;euler&quot;</code> and <code>numberOfIntervals = (stopTime - startTime)/Ts</code>.
</p>
<h4>Errors</h4>
<p>
The adapter is compiled into the DLL, where the tools' Modelica runtime functions (<code>ModelicaFormatError</code> and
friends) cannot be linked. It therefore reports through return codes: creating an instance that the DLL refuses
gives a NULL handle, and <code>step</code> returns the standard's code (0 ok, 1 message, 2 error) or a negative code
for a missing instance or a size mismatch. Every message of the DLL is written once to the standard error stream with
the model name and the time (OpenModelica shows it among the simulation messages; Dymola does not copy the
simulator's standard error into <code>dslog.txt</code> or its log, so run <code>dymosim.exe</code> from a command
prompt in the working directory to see it), and the wrapper model stops with an assertion that names the DLL.
</p>
<h4>References</h4>
<ul>
<li>CIGRE JWG B4.82/IEEE, &quot;Guidelines for use of real-code in EMT models for HVDC, FACTs and inverter based
generators in power systems analysis,&quot; CIGRE Technical Brochure 958, 2025, ISBN 978-2-85873-663-8: the IEEE/CIGRE
DLL Modeling Standard; its Appendix D holds the two headers and Appendix E a revision of the SCRX example model
(see <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.Provenance\">Provenance</a>).</li>
<li>[EPRI2023] EPRI, &quot;Code Based Generic Inverter Based Resource Model,&quot; Technical Update 3002028322, Palo
Alto, CA, November 2023 (CC BY 4.0),
<a href=\"https://www.epri.com/research/products/000000003002028322\">epri.com</a>: to be cited, as EPRI's condition
for redistributing the GFM_GFL_IBR source with their written permission (the source itself is not printed in the
report; see <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.Provenance\">Provenance</a>).</li>
<li>[Ramasubramanian2022] D. Ramasubramanian, &quot;Differentiating between plant level and inverter level voltage
control to bring about operation of 100% inverter-based resource grids,&quot; Electric Power Systems Research, vol.
205, 107739, April 2022, <a href=\"https://doi.org/10.1016/j.epsr.2021.107739\">DOI: 10.1016/j.epsr.2021.107739</a>.</li>
<li>H. Chang and L. Vanfretti, &quot;Integrating the IEEE/CIGRE DLL Modeling Standard to Use 'Real Code' Models for
Power System Analysis in Modelica Tools,&quot; Proceedings of the American Modelica Conference 2024, October 14-16,
2024, Storrs, Connecticut, USA, <a href=\"https://doi.org/10.3384/ecp20772\">DOI: 10.3384/ecp20772</a>.</li>
<li>H. Chang and L. Vanfretti, &quot;EMT Modelling and Simulation of Grid Following Converters in Modelica Integrating
the IEEE/CIGRE 'Real Code'/DLL Modelling Guidelines,&quot; CIGRE Paris Session 2026, paper C4-10724, Paris, France,
August 2026,
<a href=\"https://www.e-cigre.org/publications/detail/c4-10724-2026-emt-modelling-and-simulation-of-grid-following-converters-in-modelica-integrating-the-ieeecigre-real-codedll-modelling-guidelines.html\">e-cigre</a>.</li>
</ul>
</html>"));
end README;
