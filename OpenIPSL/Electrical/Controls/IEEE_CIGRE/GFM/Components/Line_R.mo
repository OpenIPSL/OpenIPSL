within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components;
model Line_R "Three-phase series resistance"
  parameter Modelica.Units.SI.Resistance Resistance=0 "Series resistance of each phase";
  Modelica.Electrical.Analog.Interfaces.PositivePin p "Phase B, input side" annotation (Placement(
        transformation(rotation=0, extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin p1 "Phase A, input side" annotation (Placement(
        transformation(rotation=0, extent={{-110,-70},{-90,-50}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin p2 "Phase C, input side" annotation (Placement(
        transformation(rotation=0, extent={{-110,50},{-90,70}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n "Phase B, output side" annotation (Placement(
        transformation(rotation=0, extent={{90,-10},{110,10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n1 "Phase A, output side" annotation (Placement(
        transformation(rotation=0, extent={{90,-70},{110,-50}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n2 "Phase C, output side" annotation (Placement(
        transformation(rotation=0, extent={{90,50},{110,70}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=Resistance)
    annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R=Resistance)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R=Resistance)
    annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
equation
  connect(resistor.p, p2)
    annotation (Line(points={{-10,60},{-100,60}}, color={0,0,255}));
  connect(p, resistor1.p)
    annotation (Line(points={{-100,0},{-10,0}}, color={0,0,255}));
  connect(resistor2.p, p1)
    annotation (Line(points={{-10,-60},{-100,-60}}, color={0,0,255}));
  connect(resistor2.n, n1)
    annotation (Line(points={{10,-60},{100,-60}}, color={0,0,255}));
  connect(n, resistor1.n)
    annotation (Line(points={{100,0},{10,0}}, color={0,0,255}));
  connect(resistor.n, n2)
    annotation (Line(points={{10,60},{100,60}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>
Three resistors of value <code>Resistance</code> in series with phases A (<code>p1</code> to <code>n1</code>), B
(<code>p</code> to <code>n</code>) and C (<code>p2</code> to <code>n2</code>). Used as a resistive load or a short
resistive line in the EMT tests.
</p>
<p>
Ported from <code>GridComponents.Line_R</code> of <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a>: the unused parameter <code>Time</code> removed,
<code>Resistance</code> typed as a resistance and an icon added (the original had none).
</p>
</html>"),
    Icon(graphics={
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
        Rectangle(extent={{-40,70},{40,50}}, lineColor={28,108,200}),
        Rectangle(extent={{-40,10},{40,-10}}, lineColor={28,108,200}),
        Rectangle(extent={{-40,-50},{40,-70}}, lineColor={28,108,200}),
        Line(points={{-100,60},{-40,60}}, color={28,108,200}),
        Line(points={{40,60},{100,60}}, color={28,108,200}),
        Line(points={{-100,0},{-40,0}}, color={28,108,200}),
        Line(points={{40,0},{100,0}}, color={28,108,200}),
        Line(points={{-100,-60},{-40,-60}}, color={28,108,200}),
        Line(points={{40,-60},{100,-60}}, color={28,108,200}),
        Text(extent={{-100,-74},{100,-98}}, textColor={28,108,200}, textString="R=%Resistance")}));
end Line_R;
