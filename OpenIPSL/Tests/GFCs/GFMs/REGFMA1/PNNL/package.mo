within OpenIPSL.Tests.GFCs.GFMs.REGFMA1;
package PNNL "PNNL's seven REGFM_A1 validation cases, each with PSS/E's result to compare against"
  extends Modelica.Icons.ExamplesPackage;
  annotation (Documentation(info="<html>
<p>
The seven validation cases of Pacific Northwest National Laboratory for REGFM_A1
(release V1 of <a href=\"https://github.com/pnnl/PSCAD-and-PSSE-Version-of-WECC-Grid-Forming-Inverter-Models\">PSCAD and PSS/E versions of the WECC grid-forming inverter models</a>),
on the network <code>OpenIPSL.Tests.BaseClasses.PNNL.TwoBus</code> with <code>Variants.REGFMA1</code> and its default current limiter.
</p>
<p>
In each test, the table <code>reference</code> plays back PSS/E's result, from <code>Resources/data/PNNL-Reference</code>, so that a simulation can be compared with it.
<a href=\"modelica://OpenIPSL.Tests.GFCs.GFMs.REGFMA1.PNNL.ValidationCases\">ValidationCases</a> summarizes the tests and says what to plot against the reference.
</p>
</html>"));
end PNNL;
