within OpenIPSL.Examples.Tutorial.Example_4.Utilities;
function saveTotalSMIBModel "Save the SMIB package as a total model"
  extends Modelica.Icons.Function;
  output Boolean ok "= true, if successful";
algorithm
  ok := saveTotalModel("SMIBTotal.mo", "SMIB", true);
end saveTotalSMIBModel;
