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
PNNL's case 4 (<code>FreqStepUp.plb</code>): the frequency of bus 601 steps from 60 to 60.2 Hz at 3 s. The current limiter does not act.
</p>
<p>
To compare with PSS/E, plot each pair from 2.9 s:
</p>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr><th>Quantity (pu on 0.1 MVA)</th><th>This model</th><th>PSS/E</th></tr>
<tr><td>Active power</td><td><code>GFC.P_meas</code></td><td><code>reference.y[1]</code></td></tr>
<tr><td>Reactive power</td><td><code>GFC.Q_meas</code></td><td><code>reference.y[2]</code></td></tr>
<tr><td>Terminal voltage</td><td><code>GFC.V</code></td><td><code>reference.y[3]</code></td></tr>
<tr><td>Current magnitude</td><td><code>Imag.y</code> (the same signal as <code>GFC.currentLimiter.I_mag</code>)</td><td><code>reference.y[4]</code></td></tr>
<tr><td>Speed deviation</td><td><code>GFC.omega_dev</code></td><td><code>reference.y[5]</code></td></tr>
</table>
<p>
PSS/E sees the step at 3.003 s, its first integration step after the ramp, and the model at 3 s.
<a href=\"modelica://OpenIPSL.Tests.GFCs.GFMs.REGFMA1.PNNL.ValidationCases\">ValidationCases</a> summarizes the seven tests.
</p>
</html>"));
end FreqStepUp;
