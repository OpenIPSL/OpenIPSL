within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.Variants;
class ModelVariants "Model Variants"
  extends Modelica.Icons.Information;
  annotation (Documentation(info="<html>
<p>
Every variant has the P-f and Q-V droop controls of REGFM_A1 <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2021]</a>.
They differ only in the limiters they add:
</p>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr><th>Variant</th><th>P and Q limiters</th><th>Fault current limiter</th></tr>
<tr><td><code>REGFMA1Light</code></td><td>No</td><td>None</td></tr>
<tr><td><code>REGFMA1wPQLimiters</code></td><td>Yes</td><td>None</td></tr>
<tr><td><code>REGFMA1wPQLimitersAndClamp</code></td><td>Yes</td><td>Clamp, as in PSS/E's REGFMA1</td></tr>
<tr><td><code>REGFMA1wPQLimitersAndVR</code></td><td>Yes</td><td>Virtual resistor <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2024]</a></td></tr>
<tr><td><code>REGFMA1wPQLimitersAndFCL</code></td><td>Yes</td><td>Clamp or virtual resistor, inside the voltage source, selected by the parameter <code>useVirtualResistor</code></td></tr>
<tr><td><strong><code>REGFMA1wPQLimitersAndReplaceableFCL</code></strong> (recommended)</td><td>Yes</td><td>Replaceable: clamp (default), virtual resistor, either one selected by a parameter, or no limiter</td></tr>
</table>
<p>
<strong>Use <code>REGFMA1wPQLimitersAndReplaceableFCL</code> by default.</strong> Its default limiter is the clamp of PSS/E's REGFMA1,
and the limiter can be changed in its parameter dialog without changing the model or its connections.
</p>
<p>
For the same limiter, the variants with a fault current limiter give the same results.
The clamp is what PSS/E's REGFMA1 does; the virtual resistor can lose synchronism after long faults.
</p>
</html>"));
end ModelVariants;
