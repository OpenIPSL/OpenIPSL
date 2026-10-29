within OpenIPSL.Electrical.Controls;
package IEEE_CIGRE "Real-code (IEEE/CIGRE DLL) controller models"
  extends Modelica.Icons.Package;

  annotation (Documentation(info="<html>
<p>
Controller models whose dynamics are computed by compiled C code written to the IEEE/CIGRE DLL Modeling Standard
(&quot;real code&quot; models, API V2, CIGRE Technical Brochure 958), instead of by Modelica equations. The same
compiled model can be run by any power system simulator that implements the standard; this package lets the three
Modelica tools in OpenIPSL's verification (Dymola, OpenModelica and Wolfram System Modeler) run it as well.
</p>
<ul>
<li><a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.README\">README</a>: how the shared libraries are
built for each platform, where they are, how each tool finds them, and the references.</li>
<li><a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.Provenance\">Provenance</a>: where each C source comes
from, every difference from its original, and what was changed so that anyone can build the libraries.</li>
<li><a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.SCRX9\">SCRX9</a>: the SCRX static exciter, the
example model of the standard (phasor, RMS mode, 5 ms sample time).</li>
<li><a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM\">GFM</a>: the EPRI grid-forming / grid-following
inverter-based resource model (EMT, three phase, 10 microsecond sample time).</li>
</ul>
<h4>The standard in short</h4>
<p>
An IEEE/CIGRE DLL exports eight C functions with fixed names (<code>Model_GetInfo</code>,
<code>Model_CheckParameters</code>, <code>Model_Initialize</code>, <code>Model_Outputs</code>,
<code>Model_Terminate</code>, <code>Model_PrintInfo</code>, ...) and describes its inputs, outputs, parameters,
number of states and fixed base sample time in a model information structure. The host simulator allocates one
instance structure per use of the model, initialises it from the initial outputs, and then calls
<code>Model_Outputs</code> once per sample time with the current inputs.
</p>
<h4>How the Modelica wrapper works</h4>
<ul>
<li>Every library also exports a small OpenIPSL adapter with a model-specific prefix (for example
<code>SCRX9_oipsl_create</code>, <code>SCRX9_oipsl_step</code>), compiled from one generic C source. The adapter drives
the model through the standard API inside the library; the standard's own function names are never called from
Modelica, because every IEEE/CIGRE DLL exports the same names.</li>
<li>Each model package holds an <code>Instance</code> external object (create and free one instance of the DLL model)
and the external functions <code>step</code>, <code>sampleTime</code> and <code>count</code>, all
bound with <code>annotation(Library=&quot;&lt;Name&gt;&quot;, LibraryDirectory=&quot;modelica://OpenIPSL/Resources/Library&quot;)</code>.</li>
<li>The wrapper model reads the sample time <code>Ts</code> from the library and calls <code>step</code> exactly once
per sample in <code>when sample(0, Ts)</code>: inputs are sampled and outputs are held between samples, as in the host
loop of the standard. Every sample is a time event, so the DLL clock equals the simulation time with any solver; the
explicit Euler method with the DLL's step is the cheapest choice and is written in the experiment annotations of the
tests.</li>
<li>No file input or output, no global state apart from the vendor model's shared message buffer, no tool-specific
functions: several instances of the same model can run side by side in one simulation.</li>
</ul>
<h4>Platforms</h4>
<p>
Binaries are shipped for <strong>win64</strong> (<code>Resources/Library/win64/&lt;Name&gt;.dll</code> and
<code>&lt;Name&gt;.lib</code>, built with MSVC 19.51 x64, Visual Studio Community 2026 18.11.2, static runtime
<code>/MT</code>) and <strong>linux64</strong> (<code>Resources/Library/linux64/lib&lt;Name&gt;.so</code>, built with
gcc 15.2.0 on Ubuntu 26.04.1 LTS under WSL2, glibc 2.43, linked with <code>-Bsymbolic</code>). On any other platform, or when a shipped binary does not
load, build the libraries from <code>Resources/C-Sources/IEEE_CIGRE/</code> as described in the
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.README\">README</a>.
</p>
<h4>Tools</h4>
<p>
The binding of the shared libraries was checked with Dymola 2026x Refresh 1, OpenModelica 1.27.1 and Wolfram System
Modeler 15.0 on Windows 11 and, with the shipped <code>linux64</code> libraries, on Ubuntu 24.04 LTS under WSL2
(2026-10-25). System Modeler asks once to trust the external functions of the library; the README explains this
and how each tool finds the shared library.
</p>
<h4>References</h4>
<ul>
<li>CIGRE JWG B4.82/IEEE, &quot;Guidelines for use of real-code in EMT models for HVDC, FACTs and inverter based
generators in power systems analysis,&quot; CIGRE Technical Brochure 958, 2025 (the standard; Appendix E is the SCRX
example).</li>
<li>H. Chang and L. Vanfretti, &quot;Integrating the IEEE/CIGRE DLL Modeling Standard to Use 'Real Code' Models for
Power System Analysis in Modelica Tools,&quot; Proceedings of the American Modelica Conference 2024, October 14-16,
2024, Storrs, Connecticut, USA, <a href=\"https://doi.org/10.3384/ecp20772\">DOI: 10.3384/ecp20772</a>.</li>
<li>H. Chang and L. Vanfretti, &quot;EMT Modelling and Simulation of Grid Following Converters in Modelica Integrating
the IEEE/CIGRE 'Real Code'/DLL Modelling Guidelines,&quot; CIGRE Paris Session 2026, paper C4-10724, Paris, France,
August 2026,
<a href=\"https://www.e-cigre.org/publications/detail/c4-10724-2026-emt-modelling-and-simulation-of-grid-following-converters-in-modelica-integrating-the-ieeecigre-real-codedll-modelling-guidelines.html\">e-cigre</a>.</li>
<li>[EPRI2023] EPRI, &quot;Code Based Generic Inverter Based Resource Model,&quot; Technical Update 3002028322, Palo
Alto, CA, November 2023 (CC BY 4.0),
<a href=\"https://www.epri.com/research/products/000000003002028322\">https://www.epri.com/research/products/000000003002028322</a>.</li>
<li>[Ramasubramanian2022] D. Ramasubramanian, &quot;Differentiating between plant level and inverter level voltage
control to bring about operation of 100% inverter-based resource grids,&quot; Electric Power Systems Research, vol.
205, 107739, April 2022, <a href=\"https://doi.org/10.1016/j.epsr.2021.107739\">DOI: 10.1016/j.epsr.2021.107739</a>.</li>
</ul>
</html>"));
end IEEE_CIGRE;
