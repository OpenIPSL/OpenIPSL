within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords;
record STG1 "Machine, ES and PSS Parameters for STG1"
  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineParsSTG1   constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ESST2ASTG1   constrainedby
    ESData.ESSTxATemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record PSS = PSSData.PSS2BND   constrainedby
    PSSData.PSS2BTemplate     "Power system stabilizer data";
  PSS pss;

end STG1;
