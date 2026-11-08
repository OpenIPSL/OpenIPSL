within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters;
model Clamp
  "Current limiter of PSS/E's REGFMA1: the current is clamped to Imax at the angle of the unlimited current"
  extends Base.PartialCurrentLimiter;
  CurrentLimitValue clampedCurrent(
    R_a=R_a,
    X_d=X_d,
    Imax=Imax) "The current of magnitude Imax at the angle of the unlimited current (no virtual resistance)"
    annotation (Placement(transformation(extent={{-60,-20},{-20,20}})));
  Modelica.Blocks.Sources.Constant noVirtualResistance(k=0)
    "The clamp has no virtual resistance: the angle is that of the unlimited current"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-40,-70})));
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
    annotation (Line(points={{-130,80},{-70,80},{-70,16},{-62,16}}, color={0,0,127}));
  connect(Eang, clampedCurrent.Eang)
    annotation (Line(points={{-130,20},{-80,20},{-80,4},{-62,4}},       color={0,0,127}));
  connect(V, clampedCurrent.V)
    annotation (Line(points={{-130,-20},{-80,-20},{-80,-4},{-62,-4}},
                                                                color={0,0,127}));
  connect(anglev, clampedCurrent.anglev)
    annotation (Line(points={{-130,-70},{-70,-70},{-70,-16},{-62,-16}},
                                                                    color={0,0,127}));
  connect(noVirtualResistance.y, clampedCurrent.R_e)
    annotation (Line(points={{-40,-59},{-40,-22}},       color={0,0,127}));
  annotation (preferredView="diagram",Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-120,120},{120,-120}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-60,-80},{-40,-80},{20,80},{60,80}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-60,80},{60,80}},
          color={238,46,47},
          pattern=LinePattern.Dash,
          thickness=1),
        Text(
          extent={{40,120},{120,80}},
          textColor={238,46,47},
          fontName="Geist",
          textString="Imax"),
        Text(
          extent={{-80,-60},{80,-120}},
          textColor={28,108,200},
          fontName="Geist",
          textString="Current Clamp")}),
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
</html>"),
    Diagram(coordinateSystem(grid={2,2}, extent={{-120,-100},{120,100}}),
        graphics={
        Text(
          extent={{-10,-43},{110,-60}},
          textColor={215,215,215},
          fontName="Geist",
          fontSize=24,
          textString="Implemented in the Text Layer"),
        Rectangle(
          extent={{32,40},{72,-40}},
          lineColor={28,108,200},
          lineThickness=1),
        Line(
          points={{40,-20},{48,-20},{58,20},{66,20}},
          color={28,108,200},
          thickness=1),
        Polygon(
          points={{22,15},{22,25},{31,20},{22,15}},
          lineColor={28,108,200},
          lineThickness=1),
        Polygon(
          points={{72,15},{72,25},{81,20},{72,15}},
          lineColor={28,108,200},
          lineThickness=1),
        Polygon(
          points={{72,-25},{72,-15},{81,-20},{72,-25}},
          lineColor={28,108,200},
          lineThickness=1),
        Text(
          extent={{22,59},{82,39}},
          textColor={28,108,200},
          fontName="Geist",
          fontSize=24,
          textString="Current Limited
Droop Voltage"),
        Text(
          extent={{58,42},{118,22}},
          textColor={28,108,200},
          fontName="Geist",
          fontSize=24,
          textString="ElimMag"),
        Polygon(
          points={{22,-31},{22,-21},{31,-26},{22,-31}},
          lineColor={28,108,200},
          lineThickness=1),
        Text(
          extent={{56,-20},{116,-40}},
          textColor={28,108,200},
          fontName="Geist",
          fontSize=24,
          textString="ElimAng"),
        Rectangle(
          extent={{-10,70},{110,-70}},
          lineColor={215,215,215},
          lineThickness=1,
          pattern=LinePattern.Dash),
        Text(
          extent={{-20,20},{40,0}},
          textColor={28,108,200},
          fontName="Geist",
          fontSize=24,
          textString="ImaxRe"),
        Text(
          extent={{-18,-6},{42,-26}},
          textColor={28,108,200},
          fontName="Geist",
          fontSize=24,
          textString="ImaxIm"),
        Line(
          points={{-16,-8},{-4,-8},{-4,20},{22,20}},
          color={28,108,200},
          thickness=1,
          pattern=LinePattern.Dash),
        Line(
          points={{-16,-16},{-4,-16},{-4,-26},{22,-26}},
          color={28,108,200},
          thickness=1,
          pattern=LinePattern.Dash),
        Line(
          points={{82,20},{106,20},{106,60},{120,60}},
          color={28,108,200},
          thickness=1,
          pattern=LinePattern.Dash),
        Line(
          points={{82,-20},{106,-20},{106,-60},{120,-60}},
          color={28,108,200},
          thickness=1,
          pattern=LinePattern.Dash)}));
end Clamp;
