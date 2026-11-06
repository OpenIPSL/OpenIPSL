within OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.Components;
model EMTPTransformerZeroSeq "Wye-delta transformer between the Thevenin grid and a resistive load, without converter"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.EMTPGrid eMTPGrid(Vbase=20000)
    annotation (Placement(transformation(extent={{34,-20},{74,20}})));
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.Line_R line_R(Resistance=100)  annotation (Placement(transformation(
          extent={{-114,-20},{-74,20}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-130,-32},{-110,-12}})));
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.EMTPTransformerZeroSeq transformer(
    Winding1Voltage=20000,
    Winding2Voltage=6000,
    Rtf_delta=2)
    annotation (Placement(transformation(extent={{4,-20},{-50,20}})));
equation
  connect(line_R.p1, line_R.p2) annotation (Line(points={{-114,-12},{-120,-12},{
          -120,12},{-114,12}},            color={0,0,255}));
  connect(line_R.p, line_R.p2) annotation (Line(points={{-114,0},{-120,0},{-120,
          12},{-114,12}},          color={0,0,255}));
  connect(line_R.p1, ground.p)
    annotation (Line(points={{-114,-12},{-120,-12}}, color={0,0,255}));
  connect(transformer.Cd, line_R.n2)
    annotation (Line(points={{-50,12},{-74,12}}, color={0,0,255}));
  connect(line_R.n, transformer.Bd)
    annotation (Line(points={{-74,0},{-50,0}}, color={0,0,255}));
  connect(transformer.Ad, line_R.n1)
    annotation (Line(points={{-50,-12},{-74,-12}}, color={0,0,255}));
  connect(transformer.Cy, eMTPGrid.C)
    annotation (Line(points={{3.61429,12},{34,12}},
                                                  color={0,0,255}));
  connect(eMTPGrid.B, transformer.By)
    annotation (Line(points={{34,0},{4,0}},   color={0,0,255}));
  connect(transformer.Ay, eMTPGrid.A)
    annotation (Line(points={{4,-12},{34,-12}},   color={0,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,100}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,100}})),
    Documentation(info="<html>
<p>
Network-only test (no DLL): a 20 kV
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.EMTPGrid\">EMTPGrid</a> feeds
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.EMTPTransformerZeroSeq\">EMTPTransformerZeroSeq</a>
(20 kV/6 kV, <code>Rtf_delta = 2</code> Ohm), whose delta side is loaded by 100 Ohm per phase to ground
(<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.Line_R\">Line_R</a> with its input
pins grounded).
</p>
<ul>
<li>No event: the run shows the energisation transient and the steady state.</li>
<li>Plot <code>transformer.VSecABLL.v</code>, <code>.VSecBCLL1.v</code>, <code>.VSecABLL1.v</code>
(line-to-line voltages of the delta side, V), <code>transformer.VabcSum.y</code> (their sum, ideally zero)
and <code>transformer.Bcurrent.i</code>.</li>
</ul>
<h4>How to run</h4>
<p>
Fixed-step Euler with a 1e-5 s step as for the converter tests (OpenModelica: <code>method=&quot;euler&quot;</code>,
<code>numberOfIntervals = 300000</code>); no shared library is needed.
</p>
<p>
Ported from <code>GridComponentsTest.EMTPTransZeroSeqTest</code> of <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a>, which lived inside the library
package. The grid voltage is now 20 kV, the rating of winding 1; the pull request drove the 20 kV winding from a
230 kV source.
</p>
</html>"),
    experiment(
      StopTime=3,
      Interval=0.0001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Euler",
      __Dymola_fixedstepsize=1e-05),
    __OpenModelica_simulationFlags(s="euler"));
end EMTPTransformerZeroSeq;
