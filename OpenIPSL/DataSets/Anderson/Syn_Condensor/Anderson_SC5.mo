within OpenIPSL.DataSets.Anderson.Syn_Condensor;
record Anderson_SC5 "Anderson Synch Condensor Unit 5 (75 MVA)"

  extends DataSets.GU_Dynamics_Template;

  replaceable record Machine = Machine_Data.MachineData_SC5 constrainedby
    Machine_Data.MachineData_Template   "Machine data";
  Machine machine;

  replaceable record ExcSystem = ES_Data.ExcSystemData_SC5 constrainedby
    ES_Data.ExcSystemData_Template   "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGov_Data.TurbGovernorData_ND constrainedby
    TurbGov_Data.TurbGovernorData_Template   "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSS_Data.PSSData_ND constrainedby
    PSS_Data.PSSData_Template   "Power system stabilizer data";
      PSS pss;

end Anderson_SC5;
