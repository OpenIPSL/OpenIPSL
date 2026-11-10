within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.Variants.FCL;
model FaultClamp
  "Variants.PQLimsAndFCL on the SMIB: steady start and a fault that the current limiter clamps at Imax"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=1e-4,
      X=1e-3,
      t1=2.0,
      t2=2.15));
  parameter Boolean useVirtualResistor=false "Mode of the fault current limiter of the converter";
  Electrical.GFCs.GFMs.REGFMA1.Variants.PQLimsAndFCL GFC(Imax=1.5,
      useVirtualResistor=useVirtualResistor)
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
Tests <code>Variants.PQLimsAndFCL</code> on the single-machine infinite-bus system <code>OpenIPSL.Tests.BaseClasses.SMIB</code>,
the network of the library's PSS/E tests, with the clamp of PSS/E's REGFMA1 (<code>useVirtualResistor = false</code>);
<code>FaultVirtualResistor</code> is the same test with the virtual resistor.
</p>
<p>
The references are the outputs <code>GFC.Pref0</code> and <code>GFC.Vref0</code> of the initial operating point, so the model starts in steady state.
A fault (0.0001 + j0.001 pu) is applied at bus FAULT from 2 to 2.15 s. Without a limit the converter's current would rise to 1.96 pu;
with <code>Imax = 1.5</code> the limiter holds it at 1.5 pu during the fault and releases it when the fault is cleared.
</p>
<p>
Simulate and plot <code>GFC.VS.I_unlim</code>, <code>GFC.VS.I_mag</code>, <code>GFC.VS.limited</code>, <code>GFC.P_meas</code>, <code>GFC.Q_meas</code>,
<code>GFC.V</code> and <code>GFC.omega_dev</code>.
</p>
</html>"));
end FaultClamp;
