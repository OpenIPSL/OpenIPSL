within OpenIPSL.DataSets.Anderson.Steam.Nuclear;
record Anderson_N3 "Anderson Nuclear Steam Unit 3 (500 MVA)"

  extends DataSets.GU_Dynamics_Template;

  replaceable record Machine = Machine_Data.MachineData_N3 constrainedby
    Machine_Data.MachineData_Template   "Machine data";
  Machine machine;

  replaceable record ExcSystem = ES_Data.ExcSystemData_N3 constrainedby
    ES_Data.ExcSystemData_Template   "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGov_Data.TurbGovernorData_N3 constrainedby
    TurbGov_Data.TurbGovernorData_Template   "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSS_Data.PSSData_ND constrainedby
    PSS_Data.PSSData_Template   "Power system stabilizer data";
      PSS pss;

end Anderson_N3;
