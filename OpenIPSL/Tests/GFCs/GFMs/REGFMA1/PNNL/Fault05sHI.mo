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
which PSS/E applied and cleared it. The current limiter holds the current at <code>Imax</code> = 2 pu during the fault and after its clearing, until about 3.53 s.
</p>
<p>
To compare with PSS/E, plot each pair from 2.9 to 4.2 s:
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
In the first 0.2 s after the clearing the two differ most, about as much as PSS/E differs from itself when its step changes from 4.2 ms to 0.25 ms.
<a href=\"modelica://OpenIPSL.Tests.GFCs.GFMs.REGFMA1.PNNL.ValidationCases\">ValidationCases</a> summarizes the seven tests.
</p>
</html>"));
end Fault05sHI;
