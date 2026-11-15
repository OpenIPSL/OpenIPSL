within OpenIPSL.Electrical.Controls.IEEE_CIGRE;
package SCRX9 "SCRX9 static exciter as an IEEE/CIGRE DLL (example model of the standard)"
  extends Modelica.Icons.Package;

  annotation (Documentation(info="<html>
<p>
The SCRX9 bus-fed or solid-fed static exciter, the example model that comes with the IEEE/CIGRE DLL Modeling Standard
(API V2, Garth Irwin, Electranix, 2021; the revision of the CIGRE JWG B4.82 example code, printed with small differences
in CIGRE TB 958 Appendix E), compiled into the shared library <code>SCRX9</code>
and wrapped as an OpenIPSL excitation system.
</p>
<ul>
<li><a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.SCRX9.SCRX9\">SCRX9</a>: the exciter model; it extends
the PSS/E exciter base class, so it replaces <a href=\"modelica://OpenIPSL.Electrical.Controls.PSSE.ES.SCRX\">PSSE.ES.SCRX</a>
in any generating unit.</li>
<li><a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.SCRX9.Instance\">Instance</a>: the external object that
holds one instance of the DLL model.</li>
<li><a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.SCRX9.Functions\">Functions</a>: the external functions
of the OpenIPSL adapter exported by the library.</li>
</ul>
<p>
How the library is built and found by each tool is described in
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.README\">IEEE_CIGRE.README</a>; the test system is
<a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.SCRX9\">Tests.Controls.IEEE_CIGRE.SCRX9</a>.
</p>
</html>"));
end SCRX9;
