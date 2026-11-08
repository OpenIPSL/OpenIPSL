within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters;
model VirtualResistor
  "Current limiter with a virtual resistor in series with the source: the current is limited to Imax"
  extends Base.PartialCurrentLimiter;
  VRe virtualRe(
    R_a=R_a,
    X_d=X_d,
    Imax=Imax) "The virtual resistance that limits the current to Imax"
    annotation (Placement(transformation(extent={{-80,-20},{-40,20}})));
protected
  Real cr "Real part of c = (R_a + jX_d)/(R_a + R_e + jX_d)";
  Real ci "Imaginary part of c = (R_a + jX_d)/(R_a + R_e + jX_d)";
  Real Evr "Real part of the internal voltage behind R_a + jX_d, V + c*(Edroop - V)";
  Real Evi "Imaginary part of the internal voltage behind R_a + jX_d, V + c*(Edroop - V)";
equation
  cr = (R_a*(R_a + virtualRe.R_e) + X_d^2)/((R_a + virtualRe.R_e)^2 + X_d^2) "Real part of (R_a + jX_d)/(R_a + R_e + jX_d)";
  ci = X_d*virtualRe.R_e/((R_a + virtualRe.R_e)^2 + X_d^2) "Imaginary part of (R_a + jX_d)/(R_a + R_e + jX_d)";
  Evr = V*cos(anglev) + cr*dEr - ci*dEi
    "The voltage behind R_a + jX_d when Edroop drives the current through R_a + R_e + jX_d, real part";
  Evi = V*sin(anglev) + cr*dEi + ci*dEr
    "The voltage behind R_a + jX_d when Edroop drives the current through R_a + R_e + jX_d, imaginary part";
  if initial() or noEvent(I_unlim <= Imax) then
    ElimMag = Emag "Not limited (R_e = 0): the droop command";
    ElimAng = Eang "Not limited (R_e = 0): the droop command";
  else
    ElimMag = sqrt(Evr^2 + Evi^2) "Limited: the voltage behind R_a + jX_d";
    ElimAng = Eang + atan2(Evi*cos(Eang) - Evr*sin(Eang), Evr*cos(Eang) + Evi*sin(Eang))
      "Limited: its angle, written relative to delta_droop so that it follows the droop angle beyond +-pi";
  end if;
  connect(Emag, virtualRe.Emag)
    annotation (Line(points={{-130,80},{-90,80},{-90,16},{-82,16}}, color={0,0,127}));
  connect(Eang, virtualRe.Eang)
    annotation (Line(points={{-130,20},{-100,20},{-100,8},{-82,8}},     color={0,0,127}));
  connect(V, virtualRe.V)
    annotation (Line(points={{-130,-20},{-100,-20},{-100,-8},{-82,-8}},
                                                                color={0,0,127}));
  connect(anglev, virtualRe.anglev)
    annotation (Line(points={{-130,-70},{-90,-70},{-90,-16},{-82,-16}},
                                                                    color={0,0,127}));
  annotation (preferredView="diagram",Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(
          points={{-60,-80},{-40,-80},{40,80},{60,80}},
          color={28,108,200},
          thickness=1),
        Ellipse(extent={{-60,60},{60,-60}},lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,0},{-60,0}}, color={28,108,200},
          thickness=1),
        Line(points={{60,0},{80,0}}, color={28,108,200},
          thickness=1),
        Rectangle(
          extent={{-90,10},{-70,-10}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{70,10},{90,-10}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Line(points={{-60,0},{-20,0}},
                                     color={28,108,200},
          thickness=1),
        Polygon(
          points={{-20,10},{20,10},{20,-10},{-20,-10},{-20,10}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{20,0},{60,0}}, color={28,108,200},
          thickness=1)}),
    Documentation(info="<html>
<p>
The current limiter of <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2024]</a>, section IV-C: when the unlimited current
<code>(Edroop - V)/(R_a + jX_d)</code> exceeds <code>Imax</code>, a virtual resistance <code>R_e</code> in series with the source,
computed by <code>VRe</code>, limits it to <code>Imax</code>. The output is the voltage behind <code>R_a + jX_d</code> that drives that current,
<code>V + (R_a + jX_d)/(R_a + R_e + jX_d) (Edroop - V)</code>, so that the limiter can feed a source without a virtual-resistance input;
<code>VoltageSources.VSIOwVReInput</code> takes <code>R_e</code> itself instead, which gives the same current.
</p>
<p>
The current magnitude is <code>Imax</code> as with the clamp, but its angle turns towards that of <code>Edroop - V</code>, which adds damping.
For long faults this can lose synchronism after the fault is cleared: the droop angle advances during the fault, and the current at that angle
makes the converter absorb power. [Du2024] reports this for a 0.45 s delayed clearing; on PNNL's validation case of REGFM_A1 faults of 0.5 s
at the converter's terminal slip one or more poles, where the clamp recovers.
</p>
<p>
The test is evaluated without an event and not at initialization, as in <code>Clamp</code>, whose Documentation says why.
</p>
</html>"),
    Diagram(graphics={
        Text(
          extent={{-10,-55},{110,-72}},
          textColor={215,215,215},
          fontName="Geist",
          fontSize=24,
          textString="Implemented in the Text Layer"),
        Rectangle(
          extent={{28,40},{68,-40}},
          lineColor={28,108,200},
          lineThickness=1),
        Line(
          points={{36,-20},{44,-20},{54,20},{62,20}},
          color={28,108,200},
          thickness=1),
        Polygon(
          points={{18,-5},{18,5},{27,0},{18,-5}},
          lineColor={238,46,47},
          lineThickness=1),
        Polygon(
          points={{68,15},{68,25},{77,20},{68,15}},
          lineColor={28,108,200},
          lineThickness=1),
        Polygon(
          points={{68,-25},{68,-15},{77,-20},{68,-25}},
          lineColor={28,108,200},
          lineThickness=1),
        Text(
          extent={{18,63},{78,43}},
          textColor={28,108,200},
          fontName="Geist",
          fontSize=24,
          textString="Current Limited
Droop Voltage"),
        Text(
          extent={{56,42},{116,22}},
          textColor={28,108,200},
          fontName="Geist",
          fontSize=24,
          textString="ElimMag"),
        Text(
          extent={{58,-20},{118,-40}},
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
          extent={{-14,0},{46,-20}},
          textColor={238,46,47},
          fontName="Geist",
          fontSize=24,
          textString="R_e"),
        Line(
          points={{-38,0},{18,0}},
          color={238,46,47},
          thickness=1,
          pattern=LinePattern.Dash),
        Line(
          points={{78,20},{106,20},{106,60},{120,60}},
          color={28,108,200},
          thickness=1,
          pattern=LinePattern.Dash),
        Line(
          points={{78,-20},{106,-20},{106,-60},{120,-60}},
          color={28,108,200},
          thickness=1,
          pattern=LinePattern.Dash)}));
end VirtualResistor;
