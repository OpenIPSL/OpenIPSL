within OpenIPSL.DataSets.IEEE421.ST;
record ESST4B_1
  "IEEE421.5 ST4B Type Excitation System Model Data Set 1 (Potential Source)"
  extends GU_Dynamics_Template;

  replaceable record Machine = Machine_Data.Machine_1 constrainedby
    Machine_Data.MachineData_Template   "Machine data";
  Machine machine;

  replaceable record ExcSystem = ES_Data.ST.ESST4B_1 constrainedby
    ES_Data.ST.ESSTxB_Template   "Excitation system data";
  ExcSystem excSystem;

  replaceable record PSS = PSS_Data.PSS2B_3 constrainedby
    PSS_Data.PSS2B_Template   "Power system stabilizer data";
  PSS pss;

end ESST4B_1;
