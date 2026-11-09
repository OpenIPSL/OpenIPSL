within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters;
model VirtualResistorDiagram
  "Current limiter with a virtual resistor in series with the source, built in the diagram layer: the current is limited to Imax"
  extends Base.PartialCurrentLimiter;
  VRe virtualRe(
    R_a=R_a,
    X_d=X_d,
    Imax=Imax) "The virtual resistance that limits the current to Imax"
    annotation (Placement(transformation(extent={{-70,-20},{-30,20}})));
  VirtualResistorLimitedVoltage limitedVoltage(
    R_a=R_a,
    X_d=X_d,
    Imax=Imax) "The voltage behind R_a + jX_d when Edroop drives the current through R_a + R_e + jX_d"
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
  connect(Emag, virtualRe.Emag)
    annotation (Line(points={{-130,80},{-90,80},{-90,16},{-72,16}}, color={0,0,127}));
  connect(Eang, virtualRe.Eang)
    annotation (Line(points={{-130,20},{-96,20},{-96,8},{-72,8}}, color={0,0,127}));
  connect(V, virtualRe.V)
    annotation (Line(points={{-130,-20},{-96,-20},{-96,-8},{-72,-8}}, color={0,0,127}));
  connect(anglev, virtualRe.anglev)
    annotation (Line(points={{-130,-70},{-90,-70},{-90,-16},{-72,-16}}, color={0,0,127}));
  connect(virtualRe.R_e, limitedVoltage.R_e)
    annotation (Line(points={{-28,0},{17,0}}, color={0,0,127}));
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
        Text(
          extent={{-80,-60},{80,-120}},
          textColor={28,108,200},
          fontName="Geist",
          textString="Virtual Resistor"),
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
The same limiter as <code>VirtualResistor</code>, the virtual resistor of <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2024]</a>, with its parts as blocks in the diagram layer:
<code>VRe</code> gives the virtual resistance and <code>VirtualResistorLimitedVoltage</code> the voltage behind <code>R_a + jX_d</code>.
It can lose synchronism after long faults (see <code>ClampOrVirtualResistor</code>).
The interface <code>Base.PartialCurrentLimiter</code> computes the indicators <code>I_unlim</code>, <code>I_mag</code> and <code>limited</code>.
</p>
</html>"),
    Diagram(coordinateSystem(extent={{-120,-120},{120,120}}, grid={2,2})));
end VirtualResistorDiagram;
