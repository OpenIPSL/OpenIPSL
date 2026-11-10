within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.PNNL;
model Fault01s "PNNL's case 5: a fault of 0.000434 pu at bus 401 for 0.1 s"
  extends BaseCase(tf1=3.003, tf2=3.1038, reference(fileName=Modelica.Utilities.Files.loadResource(
          "modelica://OpenIPSL/Resources/data/PNNL-Reference/Fault01s.txt")));
  annotation (experiment(
      StopTime=5,
      Interval=0.001,
      Tolerance=1e-08,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>
PNNL's case 5. The fault is requested from 3 s to 3.1 s; <code>tf1</code> and <code>tf2</code> are the steps of 4.2 ms at which PSS/E applied and cleared it.
The current limiter holds the current at <code>Imax</code> = 2 pu during the fault. The package <code>PNNL</code> says what to plot against PSS/E's result.
</p>
</html>"));
end Fault01s;
