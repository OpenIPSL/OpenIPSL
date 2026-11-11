within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.Components.CurrentLimiters;
model ClampOrVirtualResistor
  "Fault current limiter of REGFM_A1: the clamp of PSS/E's REGFMA1 or a virtual resistor, selected by a parameter"
  extends Base.PartialCurrentLimiter;
  parameter Boolean useVirtualResistor=false
    "false: the current is clamped to Imax at the angle of the unlimited current (PSS/E's REGFMA1, the WECC specification); true: a virtual resistor in series limits it to Imax"
    annotation (Dialog(group="Current Limiter Setting"));
  VirtualResistor virtualResistor(
    R_a=R_a,
    X_d=X_d,
    Imax=Imax) "The limiter with the virtual resistor"
    annotation (Placement(transformation(extent={{-60,26},{12,98}})));
  Clamp clamp(
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
        Line(
          points={{-60,-80},{-40,-80},{20,80},{60,80}},
          color={28,108,200},
          thickness=1),
        Ellipse(extent={{-60,60},{60,-60}},lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{20,80},{80,80}},
          color={238,46,47},
          pattern=LinePattern.Dash,
          thickness=1),
        Polygon(
          points={{20,110},{20,90},{40,100},{20,110}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-20,100},{20,100}},
                                     color={28,108,200},
          thickness=1),
        Rectangle(
          extent={{-52,-94},{-40,-106}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-40,-100},{-20,-100}},
                                       color={28,108,200},
          thickness=1),
        Line(points={{20,-100},{40,-100}},
                                     color={28,108,200},
          thickness=1),
        Rectangle(
          extent={{40,-96},{50,-106}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-20,-94},{20,-106}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineThickness=1),
        Polygon(
          points={{-14,20},{-12,20},{16,20},{26,0},{16,-20},{-12,-20},{-14,-20},
              {-14,20}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier),
        Line(points={{-30,10},{-14,10}},
                                     color={28,108,200},
          thickness=1),
        Line(points={{-30,-10},{-14,-10}},
                                     color={28,108,200},
          thickness=1)}),
    Documentation(info="<html>
<p>
The fault current limiter of REGFM_A1 with both of its modes: <code>Clamp</code> and <code>VirtualResistor</code> both run, and the two switches pass on the one selected by
<code>useVirtualResistor</code>. It takes the droop command <code>Edroop</code> at the angle <code>delta_droop</code> and the terminal voltage <code>V</code>, and gives the internal voltage
to apply behind the impedance <code>R_a + jX_d</code> (pu on the machine base). It can be chosen in <code>Variants.REGFMA1</code>,
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
Both modes are continuous at <code>|I| = Imax</code>, and the test is evaluated without an event, as <code>Clamp</code> explains. At initialization the limiter is inactive.
The steady-state current limiting of manufacturers' controls is not represented, as in PSS/E's REGFMA1 and the specification.
</p>
</html>"),
    Diagram(coordinateSystem(extent={{-120,-120},{120,120}}, grid={2,2})));
end ClampOrVirtualResistor;
