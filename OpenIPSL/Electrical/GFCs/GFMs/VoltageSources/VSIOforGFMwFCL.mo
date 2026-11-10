within OpenIPSL.Electrical.GFCs.GFMs.VoltageSources;
model VSIOforGFMwFCL
  "Voltage source behind an impedance driven by the droop commands, with the fault current limiter of REGFM_A1 (clamp, or virtual resistor)"
  extends OpenIPSL.Electrical.Sources.SourceBehindImpedance.BaseClasses.baseVoltageSource;
  Modelica.Blocks.Interfaces.RealInput uEmag(start=E0)
    "Droop command of the internal voltage magnitude, Edroop (pu)"
    annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput uEang(start=delta0)
    "Droop command of the internal voltage angle, delta_droop (rad)"
    annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));
  parameter OpenIPSL.Types.PerUnit Imax=2.0
    "Maximum transient current magnitude (pu, machine base): ImaxF of the specification, Imax of PSS/E's REGFMA1"
    annotation (Dialog(group="Fault current limiter"));
  parameter Boolean useVirtualResistor=false
    "false: the current is clamped to Imax at the angle of the unlimited current (PSS/E's REGFMA1, the WECC specification); true: a virtual resistor in series limits it to Imax"
    annotation (Dialog(group="Fault current limiter"));
  REGFMA1.CurrentLimiters.ClampOrVirtualResistor currentLimiter(
    R_a=R_a,
    X_d=X_d,
    Imax=Imax,
    useVirtualResistor=useVirtualResistor,
    Emag(start=E0),
    Eang(start=delta0),
    V(start=v_0),
    anglev(start=angle_0),
    ElimMag(start=E0),
    ElimAng(start=delta0),
    I_unlim(start=I0),
    I_mag(start=I0))
    "The fault current limiter: from the droop command and the terminal voltage to the internal voltage applied"
    annotation (Placement(transformation(extent={{-30,-30},{30,30}})));
  Modelica.Blocks.Sources.RealExpression sigV(y=V) "Terminal voltage magnitude"
    annotation (Placement(transformation(extent={{-80,-24},{-60,-4}})));
  Modelica.Blocks.Sources.RealExpression sigAnglev(y=anglev) "Terminal voltage angle"
    annotation (Placement(transformation(extent={{-80,-56},{-60,-36}})));
  Boolean limited(start=false) "true while the unlimited current exceeds Imax";
  OpenIPSL.Types.PerUnit I_unlim(start=I0) "Magnitude of the unlimited current (Edroop - V)/(R_a + jX_d), pu, machine base";
  OpenIPSL.Types.PerUnit I_mag(start=I0) "Magnitude of the output current, pu, machine base";
  OpenIPSL.Types.PerUnit R_e(start=0) "Virtual resistance, pu, machine base (zero with the clamp and when not limited)";
protected
  parameter OpenIPSL.Types.PerUnit I0=sqrt(ir0^2 + ii0^2)/CoB "Current of the power flow, pu, machine base";
equation
  E = uEmag "The droop command of the magnitude, |Edroop| (VAR(L+1) of PSS/E's REGFMA1)";
  delta = uEang "The droop command of the angle";
  limited = currentLimiter.limited "The state of the limiter";
  I_unlim = currentLimiter.I_unlim "Unlimited current magnitude on the machine base";
  I_mag = currentLimiter.I_mag "Output current magnitude on the machine base";
  R_e = currentLimiter.R_e "Virtual resistance of the limiter";
  assert(I0 < Imax, "The current of the power flow is not below Imax: the fault current limiter cannot start in steady state");
  Er = currentLimiter.ElimMag*cos(currentLimiter.ElimAng) "Internal voltage behind R_a + jX_d from the limiter, real part";
  Ei = currentLimiter.ElimMag*sin(currentLimiter.ElimAng) "Internal voltage behind R_a + jX_d from the limiter, imaginary part";
  connect(uEmag, currentLimiter.Emag)
    annotation (Line(points={{-120,40},{-44,40},{-44,20},{-32.5,20}}, color={0,0,127}));
  connect(uEang, currentLimiter.Eang)
    annotation (Line(points={{-120,-40},{-90,-40},{-90,5},{-32.5,5}}, color={0,0,127}));
  connect(sigV.y, currentLimiter.V)
    annotation (Line(points={{-59,-14},{-44,-14},{-44,-5},{-32.5,-5}}, color={0,0,127}));
  connect(sigAnglev.y, currentLimiter.anglev)
    annotation (Line(points={{-59,-46},{-40,-46},{-40,-17.5},{-32.5,-17.5}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-100,142},{100,100}},
          textColor={28,108,200},
          textString="%name"),
        Line(
          points={{42,0},{102,0}},
          color={0,0,255},
          thickness=1),
        Line(
          points={{-98,40},{-58,40},{-58,-40},{-98,-40}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-58,0},{-38,0}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-44,-74},{-24,-74},{36,86},{76,86}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-44,86},{76,86}},
          color={238,46,47},
          pattern=LinePattern.Dash,
          thickness=1),
        Ellipse(extent={{-38,40},{42,-40}},lineColor={28,108,200},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-18,-10},{2,10}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Ellipse(
          extent={{2,10},{22,-10}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.None,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None)}),
    Diagram(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(
          points={{32.5,15},{60,15},{60,0},{100,0}},
          color={28,108,200},
          thickness=1,
          pattern=LinePattern.Dash),
        Line(
          points={{32.5,-15},{60,-15},{60,0}},
          color={28,108,200},
          thickness=1,
          pattern=LinePattern.Dash),
        Text(
          extent={{30,-20},{94,-54}},
          textColor={28,108,200},
          fontName="Geist",
          textString="Er, Ei in
the Text Layer")}),
    Documentation(info="<html>
<p>
A voltage source behind the impedance <code>R_a + jX_d</code> (pu on the machine base <code>M_b</code>) whose internal voltage
is the droop command <code>Edroop</code> at the angle <code>delta_droop</code> (the inputs <code>uEmag</code> and <code>uEang</code>)
while the current it would drive stays within <code>Imax</code>, with the transient fault current limiting of REGFM_A1.
</p>
<p>
The limiter is the component <code>currentLimiter</code>, <code>REGFMA1.CurrentLimiters.ClampOrVirtualResistor</code>, which describes both modes:
<code>useVirtualResistor = false</code> (the default) is the clamp of PSS/E's REGFMA1 and <code>useVirtualResistor = true</code> a virtual resistor.
This class is that limiter fed with the terminal voltage of the source, its output applied as the internal voltage behind <code>R_a + jX_d</code>.
At initialization the limiter is inactive: the model asserts that the current of the power flow is below <code>Imax</code>,
the condition for a steady start.
</p>
<p>
The outputs <code>Emag</code> and <code>Edelta</code> are the internal voltage actually applied (the limited one);
<code>I_unlim</code>, <code>I_mag</code>, <code>R_e</code> and <code>limited</code> show the limiter.
The steady-state current limiting of manufacturers' controls is not represented, as in PSS/E's REGFMA1 and the specification.
</p>
</html>"));
end VSIOforGFMwFCL;
