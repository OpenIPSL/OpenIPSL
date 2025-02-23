within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusB.PfData.MachineData;
partial record MachineTemplate

  parameter OpenIPSL.Types.ActivePower PG1 "Gen01"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.ReactivePower QG1 "Gen01"
    annotation (Dialog(enable=false));

  parameter OpenIPSL.Types.ActivePower PG2 "Gen02"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.ReactivePower QG2 "Gen02"
    annotation (Dialog(enable=false));

  parameter OpenIPSL.Types.ActivePower PG3 "Gen03"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.ReactivePower QG3 "Gen03"
    annotation (Dialog(enable=false));

  parameter OpenIPSL.Types.ActivePower PG4 "Gen04"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.ReactivePower QG4 "Gen04"
    annotation (Dialog(enable=false));

  parameter OpenIPSL.Types.ActivePower PVP1 "Gen05"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.ReactivePower PVQ1 "Gen05"
    annotation (Dialog(enable=false));

  parameter OpenIPSL.Types.ActivePower PVP2 "Gen05"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.ReactivePower PVQ2 "Gen05"
    annotation (Dialog(enable=false));

  parameter OpenIPSL.Types.ActivePower PVP3 "Gen05"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.ReactivePower PVQ3 "Gen05"
    annotation (Dialog(enable=false));

  parameter OpenIPSL.Types.ActivePower PVP4 "Gen05"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.ReactivePower PVQ4 "Gen05"
    annotation (Dialog(enable=false));

  parameter OpenIPSL.Types.ActivePower PVP5 "Gen05"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.ReactivePower PVQ5 "Gen05"
    annotation (Dialog(enable=false));

end MachineTemplate;
