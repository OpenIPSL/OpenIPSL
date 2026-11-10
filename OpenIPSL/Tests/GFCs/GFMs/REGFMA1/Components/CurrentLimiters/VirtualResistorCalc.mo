within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.Components.CurrentLimiters;
model VirtualResistorCalc "Tests the virtual-resistor current limiter with a falling terminal voltage"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.Components.CurrentLimiters.VirtualResistor virtualResistor(
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
  connect(Emag.y, virtualResistor.Emag)
    annotation (Line(points={{-59,70},{-32,70},{-32,13.3333},{-21.6667,13.3333}},
                                                                   color={0,0,127}));
  connect(Eang.y, virtualResistor.Eang)
    annotation (Line(points={{-59,30},{-46,30},{-46,4},{-21.6667,4},{-21.6667,
          3.33333}},                                                   color={0,0,127}));
  connect(Vtdrop.y, virtualResistor.V)
    annotation (Line(points={{-59,-30},{-46,-30},{-46,-3.33333},{-34,-3.33333},
          {-21.6667,-3.33333}},                                color={0,0,127}));
  connect(anglev.y, virtualResistor.anglev)
    annotation (Line(points={{-59,-70},{-32,-70},{-32,-16},{-32,-11.6667},{
          -21.6667,-11.6667}},                                     color={0,0,127}));
  connect(virtualResistor.ElimMag, ElimMag)
    annotation (Line(points={{21.6667,10},{40,10},{40,40},{70,40}},
                                                        color={0,0,127}));
  connect(virtualResistor.ElimAng, ElimAng)
    annotation (Line(points={{21.6667,-10},{40,-10},{40,-40},{70,-40}},
                                                      color={0,0,127}));
  annotation (preferredView="diagram",experiment(StopTime=10, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>
Tests <code>REGFMA1.Components.CurrentLimiters.VirtualResistor</code> alone, with the inputs of <code>ClampCalc</code>. While the unlimited current
<code>virtualResistor.I_unlim</code> is below <code>Imax = 1.5</code> pu, the internal voltage applied is the droop command and the virtual resistance
<code>virtualResistor.virtualRe.R_e</code> is zero; once it exceeds it, <code>R_e</code> rises so that the current <code>virtualResistor.I_mag</code>
stays at 1.5 pu. The magnitude is that of <code>ClampCalc</code>; the angle of the current, and so the applied voltage, differ.
</p>
<p>
Simulate and plot <code>virtualResistor.virtualRe.R_e</code>, <code>virtualResistor.I_unlim</code>, <code>virtualResistor.I_mag</code>,
<code>ElimMag</code> and <code>ElimAng</code>, and compare with <code>ClampCalc</code>.
</p>
</html>"));
end VirtualResistorCalc;
