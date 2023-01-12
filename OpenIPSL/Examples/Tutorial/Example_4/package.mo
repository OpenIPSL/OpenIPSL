within OpenIPSL.Examples.Tutorial;
package Example_4 "Advanced example with a SMIB model and power flow solution records"
extends Modelica.Icons.ExamplesPackage;

  annotation (preferredView="info", Documentation(info="<html>
  <h4>SMIB with OpenIPSL and Power Flow Records</h4>
  <h5>Introduction</h5>
  <p>In this example, you will learn to build an electric power system network by using the <a href=\"https://youtu.be/2i3fvgFtcYA\">OpenIPSL library</a>. The focus will be on a <strong>Single Machine Infinite Bus</strong> ( <strong>SMIB</strong>) model. The <strong>SMIB</strong> model is frequently used by power system engineers to conduct transient stability studies. The infinite bus can be thought of as a power source without variation in frequency and voltage (the phasor). It is common to choose a bus of the power system that has a much higher capacity with respect to the rating of the machine under study. Two specific examples of events that can be part of a simulation done with the <strong>SMIB</strong> model are a fault at some point in the transmission line or a sudden change in the load. The figure below shows a typical configuration of a <strong>SMIB</strong> model that includes, in addition to the infinite bus, the transmission line as two reactances in parallel and the step-up transformer on the generation unit side. Furthermore, both the generating unit and the load could be modeled in sufficient detail as required by a specific study. </p>
  <p align=\"center\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/SMIBSystem.png\" alt=\"SMIBSystem\" />
  </p>
  <p>To build the model you will use components and subsystems already implemented in the OpenIPSL library. Then you will check and simulate the model using the functions available in Dymola.</p>
  <p>The model requires the power flow solutions to reach the equilibrium at the start of the simulation. A software widely used by electricity utilities and transmission system operators to solve offline power flows is <em>PTI PSS/E</em>. The database and model exchange mechanism are based on proprietary files having a <em>* .raw</em> extension. </p>
  <p>You will learn how to create a records structure to link power flow solutions computed from an external tool with the model. Among other things this procedure includes the use of <em>Python</em> scripts. You will verify that the power flow solution initializes the model correctly (i.e., it corresponds to an equilibrium of the nonlinear dynamics of the system). </p>
  <p>The following figure graphically summarizes the workflow required to create and populate the record structure and populate the records with the power flow data:</p>
  <p align=\"center\">
    <img src=\"modelica://OpenIPSL/Resources/images/example_4/PfRecordCreationWorkflow.png\" alt=\"PfRecordCreationWorkflow\" />
  </p>
  <p>The modeling complexity of the generation unit will change gradually. In this way, the first version of our model will only take into account the machine and, towards the end, we will have a complete model with turbine and controls.</p>
</html>"));
end Example_4;
