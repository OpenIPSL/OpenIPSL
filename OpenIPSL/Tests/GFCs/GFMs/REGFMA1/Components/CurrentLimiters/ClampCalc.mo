within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.Components.CurrentLimiters;
model ClampCalc "Tests the clamp current limiter with a falling terminal voltage"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.Components.CurrentLimiters.Clamp clamp(
    R_a=1e-3,
    X_d=0.2,
    Imax=1.5)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Sources.Ramp Vtdrop(
    height=-0.9,
    duration=5,
    offset=1,
    startTime=1) "Terminal voltage magnitude, from 1 to 0.1 pu"
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-70,-20})));
  Modelica.Blocks.Sources.Constant Emag(k=1.05) "Droop command, magnitude"
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  Modelica.Blocks.Sources.Constant Eang(k=15*Modelica.Constants.pi/180) "Droop command, angle"
    annotation (Placement(transformation(extent={{-80,10},{-60,30}})));
  Modelica.Blocks.Sources.Constant anglev(k=0) "Terminal voltage angle"
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-70,-50})));
  Modelica.Blocks.Interfaces.RealOutput ElimMag "Magnitude of the internal voltage applied"
    annotation (Placement(transformation(extent={{60,0},{80,20}})));
  Modelica.Blocks.Interfaces.RealOutput ElimAng "Angle of the internal voltage applied"
    annotation (Placement(transformation(extent={{60,-20},{80,0}})));
equation
  connect(Emag.y, clamp.Emag)
    annotation (Line(points={{-59,50},{-30,50},{-30,13.3333},{-21.6667,13.3333}},
                                                                   color={0,0,127}));
  connect(Eang.y, clamp.Eang)
    annotation (Line(points={{-59,20},{-40,20},{-40,3.33333},{-21.6667,3.33333}},
                                                                       color={0,0,127}));
  connect(Vtdrop.y, clamp.V)
    annotation (Line(points={{-59,-20},{-32,-20},{-32,-3.33333},{-21.6667,-3.33333}},
                                                               color={0,0,127}));
  connect(anglev.y, clamp.anglev)
    annotation (Line(points={{-59,-50},{-28,-50},{-28,-11.6667},{-21.6667,-11.6667}},
                                                                   color={0,0,127}));
  connect(clamp.ElimMag, ElimMag)
    annotation (Line(points={{21.6667,10},{70,10}},     color={0,0,127}));
  connect(clamp.ElimAng, ElimAng)
    annotation (Line(points={{21.6667,-10},{70,-10}}, color={0,0,127}));
  annotation (preferredView="diagram",experiment(StopTime=10, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>
Tests <code>REGFMA1.Components.CurrentLimiters.Clamp</code> alone. The droop command is constant, 1.05 pu at 15 degrees, and the terminal voltage
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
