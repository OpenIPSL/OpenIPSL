within OpenIPSL.Tests.GFCs.GFMs.REGFMA1withFCLEncapsulate;
model ReplaceableNoLimitFault
  "REGFMA1wPQLimitersAndReplaceableFCL with no current limiter, on the SMIB: the fault of the other tests, without limiting"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=1e-4,
      X=1e-3,
      t1=2.0,
      t2=2.15));
  Electrical.GFCs.GFMs.REGFMA1.REGFMA1wPQLimitersAndReplaceableFCL GFC(Imax=1.5,
      redeclare Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters.NoLimit currentLimiter)
    "The limiter replaced by NoLimit"
    annotation (Placement(transformation(extent={{-100,-30},{-40,30}})));
equation
  connect(GFC.p, GEN1.p)
    annotation (Line(points={{-34,0},{-30,0}}, color={0,0,255}));
  connect(GFC.Pref0, GFC.Pref) annotation (Line(points={{-76,-33},{-76,-50},{-120,
          -50},{-120,-18},{-104.5,-18}}, color={0,0,127}));
  connect(GFC.Vref0, GFC.Vref) annotation (Line(points={{-88,-33},{-88,-60},{-130,
          -60},{-130,18},{-104.5,18}}, color={0,0,127}));
  annotation (experiment(
      StopTime=10,
      __Dymola_NumberOfIntervals=10000,
      __Dymola_Algorithm="Dassl"), Diagram(coordinateSystem(extent={{-160,-100},
            {100,100}})),
    Documentation(info="<html>
<p>
Tests <code>REGFMA1wPQLimitersAndReplaceableFCL</code> with its current limiter replaced by <code>CurrentLimiters.NoLimit</code>, with the network
and the fault of <code>FaultClamp</code>. The droop command is applied as it is: the current rises to 1.96 pu during the fault, above
<code>Imax = 1.5</code> pu, which <code>GFC.currentLimiter.limited</code> reports but does not act on. The trajectories are those of
<code>REGFMA1wPQLimiters</code> on the same network and fault.
</p>
<p>
Simulate and plot <code>GFC.currentLimiter.I_mag</code>, <code>GFC.currentLimiter.limited</code>, <code>GFC.P_meas</code>, <code>GFC.Q_meas</code>,
<code>GFC.V</code> and <code>GFC.omega_dev</code>, and compare with <code>ReplaceableClampFault</code>.
</p>
</html>"));
end ReplaceableNoLimitFault;
