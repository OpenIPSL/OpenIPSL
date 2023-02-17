within OpenIPSL.DataSets.IEEE421.AC;
record AC1A_1 "IEEE421.5 AC1A Type Excitation System Model Data Set"
  extends GU_Dynamics_Template;

  replaceable record Machine = Machine_Data.Machine_1 constrainedby
    Machine_Data.MachineData_Template   "Machine data";
  Machine machine;

  replaceable record ExcSystem = ES_Data.AC.AC1A_1 constrainedby
    ES_Data.AC.ACxA_Template   "Excitation system data";
  ExcSystem excSystem;

  replaceable record PSS = PSS_Data.PSS1A_ND constrainedby
    PSS_Data.PSS1A_Template   "Power system stabilizer data";
  PSS pss;

end AC1A_1;
