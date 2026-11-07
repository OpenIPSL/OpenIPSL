within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1;
package CurrentLimiters "Components for current limiting modeling"
  extends Modelica.Icons.Package;
  annotation (Documentation(info="<html>
<p>
The components of the fault current limiter of REGFM_A1, one function each, to be combined with a voltage source:
</p>
<ul>
<li><code>VRe</code>: the virtual resistance <code>R_e</code> that limits the current to <code>Imax</code>
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2024]</a>; it feeds <code>VoltageSources.VSIOwVReInput</code>
(<code>REGFMA1wPQLimitersAndVR</code>) or the limiter <code>VirtualResistor</code>.</li>
<li><code>CurrentLimitValue</code>: the current of magnitude <code>Imax</code> at the angle of the current through
<code>R_a + R_e + jX_d</code>.</li>
<li><code>Clamp</code>, <code>VirtualResistor</code>, <code>NoLimit</code>: current limiters with the interface <code>Base.PartialCurrentLimiter</code>,
from the droop command and the terminal voltage to the internal voltage applied to the source (<code>VoltageSources.VSIOforGFM</code>).
<code>Clamp</code> is PSS/E's REGFMA1 (<code>REGFMA1wPQLimitersAndClamp</code>); any of the three can be chosen in
<code>REGFMA1wPQLimitersAndReplaceableFCL</code>.</li>
</ul>
<p>
<code>REGFMA1wPQLimitersAndFCL</code> implements both limiters in one voltage source instead, <code>VoltageSources.VSIOforGFMwFCL</code>,
selected by a parameter: the same limiters written as equations rather than as components. The tests in
<code>OpenIPSL.Tests.GFCs.GFMs.CurrentLimiter</code> exercise each component alone and with a voltage source on a network.
</p>
</html>"));
end CurrentLimiters;
