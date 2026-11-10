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
In each test, the table <code>reference</code> plays back PSS/E's result, from <code>Resources/data/PNNL-Reference</code>, so that a simulation can be compared with it:
plot <code>reference.y[1]</code> with <code>GFC.P_meas</code> (P), <code>reference.y[2]</code> with <code>GFC.Q_meas</code> (Q),
<code>reference.y[3]</code> with <code>GFC.V</code> (V), <code>reference.y[4]</code> with <code>Imag.y</code> (the current) and
<code>reference.y[5]</code> with <code>GFC.omega_dev</code> (the speed deviation). In the fault cases the current is limited to <code>Imax</code> = 2 pu.
</p>
</html>"));
end PNNL;
