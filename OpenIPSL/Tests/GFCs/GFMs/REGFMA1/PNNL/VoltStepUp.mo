within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.PNNL;
model VoltStepUp "PNNL's case 2: the voltage of bus 601 steps to 1.05 pu at 3 s"
  extends BaseCase(Vafter=1.05, reference(fileName=Modelica.Utilities.Files.loadResource(
          "modelica://OpenIPSL/Resources/data/PNNL-Reference/VoltStepUp.txt")));
  annotation (experiment(
      StopTime=5,
      Interval=0.001,
      Tolerance=1e-08,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>
PNNL's case 2 (<code>VoltStepUp.plb</code>). The package <code>PNNL</code> says what to plot against PSS/E's result.
</p>
</html>"));
end VoltStepUp;
