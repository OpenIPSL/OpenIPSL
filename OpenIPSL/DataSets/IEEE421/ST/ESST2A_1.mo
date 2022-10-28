within OpenIPSL.DataSets.IEEE421.ST;
record ESST2A_1
  "IEEE421.5 ST2A Type Excitation System Model Data Set"
  extends GU_Dynamics_Template;

  replaceable record Machine = Machine_Data.Machine_1 constrainedby
    Machine_Data.MachineData_Template   "Machine data";
  Machine machine;

  replaceable record ExcSystem = ES_Data.ST.ESST2A_1 constrainedby
    ES_Data.ST.ESSTxA_Template   "Excitation system data";
  ExcSystem excSystem;

  replaceable record PSS = PSS_Data.PSS1A_ND constrainedby
    PSS_Data.PSS1A_Template   "Power system stabilizer data";
  PSS pss;

end ESST2A_1;
