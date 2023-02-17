within OpenIPSL.DataSets.IEEE421.ES_Data.DC;
partial record DCxB_Template
  extends ES_Data.DC.DCxA_Template;

  parameter OpenIPSL.Types.PerUnit K_P "Voltage regulator proportional gain";
  parameter OpenIPSL.Types.PerUnit K_I "Voltage regulator integral gain";
  parameter OpenIPSL.Types.PerUnit K_D "Voltage regulator derivative gain";
  parameter OpenIPSL.Types.Time T_D "Voltage regulator derivative filter time constant";
end DCxB_Template;
