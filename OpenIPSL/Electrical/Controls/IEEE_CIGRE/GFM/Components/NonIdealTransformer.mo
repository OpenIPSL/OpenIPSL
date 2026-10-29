within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components;
model NonIdealTransformer "Single-phase ideal transformer with a low-pass filter in its voltage relation"
  parameter Real n=1 "Turns ratio primary:secondary voltage";
  SI.Voltage v1 "Voltage drop of port 1 (= p1.v - n1.v)";
  SI.Voltage v2 "Voltage drop of port 2 (= p2.v - n2.v)";
  SI.Current i1 "Current flowing from pos. to neg. pin of port 1";
  SI.Current i2 "Current flowing from pos. to neg. pin of port 2";
  Modelica.Electrical.Analog.Interfaces.PositivePin p1 "Positive pin of the primary"
    annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n1 "Negative pin of the primary"
    annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin p2 "Positive pin of the secondary"
    annotation (Placement(transformation(extent={{90,90},{110,110}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n2 "Negative pin of the secondary"
    annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
  Modelica.Blocks.Continuous.Filter filter(f_cut=f_cut) "Low-pass filter between primary voltage and n times the secondary voltage"
    annotation (Placement(transformation(extent={{-44,-10},{-24,10}})));
  parameter SI.Frequency f_cut=1000 "Cut-off frequency of the voltage filter";
equation
  v1 = p1.v - n1.v;
  v2 = p2.v - n2.v;
  i1 = p1.i;
  i2 = p2.i;
  0 = p1.i + n1.i;
  0 = p2.i + n2.i;

  i1 = -i2/n;
  filter.y = n*v2;
  v1=filter.u;
  annotation (Documentation(info="<html>
<p>
Ideal single-phase transformer whose voltage relation passes through a second-order critically damped low-pass filter
(<code>Modelica.Blocks.Continuous.Filter</code>, cut-off frequency <code>f_cut</code>): <code>n*v2</code> is the filtered
primary voltage <code>v1</code>, and the currents obey <code>i1 = -i2/n</code>. There is no magnetising branch and no
winding impedance; the series impedance is added around it in
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.TransformerSubcircuitZeroZsec\">TransformerSubcircuitZeroZsec</a>.
</p>
<p>
Ported from <code>tools.NoneIdealTransformer</code> of <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a>: name corrected, the unused parameters
<code>considerMagnetization</code> and <code>Lm1</code> removed, <code>n</code> given a binding (it had only a start
value) and an icon added (the original had none).
</p>
</html>"),
    Icon(graphics={
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
        Ellipse(extent={{-60,40},{20,-40}}, lineColor={28,108,200}),
        Ellipse(extent={{-20,40},{60,-40}}, lineColor={28,108,200}),
        Line(points={{-100,100},{-80,100},{-80,0},{-60,0}}, color={28,108,200}),
        Line(points={{-100,-100},{-80,-100},{-80,0}}, color={28,108,200}),
        Line(points={{100,100},{80,100},{80,0},{60,0}}, color={28,108,200}),
        Line(points={{100,-100},{80,-100},{80,0}}, color={28,108,200}),
        Text(extent={{-100,-50},{100,-90}}, textColor={28,108,200}, textString="f_cut=%f_cut"),
        Text(extent={{-100,90},{100,50}}, textColor={28,108,200}, textString="n=%n")}));
end NonIdealTransformer;
