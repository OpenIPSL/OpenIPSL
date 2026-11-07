within OpenIPSL.Tests.GFCs.GFMs.REGFMA1withFCLEncapsulate;
model FaultVirtualResistor
  "REGFMA1wPQLimitersAndFCL on the SMIB: steady start and a fault that the virtual resistor limits at Imax"
  extends FaultClamp(useVirtualResistor=true);
  annotation (experiment(
      StopTime=10,
      __Dymola_NumberOfIntervals=10000,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>
The test <code>FaultClamp</code> with the virtual resistor of the fault current limiter (<code>useVirtualResistor = true</code>):
during the fault a resistance <code>GFC.VS.R_e</code> in series with the source limits the current to <code>Imax</code>.
</p>
<p>
Simulate and plot <code>GFC.VS.R_e</code>, <code>GFC.VS.I_mag</code>, <code>GFC.P_meas</code>, <code>GFC.Q_meas</code>,
<code>GFC.V</code> and <code>GFC.omega_dev</code>, and compare with <code>FaultClamp</code>.
</p>
</html>"));
end FaultVirtualResistor;
