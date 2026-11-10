within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters;
model Clamp
  "Current limiter of PSS/E's REGFMA1: the current is clamped to Imax at the angle of the unlimited current"
  extends Base.PartialCurrentLimiter;
  CurrentLimitValue clampedCurrent(
    R_a=R_a,
    X_d=X_d,
    Imax=Imax) "The current of magnitude Imax at the angle of the unlimited current (no virtual resistance)"
    annotation (Placement(transformation(extent={{-80,-28},{-20,32}})));
  Modelica.Blocks.Sources.Constant noVirtualResistance(k=0)
    "The clamp has no virtual resistance: the angle is that of the unlimited current"
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},
        rotation=90,
        origin={-50,-48})));
  ClampLimitedVoltage limitedVoltage(
    R_a=R_a,
    X_d=X_d,
    Imax=Imax) "The internal voltage that drives the clamped current"
    annotation (Placement(transformation(extent={{20,-28},{80,32}})));
  Modelica.Blocks.Sources.RealExpression sigEmag(y=Emag) "Droop command, magnitude"
    annotation (Placement(transformation(extent={{-10,-4},{10,4}},
        rotation=90,
        origin={32,-50})));
  Modelica.Blocks.Sources.RealExpression sigEang(y=Eang) "Droop command, angle"
    annotation (Placement(transformation(extent={{-10,-4},{10,4}},
        rotation=90,
        origin={44,-50})));
  Modelica.Blocks.Sources.RealExpression sigV(y=V) "Terminal voltage, magnitude"
    annotation (Placement(transformation(extent={{-10,-4},{10,4}},
        rotation=90,
        origin={56,-50})));
  Modelica.Blocks.Sources.RealExpression sigAnglev(y=anglev) "Terminal voltage, angle"
    annotation (Placement(transformation(extent={{-10,-4},{10,4}},
        rotation=90,
        origin={68,-50})));
equation
  connect(Emag, clampedCurrent.Emag)
    annotation (Line(points={{-130,80},{-92,80},{-92,26},{-83,26}}, color={0,0,127}));
  connect(Eang, clampedCurrent.Eang)
    annotation (Line(points={{-130,20},{-92,20},{-92,8},{-83,8}}, color={0,0,127}));
  connect(V, clampedCurrent.V)
    annotation (Line(points={{-130,-20},{-94,-20},{-94,-4},{-83,-4}}, color={0,0,127}));
  connect(anglev, clampedCurrent.anglev)
    annotation (Line(points={{-130,-70},{-92,-70},{-92,-22},{-83,-22}}, color={0,0,127}));
  connect(noVirtualResistance.y, clampedCurrent.R_e)
    annotation (Line(points={{-50,-39.2},{-50,-31}}, color={0,0,127}));
  connect(clampedCurrent.ImaxRe, limitedVoltage.ImaxRe)
    annotation (Line(points={{-17,-10},{8,-10},{8,14},{17,14}}, color={0,0,127}));
  connect(clampedCurrent.ImaxIm, limitedVoltage.ImaxIm)
    annotation (Line(points={{-17,-22},{10,-22},{10,-10},{17,-10}},
                                                                  color={0,0,127}));
  connect(sigEmag.y, limitedVoltage.Emag)
    annotation (Line(points={{32,-39},{32,-31}}, color={0,0,127}));
  connect(sigEang.y, limitedVoltage.Eang)
    annotation (Line(points={{44,-39},{44,-31}}, color={0,0,127}));
  connect(sigV.y, limitedVoltage.V)
    annotation (Line(points={{56,-39},{56,-31}}, color={0,0,127}));
  connect(sigAnglev.y, limitedVoltage.anglev)
    annotation (Line(points={{68,-39},{68,-31}}, color={0,0,127}));
  connect(limitedVoltage.ElimMag, ElimMag)
    annotation (Line(points={{83,14},{116,14},{116,60},{130,60}}, color={0,0,127}));
  connect(limitedVoltage.ElimAng, ElimAng)
    annotation (Line(points={{83,-10},{116,-10},{116,-60},{130,-60}}, color={0,0,127}));
  annotation (preferredView="diagram",Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(
          points={{-60,-80},{-40,-80},{20,80},{60,80}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-60,80},{60,80}},
          color={238,46,47},
          pattern=LinePattern.Dash,
          thickness=1),
        Ellipse(extent={{-60,60},{60,-60}},lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{0,20},{40,0},{0,-20},{0,20}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-40,0},{0,0}}, color={28,108,200},
          thickness=1)}),
    Documentation(info="<html>
<p>
The fault current limiter of PSS/E's REGFMA1 <a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-MODELS]</a> and of the
specification of REGFM_A1 <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2021]</a>, section 3.3: when the unlimited current
<code>(Edroop - V)/(R_a + jX_d)</code> exceeds <code>Imax</code>, its magnitude is set to <code>Imax</code> and its angle is kept,
and the internal voltage is recomputed, <code>E = V + (R_a + jX_d) Imax I/|I|</code>.
</p>
<p>
The clamped current is computed by <code>CurrentLimitValue</code> with no virtual resistance, which gives the angle of the unlimited current,
and <code>ClampLimitedVoltage</code> gives the internal voltage that drives it.
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
    Diagram(coordinateSystem(extent={{-120,-120},{120,120}}, grid={2,2})));
end Clamp;
