within OpenIPSL.Tests.GFCs.GFMs.CurrentLimiter;
model VSwithClampInGrid
  "Test the clamp current limiter with the voltage source VSIOforGFM within a grid"
  import Modelica;
  extends Modelica.Icons.Example;
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=1e-12,
      X=1e-6,
      t2=2.05));
  Electrical.GFCs.GFMs.VoltageSources.VSIOforGFM VS "The source at bus GEN1, on its power flow (its defaults)"
    annotation (Placement(transformation(extent={{-110,-20},{-70,20}})));
  Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters.Clamp clamp(
    R_a=VS.R_a,
    X_d=VS.X_d,
    Imax=1.8)
    annotation (Placement(transformation(extent={{-152,-20},{-130,20}})));
  Modelica.Blocks.Sources.Ramp DEm(
    height=-0.3,
    duration=1,
    offset=0,
    startTime=4) "Change of the commanded internal voltage magnitude: 0.3 pu lower from 4 s"
    annotation (Placement(transformation(extent={{-240,20},{-220,40}})));
  Modelica.Blocks.Sources.Ramp DEang(
    height=-Modelica.Constants.pi/8,
    duration=3,
    offset=0,
    startTime=6) "Change of the commanded internal voltage angle: pi/8 lower from 6 s"
    annotation (Placement(transformation(extent={{-240,-60},{-220,-40}})));
  Modelica.Blocks.Math.Add Ecmd "Commanded magnitude: E0 of the power flow plus the change"
    annotation (Placement(transformation(extent={{-200,0},{-180,20}})));
  Modelica.Blocks.Math.Add deltacmd "Commanded angle: delta0 of the power flow plus the change"
    annotation (Placement(transformation(extent={{-200,-40},{-180,-20}})));
  OpenIPSL.Electrical.Sensors.PwCurrent pwCurrent
    annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
  Modelica.Blocks.Sources.RealExpression sigVm(y=VS.V) annotation (Placement(
        transformation(extent={{-4.5,-4.5},{4.5,4.5}}, origin={-162.5,-2.5})));
  Modelica.Blocks.Sources.RealExpression sigVang(y=VS.anglev) annotation (
      Placement(transformation(extent={{-4.5,-4.5},{4.5,4.5}}, origin={-162.5,
            -12.5})));
equation
  connect(DEm.y, Ecmd.u1)
    annotation (Line(points={{-219,30},{-210,30},{-210,16},{-202,16}}, color={0,0,127}));
  connect(VS.E0, Ecmd.u2)
    annotation (Line(points={{-106,-22},{-106,-80},{-210,-80},{-210,4},{-202,4}},
                                                                                color={0,0,127}));
  connect(DEang.y, deltacmd.u2)
    annotation (Line(points={{-219,-50},{-210,-50},{-210,-36},{-202,-36}}, color={0,0,127}));
  connect(VS.delta0, deltacmd.u1)
    annotation (Line(points={{-98,-22},{-98,-84},{-206,-84},{-206,-24},{-202,-24}}, color={0,0,127}));
  connect(Ecmd.y, clamp.Emag)
    annotation (Line(points={{-179,10},{-166,10},{-166,13.3333},{-152.917,
          13.3333}},                                                   color={0,0,127}));
  connect(deltacmd.y, clamp.Eang)
    annotation (Line(points={{-179,-30},{-178,-30},{-178,3.33333},{-152.917,
          3.33333}},                                                       color={0,0,127}));
  connect(clamp.ElimMag, VS.uEmag)
    annotation (Line(points={{-129.083,10},{-122,10},{-122,8},{-114,8}},
                                                          color={0,0,127}));
  connect(clamp.ElimAng, VS.uEang)
    annotation (Line(points={{-129.083,-10},{-124,-10},{-124,-8},{-114,-8}},  color={0,0,127}));
  connect(GEN1.p, pwCurrent.n)
    annotation (Line(points={{-30,0},{-36,0}}, color={0,0,255}));
  connect(VS.p, pwCurrent.p)
    annotation (Line(points={{-68,0},{-56,0}}, color={0,0,255}));
  connect(sigVang.y, clamp.anglev) annotation (Line(points={{-157.55,-12.5},{
          -157.55,-11.6667},{-152.917,-11.6667}}, color={0,0,127}));
  connect(sigVm.y, clamp.V) annotation (Line(points={{-157.55,-2.5},{-157.55,
          -3.33333},{-152.917,-3.33333}}, color={0,0,127}));
  annotation (preferredView="diagram",experiment(
      StopTime=10,
      __Dymola_Algorithm="Dassl"), Diagram(coordinateSystem(extent={{-260,-100},
            {100,100}}, grid={2,2})),
    Documentation(info="<html>
<p>
Tests the clamp current limiter, <code>REGFMA1.CurrentLimiters.Clamp</code> (<code>Imax = 1.8</code> pu), between a commanded internal voltage
and the voltage source <code>VoltageSources.VSIOforGFM</code>, on <code>OpenIPSL.Tests.BaseClasses.SMIB</code>, with the events of
<code>VSwithVReInGrid</code>. The limiter takes the terminal voltage from the source and gives it the internal voltage to apply.
The commanded internal voltage is the source's start value (its outputs <code>E0</code>, <code>delta0</code>) plus the changes, so the test
starts in steady state.
</p>
<p>
A bolted fault at bus FAULT from 2 to 2.05 s drives the unlimited current above <code>Imax</code>: the limiter holds the current at 1.8 pu at the angle
of the unlimited current, and releases it when the fault is cleared. From 4 s the commanded magnitude falls by 0.3 pu, and from 6 s its angle by pi/8.
</p>
<p>
Simulate and plot <code>clamp.I_unlim</code>, <code>clamp.I_mag</code>, <code>clamp.limited</code>, <code>VS.P_meas</code>, <code>VS.Q_meas</code>
and <code>VS.V</code>, and compare with <code>VSwithVReInGrid</code>.
</p>
</html>"));
end VSwithClampInGrid;
