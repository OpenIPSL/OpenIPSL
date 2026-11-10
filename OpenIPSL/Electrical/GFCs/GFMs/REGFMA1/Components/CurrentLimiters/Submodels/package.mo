within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.Components.CurrentLimiters;
package Submodels "Blocks the current limiters are built from; not current limiters themselves"
  extends Modelica.Icons.Package;
  annotation (Documentation(info="<html>
<p>
The blocks from which the current limiters of <code>CurrentLimiters</code> are built, one function each:
</p>
<ul>
<li><code>VRe</code>: the virtual resistance <code>R_e</code> that limits the current to <code>Imax</code>
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2024]</a>; it feeds <code>VoltageSources.VSIOwVReInput</code>
(<code>Variants.PQLimsAndVR</code>) or the limiter <code>VirtualResistor</code>.</li>
<li><code>CurrentLimitValue</code>: the current of magnitude <code>Imax</code> at the angle of the current through
<code>R_a + R_e + jX_d</code>.</li>
<li><code>ClampLimitedVoltage</code>, <code>VirtualResistorLimitedVoltage</code>: the internal voltage to apply, from the clamped current or the virtual resistance;
the blocks of <code>Clamp</code> and <code>VirtualResistor</code> after <code>CurrentLimitValue</code> and <code>VRe</code>.</li>
</ul>
</html>"));
end Submodels;
