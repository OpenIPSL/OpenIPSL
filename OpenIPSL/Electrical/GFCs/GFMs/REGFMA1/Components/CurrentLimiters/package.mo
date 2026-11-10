within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.Components;
package CurrentLimiters "Components for current limiting modeling"
  extends Modelica.Icons.Package;
  annotation (Documentation(info="<html>
<p>
The fault current limiters of REGFM_A1, to be combined with a voltage source. <code>Clamp</code>, <code>VirtualResistor</code>,
<code>ClampOrVirtualResistor</code> and <code>NoLimit</code> have the interface <code>Base.PartialCurrentLimiter</code>,
from the droop command and the terminal voltage to the internal voltage applied to the source (<code>VoltageSources.VSIOforGFM</code>).
<code>Clamp</code> is PSS/E's REGFMA1 (<code>REGFMA1wPQLimitersAndClamp</code>); any of the four can be chosen in
<code>REGFMA1wPQLimitersAndReplaceableFCL</code>. The package <code>Submodels</code> holds the blocks they are built from, which are not current limiters themselves.
</p>
<p>
<code>ClampOrVirtualResistor</code> runs <code>Clamp</code> and <code>VirtualResistor</code> and passes on the one selected by a parameter.
<code>VoltageSources.VSIOforGFMwFCL</code> is a voltage source built on it, used by <code>REGFMA1wPQLimitersAndFCL</code>. The tests in
<code>OpenIPSL.Tests.GFCs.GFMs.CurrentLimiter</code> exercise each component alone and with a voltage source on a network.
</p>
</html>"));
end CurrentLimiters;
