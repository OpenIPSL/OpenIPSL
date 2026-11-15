within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.PNNL;
class ValidationCases "Validation Cases"
  extends Modelica.Icons.Information;
  annotation (Documentation(info="<html>
<p>
The seven validation cases of Pacific Northwest National Laboratory for REGFM_A1, from release V1 of
<a href=\"https://github.com/pnnl/PSCAD-and-PSSE-Version-of-WECC-Grid-Forming-Inverter-Models\">PSCAD and PSS/E versions of the WECC grid-forming inverter models</a>.
Each test runs <code>Variants.REGFMA1</code> with its default limiter, the clamp, on PNNL's two-bus network
(<code>OpenIPSL.Tests.BaseClasses.PNNL.TwoBus</code>) for 5 s, and holds PSS/E 36.4's result in the table <code>reference</code>.
</p>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr><th>Test</th><th>PNNL's case</th><th>Disturbance</th><th>Current limiter</th><th>Plot from</th></tr>
<tr><td><code>VoltStepDown</code></td><td>1</td><td>The voltage of bus 601 steps to 0.95 pu at 3 s</td><td>Does not act</td><td>2.9 s</td></tr>
<tr><td><code>VoltStepUp</code></td><td>2</td><td>The voltage of bus 601 steps to 1.05 pu at 3 s</td><td>Does not act</td><td>2.9 s</td></tr>
<tr><td><code>FreqStepDown</code></td><td>3</td><td>The frequency of bus 601 steps to 59.8 Hz at 3 s</td><td>Does not act</td><td>2.9 s</td></tr>
<tr><td><code>FreqStepUp</code></td><td>4</td><td>The frequency of bus 601 steps to 60.2 Hz at 3 s</td><td>Does not act</td><td>2.9 s</td></tr>
<tr><td><code>Fault01s</code></td><td>5</td><td>Fault of 0.000434 pu at bus 401 for 0.1 s, from 3 s</td><td>Holds the current at 2 pu until about 3.10 s</td><td>2.9 to 3.5 s</td></tr>
<tr><td><code>Fault05s</code></td><td>6</td><td>Fault of 0.000434 pu at bus 401 for 0.5 s, from 3 s</td><td>Holds the current at 2 pu until about 3.61 s</td><td>2.9 to 4.2 s</td></tr>
<tr><td><code>Fault05sHI</code></td><td>7</td><td>Fault of 0.0139 pu at bus 401 for 0.5 s, from 3 s</td><td>Holds the current at 2 pu until about 3.53 s</td><td>2.9 to 4.2 s</td></tr>
</table>
<p>
<strong>To compare a test with PSS/E, plot these pairs.</strong> The same pairs apply to all seven tests, and all values are in pu on 0.1 MVA.
</p>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr><th>Quantity</th><th>This model</th><th>PSS/E</th><th>PSS/E's channel at bus 401</th></tr>
<tr><td>Active power</td><td><code>GFC.P_meas</code></td><td><code>reference.y[1]</code></td><td><code>POWR</code></td></tr>
<tr><td>Reactive power</td><td><code>GFC.Q_meas</code></td><td><code>reference.y[2]</code></td><td><code>VARS</code></td></tr>
<tr><td>Terminal voltage</td><td><code>GFC.V</code></td><td><code>reference.y[3]</code></td><td><code>ETRM</code></td></tr>
<tr><td>Current magnitude</td><td><code>Imag.y</code></td><td><code>reference.y[4]</code></td><td><code>ITRM</code></td></tr>
<tr><td>Speed deviation</td><td><code>GFC.omega_dev</code></td><td><code>reference.y[5]</code></td><td><code>SPD</code></td></tr>
</table>
<p>
<code>Imag.y</code> is the magnitude of the current at the converter's terminal. <code>GFC.currentLimiter.I_mag</code>, the current inside the limiter, is the same signal, so either can be plotted against <code>reference.y[4]</code>.
</p>
<p>
The curves lie on each other, with two exceptions. In the voltage and frequency steps, PSS/E sees the step at its first integration step after the ramp, 3.003 s, and the model at 3 s.
In the first 0.2 s after a fault is cleared they differ by up to 4e-2 pu in P, about as much as PSS/E differs from itself when its step changes from 4.2 ms to 0.25 ms.
</p>
</html>"));
end ValidationCases;
