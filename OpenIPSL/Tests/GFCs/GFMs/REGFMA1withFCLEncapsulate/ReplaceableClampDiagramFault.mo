within OpenIPSL.Tests.GFCs.GFMs.REGFMA1withFCLEncapsulate;
model ReplaceableClampDiagramFault
  "REGFMA1wPQLimitersAndReplaceableFCL with the clamp built in the diagram layer, on the SMIB: steady start and a fault limited at Imax"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=1e-4,
      X=1e-3,
      t1=2.0,
      t2=2.15));
  Electrical.GFCs.GFMs.REGFMA1.REGFMA1wPQLimitersAndReplaceableFCL GFC(Imax=1.5,
      redeclare Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters.ClampDiagram currentLimiter)
    "The limiter replaced by the clamp built in the diagram layer"
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
Tests <code>REGFMA1wPQLimitersAndReplaceableFCL</code> with its current limiter replaced by <code>CurrentLimiters.ClampDiagram</code>
(<code>redeclare</code>), with the network and the fault of <code>FaultClamp</code>. Its trajectories are those of <code>ReplaceableClampFault</code> and <code>FaultClamp</code>.
</p>
</html>"));
end ReplaceableClampDiagramFault;
