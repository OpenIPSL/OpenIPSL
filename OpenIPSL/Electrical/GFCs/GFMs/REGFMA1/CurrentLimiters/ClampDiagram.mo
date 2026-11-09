within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters;
model ClampDiagram
  "Current limiter of PSS/E's REGFMA1 built in the diagram layer: the current is clamped to Imax at the angle of the unlimited current"
  extends Base.PartialCurrentLimiter;
  CurrentLimitValue clampedCurrent(
    R_a=R_a,
    X_d=X_d,
    Imax=Imax) "The current of magnitude Imax at the angle of the unlimited current (no virtual resistance)"
    annotation (Placement(transformation(extent={{-70,-20},{-30,20}})));
  Modelica.Blocks.Sources.Constant noVirtualResistance(k=0)
    "The clamp has no virtual resistance: the angle is that of the unlimited current"
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},
        rotation=90,
        origin={-50,-46})));
  ClampLimitedVoltage limitedVoltage(
    R_a=R_a,
    X_d=X_d,
    Imax=Imax) "The internal voltage that drives the clamped current"
    annotation (Placement(transformation(extent={{20,-30},{80,30}})));
  Modelica.Blocks.Sources.RealExpression sigEmag(y=Emag) "Droop command, magnitude"
    annotation (Placement(transformation(extent={{-10,-4},{10,4}},
        rotation=90,
        origin={32,-56})));
  Modelica.Blocks.Sources.RealExpression sigEang(y=Eang) "Droop command, angle"
    annotation (Placement(transformation(extent={{-10,-4},{10,4}},
        rotation=90,
        origin={44,-56})));
  Modelica.Blocks.Sources.RealExpression sigV(y=V) "Terminal voltage, magnitude"
    annotation (Placement(transformation(extent={{-10,-4},{10,4}},
        rotation=90,
        origin={56,-56})));
  Modelica.Blocks.Sources.RealExpression sigAnglev(y=anglev) "Terminal voltage, angle"
    annotation (Placement(transformation(extent={{-10,-4},{10,4}},
        rotation=90,
        origin={68,-56})));
equation
  connect(Emag, clampedCurrent.Emag)
    annotation (Line(points={{-130,80},{-90,80},{-90,16},{-72,16}}, color={0,0,127}));
  connect(Eang, clampedCurrent.Eang)
    annotation (Line(points={{-130,20},{-96,20},{-96,4},{-72,4}}, color={0,0,127}));
  connect(V, clampedCurrent.V)
    annotation (Line(points={{-130,-20},{-96,-20},{-96,-4},{-72,-4}}, color={0,0,127}));
  connect(anglev, clampedCurrent.anglev)
    annotation (Line(points={{-130,-70},{-90,-70},{-90,-16},{-72,-16}}, color={0,0,127}));
  connect(noVirtualResistance.y, clampedCurrent.R_e)
    annotation (Line(points={{-50,-37.2},{-50,-22}}, color={0,0,127}));
  connect(clampedCurrent.ImaxRe, limitedVoltage.ImaxRe)
    annotation (Line(points={{-28,-8},{-6,-8},{-6,12},{17,12}}, color={0,0,127}));
  connect(clampedCurrent.ImaxIm, limitedVoltage.ImaxIm)
    annotation (Line(points={{-28,-16},{4,-16},{4,-12},{17,-12}}, color={0,0,127}));
  connect(sigEmag.y, limitedVoltage.Emag)
    annotation (Line(points={{32,-45},{32,-33}}, color={0,0,127}));
  connect(sigEang.y, limitedVoltage.Eang)
    annotation (Line(points={{44,-45},{44,-33}}, color={0,0,127}));
  connect(sigV.y, limitedVoltage.V)
    annotation (Line(points={{56,-45},{56,-33}}, color={0,0,127}));
  connect(sigAnglev.y, limitedVoltage.anglev)
    annotation (Line(points={{68,-45},{68,-33}}, color={0,0,127}));
  connect(limitedVoltage.ElimMag, ElimMag)
    annotation (Line(points={{83,12},{100,12},{100,60},{130,60}}, color={0,0,127}));
  connect(limitedVoltage.ElimAng, ElimAng)
    annotation (Line(points={{83,-12},{100,-12},{100,-60},{130,-60}}, color={0,0,127}));
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
The same limiter as <code>Clamp</code>, the clamp of PSS/E's REGFMA1 <a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-MODELS]</a>, with its parts as blocks in the diagram layer:
<code>CurrentLimitValue</code> gives the current of magnitude <code>Imax</code> at the angle of the unlimited current, and <code>ClampLimitedVoltage</code> the internal voltage that drives it.
The interface <code>Base.PartialCurrentLimiter</code> computes the indicators <code>I_unlim</code>, <code>I_mag</code> and <code>limited</code>.
</p>
</html>"),
    Diagram(coordinateSystem(extent={{-120,-120},{120,120}}, grid={2,2})));
end ClampDiagram;
