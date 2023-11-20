within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords;
record CTG1 "Machine, ES and PSS Parameters for CTG1"
  extends GUDynamicsTemplate;

  replaceable record Machine = MachineData.MachineParsCTG1   constrainedby
    MachineData.MachineDataTemplate     "Machine data";
  Machine machine;

  replaceable record ExcSystem = ESData.ESST4BCTG1   constrainedby
    ESData.ESSTxBTemplate     "Excitation system data";
  ExcSystem excSystem;

  replaceable record PSS = PSSData.PSS2BND   constrainedby
    PSSData.PSS2BTemplate     "Power system stabilizer data";
  PSS pss;

end CTG1;
