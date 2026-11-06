within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM;
package Components "Three-phase EMT network components for the GFM_GFL_IBR converter tests"
  extends Modelica.Icons.Package;

  annotation (Documentation(info="<html>
<p>
Sensors, switches, transformers, faults and grid equivalents built from <code>Modelica.Electrical.Analog</code>
components, used by the converter model and by the tests in
<a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM\">OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM</a>. All
quantities are instantaneous phase values in SI units; the three-phase components order their pins C (top), B (middle),
A (bottom) on the icons.
</p>
<ul>
<li>Measurement and switching: <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.VoltageCurrentSensor\">VoltageCurrentSensor</a>, <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.ZeroCrossingDetector\">ZeroCrossingDetector</a>, <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.SmoothSwitch\">SmoothSwitch</a>.</li>
<li>Transformers: <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.NonIdealTransformer\">NonIdealTransformer</a>, <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.TransformerSubcircuitZeroZsec\">TransformerSubcircuitZeroZsec</a>, <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.EMTPTransformer\">EMTPTransformer</a>, <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.EMTPTransformerZeroSeq\">EMTPTransformerZeroSeq</a>.</li>
<li>Network and faults: <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.Line_R\">Line_R</a>, <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.ShortFault\">ShortFault</a>, <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.SmoothShortFault\">SmoothShortFault</a>.</li>
<li>Grid equivalents: <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.GridWithFault\">GridWithFault</a> (voltage dip or step), <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.GridFrequencyStep\">GridFrequencyStep</a>, <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.EMTPGrid\">EMTPGrid</a> (Thevenin source).</li>
</ul>
<p>
Ported from the packages <code>tools</code> and <code>GridComponents</code> of
<a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a> (Hao Chang); each class
documents what changed.
</p>
</html>"));
end Components;
