within OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM;
package Components "Network-only tests of the EMT components of the GFM package (no DLL)"
  extends Modelica.Icons.ExamplesPackage;

  annotation (Documentation(info="<html>
<p>
Two tests of the EMT network components of
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components\">OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components</a>
without the converter, so they run without the shared library:
<a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.Components.SmoothShortFault\">SmoothShortFault</a> (smooth
three-phase fault on the 230 kV Thevenin grid) and
<a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.Components.EMTPTransformerZeroSeq\">EMTPTransformerZeroSeq</a>
(wye-delta transformer between the grid and a resistive load). They were two of the ten models of
<code>GridComponentsTest</code>, which lived inside the library package of
<a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a>; the other eight were dropped
as duplicates or 3 ms sketches.
</p>
</html>"));
end Components;
