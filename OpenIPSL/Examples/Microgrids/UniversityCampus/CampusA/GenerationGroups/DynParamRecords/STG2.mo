within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords;
record STG2 "Machine, ES and PSS Parameters for STG2"
  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineParsSTG2   constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.AC7BSTG2   constrainedby
    ESData.ACxBTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record PSS = PSSData.PSS2BND   constrainedby
    PSSData.PSS2BTemplate     "Power system stabilizer data";
  PSS pss;

end STG2;
