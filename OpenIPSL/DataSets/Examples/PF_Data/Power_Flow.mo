within OpenIPSL.DataSets.Examples.PF_Data;
record Power_Flow
  extends Modelica.Icons.Record;

  replaceable record PowerFlow =
      DataSets.Examples.PF_Data.Power_Flow_Template constrainedby
    DataSets.Examples.PF_Data.Power_Flow_Template annotation (
      choicesAllMatching);

  PowerFlow powerflow;

end Power_Flow;
