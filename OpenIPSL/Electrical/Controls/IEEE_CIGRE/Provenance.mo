within OpenIPSL.Electrical.Controls.IEEE_CIGRE;
class Provenance "Origin of the C sources of the IEEE/CIGRE DLL models and their differences from the originals"
  extends Modelica.Icons.Information;

  annotation (DocumentationClass=true, Documentation(info="<html>
<p>
The C sources in <code>OpenIPSL/Resources/C-Sources/IEEE_CIGRE/</code> were compared on 2026-10-28 with their originals
(<code>diff --strip-trailing-cr -w</code> for the files, a token-by-token comparison for the code printed in CIGRE
Technical Brochure 958). This page lists where each file comes from and every difference from the original. The
provenance block at the top of each C file repeats the same facts for that file.
</p>
<h4>Origin of each file</h4>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\">
<tr><th>File (under <code>C-Sources/IEEE_CIGRE/</code>)</th><th>Original</th><th>Published version</th></tr>
<tr><td><code>include/IEEE_Cigre_DLLInterface.h</code>,<br><code>include/IEEE_Cigre_DLLInterface_types.h</code></td>
<td>the two interface files of the IEEE/CIGRE DLL Modeling Standard, API V2, in the folder <code>DLL_V1_1</code> of the
example code distributed by CIGRE JWG B4.82 (file date 2022-02-14; SHA-256 <code>8fa780c3...</code> and
<code>1e7bc245...</code>)</td>
<td>[TB958] Appendix D. The code matches the printed text token for token; only the wording of the file comment
differs.</td></tr>
<tr><td><code>src/SCRX9.c</code></td>
<td>the SCRX9 static exciter, the example model of the standard by G. D. Irwin (Electranix), September 14, 2021:
<code>DLL_V1_1/Static Exciter Model/SCRX9.c</code> of the same distribution (file date 2022-02-14, SHA-256
<code>f4515d7d...</code>)</td>
<td>[TB958] Appendix E prints another revision with the same control code. It adds, at the end of
<code>Model_CheckParameters</code>, <code>Model_Initialize</code> and <code>Model_Outputs</code>, tests of
<code>instance-&gt;LastErrorMessage[0]</code> and <code>instance-&gt;LastGeneralMessage[0]</code> that return the
Error or Message code, and empty <code>Model_FirstCall</code> and <code>Model_Iterate</code> functions. OpenIPSL
ships the B4.82 revision.</td></tr>
<tr><td><code>src/GFM_GFL_IBR.c</code></td>
<td>EPRI's <code>GFM-GFL-IBR-PWM-Model</code>, version 1.1.0.0, by D. Ramasubramanian, January 27, 2022:
<code>DLL_V1_1/GFM_GFL_IBR Model/GFM_GFL_IBR.c</code> of the same distribution (file date 2023-02-21, SHA-256
<code>5df73248...</code>)</td>
<td>Not printed. [EPRI2023] is cited because EPRI made it the condition of its written permission (2026-06-09) to
redistribute this source; Appendix B of that report prints a different model (<code>IBR-Average-Model</code>, V. Verma,
EPRI, 2023; 15 inputs, 13 outputs, 54 parameters, against 12, 12 and 41 here). The CC BY 4.0 licence of the report
does not extend to this file.</td></tr>
</table>
<p>
All four files reached OpenIPSL through
<a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a> (Hao Chang, head
<code>3c15968f</code>). The full SHA-256 values are in the provenance blocks of the files.
</p>
<h4>Differences from the originals</h4>
<p>
In the control code there are none: the computations in <code>Model_Initialize</code> and <code>Model_Outputs</code>
of both models are those of the originals. All differences are listed below, with who made them.
</p>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\">
<tr><th>File</th><th>Difference</th><th>Made in</th><th>Effect</th></tr>
<tr><td rowspan=\"2\">both headers</td><td>a structure <code>rec_struct</code>, not part of the standard, added to
<code>IEEE_Cigre_DLLInterface.h</code></td><td>PR #362; removed again here</td><td>none (unused)</td></tr>
<tr><td>provenance block at the top; LF line endings</td><td>here</td><td>none</td></tr>
<tr><td rowspan=\"4\"><code>SCRX9.c</code></td><td><code>sprintf_s</code> replaced by <code>snprintf</code> in the
five messages (two in <code>Model_CheckParameters</code>, three in <code>Model_Initialize</code>), same text and buffer
size</td><td>PR #362</td><td>none; <code>sprintf_s</code> is provided only by MSVC</td></tr>
<tr><td><code>#include &lt;windows.h&gt;</code> removed</td><td>here</td><td>none; nothing in the model uses it, and
it does not exist on Linux</td></tr>
<tr><td><code>__declspec(dllexport) &lt;type&gt; __cdecl</code> replaced by the macros
<code>IEEE_CIGRE_EXPORT &lt;type&gt; IEEE_CIGRE_CALL</code> (<code>include/ieee_cigre_export.h</code>) on the six entry
points; file-scope data and helper functions made <code>static</code></td><td>here</td><td>the same exports on
Windows; builds with gcc on Linux; only the entry points are exported</td></tr>
<tr><td>Modelica glue and test code of PR #362 (added after the model)</td><td>PR #362; removed here</td><td>none
(the adapter <code>src/oipsl_cigre_adapter.c</code> drives the standard entry points instead)</td></tr>
<tr><td rowspan=\"7\"><code>GFM_GFL_IBR.c</code></td><td>the five messages of <code>Model_CheckParameters</code> that
report the reset of <code>KiI</code>, <code>KiPLL</code>, <code>KiP</code>, <code>KiQ</code>, <code>KiV</code> to
1/(2&nbsp;<code>delt</code>) are commented out</td><td>PR #362; kept</td><td>the gains are still reset; the model
returns an empty general message where the original returned the last of these messages</td></tr>
<tr><td>a block in <code>Model_Outputs</code> that overwrote all 41 parameters with constants at every call</td>
<td>PR #362; removed here</td><td>none against the original: the parameters given by the host are used, as in the
original. The two constant sets of PR #362 are the records
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Records\">GFM.Records</a>.</td></tr>
<tr><td>six states (8, 11, 19-22) set to zero in <code>Model_Initialize</code> instead of seeded from the initial
outputs</td><td>PR #362; restored here</td><td>none against the original</td></tr>
<tr><td>a check in <code>Model_CheckParameters</code> that returns the Error code when <code>Wtype</code> is not 0 or
1 or <code>PQflag</code> is not 0 or 1</td><td>here</td><td>rejects values that <code>Model_Outputs</code> does not
implement (the original left control variables uninitialised for them)</td></tr>
<tr><td><code>#include &lt;stdlib.h&gt;</code> added; file re-encoded from Windows-1252 to UTF-8 (three lines of the
header comment); LF line endings; trailing blanks; one blank line</td><td>PR #362</td><td>none</td></tr>
<tr><td><code>#include &lt;windows.h&gt;</code> removed; export macros and <code>static</code> as for SCRX9</td>
<td>here</td><td>as for SCRX9</td></tr>
<tr><td>Modelica glue, file input and output and two global variables of PR #362</td><td>PR #362; removed here</td>
<td>none against the original</td></tr>
</table>
<h4>What is needed to build the libraries from these sources</h4>
<p>
The changes marked &quot;here&quot; and the <code>snprintf</code> of PR #362 are those that let the unchanged model code
build with any C11 compiler on Windows and Linux: no Windows header, no MSVC-only function, and the export
decoration in one header. The shipped libraries are release builds with the static C runtime on Windows, so they need
no Visual C++ runtime or Visual Studio on the user's machine. This is deliberate: real-code models are often
distributed only as compiled DLLs for one platform, sometimes linked against the Visual Studio debug runtime, which
may not be redistributed. With the sources, the build project and the tests in OpenIPSL, the libraries can be rebuilt
and re-shipped with the current Visual Studio, Windows SDK, gcc and CMake whenever those are updated, instead of
becoming stale binaries. How to build them, and the build of the shipped binaries,
are in <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.README\">README</a> and in
<code>OpenIPSL/Resources/C-Sources/IEEE_CIGRE/README.md</code>.
</p>
<h4>References</h4>
<ul>
<li>[TB958] CIGRE JWG B4.82/IEEE, &quot;Guidelines for use of real-code in EMT models for HVDC, FACTs and inverter based
generators in power systems analysis,&quot; CIGRE Technical Brochure 958, 2025, ISBN 978-2-85873-663-8.</li>
<li>[EPRI2023] EPRI, &quot;Code Based Generic Inverter Based Resource Model,&quot; Technical Update 3002028322, Palo
Alto, CA, November 2023 (CC BY 4.0),
<a href=\"https://www.epri.com/research/products/000000003002028322\">https://www.epri.com/research/products/000000003002028322</a>.</li>
<li>[Ramasubramanian2022] D. Ramasubramanian, &quot;Differentiating between plant level and inverter level voltage
control to bring about operation of 100% inverter-based resource grids,&quot; Electric Power Systems Research, vol.
205, 107739, April 2022, <a href=\"https://doi.org/10.1016/j.epsr.2021.107739\">DOI: 10.1016/j.epsr.2021.107739</a>.</li>
</ul>
</html>"));
end Provenance;
