within OpenIPSL.DataSets;
model HowTo
  extends Modelica.Icons.Information;
  annotation (Documentation(info="<html>
<h4>Data Sets Usage Guide</h4>
<p>The following short guide is intended to provide a brief description on the use of the <b>parameter data sets for generation units</b> contained in this package.</p>
<p><b>Example 1</b> of the <b>OpenIPSL Library Tutorial</b> explains the process required to create a simple network model along with a <b>generation group</b> sub-model. Although it is not necessary to create a model only for the generation group, it is highly recommended as it promotes modularity and flexibility. It should be noted that the network model can grow in size and complexity, as the IEEE14 and N44 examples demonstrate. For these last two cases, there is a generator group model for each generator connected to the network.</p>
<p>To be able to make use of the parameterized records in this package, simply <b><span style=\"color: #00007f;\">drag and drop an instance of the GU_Dynamics record</span></b> onto the interest generation group model.</p>
<p>Then, propagate the record to the upper level and double click on the generator component. Go to the dropdown list of the propagated <b>GUnitDynamics</b> and <b><span style=\"color: #00007f;\">choose the set of parameters that best suits your needs</span></b>. The available parameters can be inspected later by first clicking on the button to the right of the drop-down list, and then on the button of the corresponding generator set component (i.e. machine, excitation system, etc.).</p>
<p>The last step is to double-click on each of the model components and <b><span style=\"color: #00007f;\">insert references to match the parameters with their corresponding values from the GU_Dynamics record</span></b>. For example, after double-clicking on the machine component, its inertia parameter H can be assigned by reference using the expression <i>gU_Dynamics.guDynamics.machine.H</i>. The reference can be typed, copied and pasted or can be explored using the Insert Component Reference functionality.</p>
<p>A couple of<b> examples</b> have been created to illustrate the entire procedure.</p>
</html>"));
end HowTo;
