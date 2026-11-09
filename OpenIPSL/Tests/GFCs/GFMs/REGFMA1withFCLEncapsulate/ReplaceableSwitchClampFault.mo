within OpenIPSL.Tests.GFCs.GFMs.REGFMA1withFCLEncapsulate;
model ReplaceableSwitchClampFault
  "REGFMA1wPQLimitersAndReplaceableFCL with the limiter of both modes, on the clamp, on the SMIB: steady start and a fault limited at Imax"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=1e-4,
      X=1e-3,
      t1=2.0,
      t2=2.15));
  Electrical.GFCs.GFMs.REGFMA1.REGFMA1wPQLimitersAndReplaceableFCL GFC(Imax=1.5,
      redeclare Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters.ClampOrVirtualResistor currentLimiter(useVirtualResistor=false))
    "The limiter replaced by the one with both modes, on the clamp"
    annotation (Placement(transformation(extent={{-100,-30},{-40,30}})));
equation
  connect(GFC.p, GEN1.p)
    annotation (Line(points={{-37,0},{-30,0}}, color={0,0,255}));
  connect(GFC.Pref0, GFC.Pref) annotation (Line(points={{-58,-31.5},{-58,-50},{-120,
          -50},{-120,-18},{-103,-18}}, color={0,0,127}));
  connect(GFC.Vref0, GFC.Vref) annotation (Line(points={{-82,-31.5},{-82,-60},{-130,
          -60},{-130,18},{-103,18}}, color={0,0,127}));
  annotation (experiment(
      StopTime=10,
      __Dymola_NumberOfIntervals=10000,
      __Dymola_Algorithm="Dassl"), Diagram(coordinateSystem(extent={{-160,-100},
            {100,100}})),
    Documentation(info="<html>
<p>
Tests <code>REGFMA1wPQLimitersAndReplaceableFCL</code> with its current limiter replaced by <code>CurrentLimiters.ClampOrVirtualResistor</code>
(<code>redeclare</code>), with <code>useVirtualResistor = false</code>, the network and the fault of <code>FaultClamp</code>
(<code>Imax = 1.5</code> pu, a fault at bus FAULT from 2 to 2.15 s). Its trajectories are those of <code>ReplaceableClampFault</code> and
<code>FaultClamp</code>; <code>ReplaceableSwitchVRFault</code> is the other position of the switch.
</p>
<p>
Simulate and plot <code>GFC.currentLimiter.I_unlim</code>, <code>GFC.currentLimiter.I_mag</code>, <code>GFC.P_meas</code>, <code>GFC.Q_meas</code>,
<code>GFC.V</code> and <code>GFC.omega_dev</code>.
</p>
</html>"));
end ReplaceableSwitchClampFault;
