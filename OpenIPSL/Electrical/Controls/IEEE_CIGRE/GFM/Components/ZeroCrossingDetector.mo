within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components;
model ZeroCrossingDetector "Fault switch command that closes at once and opens at the next current zero crossing"
  Modelica.Blocks.MathBoolean.RisingEdge rising1
    annotation (Placement(transformation(extent={{-60,24},{-52,32}})));
  Modelica.Blocks.MathBoolean.FallingEdge falling1
    annotation (Placement(transformation(extent={{-60,-4},{-52,4}})));
  Modelica.Blocks.Logical.RSFlipFlop rSFlipFlop2
    annotation (Placement(transformation(extent={{-40,-16},{-20,4}})));
  Modelica.Blocks.Logical.ZeroCrossing zeroCrossing annotation (Placement(
        transformation(extent={{-10,-10},{10,10}}, rotation=270)));
  Modelica.Blocks.Logical.RSFlipFlop rSFlipFlop1
    annotation (Placement(transformation(extent={{54,12},{74,32}})));
  Modelica.Blocks.Interfaces.BooleanInput u "Fault command, true while the fault is applied"
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  Modelica.Blocks.Interfaces.BooleanOutput y "Switch command, true = closed"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput u1(unit="A") "Current whose zero crossing opens the switch" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,100})));
equation
  connect(falling1.u, rising1.u) annotation (Line(points={{-61.6,0},{-66,
          0},{-66,28},{-61.6,28}}, color={255,0,255}));
  connect(rising1.y, rSFlipFlop1.S)
    annotation (Line(points={{-51.2,28},{52,28}}, color={255,0,255}));
  connect(falling1.y, rSFlipFlop2.S)
    annotation (Line(points={{-51.2,0},{-42,0}}, color={255,0,255}));
  connect(rSFlipFlop2.R, rSFlipFlop1.QI) annotation (Line(points={{-42,
          -12},{-42,-38},{82,-38},{82,16},{75,16}}, color={255,0,255}));
  connect(rSFlipFlop2.Q, zeroCrossing.enable)
    annotation (Line(points={{-19,0},{-12,0}}, color={255,0,255}));
  connect(zeroCrossing.y, rSFlipFlop1.R) annotation (Line(points={{0,-11},
          {0,-16},{44,-16},{44,16},{52,16}}, color={255,0,255}));
  connect(rSFlipFlop1.Q, y) annotation (Line(points={{75,28},{96,28},{96,
          0},{110,0}}, color={255,0,255}));
  connect(u, rising1.u) annotation (Line(points={{-100,0},{-66,0},{-66,28},
          {-61.6,28}}, color={255,0,255}));
  connect(zeroCrossing.u, u1)
    annotation (Line(points={{0,12},{0,100}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>
Command logic of the fault switches in
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.ShortFault\">ShortFault</a> and
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.SmoothShortFault\">SmoothShortFault</a>.
A rising edge of the fault command <code>u</code> sets the output <code>y</code> (switch closed) at once. After a falling
edge of <code>u</code>, the zero-crossing detector on the current <code>u1</code> is enabled and resets <code>y</code>
at the next zero crossing, so the fault is cleared at a current zero as a circuit breaker would clear it.
</p>
<p>
Ported from <code>tools.zeroXdetect</code> of <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a>; only the name, the descriptions and this documentation
changed.
</p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          lineThickness=0.5), Text(
          extent={{-94,76},{98,-110}},
          textColor={28,108,200},
          textString="Zero Current
Detect
")}),                                 Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end ZeroCrossingDetector;
