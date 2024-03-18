within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.PfData;
record Pf00001 "DATA ATILA GO MAN!"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PfBus00001 constrainedby BusData.BusTemplate
    "Bus power flow results";
  Bus bus;

  replaceable record Loads =
      LoadData.PfLoad00001 constrainedby LoadData.LoadTemplate
    "Loads power flow results";
  Loads loads;

  replaceable record Machines =
      MachineData.PfMachine00001 constrainedby MachineData.MachineTemplate
    "Machine power flow results";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PfTrafo00001 constrainedby TrafoData.TrafoTemplate
    "Trafos power flow results";
  Trafos trafos;

end Pf00001;
