within OpenIPSL.Tests.GFCs.GFMs.REGFMA1withFCLEncapsulate;
model VRVariantFault
  "REGFMA1wPQLimitersAndVR on the SMIB: steady start and a fault that the virtual resistor limits at Imax"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=1e-4,
      X=1e-3,
      t1=2.0,
      t2=2.15));
  Electrical.GFCs.GFMs.REGFMA1.REGFMA1wPQLimitersAndVR GFC(Imax=1.5)
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
Tests <code>REGFMA1wPQLimitersAndVR</code>, the virtual resistor built from <code>CurrentLimiters.VRe</code> and the voltage source
<code>VoltageSources.VSIOwVReInput</code>, with the network and the fault of <code>FaultClamp</code> (<code>Imax = 1.5</code> pu, a fault at bus FAULT
from 2 to 2.15 s). During the fault the virtual resistance <code>GFC.virtualRe.R_e</code> holds the current at 1.5 pu and returns to zero when the fault is cleared.
Its trajectories are those of <code>FaultVirtualResistor</code> and <code>ReplaceableVRFault</code>.
</p>
<p>
Simulate and plot <code>GFC.virtualRe.R_e</code>, <code>GFC.P_meas</code>, <code>GFC.Q_meas</code>, <code>GFC.V</code> and <code>GFC.omega_dev</code>.
</p>
</html>"));
end VRVariantFault;
