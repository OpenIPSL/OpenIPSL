within OpenIPSL.Examples.KundurSMIB;
package Generation_Groups "Package with models for the different generation units tested in this example"
 extends Modelica.Icons.ExamplesPackage;

annotation (Documentation(info="<html>
<p>This package contains three generation units that are used in the different SMIB systems.</p>
<ul>
<li><strong>Generator</strong>: generation unit connected to bus 1 composed only of a machine. Present in system SMIB.</li>
<li><strong>Generator_AVR</strong>: generation unit connected to bus 1 composed of a machine and an exciter. Present in system SMIB_AVR.</li>
<li><strong>Generator_AVR_PSS</strong>: generation unit connected to bus 1 composed of a machine, an exciter and a stabilizer. Present in system SMIB_AVR_PSS.</li>
</ul>
</html>"));
end Generation_Groups;
