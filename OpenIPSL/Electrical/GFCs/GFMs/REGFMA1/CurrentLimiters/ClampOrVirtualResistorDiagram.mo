within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters;
model ClampOrVirtualResistorDiagram
  "Fault current limiter of REGFM_A1 built in the diagram layer: the clamp of PSS/E's REGFMA1 or a virtual resistor, selected by a parameter"
  extends Base.PartialCurrentLimiter;
  parameter Boolean useVirtualResistor=false
    "false: the current is clamped to Imax at the angle of the unlimited current (PSS/E's REGFMA1, the WECC specification); true: a virtual resistor in series limits it to Imax"
    annotation (Dialog(group="Current Limiter Setting"));
  VirtualResistorDiagram virtualResistor(
    R_a=R_a,
    X_d=X_d,
    Imax=Imax) "The limiter with the virtual resistor"
    annotation (Placement(transformation(extent={{-60,26},{12,98}})));
  ClampDiagram clamp(
    R_a=R_a,
    X_d=X_d,
    Imax=Imax) "The limiter with the clamp"
    annotation (Placement(transformation(extent={{-60,-98},{12,-26}})));
  Modelica.Blocks.Sources.RealExpression sigEmag(y=Emag) "Droop command, magnitude"
    annotation (Placement(transformation(extent={{-78,-42},{-66,-34}})));
  Modelica.Blocks.Sources.RealExpression sigEang(y=Eang) "Droop command, angle"
    annotation (Placement(transformation(extent={{-78,-60},{-66,-52}})));
  Modelica.Blocks.Sources.RealExpression sigV(y=V) "Terminal voltage, magnitude"
    annotation (Placement(transformation(extent={{-78,-72},{-66,-64}})));
  Modelica.Blocks.Sources.RealExpression sigAnglev(y=anglev) "Terminal voltage, angle"
    annotation (Placement(transformation(extent={{-78,-87},{-66,-79}})));
  Modelica.Blocks.Logical.Switch switchMag "The magnitude of the selected limiter"
    annotation (Placement(transformation(extent={{64,48},{88,72}})));
  Modelica.Blocks.Logical.Switch switchAng "The angle of the selected limiter"
    annotation (Placement(transformation(extent={{64,-72},{88,-48}})));
  Modelica.Blocks.Sources.BooleanConstant selectMag(k=useVirtualResistor) "true selects the virtual resistor"
    annotation (Placement(transformation(extent={{36,54},{48,66}})));
  Modelica.Blocks.Sources.BooleanConstant selectAng(k=useVirtualResistor) "true selects the virtual resistor"
    annotation (Placement(transformation(extent={{36,-66},{48,-54}})));
  OpenIPSL.Types.PerUnit R_e=if useVirtualResistor then virtualResistor.virtualRe.R_e else 0
    "Virtual resistance, pu, machine base (zero with the clamp and when not limited)";
equation
  connect(Emag, virtualResistor.Emag)
    annotation (Line(points={{-130,80},{-80,80},{-80,86},{-63,86}}, color={0,0,127}));
  connect(Eang, virtualResistor.Eang)
    annotation (Line(points={{-130,20},{-96,20},{-96,68},{-63,68}}, color={0,0,127}));
  connect(V, virtualResistor.V)
    annotation (Line(points={{-130,-20},{-90,-20},{-90,56},{-63,56}}, color={0,0,127}));
  connect(anglev, virtualResistor.anglev)
    annotation (Line(points={{-130,-70},{-84,-70},{-84,41},{-63,41}}, color={0,0,127}));
  connect(sigEmag.y, clamp.Emag)
    annotation (Line(points={{-65.4,-38},{-63,-38}}, color={0,0,127}));
  connect(sigEang.y, clamp.Eang)
    annotation (Line(points={{-65.4,-56},{-63,-56}}, color={0,0,127}));
  connect(sigV.y, clamp.V)
    annotation (Line(points={{-65.4,-68},{-63,-68}}, color={0,0,127}));
  connect(sigAnglev.y, clamp.anglev)
    annotation (Line(points={{-65.4,-83},{-63,-83}}, color={0,0,127}));
  connect(virtualResistor.ElimMag, switchMag.u1)
    annotation (Line(points={{15,80},{40,80},{40,69.6},{61.6,69.6}}, color={0,0,127}));
  connect(clamp.ElimMag, switchMag.u3)
    annotation (Line(points={{15,-44},{30,-44},{30,50.4},{61.6,50.4}}, color={0,0,127}));
  connect(virtualResistor.ElimAng, switchAng.u1)
    annotation (Line(points={{15,44},{22,44},{22,-50.4},{61.6,-50.4}}, color={0,0,127}));
  connect(clamp.ElimAng, switchAng.u3)
    annotation (Line(points={{15,-80},{40,-80},{40,-69.6},{61.6,-69.6}}, color={0,0,127}));
  connect(selectMag.y, switchMag.u2)
    annotation (Line(points={{48.6,60},{61.6,60}}, color={255,0,255}));
  connect(selectAng.y, switchAng.u2)
    annotation (Line(points={{48.6,-60},{61.6,-60}}, color={255,0,255}));
  connect(switchMag.y, ElimMag)
    annotation (Line(points={{89.2,60},{130,60}}, color={0,0,127}));
  connect(switchAng.y, ElimAng)
    annotation (Line(points={{89.2,-60},{130,-60}}, color={0,0,127}));
  annotation (preferredView="diagram",Icon(coordinateSystem(preserveAspectRatio=false), graphics={
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
The same limiter as <code>ClampOrVirtualResistor</code>, built in the diagram layer from its two functions: <code>ClampDiagram</code> and <code>VirtualResistorDiagram</code>
both run, and the two switches pass on the one selected by <code>useVirtualResistor</code>. The modes are described in <code>ClampOrVirtualResistor</code>.
The interface <code>Base.PartialCurrentLimiter</code> computes the indicators <code>I_unlim</code>, <code>I_mag</code> and <code>limited</code>.
</p>
</html>"),
    Diagram(coordinateSystem(extent={{-120,-120},{120,120}}, grid={2,2})));
end ClampOrVirtualResistorDiagram;
