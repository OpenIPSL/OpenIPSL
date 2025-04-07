within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GUnitTest.PfDataSMIB;
record PfSTGx "Record for power flow solutions - Pload = 50 MW"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PfBusSTGx    constrainedby BusData.BusTemplate
    "Bus power flow results";
  Bus bus;

  replaceable record Loads =
      LoadData.PfLoadSTGx     constrainedby LoadData.LoadTemplate
    "Loads power flow results";
  Loads loads;

  replaceable record Machines =
      MachineData.PfMachineSTGx     constrainedby MachineData.MachineTemplate
    "Machine power flow results";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PfTrafoSTGx     constrainedby TrafoData.TrafoTemplate
    "Trafos power flow results";
  Trafos trafos;

end PfSTGx;
