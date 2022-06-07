within OpenIPSL.Examples.PSATSystems.Discretization;
model FourthOrder_AVRII_Discretized_Continuous "5-bus system with 4th-order machine and AVR Type II + Sample and Hold"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.TwoAreaOld.BaseClasses.BaseOrder4(
      order4(w(fixed=true)));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVRTypeII(
    v0=1.05,
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
    Be=0) annotation (Placement(transformation(extent={{-166,-6},{-146,14}})));
  Modelica.Clocked.RealSignals.Sampler.Sample sample1 annotation (Placement(transformation(extent={{-186,4},{-174,16}})));
  Modelica.Clocked.RealSignals.Sampler.SampleClocked sample2 annotation (Placement(transformation(extent={{-186,-6},{-174,6}})));
  Modelica.Clocked.RealSignals.Sampler.Hold hold1(y_start=1.046883400898693) annotation (Placement(transformation(extent={{-132,0},{-120,12}})));
  Modelica.Clocked.ClockSignals.Clocks.PeriodicRealClock periodicClock1(
    period=0.01,
    useSolver=true,
    solverMethod="ImplicitEuler") annotation (Placement(transformation(extent={{-194,-52},{-182,-40}})));
equation
  connect(sample1.y, aVRTypeII.vref) annotation (Line(
      points={{-173.4,10},{-168,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sample2.y, aVRTypeII.v) annotation (Line(
      points={{-173.4,0},{-168,0},{-168,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(periodicClock1.y, sample2.clock) annotation (Line(
      points={{-181.4,-46},{-180,-46},{-180,-7.2}},
      color={175,175,175},
      pattern=LinePattern.Dot,
      thickness=0.5,
      smooth=Smooth.None));
  connect(aVRTypeII.vf, hold1.u) annotation (Line(points={{-144,4},{-136.75,4},
          {-136.75,6},{-133.2,6}}, color={0,0,127}));
  connect(hold1.y, order4.vf) annotation (Line(points={{-119.4,6},{-116,6},{-116,
          5},{-114,5}}, color={0,0,127}));
  connect(sample2.u, order4.v) annotation (Line(points={{-187.2,0},{-196,0},{
          -196,-16},{-88,-16},{-88,3},{-91,3}},
                                           color={0,0,127}));
  connect(aVRTypeII.vref0, sample1.u) annotation (Line(points={{-156,16},{-156,
          30},{-198,30},{-198,12},{-187.2,12},{-187.2,10}}, color={0,
          0,127}));
  connect(aVRTypeII.vf0, order4.vf0) annotation (Line(points={{-156,-8},{-150,
          -8},{-150,-26},{-204,-26},{-204,40},{-110,40},{-110,11}},
                                                                color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-220,-100},{160,100}},
          preserveAspectRatio=false)),
    experiment(
      StopTime=20,
      Interval=0.01),
Documentation(info="<html>
<p>Simulate for 20 seconds. Variables of interest are:</p>
<ul>
<li><code>aVRTypeII.vf</code></li>
</ul>
<p>Compare these results with the ones from the other example systems within the <strong>Discretization</strong> subpackage.</p>
</html>"));
end FourthOrder_AVRII_Discretized_Continuous;
