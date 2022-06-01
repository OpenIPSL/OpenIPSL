within OpenIPSL.Examples;
package TwoAreas "2 areas test system from Klein, Rogers, and Kundur"
    extends Modelica.Icons.ExamplesPackage;

annotation (
    Documentation(info="<html>
<p>This package contains a 11-bus 4-machine 2-area power grid model implemented in three different ways, generation unit models that are used in the network implementation and data packages for assisting initialization. </p>
<p>As mentioned previously, the user will find three test systems: </p>
<ul>
<li><strong>Two_Areas_PSAT</strong>: test system in which generation units are composed of PSAT machine models.</li>
<li><strong>Two_Areas_PSSE</strong>: test system in which generation units are composed of PSSE machine models.</li>
<li><strong>Two_Areas_PSSE</strong>: test system in which generation units are composed of PSSE machine and PSSE exciter models.</li>
</ul>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>Two-Area System, Prabha Kundur, Power System Stability and Control, Example 12.6, page 813</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, Tin Rabuzin, Ahsan Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigi.vanfretti@gmail.com\">luigi.vanfretti@gmail.com</a></p></td>
</tr>
</table>
</html>"));
end TwoAreas;
