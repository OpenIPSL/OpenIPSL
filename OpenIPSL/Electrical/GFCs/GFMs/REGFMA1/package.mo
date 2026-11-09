within OpenIPSL.Electrical.GFCs.GFMs;
package REGFMA1 "Variants of the REGFM_A1 GFM model"
  extends Modelica.Icons.Package;
  annotation (Documentation(info="<html>
<p>
Package containing the REGFM_A1 model based on <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2021]</a>. Includes variants whose number of features increase by complexity. </p>
<ol>
<li><code>REGFMA1Light</code>: the P-f and Q-V droop controls.</li>
<li><code>REGFMA1wPQLimiters</code>: with the limiters of the active and reactive power.</li>
<li>With a fault current limiter, which holds the converter's current at <code>Imax</code> during faults, in four forms that give the same results:
<ul>
<li><code>REGFMA1wPQLimitersAndClamp</code>: the clamp of PSS/E's REGFMA1 as a component, <code>CurrentLimiters.Clamp</code>;</li>
<li><code>REGFMA1wPQLimitersAndVR</code>: the virtual resistor <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2024]</a> as components,
<code>CurrentLimiters.VRe</code> and the source <code>VoltageSources.VSIOwVReInput</code>;</li>
<li><code>REGFMA1wPQLimitersAndReplaceableFCL</code>: the limiter as a replaceable component (<code>CurrentLimiters.Clamp</code> by default,
<code>CurrentLimiters.VirtualResistor</code>, <code>CurrentLimiters.ClampOrVirtualResistor</code>, <code>CurrentLimiters.NoLimit</code>);</li>
<li><code>REGFMA1wPQLimitersAndFCL</code>: both limiters written as equations, <code>CurrentLimiters.ClampOrVirtualResistor</code>, inside one voltage source,
<code>VoltageSources.VSIOforGFMwFCL</code>, selected by the parameter <code>useVirtualResistor</code>.</li>
</ul>
</li>
</ol>
<p>
The clamp is what PSS/E's REGFMA1 does; the virtual resistor can lose synchronism after long faults. The tests of each stage are in
<code>OpenIPSL.Tests.GFCs.GFMs</code>, from the components alone to the encapsulated models.
</p>
</html>"));
end REGFMA1;
