within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.Variants.PQLimsAndClamp;
model Fault
  "Variants.PQLimsAndClamp on the SMIB: steady start and a fault that the clamp component limits at Imax"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=1e-4,
      X=1e-3,
      t1=2.0,
      t2=2.15));
  Electrical.GFCs.GFMs.REGFMA1.Variants.PQLimsAndClamp GFC(Imax=1.5)
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
Tests <code>Variants.PQLimsAndClamp</code>, the clamp of PSS/E's REGFMA1 as a component, with the network and the fault of <code>PQLimsAndFCL.FaultClamp</code>:
<code>Tests.BaseClasses.SMIB</code>, <code>Imax = 1.5</code> pu, a fault (0.0001 + j0.001 pu) at bus FAULT from 2 to 2.15 s.
The model starts in steady state (the references are <code>GFC.Pref0</code> and <code>GFC.Vref0</code>); during the fault the clamp holds the current
at 1.5 pu and releases it when the fault is cleared. Its trajectories are those of <code>PQLimsAndFCL.FaultClamp</code> and <code>REGFMA1.FaultClamp</code>.
</p>
<p>
Simulate and plot <code>GFC.currentLimiter.I_unlim</code>, <code>GFC.currentLimiter.I_mag</code>, <code>GFC.currentLimiter.limited</code>,
<code>GFC.P_meas</code>, <code>GFC.Q_meas</code>, <code>GFC.V</code> and <code>GFC.omega_dev</code>.
</p>
</html>"));
end Fault;
