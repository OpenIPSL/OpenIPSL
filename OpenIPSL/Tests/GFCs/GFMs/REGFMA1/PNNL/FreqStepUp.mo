within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.PNNL;
model FreqStepUp "PNNL's case 4: the frequency of bus 601 steps to 60.2 Hz at 3 s"
  extends BaseCase(fafter=60.2, reference(fileName=Modelica.Utilities.Files.loadResource(
          "modelica://OpenIPSL/Resources/data/PNNL-Reference/FreqStepUp.txt")));
  annotation (experiment(
      StopTime=5,
      Interval=0.001,
      Tolerance=1e-08,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>
PNNL's case 4 (<code>FreqStepUp.plb</code>). The package <code>PNNL</code> says what to plot against PSS/E's result.
</p>
</html>"));
end FreqStepUp;
