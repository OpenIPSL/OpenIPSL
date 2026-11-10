within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.PNNL;
model Fault05sHI "PNNL's case 7: a fault of 0.0139 pu at bus 401 for 0.5 s"
  extends BaseCase(Rf=0.032/2.304, tf1=3.003, tf2=3.5028, reference(fileName=Modelica.Utilities.Files.loadResource(
          "modelica://OpenIPSL/Resources/data/PNNL-Reference/Fault05sHI.txt")));
  annotation (experiment(
      StopTime=5,
      Interval=0.001,
      Tolerance=1e-08,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>
PNNL's case 7, a fault of higher impedance (0.032 ohm at 0.48 kV). The fault is requested from 3 s to 3.5 s; <code>tf1</code> and <code>tf2</code> are the steps of 4.2 ms at
which PSS/E applied and cleared it. The current limiter holds the current at <code>Imax</code> = 2 pu during the fault. The package <code>PNNL</code> says what to plot against PSS/E's result.
</p>
</html>"));
end Fault05sHI;
