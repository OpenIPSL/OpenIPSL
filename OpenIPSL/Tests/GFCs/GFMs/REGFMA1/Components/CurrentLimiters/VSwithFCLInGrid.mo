within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.Components.CurrentLimiters;
model VSwithFCLInGrid
  "Test the voltage source with the fault current limiter built in, VSIOforGFMwFCL, within a grid"
  import Modelica;
  extends Modelica.Icons.Example;
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=1e-12,
      X=1e-6,
      t2=2.05));
  parameter Boolean useVirtualResistor=false "Mode of the limiter: false, the clamp; true, the virtual resistor";
  Electrical.GFCs.GFMs.VoltageSources.VSIOforGFMwFCL VS(
    P_0=40e6,
    Q_0=5.416582e6,
    v_0=1.0,
    angle_0=0.070620799598684,
    Imax=1.8,
    useVirtualResistor=useVirtualResistor) "The source at bus GEN1, on its power flow"
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  Modelica.Blocks.Sources.Ramp DEm(
    height=-0.3,
    duration=1,
    offset=0,
    startTime=4) "Change of the droop command's magnitude: 0.3 pu lower from 4 s"
    annotation (Placement(transformation(extent={{-240,20},{-220,40}})));
  Modelica.Blocks.Sources.Ramp DEang(
    height=-Modelica.Constants.pi/8,
    duration=3,
    offset=0,
    startTime=6) "Change of the droop command's angle: pi/8 lower from 6 s"
    annotation (Placement(transformation(extent={{-240,-60},{-220,-40}})));
  Modelica.Blocks.Math.Add Ecmd "Droop command, magnitude: E0 of the power flow plus the change"
    annotation (Placement(transformation(extent={{-180,0},{-160,20}})));
  Modelica.Blocks.Math.Add deltacmd "Droop command, angle: delta0 of the power flow plus the change"
    annotation (Placement(transformation(extent={{-180,-40},{-160,-20}})));
  OpenIPSL.Electrical.Sensors.PwCurrent pwCurrent
    annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
equation
  connect(DEm.y, Ecmd.u1)
    annotation (Line(points={{-219,30},{-190,30},{-190,16},{-182,16}}, color={0,0,127}));
  connect(VS.Emag0, Ecmd.u2)
    annotation (Line(points={{-100,22},{-100,50},{-196,50},{-196,4},{-182,4}}, color={0,0,127}));
  connect(DEang.y, deltacmd.u2)
    annotation (Line(points={{-219,-50},{-190,-50},{-190,-36},{-182,-36}}, color={0,0,127}));
  connect(VS.Eang0, deltacmd.u1)
    annotation (Line(points={{-100,-22},{-100,-70},{-196,-70},{-196,-24},{-182,-24}}, color={0,0,127}));
  connect(Ecmd.y, VS.uEmag)
    annotation (Line(points={{-159,10},{-140,10},{-140,8},{-124,8}}, color={0,0,127}));
  connect(deltacmd.y, VS.uEang)
    annotation (Line(points={{-159,-30},{-140,-30},{-140,-8},{-124,-8}}, color={0,0,127}));
  connect(GEN1.p, pwCurrent.n)
    annotation (Line(points={{-30,0},{-36,0}}, color={0,0,255}));
  connect(VS.p, pwCurrent.p)
    annotation (Line(points={{-78,0},{-56,0}}, color={0,0,255}));
  annotation (preferredView="diagram",experiment(
      StopTime=10,
      __Dymola_Algorithm="Dassl"), Diagram(coordinateSystem(extent={{-260,-100},
            {100,100}}, grid={2,2})),
    Documentation(info="<html>
<p>
Tests the voltage source with the fault current limiter built in, <code>VoltageSources.VSIOforGFMwFCL</code> (<code>Imax = 1.8</code> pu),
on <code>OpenIPSL.Tests.BaseClasses.SMIB</code>, with the events of <code>VSwithVReInGrid</code> and <code>VSwithClampInGrid</code>:
the same limiters as there, inside the source. The parameter <code>useVirtualResistor</code>
selects the mode: <code>false</code> (default) gives the trajectories of <code>VSwithClampInGrid</code>, <code>true</code> those of
<code>VSwithVReInGrid</code>.
</p>
<p>
Simulate and plot <code>VS.I_unlim</code>, <code>VS.I_mag</code>, <code>VS.R_e</code>, <code>VS.limited</code>, <code>VS.P</code>, <code>VS.Q</code>
and <code>VS.V</code>.
</p>
</html>"));
end VSwithFCLInGrid;
