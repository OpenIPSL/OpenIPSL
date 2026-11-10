within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.PNNL;
model FreqStepDown "PNNL's case 3: the frequency of bus 601 steps to 59.8 Hz at 3 s"
  extends BaseCase(fafter=59.8, reference(fileName=Modelica.Utilities.Files.loadResource(
          "modelica://OpenIPSL/Resources/data/PNNL-Reference/FreqStepDown.txt")));
  annotation (experiment(
      StopTime=5,
      Interval=0.001,
      Tolerance=1e-08,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>
PNNL's case 3 (<code>FreqStepDown.plb</code>). The package <code>PNNL</code> says what to plot against PSS/E's result.
</p>
</html>"));
end FreqStepDown;
