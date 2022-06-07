within OpenIPSL.Examples.PSATSystems.Discretization;
model FourthOrder_AVRII_Discrete "5-bus system with 4th-order machine and AVRTypeII_Discrete"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.TwoAreaOld.BaseClasses.BaseOrder4;
  DiscreteAVR.AVRTypeII_discrete aVRTypeII(
    v0=1.05,
    vf0=1.046883400898693,
    vref0=1.198705028536746,
    vrmin=0,
    vrmax=7.57,
    Ka=7.04,
    Ta=0.4,
    Kf=1,
    Tf=0.05,
    Ke=1,
    Te=0.4,
    Tr=0.05,
    Ae=0,
    Be=0) annotation (Placement(transformation(extent={{-166,-10},{-146,10}})));
  Modelica.Blocks.Sources.Constant vref2(k=1.198705028536746) annotation (
      Placement(transformation(
        extent={{-5,-5},{5,5}},
        origin={-199,27})));
  Modelica.Clocked.RealSignals.Sampler.Hold hold1(y_start=1.046883400898693) annotation (Placement(transformation(extent={{-136,0},{-124,12}})));
  Modelica.Clocked.RealSignals.Sampler.Sample sample1 annotation (Placement(transformation(extent={{-184,22},{-172,34}})));
  Modelica.Clocked.RealSignals.Sampler.SampleClocked sample2 annotation (Placement(transformation(extent={{-190,-6},{-178,6}})));
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock1(
    useSolver=true,
    period=0.01,
    solverMethod="ImplicitEuler") annotation (Placement(transformation(extent={{-196,-52},{-184,-40}})));
equation
  connect(vref2.y, sample1.u) annotation (Line(
      points={{-193.5,27},{-186.75,27},{-186.75,28},{-185.2,28}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sample1.y, aVRTypeII.vref) annotation (Line(
      points={{-171.4,28},{-168,28},{-168,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(aVRTypeII.vf, hold1.u) annotation (Line(
      points={{-145,0},{-142,0},{-142,6},{-137.2,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sample2.y, aVRTypeII.v) annotation (Line(
      points={{-177.4,0},{-172,0},{-172,-6},{-168,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(periodicClock1.y, sample2.clock) annotation (Line(
      points={{-183.4,-46},{-184,-46},{-184,-7.2}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5,
      smooth=Smooth.None));
  connect(hold1.y, order4.vf)
    annotation (Line(points={{-123.4,6},{-114,6},{-114,5}}, color={0,0,127}));
  connect(sample2.u, order4.v) annotation (Line(points={{-191.2,0},{-200,0},{-200,
          -20},{-88,-20},{-88,3},{-91,3}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-220,-100},{160,100}},
          preserveAspectRatio=false)),
    experiment(
      StopTime=20,
      Interval=0.01,
      Tolerance=0.001),
Documentation(info="<html>
<p>Simulate for 20 seconds. Variables of interest are:</p>
<ul>
<li><code>aVRTypeII.vf</code></li>
</ul>
<p>Compare these results with the ones from the other example systems within the <strong>Discretization</strong> subpackage.</p>
</html>"));
end FourthOrder_AVRII_Discrete;
