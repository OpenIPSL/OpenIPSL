within OpenIPSL.Electrical.Controls.IEEE_CIGRE;
package GFM "Grid-forming/grid-following inverter (EPRI GFM-GFL-IBR-PWM real-code model behind an IEEE/CIGRE DLL) with its EMT network components"
  extends Modelica.Icons.Package;

  annotation (Documentation(info="<html>
<p>
This package wraps the EPRI <em>GFM-GFL-IBR-PWM-Model</em> (version 1.1.0.0, Deepak Ramasubramanian, EPRI, 2022), a
grid-forming/grid-following inverter controller written in C according to the IEEE/CIGRE DLL modelling standard, and
provides the three-phase electromagnetic-transient (EMT) network pieces needed to test it with
<code>Modelica.Electrical.Analog</code> components.
</p>
<h4>Contents</h4>
<ul>
<li><a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR\">GFM_GFL_IBR</a>: the converter model (controller DLL, average-value bridge, R-L-C output filter, pins A, B, C).</li>
<li><a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Instance\">Instance</a> and <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Functions\">Functions</a>: the external object and the external functions bound to the shared library <code>GFM_GFL_IBR</code> in <code>OpenIPSL/Resources/Library/&lt;platform&gt;/</code>.</li>
<li><a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Records\">Records</a>: the 41 DLL parameters as a record (defaults of the Dymola studies) and the PSCAD parameter set.</li>
<li><a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components\">Components</a>: sensors, switches, transformers, grids and faults for the EMT test circuits.</li>
</ul>
<h4>How the DLL is driven</h4>
<p>
The DLL integrates its own discrete states with a fixed base sample time of 1e-5 s
(<code>Model_Info.FixedStepBaseSampleTime</code>). The converter model reads that value through
<code>Functions.sampleTime()</code> and calls <code>Functions.step()</code> once per sample in a
<code>when sample(0, Ts)</code> clause; the outputs are held between samples. Any solver therefore sees one time event
every 10 microseconds. Fixed-step explicit Euler with a 1e-5 s step is the cheapest setting and the one written in the
experiment annotations of the tests in
<a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM\">OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM</a>.
</p>
<h4>Provenance and licence</h4>
<p>
The C source of the controller is EPRI's <code>GFM-GFL-IBR-PWM-Model</code> as distributed by CIGRE JWG B4.82 in its
example code (version DLL_V1_1). It reached OpenIPSL through pull request #362 and is redistributed in
<code>OpenIPSL/Resources/C-Sources/IEEE_CIGRE/</code> with EPRI's written permission (2026-06-09), on condition that
whoever uses or redistributes the model cites the EPRI report [EPRI2023] and the paper by Ramasubramanian listed below.
The source itself is not printed in [EPRI2023]: Appendix B of that report holds a different model, and the CC BY 4.0
licence of the report does not extend to this file. The origin of every C file and its differences from the original
are listed in <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.Provenance\">IEEE_CIGRE.Provenance</a>.
The Modelica integration follows the two papers by Chang and Vanfretti.
</p>
<h4>References</h4>
<ul>
<li>[EPRI2023] EPRI, &quot;Code Based Generic Inverter Based Resource Model,&quot; Technical Update 3002028322, Palo
Alto, CA, November 2023 (CC BY 4.0),
<a href=\"https://www.epri.com/research/products/000000003002028322\">https://www.epri.com/research/products/000000003002028322</a>.</li>
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
end GFM;
