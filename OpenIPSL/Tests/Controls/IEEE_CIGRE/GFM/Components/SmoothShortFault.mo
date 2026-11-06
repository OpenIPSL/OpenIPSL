within OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.Components;
model SmoothShortFault "Smooth three-phase fault on the 230 kV Thevenin grid, without converter"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.EMTPGrid eMTPGrid(Vbase=230000)
    annotation (Placement(transformation(extent={{12,-20},{52,20}})));
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.SmoothShortFault smoothShortFault(
    faultDuration=0.03, f_cut=100)
    annotation (Placement(transformation(extent={{-40,-28},{0,20}})));
equation
  connect(smoothShortFault.C_n, eMTPGrid.C)
    annotation (Line(points={{0,12},{12,12}}, color={0,0,255}));
  connect(smoothShortFault.B_n, eMTPGrid.B)
    annotation (Line(points={{0,0},{12,0}}, color={0,0,255}));
  connect(smoothShortFault.A_n, eMTPGrid.A)
    annotation (Line(points={{0,-12},{12,-12}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
Network-only test (no DLL):
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.SmoothShortFault\">SmoothShortFault</a>
(5 Ohm, 30 ms, switch filter cut-off 100 Hz) at the terminals of the 230 kV
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.EMTPGrid\">EMTPGrid</a>; the other
side of the fault is open.
</p>
<ul>
<li>Events: fault applied at 5 s, command removed at 5.03 s, each phase opens at its next current zero.</li>
<li>Plot <code>smoothShortFault.currentSensor.i</code>, <code>smoothShortFault.currentSensor1.i</code>,
<code>smoothShortFault.currentSensor2.i</code> (fault currents, A) and <code>smoothShortFault.smoothSwitch.resistor.R</code>.</li>
</ul>
<h4>How to run</h4>
<p>
Fixed-step Euler with a 1e-5 s step as for the converter tests (OpenModelica: <code>method=&quot;euler&quot;</code>,
<code>numberOfIntervals = 550000</code>); no shared library is needed.
</p>
<p>
Ported from <code>GridComponentsTest.SmoothEMTPGridTest</code> of <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a>, which lived inside the library
package; the unused modifier <code>threshold</code> is gone and StopTime is 5.5 s instead of 10 s (nothing happens
after the fault).
</p>
</html>"),
    experiment(
      StopTime=5.5,
      Interval=0.0001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Euler",
      __Dymola_fixedstepsize=1e-05),
    __OpenModelica_simulationFlags(s="euler"));
end SmoothShortFault;
