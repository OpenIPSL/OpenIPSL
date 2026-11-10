within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.PNNL;
model VoltStepDown "PNNL's case 1: the voltage of bus 601 steps to 0.95 pu at 3 s"
  extends BaseCase(Vafter=0.95, reference(fileName=Modelica.Utilities.Files.loadResource(
          "modelica://OpenIPSL/Resources/data/PNNL-Reference/VoltStepDown.txt")));
  annotation (experiment(
      StopTime=5,
      Interval=0.001,
      Tolerance=1e-08,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>
PNNL's case 1 (<code>VoltStepDown.plb</code>). The package <code>PNNL</code> says what to plot against PSS/E's result.
</p>
</html>"));
end VoltStepDown;
