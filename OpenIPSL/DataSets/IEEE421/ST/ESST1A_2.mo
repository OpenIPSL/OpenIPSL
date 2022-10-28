within OpenIPSL.DataSets.IEEE421.ST;
record ESST1A_2
  "IEEE421.5 ST1A Type Excitation System Model Data Set 2 (Bus-fed thyristor excitation system with transient gain reduction)"
  extends GU_Dynamics_Template;

  replaceable record Machine = Machine_Data.Machine_1 constrainedby
    Machine_Data.MachineData_Template   "Machine data";
  Machine machine;

  replaceable record ExcSystem = ES_Data.ST.ESST1A_2 constrainedby
    ES_Data.ST.ESSTxA_Template   "Excitation system data";
  ExcSystem excSystem;

  replaceable record PSS = PSS_Data.PSS1A_3 constrainedby
    PSS_Data.PSS1A_Template   "Power system stabilizer data";
  PSS pss;

end ESST1A_2;
