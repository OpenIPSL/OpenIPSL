within OpenIPSL.DataSets.IEEE421.AC;
record AC7B_1
  "IEEE421.5 AC7B Type Excitation System Model Data Set 1 (Alternator-Rectifier)"
  extends GU_Dynamics_Template;

  replaceable record Machine = Machine_Data.Machine_1 constrainedby
    Machine_Data.MachineData_Template   "Machine data";
  Machine machine;

  replaceable record ExcSystem = ES_Data.AC.AC7B_1 constrainedby
    ES_Data.AC.ACxB_Template   "Excitation system data";
  ExcSystem excSystem;

  replaceable record PSS = PSS_Data.PSS2B_ND constrainedby
    PSS_Data.PSS2B_Template   "Power system stabilizer data";
  PSS pss;

end AC7B_1;
