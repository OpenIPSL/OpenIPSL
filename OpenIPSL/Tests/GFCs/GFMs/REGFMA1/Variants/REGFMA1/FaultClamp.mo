within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.Variants.REGFMA1;
model FaultClamp
  "Variants.REGFMA1 with its default limiter, the clamp, on the SMIB: steady start and a fault limited at Imax"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=1e-4,
      X=1e-3,
      t1=2.0,
      t2=2.15));
  Electrical.GFCs.GFMs.REGFMA1.Variants.REGFMA1 GFC(Imax=1.5)
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
Tests <code>Variants.REGFMA1</code> with its default current limiter, <code>CurrentLimiters.Clamp</code>, with the network and
the fault of <code>PQLimsAndFCL.FaultClamp</code> (<code>Imax = 1.5</code> pu, a fault at bus FAULT from 2 to 2.15 s). Its trajectories are those of
<code>PQLimsAndClamp.Fault</code> and <code>PQLimsAndFCL.FaultClamp</code>; <code>FaultVirtualResistor</code> replaces the limiter.
</p>
<p>
Simulate and plot <code>GFC.currentLimiter.I_unlim</code>, <code>GFC.currentLimiter.I_mag</code>, <code>GFC.P_meas</code>, <code>GFC.Q_meas</code>,
<code>GFC.V</code> and <code>GFC.omega_dev</code>.
</p>
</html>"));
end FaultClamp;
