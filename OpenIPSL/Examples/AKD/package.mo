within OpenIPSL.Examples;
package AKD "Small subsystem representing the northern part of the Norwegian power system network"
 extends Modelica.Icons.ExamplesPackage;

annotation (Documentation(info="<html>
<p>The AKD test system represents a small transmission grid that is provided by Statnett, the Norwegian Transmission System Operator. The grid represents a subsystem of the Norwegian power network, located in the northern part of the country.</p>
<p>The system is composed of seven buses, six machines and one load center.</p>
<p>The model underwent a software-to-software validation procedure against the PSSE model counterpart. The validation procedure assessed the behavior of the system after different disturbances that were applied to the system.</p>
<p>This package contains three sub-packages:</p>
<ul>
<li><strong>Components</strong>: has basically two models that represent the generation units used in the system.</li>
<li><strong>System</strong>: has the power grid model that can be simulated.</li>
<li><strong>Data</strong>: contains the power flow data that is used to initialize the power grid.</li>
</ul>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Author</p></td>
<td><p>Giuseppe Laera, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigi.vanfretti@gmail.com\">luigi.vanfretti@gmail.com</a></p></td>
</tr>
</table>
</html>"));
end AKD;
