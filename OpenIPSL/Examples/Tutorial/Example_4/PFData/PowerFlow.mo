within OpenIPSL.Examples.Tutorial.Example_4.PFData;
record PowerFlow
  "Instantiable record containing the replaceable record with power flow results"
  extends Modelica.Icons.Record;

  replaceable record PowerFlow =
        OpenIPSL.Examples.Tutorial.Example_4.PFData.PowerFlowTemplate
    constrainedby OpenIPSL.Examples.Tutorial.Example_4.PFData.PowerFlowTemplate
    "Replaceable power flow record"
  annotation(choicesAllMatching=true);

PowerFlow powerflow;


end PowerFlow;
