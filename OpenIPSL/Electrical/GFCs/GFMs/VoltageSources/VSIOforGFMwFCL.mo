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
  Boolean limited(start=false) "true while the unlimited current exceeds Imax";
  OpenIPSL.Types.PerUnit I_unlim(start=I0) "Magnitude of the unlimited current (Edroop - V)/(R_a + jX_d), pu, machine base";
  OpenIPSL.Types.PerUnit I_mag(start=I0) "Magnitude of the output current, pu, machine base";
  OpenIPSL.Types.PerUnit R_e(start=0) "Virtual resistance, pu, machine base (zero with the clamp and when not limited)";
protected
  parameter OpenIPSL.Types.PerUnit Z_a=sqrt(R_a^2 + X_d^2) "Magnitude of the source impedance, pu, machine base";
  parameter OpenIPSL.Types.PerUnit I0=sqrt(ir0^2 + ii0^2)/CoB "Current of the power flow, pu, machine base";
  OpenIPSL.Types.PerUnit dEr(start=Er0 - vr0) "Real part of Edroop - V";
  OpenIPSL.Types.PerUnit dEi(start=Ei0 - vi0) "Imaginary part of Edroop - V";
  Real dE2(start=(Er0 - vr0)^2 + (Ei0 - vi0)^2) "Squared magnitude of Edroop - V";
  Real cr(start=1) "Real part of the factor c in E = V + c*(Edroop - V)";
  Real ci(start=0) "Imaginary part of the factor c in E = V + c*(Edroop - V)";
equation
  E = uEmag "The droop command of the magnitude, |Edroop| (VAR(L+1) of PSS/E's REGFMA1)";
  delta = uEang "The droop command of the angle";
  dEr = E*cos(delta) - p.vr "Edroop - V, real part";
  dEi = E*sin(delta) - p.vi "Edroop - V, imaginary part";
  dE2 = dEr^2 + dEi^2 "Squared voltage across the source impedance without limiting";
  limited = dE2 > (Imax*Z_a)^2 "The unlimited current exceeds Imax (an output; the equations below test the same condition without an event)";
  I_unlim = sqrt(dE2)/Z_a "Unlimited current magnitude on the machine base";
  assert(I0 < Imax, "The current of the power flow is not below Imax: the fault current limiter cannot start in steady state");
  if initial() or noEvent(dE2 <= (Imax*Z_a)^2) then
    R_e = 0 "No virtual resistance";
    cr = 1 "Not limited: the internal voltage is the droop command";
    ci = 0 "Not limited: the internal voltage is the droop command";
  elseif useVirtualResistor then
    R_e = sqrt(dE2/Imax^2 - X_d^2) - R_a "Virtual resistance for which |Edroop - V|/|R_a + R_e + jX_d| = Imax";
    cr = (R_a*(R_a + R_e) + X_d^2)/((R_a + R_e)^2 + X_d^2) "Real part of (R_a + jX_d)/(R_a + R_e + jX_d)";
    ci = X_d*R_e/((R_a + R_e)^2 + X_d^2) "Imaginary part of (R_a + jX_d)/(R_a + R_e + jX_d)";
  else
    R_e = 0 "No virtual resistance with the clamp";
    cr = Imax*Z_a/sqrt(dE2) "Clamp: the current is scaled to Imax, its angle is that of the unlimited current";
    ci = 0 "Clamp: the scaling is real";
  end if;
  Er = p.vr + cr*dEr - ci*dEi "Internal voltage behind R_a + jX_d, real part: E = V + c*(Edroop - V)";
  Ei = p.vi + cr*dEi + ci*dEr "Internal voltage behind R_a + jX_d, imaginary part: E = V + c*(Edroop - V)";
  I_mag = sqrt((cr^2 + ci^2)*dE2)/Z_a "Output current magnitude on the machine base, |c|*|Edroop - V|/|R_a + jX_d|";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          lineThickness=1),
        Text(
          extent={{-100,142},{100,100}},
          textColor={28,108,200},
          textString="%name"),
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
          closure=EllipseClosure.None),
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
          points={{-80,-80},{-60,-80},{-20,-60},{80,-60}},
          color={238,46,47},
          thickness=1),
        Text(
          extent={{20,-62},{100,-98}},
          textColor={238,46,47},
          textString="Imax")}),
    Documentation(info="<html>
<p>
A voltage source behind the impedance <code>R_a + jX_d</code> (pu on the machine base <code>M_b</code>) whose internal voltage
is the droop command <code>Edroop</code> at the angle <code>delta_droop</code> (the inputs <code>uEmag</code> and <code>uEang</code>)
while the current it would drive stays within <code>Imax</code>, with the transient fault current limiting of REGFM_A1.
</p>
<p>
The unlimited current is <code>I = (Edroop - V)/(R_a + jX_d)</code>, computed from the droop command and the terminal voltage <code>V</code>.
While <code>|I| &le; Imax</code> the internal voltage is the droop command. Once <code>|I| &gt; Imax</code>:
</p>
<ul>
<li><code>useVirtualResistor = false</code> (the default): the clamp of PSS/E's REGFMA1 <a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-MODELS]</a>
and of the specification <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2021]</a>.
The magnitude of the current is set to <code>Imax</code>, its angle is that of the unlimited current, and the internal voltage is recomputed,
<code>E = V + (R_a + jX_d) Imax I/|I|</code>.</li>
<li><code>useVirtualResistor = true</code>: the virtual resistor of <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2024]</a>.
A resistance <code>R_e</code> in series with the source is chosen so that <code>|Edroop - V|/|R_a + R_e + jX_d| = Imax</code>,
<code>R_e = sqrt(|Edroop - V|^2/Imax^2 - X_d^2) - R_a</code>. The current magnitude is again <code>Imax</code>;
its angle turns towards that of <code>Edroop - V</code>, which adds damping.</li>
</ul>
<p>
In both modes the test is made on the unlimited current, i.e. on the droop command and not on the limited internal voltage,
so the limiter releases by itself once the fault is cleared and the current falls below <code>Imax</code>.
Both modes are continuous at <code>|I| = Imax</code>, and the test is evaluated without an event (<code>noEvent</code>),
at every iterate of the nonlinear solver. With an event, the solver keeps the limiter's previous state while it solves the
network at a switching; when a fault is cleared with the current limited, OpenModelica then converged to a second solution
of the network, in which the voltage of a PSS/E load with a low-voltage characteristic is zero and the load passes any current,
and stayed there. Evaluated at every iterate, the limiter takes the state of the solution the solver is converging to.
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
