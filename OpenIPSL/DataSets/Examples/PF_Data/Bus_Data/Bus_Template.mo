within OpenIPSL.DataSets.Examples.PF_Data.Bus_Data;
partial record Bus_Template

  parameter OpenIPSL.Types.PerUnit V1 "(pu) FAULT"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.Angle A1 "FAULT" annotation (Dialog(enable=false));

  parameter OpenIPSL.Types.PerUnit V2 "(pu) GEN1"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.Angle A2 "GEN1" annotation (Dialog(enable=false));

  parameter OpenIPSL.Types.PerUnit V3 "(pu) GEN2"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.Angle A3 "GEN2" annotation (Dialog(enable=false));

  parameter OpenIPSL.Types.PerUnit V4 "(pu) LOAD"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.Angle A4 "LOAD" annotation (Dialog(enable=false));

  parameter OpenIPSL.Types.PerUnit V5 "(pu) SHUNT"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.Angle A5 "SHUNT" annotation (Dialog(enable=false));

end Bus_Template;
