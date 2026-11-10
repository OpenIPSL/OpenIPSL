within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.Variants;
package FCL
  "Tests the REGFM_A1 model with P and Q limiters and the fault current limiter"
  extends Modelica.Icons.ExamplesPackage;
  annotation (Documentation(info="<html>
<p>
This sub-package tests <code>Variants.PQLimsAndFCL</code> on <code>OpenIPSL.Tests.BaseClasses.SMIB</code>,
with a fault that drives the converter's current above <code>Imax</code>, in both modes of the fault current limiter:
the clamp of PSS/E's REGFMA1 (<code>FaultClamp</code>) and the virtual resistor (<code>FaultVirtualResistor</code>).
</p>
</html>"));
end FCL;
