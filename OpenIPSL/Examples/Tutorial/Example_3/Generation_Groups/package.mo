within OpenIPSL.Examples.Tutorial.Example_3;
package Generation_Groups "Package with a set of generation units that is used in Example 3 system"
 extends Modelica.Icons.Package;

annotation (Documentation(info="<html>
<p>This package contains basically three generation units:</p>
<ul>
<li><strong>Gen1</strong>: generation unit connected to bus 1.</li>
<li><strong>Gen2</strong>: generation unit connected to bus 2.</li>
<li><strong>Gen3</strong>: generation unit connected to bus 3.</li>
</ul>
<p>Each generation unit allows the user to perform a step disturbance in the voltage reference value for each Automatic Voltage Regulator.</p>
</html>"));
end Generation_Groups;
