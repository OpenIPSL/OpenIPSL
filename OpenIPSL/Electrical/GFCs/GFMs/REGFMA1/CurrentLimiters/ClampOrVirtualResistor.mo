within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters;
model ClampOrVirtualResistor
  "Fault current limiter of REGFM_A1 written as equations: the clamp of PSS/E's REGFMA1 or a virtual resistor, selected by a parameter"
  extends Base.PartialCurrentLimiter;
  parameter Boolean useVirtualResistor=false
    "false: the current is clamped to Imax at the angle of the unlimited current (PSS/E's REGFMA1, the WECC specification); true: a virtual resistor in series limits it to Imax"
    annotation (Dialog(group="Current Limiter Setting"));
  OpenIPSL.Types.PerUnit R_e(start=0) "Virtual resistance, pu, machine base (zero with the clamp and when not limited)";
protected
  Real dE2 "Squared magnitude of Edroop - V";
  Real cr(start=1) "Real part of the factor c in E = V + c*(Edroop - V)";
  Real ci(start=0) "Imaginary part of the factor c in E = V + c*(Edroop - V)";
  Real Elr "Real part of the internal voltage behind R_a + jX_d";
  Real Eli "Imaginary part of the internal voltage behind R_a + jX_d";
equation
  dE2 = dEr^2 + dEi^2 "Squared voltage across the source impedance without limiting";
  if initial() or noEvent(dE2 <= (Imax*Z_a)^2) then
    R_e = 0 "No virtual resistance";
    cr = 1 "Not limited: the internal voltage is the droop command";
    ci = 0 "Not limited: the internal voltage is the droop command";
  elseif useVirtualResistor then
    R_e = sqrt(max(dE2/Imax^2 - X_d^2, R_a^2)) - R_a "Virtual resistance for which |Edroop - V|/|R_a + R_e + jX_d| = Imax (the argument is at least R_a^2 in this branch; the bound keeps it real if a tool evaluates the branch elsewhere)";
    cr = (R_a*(R_a + R_e) + X_d^2)/((R_a + R_e)^2 + X_d^2) "Real part of (R_a + jX_d)/(R_a + R_e + jX_d)";
    ci = X_d*R_e/((R_a + R_e)^2 + X_d^2) "Imaginary part of (R_a + jX_d)/(R_a + R_e + jX_d)";
  else
    R_e = 0 "No virtual resistance with the clamp";
    cr = Imax*Z_a/sqrt(dE2) "Clamp: the current is scaled to Imax, its angle is that of the unlimited current";
    ci = 0 "Clamp: the scaling is real";
  end if;
  Elr = V*cos(anglev) + cr*dEr - ci*dEi "Internal voltage behind R_a + jX_d, real part: E = V + c*(Edroop - V)";
  Eli = V*sin(anglev) + cr*dEi + ci*dEr "Internal voltage behind R_a + jX_d, imaginary part: E = V + c*(Edroop - V)";
  if initial() or noEvent(dE2 <= (Imax*Z_a)^2) then
    ElimMag = Emag "Not limited: the droop command";
    ElimAng = Eang "Not limited: the droop command";
  else
    ElimMag = sqrt(Elr^2 + Eli^2) "Limited: the magnitude of the internal voltage";
    ElimAng = Eang + atan2(Eli*cos(Eang) - Elr*sin(Eang), Elr*cos(Eang) + Eli*sin(Eang))
      "Limited: its angle, written relative to delta_droop so that it follows the droop angle beyond +-pi";
  end if;
  annotation (preferredView="text",Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-120,120},{120,-120}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-60,-30},{-40,-30},{20,70},{60,70}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-60,70},{60,70}},
          color={238,46,47},
          pattern=LinePattern.Dash,
          thickness=1),
        Text(
          extent={{40,110},{120,70}},
          textColor={238,46,47},
          fontName="Geist",
          textString="Imax"),
        Text(
          extent={{-100,-44},{100,-112}},
          textColor={28,108,200},
          fontName="Geist",
          textString="Clamp or
Virtual Resistor")}),
    Documentation(info="<html>
<p>
The fault current limiter of REGFM_A1, with both of its modes written as equations and selected by the parameter <code>useVirtualResistor</code>.
It takes the droop command <code>Edroop</code> at the angle <code>delta_droop</code> and the terminal voltage <code>V</code>, and gives the internal voltage
to apply behind the impedance <code>R_a + jX_d</code> (pu on the machine base). It can be chosen in <code>REGFMA1wPQLimitersAndReplaceableFCL</code>,
and <code>VoltageSources.VSIOforGFMwFCL</code> is a voltage source built on it.
</p>
<p>
The unlimited current is <code>I = (Edroop - V)/(R_a + jX_d)</code>. While <code>|I| &le; Imax</code> the internal voltage is the droop command. Once <code>|I| &gt; Imax</code>:
</p>
<ul>
<li><code>useVirtualResistor = false</code> (the default): the clamp of PSS/E's REGFMA1 <a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-MODELS]</a>
and of the specification <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2021]</a>.
The magnitude of the current is set to <code>Imax</code>, its angle is that of the unlimited current, and the internal voltage is recomputed,
<code>E = V + (R_a + jX_d) Imax I/|I|</code>.</li>
<li><code>useVirtualResistor = true</code>: the virtual resistor of <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2024]</a>.
A resistance <code>R_e</code> in series with the source is chosen so that <code>|Edroop - V|/|R_a + R_e + jX_d| = Imax</code>,
<code>R_e = sqrt(|Edroop - V|^2/Imax^2 - X_d^2) - R_a</code>. The current magnitude is again <code>Imax</code>;
its angle turns towards that of <code>Edroop - V</code>, which adds damping.
For long faults this mode can lose synchronism after the fault is cleared: the droop angle advances during the fault, and the current
at that angle makes the converter absorb power. [Du2024] reports this for a 0.45 s delayed clearing; on PNNL's validation case of REGFM_A1,
faults of 0.5 s at the converter's terminal slip one or more poles, where the clamp, PSS/E and PNNL's PSCAD model recover.</li>
</ul>
<p>
In both modes the test is made on the unlimited current, i.e. on the droop command and not on the limited internal voltage,
so the limiter releases by itself once the fault is cleared and the current falls below <code>Imax</code>.
Both modes are continuous at <code>|I| = Imax</code>, and the test is evaluated without an event (<code>noEvent</code>),
at every iterate of the nonlinear solver. With an event, the solver keeps the limiter's previous state while it solves the
network at a switching; when a fault is cleared with the current limited, OpenModelica then converged to a second solution
of the network, in which the voltage of a PSS/E load with a low-voltage characteristic is zero and the load passes any current,
and stayed there. Evaluated at every iterate, the limiter takes the state of the solution the solver is converging to.
At initialization the limiter is inactive. <code>Clamp</code> and <code>VirtualResistor</code> are the same two limiters built from components.
The steady-state current limiting of manufacturers' controls is not represented, as in PSS/E's REGFMA1 and the specification.
</p>
</html>"),
    Diagram(coordinateSystem(extent={{-120,-120},{120,120}}, grid={2,2}), graphics={
        Rectangle(
          extent={{-60,60},{60,-60}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-54,44},{54,-4}},
          textColor={28,108,200},
          fontName="Geist",
          textString="Clamp or
Virtual Resistor"),
        Text(
          extent={{-54,-14},{54,-48}},
          textColor={28,108,200},
          fontName="Geist",
          textString="Implemented in
the Text Layer"),
        Line(
          points={{-120,80},{-84,80},{-84,30},{-60,30}},
          color={28,108,200},
          thickness=1,
          pattern=LinePattern.Dash),
        Line(
          points={{-120,20},{-90,20},{-90,10},{-60,10}},
          color={28,108,200},
          thickness=1,
          pattern=LinePattern.Dash),
        Line(
          points={{-120,-20},{-90,-20},{-90,-10},{-60,-10}},
          color={28,108,200},
          thickness=1,
          pattern=LinePattern.Dash),
        Line(
          points={{-120,-70},{-84,-70},{-84,-30},{-60,-30}},
          color={28,108,200},
          thickness=1,
          pattern=LinePattern.Dash),
        Line(
          points={{60,30},{90,30},{90,60},{120,60}},
          color={28,108,200},
          thickness=1,
          pattern=LinePattern.Dash),
        Line(
          points={{60,-30},{90,-30},{90,-60},{120,-60}},
          color={28,108,200},
          thickness=1,
          pattern=LinePattern.Dash)}));
end ClampOrVirtualResistor;
