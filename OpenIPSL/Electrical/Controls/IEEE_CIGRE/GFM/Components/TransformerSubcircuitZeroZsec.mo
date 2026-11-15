within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components;
model TransformerSubcircuitZeroZsec "Single-phase transformer unit with series impedance on winding 1 only"
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p "Winding 1, positive pin"
    annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p1 "Winding 2, positive pin"
    annotation (Placement(transformation(extent={{90,90},{110,110}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n "Winding 1, negative pin"
    annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n1 "Winding 2, negative pin"
    annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
  Modelica.Electrical.Analog.Basic.Inductor L1(L=Lp) "Series inductance of winding 1"
    annotation (Placement(transformation(extent={{-72,50},{-52,70}})));
  Modelica.Electrical.Analog.Basic.Resistor R1(R=Rp) "Series resistance of winding 1"
    annotation (Placement(transformation(extent={{-46,50},{-26,70}})));
  parameter Real n=1 "Voltage ratio winding 2 : winding 1 (the inner transformer uses 1/n)";
  parameter SI.Inductance Lp=1 "Series inductance on winding 1";
  parameter SI.Resistance Rp=1 "Series resistance on winding 1";

  parameter SI.Frequency f_cut=1000 "Cut-off frequency of the voltage filter of the inner transformer";
  NonIdealTransformer nonIdealTransformer(n=1/n, f_cut=f_cut) "Filtered ideal transformer"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
equation
  connect(L1.n, R1.p)
    annotation (Line(points={{-52,60},{-46,60}}, color={0,0,255}));
  connect(L1.p, pin_p) annotation (Line(points={{-72,60},{-86,60},{-86,100},{-100,
          100}}, color={0,0,255}));
  connect(nonIdealTransformer.p1, R1.n) annotation (Line(points={{-10,10},
          {-14,10},{-14,60},{-26,60}}, color={0,0,255}));
  connect(nonIdealTransformer.n1, pin_n) annotation (Line(points={{-10,
          -10},{-56,-10},{-56,-100},{-100,-100}}, color={0,0,255}));
  connect(nonIdealTransformer.n2, pin_n1) annotation (Line(points={{10,
          -10},{56,-10},{56,-100},{100,-100}}, color={0,0,255}));
  connect(nonIdealTransformer.p2, pin_p1) annotation (Line(points={{10,
          10},{56,10},{56,100},{100,100}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>
One phase of the three-phase transformers of this package: the series inductance <code>Lp</code> and resistance
<code>Rp</code> on winding 1 (<code>pin_p</code>, <code>pin_n</code>) followed by a
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.NonIdealTransformer\">NonIdealTransformer</a>
with ratio <code>1/n</code> to winding 2 (<code>pin_p1</code>, <code>pin_n1</code>). The winding 2 side has zero series
impedance (&quot;ZeroZsec&quot;).
</p>
<p>
Ported from <code>GridComponents.TFsubcircuitZeroZsec</code> of <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a>: renamed, the parameters
<code>Ls</code> and <code>Rs</code>, which no equation used, removed, and the description of <code>n</code> corrected
(it is the winding 2 to winding 1 voltage ratio, since the inner transformer receives <code>1/n</code>).
</p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(
          points={{-100,100},{-80,100}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{-80,106},{-52,94}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{80,100},{100,100}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-52,100},{-20,100}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{20,100},{80,100}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-2,100},{-2,-100}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{2,100},{2,-100}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-90,-100},{-20,-100}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{20,-100},{90,-100}},
          color={28,108,200},
          thickness=0.5),
        Ellipse(
          extent={{-10,10},{10,-10}},
          lineColor={28,108,200},
          lineThickness=0.5,
          closure=EllipseClosure.None,
          startAngle=0,
          endAngle=180,
          origin={-20,90},
          rotation=90),
        Ellipse(
          extent={{-10,10},{10,-10}},
          lineColor={28,108,200},
          lineThickness=0.5,
          closure=EllipseClosure.None,
          startAngle=0,
          endAngle=180,
          origin={-20,70},
          rotation=90),
        Ellipse(
          extent={{-10,10},{10,-10}},
          lineColor={28,108,200},
          lineThickness=0.5,
          closure=EllipseClosure.None,
          startAngle=0,
          endAngle=180,
          origin={-20,50},
          rotation=90),
        Ellipse(
          extent={{-10,10},{10,-10}},
          lineColor={28,108,200},
          lineThickness=0.5,
          closure=EllipseClosure.None,
          startAngle=0,
          endAngle=180,
          origin={-20,30},
          rotation=90),
        Ellipse(
          extent={{-10,10},{10,-10}},
          lineColor={28,108,200},
          lineThickness=0.5,
          closure=EllipseClosure.None,
          startAngle=0,
          endAngle=180,
          origin={-20,10},
          rotation=90),
        Ellipse(
          extent={{-10,10},{10,-10}},
          lineColor={28,108,200},
          lineThickness=0.5,
          closure=EllipseClosure.None,
          startAngle=0,
          endAngle=180,
          origin={-20,-10},
          rotation=90),
        Ellipse(
          extent={{-10,10},{10,-10}},
          lineColor={28,108,200},
          lineThickness=0.5,
          closure=EllipseClosure.None,
          startAngle=0,
          endAngle=180,
          origin={-20,-30},
          rotation=90),
        Ellipse(
          extent={{-10,10},{10,-10}},
          lineColor={28,108,200},
          lineThickness=0.5,
          closure=EllipseClosure.None,
          startAngle=0,
          endAngle=180,
          origin={-20,-50},
          rotation=90),
        Ellipse(
          extent={{-10,10},{10,-10}},
          lineColor={28,108,200},
          lineThickness=0.5,
          closure=EllipseClosure.None,
          startAngle=0,
          endAngle=180,
          origin={-20,-70},
          rotation=90),
        Ellipse(
          extent={{-10,10},{10,-10}},
          lineColor={28,108,200},
          lineThickness=0.5,
          closure=EllipseClosure.None,
          startAngle=0,
          endAngle=180,
          origin={-20,-90},
          rotation=90),
        Line(
          points={{-20,80},{-26,80}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-20,60},{-26,60}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-20,40},{-26,40}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-20,20},{-26,20}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-20,0},{-26,0}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-20,-20},{-26,-20}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-20,-40},{-26,-40}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-20,-60},{-26,-60}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-20,-80},{-26,-80}},
          color={28,108,200},
          thickness=0.5),
        Ellipse(
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          lineThickness=0.5,
          closure=EllipseClosure.None,
          startAngle=0,
          endAngle=180,
          origin={20,90},
          rotation=90),
        Ellipse(
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          lineThickness=0.5,
          closure=EllipseClosure.None,
          startAngle=0,
          endAngle=180,
          origin={20,70},
          rotation=90),
        Ellipse(
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          lineThickness=0.5,
          closure=EllipseClosure.None,
          startAngle=0,
          endAngle=180,
          origin={20,50},
          rotation=90),
        Ellipse(
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          lineThickness=0.5,
          closure=EllipseClosure.None,
          startAngle=0,
          endAngle=180,
          origin={20,30},
          rotation=90),
        Ellipse(
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          lineThickness=0.5,
          closure=EllipseClosure.None,
          startAngle=0,
          endAngle=180,
          origin={20,10},
          rotation=90),
        Ellipse(
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          lineThickness=0.5,
          closure=EllipseClosure.None,
          startAngle=0,
          endAngle=180,
          origin={20,-10},
          rotation=90),
        Ellipse(
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          lineThickness=0.5,
          closure=EllipseClosure.None,
          startAngle=0,
          endAngle=180,
          origin={20,-30},
          rotation=90),
        Ellipse(
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          lineThickness=0.5,
          closure=EllipseClosure.None,
          startAngle=0,
          endAngle=180,
          origin={20,-50},
          rotation=90),
        Ellipse(
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          lineThickness=0.5,
          closure=EllipseClosure.None,
          startAngle=0,
          endAngle=180,
          origin={20,-70},
          rotation=90),
        Ellipse(
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          lineThickness=0.5,
          closure=EllipseClosure.None,
          startAngle=0,
          endAngle=180,
          origin={20,-90},
          rotation=90),
        Line(
          points={{20,80},{26,80}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{20,60},{26,60}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{20,40},{26,40}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{20,20},{26,20}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{20,0},{26,0}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{20,-20},{26,-20}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{20,-40},{26,-40}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{20,-60},{26,-60}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{20,-80},{26,-80}},
          color={28,108,200},
          thickness=0.5),
        Text(
          extent={{-76,22},{-48,-22}},
          textColor={28,108,200},
          textString="1"),
        Text(
          extent={{44,22},{72,-22}},
          textColor={28,108,200},
          textString="2"),
        Text(
          extent={{-82,104},{-40,46}},
          textColor={28,108,200},
          textString="Zp"),
        Text(
          extent={{52,104},{92,48}},
          textColor={28,108,200},
          textString="Zs")}),                                    Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end TransformerSubcircuitZeroZsec;
