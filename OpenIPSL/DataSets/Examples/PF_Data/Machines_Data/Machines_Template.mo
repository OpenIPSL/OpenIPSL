within OpenIPSL.DataSets.Examples.PF_Data.Machines_Data;
partial record Machines_Template

  parameter OpenIPSL.Types.ActivePower PG1 "generator1"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.ReactivePower QG1 "generator1"
    annotation (Dialog(enable=false));

  parameter OpenIPSL.Types.ActivePower PG2 "generator2"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.ReactivePower QG2 "generator2"
    annotation (Dialog(enable=false));

end Machines_Template;
