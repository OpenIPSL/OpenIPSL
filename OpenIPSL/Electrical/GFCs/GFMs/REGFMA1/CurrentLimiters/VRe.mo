within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters;
model VRe "Virtual Resistor Computation"
  Modelica.Blocks.Interfaces.RealInput Emag
    "Input to vary the voltage magnitude of the voltage source" annotation (
      Placement(transformation(extent={{-120,70},{-100,90}}),
        iconTransformation(extent={{-120,70},{-100,90}})));
  Modelica.Blocks.Interfaces.RealInput Eang
    "Input to vary the angle of the voltage source" annotation (Placement(
        transformation(extent={{-120,30},{-100,50}}),   iconTransformation(
          extent={{-120,30},{-100,50}})));
  Modelica.Blocks.Interfaces.RealInput V
    "Input to vary the voltage magnitude of the voltage source" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,-40}),
                          iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,-40})));
  Modelica.Blocks.Interfaces.RealInput anglev
    "Input to vary the angle of the voltage source" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,-80}),iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,-80})));
  Modelica.Blocks.Interfaces.RealOutput R_e
    "Output Value of the Virtual Resistance" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,0})));
  parameter Real R_a=1e-3 "Internal source resistance, pu, machine base"
    annotation (Dialog(group="Voltage Source parameters"));
  parameter Real X_d=0.2 "Internal source d-axis reactance, pu, machine base"
    annotation (Dialog(group="Voltage Source parameters"));
  parameter Real Imax = 2.0 "Inverter allowable maximum output current, pu, machine base"
    annotation (Dialog(group="Current Limiter Setting"));
  Real numval(start=0) "Numerator of the expression within the division of R_e computation: |E - V|^2";
  Real Ra2pXd2(start=0) "Square sum of the voltage source resistance and reactance, |R_a + jX_d|^2";
  Real divres(start=0) "Result of the division in the R_e computation: |E - V|^2/Imax^2";
  Real subsval(start=0) "Result of subtraction in the R_e computation; positive when the current through R_a + jX_d would exceed Imax";
equation
  numval = Emag^2 + V^2 - 2*Emag*V*cos(Eang-anglev) "|E - V|^2 by the law of cosines";
  divres = numval/Imax^2 "|E - V|^2/Imax^2, the squared impedance that limits the current to Imax";
  Ra2pXd2 = R_a^2+X_d^2 "|R_a + jX_d|^2";
  subsval = divres - Ra2pXd2 "Positive when |E - V|/|R_a + jX_d| > Imax";
  R_e = noEvent(if subsval > 0 then sqrt(max(divres - X_d^2, R_a^2)) - R_a else 0)
    "The exact root of |E - V| = Imax*|R_a + R_e + jX_d|, zero when the current is below Imax; continuous at the switch, which is evaluated without an event (see Documentation)";
  annotation (preferredView="text",Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          lineThickness=1),
        Rectangle(
          extent={{-80,10},{-60,-10}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-60,0},{-40,0}}, color={28,108,200},
          thickness=1),
        Rectangle(
          extent={{-40,20},{40,-20}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineThickness=1),
        Line(points={{40,0},{60,0}}, color={28,108,200},
          thickness=1),
        Rectangle(
          extent={{60,10},{80,-10}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-60,-20},{60,-100}},
          textColor={28,108,200},
          textString="R_e"),
        Text(
          extent={{-80,92},{80,-40}},
          textColor={170,213,255},
          textStyle={TextStyle.Bold},
          textString="V"),
        Text(
          extent={{-80,88},{80,-72}},
          textColor={28,108,200},
          textString="V",
          textStyle={TextStyle.Bold})}),
    Documentation(info="<html>
<p>
The virtual resistance of the current limiter of <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2024]</a>, section IV-C:
the resistance <code>R_e</code> in series with the source impedance <code>R_a + jX_d</code> (pu, machine base) for which the current that the
internal voltage <code>E</code> (inputs <code>Emag</code>, <code>Eang</code>) drives into the terminal voltage <code>V</code>
(inputs <code>V</code>, <code>anglev</code>) has the magnitude <code>Imax</code>:
</p>
<p>
<code>|E - V| = Imax |R_a + R_e + jX_d|</code>, so <code>R_e = sqrt(|E - V|^2/Imax^2 - X_d^2) - R_a</code>
when <code>|E - V|/|R_a + jX_d| &gt; Imax</code>, and <code>R_e = 0</code> otherwise.
</p>
<p>
<code>E</code> must be the commanded internal voltage (the droop command), not the voltage of a source that the limiter has already changed:
fed back the limited voltage, <code>R_e</code> collapses to zero. The two branches meet at the switch (<code>R_e = 0</code> there),
which is evaluated without an event: within an algebraic loop through the network an event keeps the previous branch while the network
is solved at a switching, and a network can then converge to another of its solutions (a load bus at zero voltage, seen at a fault's clearing).
</p>
</html>"));
end VRe;
