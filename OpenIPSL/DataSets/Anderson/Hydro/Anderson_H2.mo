within OpenIPSL.DataSets.Anderson.Hydro;
record Anderson_H2 "Anderson Hydro Unit 2 (17.5 MVA)"

  extends DataSets.GU_Dynamics_Template;

  replaceable record Machine = Machine_Data.MachineData_H2 constrainedby
    Machine_Data.MachineData_Template   "Machine data";
  Machine machine;

  replaceable record ExcSystem = ES_Data.ExcSystemData_H2 constrainedby
    ES_Data.ExcSystemData_Template   "Excitation system data";
  ExcSystem excSystem;

  replaceable record TurbGovernor = TurbGov_Data.TurbGovernorData_H2 constrainedby
    TurbGov_Data.TurbGovernorData_Template   "Turbine-Governor data";
  TurbGovernor turbGovernor;

  replaceable record PSS = PSS_Data.PSSData_ND constrainedby
    PSS_Data.PSSData_Template   "Power system stabilizer data";
      PSS pss;

end Anderson_H2;
