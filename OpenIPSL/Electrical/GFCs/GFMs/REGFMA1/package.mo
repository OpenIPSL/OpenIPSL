within OpenIPSL.Electrical.GFCs.GFMs;
package REGFMA1 "The REGFM_A1 GFM model: its variants and the components they are built from"
  extends Modelica.Icons.Package;
  annotation (Documentation(info="<html>
<p>
Package containing the REGFM_A1 model based on <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2021]</a>.
The models to use are in <code>Variants</code>, whose features increase with their complexity;
<a href=\"modelica://OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.Variants.ModelVariants\"><code>Variants.ModelVariants</code></a>
says how they differ and which one to use by default. <code>Components</code> holds the control schemes and limiters they are built from.
The tests of each stage are in <code>OpenIPSL.Tests.GFCs.GFMs</code>, from the components alone to the encapsulated models.
</p>
</html>"));
end REGFMA1;
