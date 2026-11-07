within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters;
model Clamp
  "Current limiter of PSS/E's REGFMA1: the current is clamped to Imax at the angle of the unlimited current"
  extends Base.PartialCurrentLimiter;
  CurrentLimitValue clampedCurrent(
    R_a=R_a,
    X_d=X_d,
    Imax=Imax) "The current of magnitude Imax at the angle of the unlimited current (no virtual resistance)"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Sources.Constant noVirtualResistance(k=0)
    "The clamp has no virtual resistance: the angle is that of the unlimited current"
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
protected
  Real Ecr "Real part of the clamped internal voltage V + (R_a + jX_d)*Iclamp";
  Real Eci "Imaginary part of the clamped internal voltage V + (R_a + jX_d)*Iclamp";
equation
  Ecr = V*cos(anglev) + R_a*clampedCurrent.ImaxRe - X_d*clampedCurrent.ImaxIm
    "The internal voltage that drives the clamped current, real part";
  Eci = V*sin(anglev) + R_a*clampedCurrent.ImaxIm + X_d*clampedCurrent.ImaxRe
    "The internal voltage that drives the clamped current, imaginary part";
  if initial() or noEvent(I_unlim <= Imax) then
    ElimMag = Emag "Not limited: the droop command";
    ElimAng = Eang "Not limited: the droop command";
  else
    ElimMag = sqrt(Ecr^2 + Eci^2) "Limited: the internal voltage that drives the clamped current";
    ElimAng = Eang + atan2(Eci*cos(Eang) - Ecr*sin(Eang), Ecr*cos(Eang) + Eci*sin(Eang))
      "Limited: the angle of the clamped internal voltage, written relative to delta_droop so that it follows the droop angle beyond +-pi";
  end if;
  connect(Emag, clampedCurrent.Emag)
    annotation (Line(points={{-120,60},{-60,60},{-60,12},{-24,12}}, color={0,0,127}));
  connect(Eang, clampedCurrent.Eang)
    annotation (Line(points={{-120,-60},{-80,-60},{-80,-12},{-24,-12}}, color={0,0,127}));
  connect(V, clampedCurrent.V)
    annotation (Line(points={{120,60},{60,60},{60,12},{24,12}}, color={0,0,127}));
  connect(anglev, clampedCurrent.anglev)
    annotation (Line(points={{120,-60},{60,-60},{60,-12},{24,-12}}, color={0,0,127}));
  connect(noVirtualResistance.y, clampedCurrent.R_e)
    annotation (Line(points={{-39,-50},{0,-50},{0,-24}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(
          points={{-60,-30},{-20,-30},{20,30},{60,30}},
          color={238,46,47},
          thickness=1),
        Line(
          points={{-60,30},{60,30}},
          color={238,46,47},
          pattern=LinePattern.Dash,
          thickness=0.5),
        Text(
          extent={{-60,24},{60,-6}},
          textColor={238,46,47},
          textString="Imax"),
        Text(
          extent={{-80,-34},{80,-64}},
          textColor={28,108,200},
          textString="clamp")}),
    Documentation(info="<html>
<p>
The fault current limiter of PSS/E's REGFMA1 <a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-MODELS]</a> and of the
specification of REGFM_A1 <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2021]</a>, section 3.3: when the unlimited current
<code>(Edroop - V)/(R_a + jX_d)</code> exceeds <code>Imax</code>, its magnitude is set to <code>Imax</code> and its angle is kept,
and the internal voltage is recomputed, <code>E = V + (R_a + jX_d) Imax I/|I|</code>.
</p>
<p>
The clamped current is computed by <code>CurrentLimitValue</code> with no virtual resistance, which gives the angle of the unlimited current.
The test is made on the droop command, not on the applied voltage, so the limiter releases by itself once the fault is cleared.
</p>
<p>
The test is evaluated without an event (<code>noEvent</code>; both branches meet at <code>|I| = Imax</code>), and not at all at initialization,
where the limiter is inactive. The inputs <code>V</code> and <code>anglev</code> close an algebraic loop through the network.
With an event, the solver keeps the previous branch while it solves the network at a switching; at the clearing of a fault with the
current limited, OpenModelica then converged to a second solution of the network, in which the bus of a PSS/E load with a low-voltage
characteristic is at zero voltage, and stayed there. Evaluated at every iterate the limiter follows the solution the solver converges to.
</p>
</html>"));
end Clamp;
