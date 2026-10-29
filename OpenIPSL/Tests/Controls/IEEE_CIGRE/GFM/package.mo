within OpenIPSL.Tests.Controls.IEEE_CIGRE;
package GFM "Tests of the EMT inverter driven by the EPRI GFM-GFL-IBR-PWM real-code DLL"
  extends Modelica.Icons.ExamplesPackage;

  annotation (Documentation(info="<html>
<p>
EMT tests of
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR\">GFM_GFL_IBR</a>, the three-phase
inverter whose controller is the EPRI real-code model behind the IEEE/CIGRE DLL <code>GFM_GFL_IBR</code>. All converter
tests run the DLL's parameter set of the Dymola studies (droop frequency control, Q control, P priority) except
<a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.GFL_FaultPSCAD\">GFL_FaultPSCAD</a>, which uses EPRI's
PSCAD set. The names follow the 2026 papers, which call the case grid following (GFL); the package keeps the name of the
EPRI model.
</p>
<ul>
<li><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.GFL_Fault\">GFL_Fault</a>: ideal 6.5 kV source, power step at 2 s, 0.8 pu voltage dip at 5 s.</li>
<li><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.GFL_POCFault\">GFL_POCFault</a>: wye-delta transformer and 230 kV grid, three-phase fault at the point of connection at 3 s (the fault figure of the CIGRE 2026 paper).</li>
<li><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.GFL_FrequencyStep\">GFL_FrequencyStep</a>: -0.5 Hz grid frequency step at 2 s.</li>
<li><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.GFL_VoltageStep\">GFL_VoltageStep</a>: grid voltage step to 0.95 pu at 2 s.</li>
<li><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.GFL_PowerRamp\">GFL_PowerRamp</a>: active and reactive power ramps from 2 s to 2.8 s.</li>
<li><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.GFL_FaultPSCAD\">GFL_FaultPSCAD</a>: PSCAD parameter set on a 650 V source, power step at 2 s, 0.7 pu dip at 5 s.</li>
<li><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.GFM_EMTPFault\">GFM_EMTPFault</a>: 6.5 kV Thevenin grid, three-phase fault at 5 s.</li>
<li><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.GFM_EMTPFull\">GFM_EMTPFull</a>: full chain with the grounded-delta transformer, fault on the 230 kV side at 5 s.</li>
<li><a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.Components\">Components</a>: two network-only tests (no DLL) of the fault and the transformer.</li>
</ul>
<p>
The times in this list are the papers' round times. The converter tests apply each disturbance 5e-6 s later, half a
DLL sample off the sample grid, so that every tool orders it the same way relative to the DLL step (see the
<a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.README\">README</a>).
</p>
<p>
Every converter test steps the DLL every 1e-5 s through <code>when sample(0, Ts)</code> and carries
<code>experiment(Interval=1e-4, Tolerance=1e-6)</code> with fixed-step Euler at 1e-5 s for Dymola and
<code>__OpenModelica_simulationFlags(s=&quot;euler&quot;)</code> for OpenModelica, whose Euler step equals the output
interval (run it with <code>numberOfIntervals = StopTime/1e-5</code>). Each test documents its events, the signals to
plot and how to run it; the build of the shared library and the tool details are in the
<a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.README\">README</a> of the parent package.
</p>
<p>
Ported from the package <code>Tests.Controls.IEEE_CIGRE.GFM</code> of
<a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a> (Hao Chang). Not ported:
the <code>list.dat</code> save/load tests (<code>GFM_TestNoFault</code>, <code>GFM_SaveInit</code>,
<code>GFM_InitNoFault</code>, <code>GFM_InitLine</code>), <code>GFM_Transformer</code>, <code>Transformer_test</code>,
<code>GFM_Test_no_grid</code>, <code>VSCperPhase</code>, <code>GFM_EMTPFullPSCAD</code> and the duplicated
<code>GFM_PSCAD</code> package.
</p>
</html>"));
end GFM;
