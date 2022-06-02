within OpenIPSL.Examples.Tutorial.Example_1;
function modal_analysis "Function for executing the eigenanalysis of the test system assembled in Example 1"
  extends Modelica.Icons.Function;
  import Modelica_LinearSystems2.StateSpace;
  import Modelica_LinearSystems2.TransferFunction;
  input String pathToPlantModel="OpenIPSL.Examples.Tutorial.Example_1.Example_1" "Model to be linearized";
  output Modelica_LinearSystems2.StateSpace ss "Object with ABCD matrices of linearized model";
algorithm
  // LINEARIZE the model
  ss := Modelica_LinearSystems2.ModelAnalysis.Linearize(pathToPlantModel);
  // Modelica.Utilities.Streams.print(String(ss));
  // Check eigenvalues of the open-loop
  Modelica.Math.Matrices.eigenValues(ss.A);
  annotation (Documentation(info="<html>
<p>This function linearizes the equations of the example system and extracts the eigenvalues from the state matrix A.</p>
<p>The main goal of this function is to identify the unstable eigenvalues, or modes, which are going to be the focus of the next text system, in Example 2.</p>
</html>"));
end modal_analysis;
