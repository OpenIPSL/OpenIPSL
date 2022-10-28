within OpenIPSL.DataSets.Anderson.Steam.Fossil.Cross_Compound;
record Anderson_CF2_LP
  "Anderson Cross-Compound Fossil Steam Unit 2 LP (192 MVA)"

  extends DataSets.GU_Dynamics_Template;

  replaceable record Machine = Machine_Data.MachineData_CF2_LP constrainedby
    Machine_Data.MachineData_Template   "Machine data";
  Machine machine;

  replaceable record ExcSystem = ES_Data.ExcSystemData_CF2_LP constrainedby
    ES_Data.ExcSystemData_Template   "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor =
      TurbGov_Data.TurbGovernorData_CF2_LP                               constrainedby
    TurbGov_Data.TurbGovernorData_Template   "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSS_Data.PSSData_CF2_LP constrainedby
    PSS_Data.PSSData_Template   "Power system stabilizer data";
      PSS pss;

end Anderson_CF2_LP;
