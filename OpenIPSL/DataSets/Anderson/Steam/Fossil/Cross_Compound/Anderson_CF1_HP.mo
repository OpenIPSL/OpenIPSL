within OpenIPSL.DataSets.Anderson.Steam.Fossil.Cross_Compound;
record Anderson_CF1_HP
  "Anderson Cross-Compound Fossil Steam Unit 1 HP (128 MVA)"

  extends DataSets.GU_Dynamics_Template;

  replaceable record Machine = Machine_Data.MachineData_CF1_HP constrainedby
    Machine_Data.MachineData_Template   "Machine data";
  Machine machine;

  replaceable record ExcSystem = ES_Data.ExcSystemData_CF1_HP constrainedby
    ES_Data.ExcSystemData_Template   "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor =
      TurbGov_Data.TurbGovernorData_CF1_HP                               constrainedby
    TurbGov_Data.TurbGovernorData_Template   "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSS_Data.PSSData_CF1_HP constrainedby
    PSS_Data.PSSData_Template   "Power system stabilizer data";
      PSS pss;

end Anderson_CF1_HP;
