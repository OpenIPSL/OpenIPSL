within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.Components.CurrentLimiters;
model ClampOrVirtualResistorCalc "Tests the current limiter with both modes with a falling terminal voltage"
  extends Modelica.Icons.Example;
  parameter Boolean useVirtualResistor=false "Mode of the limiter: false, the clamp; true, the virtual resistor";
  OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.Components.CurrentLimiters.ClampOrVirtualResistor limiter(
    R_a=1e-3,
    X_d=0.2,
    Imax=1.5,
    useVirtualResistor=useVirtualResistor)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Sources.Ramp Vtdrop(
    height=-0.9,
    duration=5,
    offset=1,
    startTime=1) "Terminal voltage magnitude, from 1 to 0.1 pu"
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-70,-30})));
  Modelica.Blocks.Sources.Constant Emag(k=1.05) "Droop command, magnitude"
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Sources.Constant Eang(k=15*Modelica.Constants.pi/180) "Droop command, angle"
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Sources.Constant anglev(k=0) "Terminal voltage angle"
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-70,-70})));
  Modelica.Blocks.Interfaces.RealOutput ElimMag "Magnitude of the internal voltage applied"
    annotation (Placement(transformation(extent={{60,30},{80,50}})));
  Modelica.Blocks.Interfaces.RealOutput ElimAng "Angle of the internal voltage applied"
    annotation (Placement(transformation(extent={{60,-50},{80,-30}})));
equation
  connect(Emag.y, limiter.Emag)
    annotation (Line(points={{-59,70},{-32,70},{-32,13.3333},{-21.6667,13.3333}}, color={0,0,127}));
  connect(Eang.y, limiter.Eang)
    annotation (Line(points={{-59,30},{-46,30},{-46,3.33333},{-21.6667,3.33333}}, color={0,0,127}));
  connect(Vtdrop.y, limiter.V)
    annotation (Line(points={{-59,-30},{-46,-30},{-46,-3.33333},{-21.6667,-3.33333}}, color={0,0,127}));
  connect(anglev.y, limiter.anglev)
    annotation (Line(points={{-59,-70},{-32,-70},{-32,-11.6667},{-21.6667,-11.6667}}, color={0,0,127}));
  connect(limiter.ElimMag, ElimMag)
    annotation (Line(points={{21.6667,10},{40,10},{40,40},{70,40}}, color={0,0,127}));
  connect(limiter.ElimAng, ElimAng)
    annotation (Line(points={{21.6667,-10},{40,-10},{40,-40},{70,-40}}, color={0,0,127}));
  annotation (preferredView="diagram",experiment(StopTime=10, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>
Tests <code>REGFMA1.Components.CurrentLimiters.ClampOrVirtualResistor</code> alone, with the inputs of <code>ClampCalc</code> and <code>VirtualResistorCalc</code>.
The parameter <code>useVirtualResistor</code> selects the mode: <code>false</code> (default) gives the outputs of <code>ClampCalc</code>,
<code>true</code> those of <code>VirtualResistorCalc</code>.
</p>
<p>
Simulate and plot <code>limiter.I_unlim</code>, <code>limiter.I_mag</code>, <code>limiter.R_e</code>, <code>ElimMag</code> and <code>ElimAng</code>.
</p>
</html>"));
end ClampOrVirtualResistorCalc;
