within OpenIPSL.Tests.Controls.IEEE_CIGRE;
class README "How to run the IEEE/CIGRE DLL tests in each tool"
  extends Modelica.Icons.Information;

  annotation (DocumentationClass=true, Documentation(info="<html>
<h4>Before running</h4>
<p>
The tests need the shared libraries of the models in <code>OpenIPSL/Resources/Library/win64/</code> (Windows) or
<code>OpenIPSL/Resources/Library/linux64/</code> (Linux). They are shipped for both platforms:
</p>
<ul>
<li>win64: <code>SCRX9.dll</code>, <code>SCRX9.lib</code>, <code>GFM_GFL_IBR.dll</code>, <code>GFM_GFL_IBR.lib</code>,
built with the Microsoft C/C++ compiler 19.51 for x64 (Visual Studio Community 2026 18.11.2) and the static C
runtime (<code>/MT</code>), so they depend on <code>KERNEL32.dll</code> only;</li>
<li>linux64: <code>libSCRX9.so</code>, <code>libGFM_GFL_IBR.so</code>, built with gcc 15.2.0 on Ubuntu 26.04.1 LTS
under WSL2 (glibc 2.43; the libraries need glibc 2.4 or newer). Dymola, OpenModelica and System Modeler ran these
tests with them on Ubuntu 24.04 LTS under WSL2 (glibc 2.39, 2026-10-25) and reproduced their Windows results. A
System Modeler simulation executable run outside the tool needs <code>Resources/Library/linux64</code> on
<code>LD_LIBRARY_PATH</code>.</li>
</ul>
<h4>Building the libraries</h4>
<p>
Requirements: CMake 3.20 or newer and a C compiler. On Windows: Visual Studio 2022 or later with the C++ workload and
its component &quot;C++ CMake tools for Windows&quot; (or any CMake 3.20 or newer on <code>PATH</code>). On Linux:
gcc and CMake (on Ubuntu: <code>sudo apt-get install build-essential cmake</code>). The sources, the CMake project and
the two build scripts are in <code>OpenIPSL/Resources/C-Sources/IEEE_CIGRE/</code>.
</p>
<ul>
<li>win64 (MSVC): from a command prompt in that folder run <code>build_win64.bat</code>. It sets up the x64 compiler
with <code>vcvarsall.bat x64</code> (set <code>VCVARSALL</code> to its full path for a Visual Studio outside the default
folder of Visual Studio 2026), builds, runs the C tests with <code>ctest</code> and installs <code>SCRX9.dll</code>,
<code>SCRX9.lib</code>, <code>GFM_GFL_IBR.dll</code> and <code>GFM_GFL_IBR.lib</code> into
<code>OpenIPSL/Resources/Library/win64/</code>.</li>
<li>linux64 (gcc), on Linux or in WSL Ubuntu 26.04: from a shell in that folder run <code>sh build_linux64.sh</code>,
or from Windows <code>wsl.exe -d Ubuntu-26.04 -- sh
/mnt/&lt;drive&gt;/&lt;checkout&gt;/OpenIPSL/Resources/C-Sources/IEEE_CIGRE/build_linux64.sh</code>. It builds, runs
the C tests and installs <code>libSCRX9.so</code> and <code>libGFM_GFL_IBR.so</code> into
<code>OpenIPSL/Resources/Library/linux64/</code>.</li>
</ul>
<p>
Keep the build tree out of folders that Dropbox or OneDrive synchronise (both scripts default to a temporary folder).
The equivalent CMake commands, the compiler settings, how each tool finds the libraries and the System Modeler trust
question are explained in
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.README\">Electrical.Controls.IEEE_CIGRE.README</a>.
</p>
<h4>The fixed-step contract</h4>
<p>
Each DLL advances by one fixed base sample per call: SCRX9 every 0.005 s, GFM_GFL_IBR every 1e-5 s. The wrappers call
it in <code>when sample(0, Ts)</code>, so every sample is a time event and every solver steps the DLL at the same
instants.
Explicit Euler with the DLL's step is the cheapest solver and the one the EMT tests declare
(<code>__Dymola_Algorithm=&quot;Euler&quot;</code>, <code>__Dymola_fixedstepsize=1e-05</code>); the SCRX9 tests keep
the default variable-step solver, which stops at each 5 ms sample.
</p>
<h4>Disturbances half a sample off the sample grid</h4>
<p>
The papers and the pull request placed the disturbances at round times (the SMIB fault at 2 s and its clearing at
2.15 s, the power steps at 2 s and the voltage dips and faults at 5 s of the EMT tests), which are sample instants of
the DLLs. A disturbance on a sample instant and the DLL step there are simultaneous events, and the tools order them
differently: the verification of 2026-10-25 measured that Dymola 2026x and System Modeler 15.0 step the DLL after the
disturbance, while OpenModelica 1.27.1 places the sample just before it (it accumulates the sample times) and the
disturbance just after it, so its DLL sees the change one sample later. The response is then shifted by one sample
between the tools after that instant (up to 3.3 pu in the field voltage of SCRX9 for one 5 ms sample at 2.15 s,
0.09 pu later on; 0.015 MW in P after the dip of <code>GFL_Fault</code>).
</p>
<p>
The tests therefore apply every disturbance half a DLL sample after the papers' round time: the SCRX9 tests fault the
SMIB system from 2.0025 s to 2.1525 s (half of 5 ms), and the GFM tests add 5e-6 s (half of 1e-5 s) to every step,
ramp, dip, fault and frequency or voltage step, keeping the durations (for example 2.000005 s and 5.000005 s to
5.100005 s). Off the grid the order of events is unique. With DASSL, Dymola and OpenModelica agreed to 6.7e-5 pu in the
field voltage of SCRX9, and with fixed-step Euler to 5.5e-5 MW in P of <code>GFL_Fault</code>. OpenModelica 1.27.1 and
System Modeler 15.0 stop a fixed-step Euler run at an off-grid event; Dymola applies it at the end of the step (below),
so with Euler Dymola differs from the other two by that half step: up to 0.021 MW in P for a few milliseconds after the
fault of <code>GFM_EMTPFault</code>, and by 2.5 ms of fault timing in the 5 ms Euler run of SCRX9. Dymola's fixed-step
Euler does not stop inside a step: it applies a time event that falls inside a step at the end of that step, together
with the DLL step there (the power step of 2.000005 s acts at 2.00001 s). The network then sees the disturbance half a
sample later than with a solver that stops at the event (2.5 ms with the 5 ms Euler step of the SCRX9 tests, none with
DASSL), while the DLL still sees it at the first sample after the event, as in OpenModelica. The native
<a href=\"modelica://OpenIPSL.Tests.Controls.PSSE.ES.SCRX\">Tests.Controls.PSSE.ES.SCRX</a> keeps its round times
(it has no sampled controller); <code>SCRX9_vs_SCRX</code> shifts the fault of its copy by a modifier. The two
network-only tests in <code>GFM.Components</code> contain no DLL and keep their times. Keep a disturbance off the
sample grid in any new test of a DLL model.
</p>
<h4>SCRX9 tests (phasor, SMIB)</h4>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\">
<tr><th>Test</th><th>Stop time</th><th>Solver and step</th><th>Plot</th><th>Paper figure</th></tr>
<tr><td><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.SCRX9.SCRX9\">SCRX9.SCRX9</a></td><td>10 s</td>
<td>DASSL, tolerance 1e-6, output interval 0.005 s; or Euler with step 0.005 s</td>
<td><code>sCRX9.EFD</code>, <code>GEN1.v</code>, <code>gENROU.w</code></td>
<td>Chang and Vanfretti 2024, Figs. 8 and 9</td></tr>
<tr><td><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.SCRX9.SCRX9_vs_SCRX\">SCRX9.SCRX9_vs_SCRX</a></td><td>10 s</td>
<td>as above</td>
<td><code>dll.sCRX9.EFD</code> with <code>native.sCRX.EFD</code>, <code>dll.GEN1.v</code> with <code>native.GEN1.v</code>,
<code>dEFD</code>, <code>dV</code>, <code>dw</code></td>
<td>Chang and Vanfretti 2024, Figs. 7 and 9</td></tr>
</table>
<p>
How to run them:
</p>
<ul>
<li><strong>Dymola</strong>: open OpenIPSL, open the test and press Simulate; the experiment annotation sets 10 s,
DASSL and tolerance 1e-6. For the fixed-step run choose Euler with fixed integrator step 0.005 in Simulation Setup.
Dymola builds a 64-bit simulator by itself because the library exists only for win64.</li>
<li><strong>OpenModelica</strong>: in OMEdit simulate with the defaults of the annotation (DASSL). From a script:
<code>simulate(OpenIPSL.Tests.Controls.IEEE_CIGRE.SCRX9.SCRX9, stopTime=10, numberOfIntervals=2000, tolerance=1e-6)</code>;
for Euler add <code>method=&quot;euler&quot;</code> (the step is <code>stopTime/numberOfIntervals</code> = 0.005 s).
Load the Modelica Standard Library 4.0.0 exactly (<code>loadModel(Modelica, {&quot;4.0.0&quot;},
requireExactVersion=true)</code>).</li>
<li><strong>Wolfram System Modeler</strong>: confirm the trust question for the external functions of OpenIPSL once,
then simulate in Simulation Center with the annotation's settings; for the fixed-step run pick the Euler method and
the step size 0.005 s in the experiment settings. System Modeler 15.0 does not translate the native
<a href=\"modelica://OpenIPSL.Tests.Controls.PSSE.ES.SCRX\">Tests.Controls.PSSE.ES.SCRX</a> (&quot;Variables have start
values that are determined in the same block of equations as the variables themselves: sCRX.simpleLagLim.y&quot;), so
<code>SCRX9_vs_SCRX</code>, which contains it, is for Dymola and OpenModelica; <code>SCRX9.SCRX9</code> runs in
System Modeler.</li>
</ul>
<h4>GFM tests (EMT, three phase)</h4>
<p>
The tests of the grid-forming / grid-following inverter model
(<a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM\">Tests.Controls.IEEE_CIGRE.GFM</a>) run with explicit
Euler at the DLL's step of 1e-5 s and an output interval of 1e-4 s, as their experiment annotations say. All converter
tests start the converter from rest (no current, power states zero): the first second is the start-up of the
controller and the phase-locked loop, and the scenario begins at 2.000005 s (2 s in the papers, see above). Unless
the table says otherwise the converter uses the default parameter record (6.5 kV, 10 MVA, droop frequency control,
Q control, P priority); <code>P</code> is <code>gFM_GFL_IBR.out[11]</code> (MW), <code>Q</code> is
<code>gFM_GFL_IBR.out[12]</code> (Mvar), the PLL frequency <code>gFM_GFL_IBR.out[10]</code> (Hz), and the terminal
waveforms are <code>gFM_GFL_IBR.grid_sensor_a.voltage</code> ... <code>grid_sensor_c.current</code> (V, A).
</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\">
<tr><th>Test</th><th>Stop time</th><th>Network and events</th><th>Plot</th><th>Paper figure</th></tr>
<tr><td><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.GFL_Fault\">GFM.GFL_Fault</a></td><td>5.8 s</td>
<td>ideal 6.5 kV source at the terminals; Pref 0.5 to 0.7 pu at 2.000005 s; source dip to 0.8 pu from 5.000005 s to
5.100005 s</td>
<td>P, Q at 4.95-5.6 s; waveforms at 4.98-5.2 s</td><td>none</td></tr>
<tr><td><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.GFL_POCFault\">GFM.GFL_POCFault</a></td><td>4 s</td>
<td>wye-delta transformer and 230 kV grid; Pref 0.5 to 0.7 pu at 2.000005 s; three-phase fault through 5 Ohm at the
point of connection at 3.000005 s, cleared from 3.100005 s at the current zeros; Qref 0.07 pu</td>
<td>waveforms at 2.98-3.3 s</td><td>the three-phase fault figure of CIGRE 2026 paper C4-10724</td></tr>
<tr><td><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.GFL_FrequencyStep\">GFM.GFL_FrequencyStep</a></td><td>3 s</td>
<td>wye-delta transformer and 230 kV source; source frequency 60 to 59.5 Hz at 2.000005 s; Pref 0.5 pu, Qref
0.07 pu</td>
<td>P, Q and the PLL frequency at 1.9-2.8 s; waveforms at 1.98-2.25 s</td><td>none</td></tr>
<tr><td><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.GFL_VoltageStep\">GFM.GFL_VoltageStep</a></td><td>3 s</td>
<td>wye-delta transformer and 230 kV source; source voltage to 0.95 pu at 2.000005 s; Pref 0.5 pu, Qref 0.03 pu</td>
<td>P, Q; waveforms at 1.98-2.3 s</td><td>none (a case of the 2026 studies)</td></tr>
<tr><td><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.GFL_PowerRamp\">GFM.GFL_PowerRamp</a></td><td>3.6 s</td>
<td>wye-delta transformer and 230 kV source; Pref 0 to 0.4 pu and Qref -0.03 to 0.02 pu, ramps from 2.000005 s to
2.800005 s</td>
<td>P with Pref, Q with Qref at 1.8-3.4 s; waveforms at 1.9-3.1 s</td><td>none (a case of the 2026 studies)</td></tr>
<tr><td><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.GFL_FaultPSCAD\">GFM.GFL_FaultPSCAD</a></td><td>5.8 s</td>
<td>EPRI's PSCAD parameter record on an ideal 650 V source; Pref 0.2 to 0.4 pu at 2.000005 s; dip to 0.7 pu from
5.000005 s to 5.100005 s; Q settles at -71.6 Mvar (-0.716 pu) although Qref = 0 (voltage droop of the record,
see below)</td>
<td>P, Q; waveforms around 5 s</td><td>none</td></tr>
<tr><td><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.GFM_EMTPFault\">GFM.GFM_EMTPFault</a></td><td>5.9 s</td>
<td>6.5 kV Thevenin grid; Pref 0.5 to 0.7 pu at 2.000005 s; three-phase fault through 5 Ohm at 5.000005 s, cleared
from 5.100005 s</td>
<td>P, Q at 4.95-5.7 s; waveforms at 4.98-5.25 s</td><td>none</td></tr>
<tr><td><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.GFM_EMTPFull\">GFM.GFM_EMTPFull</a></td><td>6 s</td>
<td>grounded-delta transformer and 230 kV Thevenin grid; Pref 0.5 to 0.7 pu at 2.000005 s; fault on the 230 kV side
at 5.000005 s, cleared from 5.100005 s</td>
<td>waveforms at 4.98-5.3 s</td><td>none</td></tr>
<tr><td><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.Components.SmoothShortFault\">GFM.Components.SmoothShortFault</a></td><td>5.5 s</td>
<td>network only (no DLL): smooth fault on the 230 kV Thevenin grid at 5 s, command off at 5.03 s</td>
<td>the three fault currents</td><td>none</td></tr>
<tr><td><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.Components.EMTPTransformerZeroSeq\">GFM.Components.EMTPTransformerZeroSeq</a></td><td>3 s</td>
<td>network only (no DLL): wye-delta transformer between the grid and a resistive load</td>
<td>delta-side line-to-line voltages and their sum</td><td>none</td></tr>
</table>
<p>
<code>GFL_FaultPSCAD</code> settles far from its reactive power reference of 0. Dymola 2026x (Euler, 1e-5 s,
2026-10-25) gives Q = -53.2 Mvar (-0.532 pu on the record's 100 MVA) as the mean of the last 0.5 s before the power
step, -71.59 Mvar (-0.716 pu) in the last 0.5 s before the dip and -71.70 Mvar (-0.717 pu) at 5.8 s, the values that
the first verification found in all three tools. The record runs the droop control type (<code>Wtype</code> = 1), in
which the DLL holds <code>Q = Qref/Sbase + KvDroop*(Vref - Vd)</code> with <code>KvDroop</code> = 30. The converter
drives 71 kA rms per phase through the 5 mOhm line, 1.18 pu on the 650 V, 100 MVA base, so its terminal voltage
<code>Vd</code> (<code>gFM_GFL_IBR.out[8]</code>) settles at 1.0239 pu after the power step and
30*(1 - 1.0239) = -0.716 pu. The test documents the values in detail.
</p>
<p>
How to run them:
</p>
<ul>
<li><strong>Dymola</strong>: simulate as is; the experiment annotation selects Euler with the fixed step 1e-5 s. A
5.8 s run takes about 1.5 s of integration time. The verification ran Dymola with the flag
<code>Evaluate = true</code> (typed in the command line before the translation); with Dymola's default
<code>false</code> the tests with a transformer take 2.5 to 3.3 times as long.</li>
<li><strong>OpenModelica</strong>: the annotation <code>__OpenModelica_simulationFlags(s=&quot;euler&quot;)</code> selects
Euler, whose step is the output interval, so from a script use
<code>simulate(OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.GFL_PowerRamp, stopTime=3.6, numberOfIntervals=360000,
method=&quot;euler&quot;)</code> (<code>numberOfIntervals = stopTime/1e-5</code>) and a <code>variableFilter</code> with the
signals to plot; the full result of a 1e-5 s run is several hundred megabytes. Simulating with the annotation alone
also runs, because the 1e-5 s sample events cut the 1e-4 s steps.</li>
<li><strong>Wolfram System Modeler</strong>: confirm the trust question once, then pick the Euler method with step
size 1e-5 s in the experiment settings.</li>
</ul>
<h4>References</h4>
<ul>
<li>H. Chang and L. Vanfretti, &quot;Integrating the IEEE/CIGRE DLL Modeling Standard to Use 'Real Code' Models for
Power System Analysis in Modelica Tools,&quot; Proceedings of the American Modelica Conference 2024, October 14-16,
2024, Storrs, Connecticut, USA, <a href=\"https://doi.org/10.3384/ecp20772\">DOI: 10.3384/ecp20772</a>.</li>
<li>H. Chang and L. Vanfretti, &quot;EMT Modelling and Simulation of Grid Following Converters in Modelica Integrating
the IEEE/CIGRE 'Real Code'/DLL Modelling Guidelines,&quot; CIGRE Paris Session 2026, paper C4-10724, Paris, France,
August 2026,
<a href=\"https://www.e-cigre.org/publications/detail/c4-10724-2026-emt-modelling-and-simulation-of-grid-following-converters-in-modelica-integrating-the-ieeecigre-real-codedll-modelling-guidelines.html\">e-cigre</a>.</li>
<li>[EPRI2023] EPRI, &quot;Code Based Generic Inverter Based Resource Model,&quot; Technical Update 3002028322, Palo
Alto, CA, November 2023 (CC BY 4.0),
<a href=\"https://www.epri.com/research/products/000000003002028322\">epri.com</a>.</li>
<li>[Ramasubramanian2022] D. Ramasubramanian, &quot;Differentiating between plant level and inverter level voltage
control to bring about operation of 100% inverter-based resource grids,&quot; Electric Power Systems Research, vol.
205, 107739, April 2022, <a href=\"https://doi.org/10.1016/j.epsr.2021.107739\">DOI: 10.1016/j.epsr.2021.107739</a>.</li>
</ul>
</html>"));
end README;
