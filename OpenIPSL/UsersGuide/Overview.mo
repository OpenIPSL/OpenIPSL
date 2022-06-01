within OpenIPSL.UsersGuide;
model Overview "Overview"
  extends Modelica.Icons.Information;

  annotation(DocumentationClass=true, Documentation(info="<html>
<p>
The <strong><code>OpenIPSL</code></strong> has, basically, six packages:
Examples, Electrical, Nonelectrical, Interfaces, Icons and Types. They are briefly described below:
</p>

<ul>
<li><a href=\"modelica://OpenIPSL.Examples\">Examples</a> package for demonstration of power system examples that can be assembled using the library.</li>
<li> <a href=\"modelica://OpenIPSL.Electrical\">Electrical</a>: contains many different models that represent devices that form the grid or that are part of equipment which is connected to the grid. A more detailed overview is presented below.</li>
<li> <a href=\"modelica://OpenIPSL.NonElectrical\">NonElectrical</a>: contains elementary blocks that can be used to model a specific dynamic behavior (a lead-lag transfer function, for example). It also contains functions that are called inside models.</li>
<li> <a href=\"modelica://OpenIPSL.Interfaces\">Interfaces</a>: contains the connector interface and the generator mask. The connector is present in every model that is connected to the grid.</li>
<li> <a href=\"modelica://OpenIPSL.Icons\">Icons</a>: contains the basic icons that are used and extended throughout the library.</li>
<li> <a href=\"modelica://OpenIPSL.Types\">Types</a>: contains a description of the units that are used in the library and an expected order of magnitude. This information can be used to scale differential equations and enhance code generation performance.</li>
<li><a href=\"modelica://OpenIPSL.Tests\">Tests</a> package for small test systems which show basic behavior of some of the many components of this library.</li>
</ul>

<p>
The <a href=\"modelica://OpenIPSL.Electrical\">Electrical</a> package has many other subpackages that are
briefly described here.
It also contains one model, <a href=\"modelica://OpenIPSL.Electrical.SystemBase\">SystemBase</a>,
which is going to be explained later in <a href=\"modelica://OpenIPSL.UsersGuide.GettingStarted\">Getting Started</a>.
Within each subpackage, the user will find models grouped into software tools from which each model design was extracted.
</p>

<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
<tr><th valign=\"top\">Subpackage</th>
    <th valign=\"top\">Description</th>
</tr>
<tr><td valign=\"top\"> Controls </td>
   <td valign=\"top\"> Models that represent controllers used in machines. Exciters, stabilizers and governors for example. </td>
</tr>
<tr><td valign=\"top\"> Banks </td>
   <td valign=\"top\"> Models that represent shunt devices that compensate reactive power. </td>
</tr>
<tr><td valign=\"top\"> Branches </td>
   <td valign=\"top\"> Models that represent devices that connect two or more buses. Transformers and power lines are perfect examples. </td>
</tr>
<tr><td valign=\"top\"> Buses </td>
   <td valign=\"top\"> Models that represent <strong>nodes</strong> of a circuit. </td>
</tr>
<tr><td valign=\"top\"> Events </td>
   <td valign=\"top\"> Models that can be used for the representation of events in a power system. Examples are faults and breakers. </td>
</tr>
<tr><td valign=\"top\"> FACTS </td>
   <td valign=\"top\"> Models that represent devices used in the Flexible AC Transmission System paradigm. </td>
</tr>
<tr><td valign=\"top\"> Loads </td>
   <td valign=\"top\"> Models that represent various types of loads in a power system. </td>
</tr>
<tr><td valign=\"top\"> Machines </td>
   <td valign=\"top\"> Models that represent the rotating electrical machines connected to a power system such as generators and motors. </td>
</tr>
<tr><td valign=\"top\"> Sensors </td>
   <td valign=\"top\"> Models that can represent sensors used in a real power system. </td>
</tr>
<tr><td valign=\"top\"> Solar </td>
   <td valign=\"top\"> Models that represent photovoltaic solar cells and their interface to the grid. </td>
</tr>
<tr><td valign=\"top\"> ThreePhase </td>
   <td valign=\"top\"> Models that can represent three-phase grids. More information can be found in the package's documentation. </td>
</tr>
<tr><td valign=\"top\"> Wind </td>
   <td valign=\"top\"> Models that represent wind generators and their controls. </td>
</tr>
<tr><td valign=\"top\"> Essentials </td>
   <td valign=\"top\"> Contains the <code>pfComponent</code> model that is extended for purposes of initialization with power flow results. </td>
</tr>
</table>

</html>"));
end Overview;
