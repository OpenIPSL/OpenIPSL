within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.PfData;
record Pf00000
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PfBus00000 constrainedby BusData.BusTemplate
    "Bus power flow results";
  Bus bus;

  replaceable record Loads =
      LoadData.PfLoad00000 constrainedby LoadData.LoadTemplate
    "Loads power flow results";
  Loads loads;

  replaceable record Machines =
      MachineData.PfMachine00000 constrainedby MachineData.MachineTemplate
    "Machine power flow results";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PfTrafo00000 constrainedby TrafoData.TrafoTemplate
    "Trafos power flow results";
  Trafos trafos;

end Pf00000;
