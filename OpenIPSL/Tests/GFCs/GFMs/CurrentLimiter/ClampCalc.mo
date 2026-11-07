within OpenIPSL.Tests.GFCs.GFMs.CurrentLimiter;
model ClampCalc "Tests the clamp current limiter with a falling terminal voltage"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters.Clamp clamp(
    R_a=1e-3,
    X_d=0.2,
    Imax=1.5)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Sources.Ramp Vtdrop(
    height=-0.9,
    duration=5,
    offset=1,
    startTime=1) "Terminal voltage magnitude, from 1 to 0.1 pu"
    annotation (Placement(transformation(extent={{80,50},{60,70}})));
  Modelica.Blocks.Sources.Constant Emag(k=1.05) "Droop command, magnitude"
    annotation (Placement(transformation(extent={{-80,50},{-60,70}})));
  Modelica.Blocks.Sources.Constant Eang(k=15*Modelica.Constants.pi/180) "Droop command, angle"
    annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
  Modelica.Blocks.Sources.Constant anglev(k=0) "Terminal voltage angle"
    annotation (Placement(transformation(extent={{80,-70},{60,-50}})));
  Modelica.Blocks.Interfaces.RealOutput ElimMag "Magnitude of the internal voltage applied"
    annotation (Placement(transformation(extent={{100,80},{120,100}})));
  Modelica.Blocks.Interfaces.RealOutput ElimAng "Angle of the internal voltage applied"
    annotation (Placement(transformation(extent={{100,20},{120,40}})));
equation
  connect(Emag.y, clamp.Emag)
    annotation (Line(points={{-59,60},{-40,60},{-40,12},{-24,12}}, color={0,0,127}));
  connect(Eang.y, clamp.Eang)
    annotation (Line(points={{-59,-60},{-40,-60},{-40,-12},{-24,-12}}, color={0,0,127}));
  connect(Vtdrop.y, clamp.V)
    annotation (Line(points={{59,60},{40,60},{40,12},{24,12}}, color={0,0,127}));
  connect(anglev.y, clamp.anglev)
    annotation (Line(points={{59,-60},{40,-60},{40,-12},{24,-12}}, color={0,0,127}));
  connect(clamp.ElimMag, ElimMag)
    annotation (Line(points={{-8,22},{-8,90},{110,90}}, color={0,0,127}));
  connect(clamp.ElimAng, ElimAng)
    annotation (Line(points={{8,22},{8,30},{110,30}}, color={0,0,127}));
  annotation (experiment(StopTime=10, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>
Tests <code>REGFMA1.CurrentLimiters.Clamp</code> alone. The droop command is constant, 1.05 pu at 15 degrees, and the terminal voltage
falls from 1 to 0.1 pu between 1 and 6 s. While the unlimited current <code>clamp.I_unlim</code> is below <code>Imax = 1.5</code> pu,
the internal voltage applied (<code>ElimMag</code>, <code>ElimAng</code>) is the droop command; once it exceeds it, the applied voltage drives a current
<code>clamp.I_mag</code> of 1.5 pu at the angle of the unlimited current.
</p>
<p>
Simulate and plot <code>clamp.I_unlim</code>, <code>clamp.I_mag</code>, <code>clamp.limited</code>, <code>ElimMag</code> and <code>ElimAng</code>,
and compare with <code>VirtualResistorCalc</code>.
</p>
</html>"));
end ClampCalc;
