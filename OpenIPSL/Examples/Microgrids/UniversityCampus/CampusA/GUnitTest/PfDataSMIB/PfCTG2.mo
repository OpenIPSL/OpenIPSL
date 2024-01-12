within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GUnitTest.PfDataSMIB;
record PfCTG2 "Record for power flow solutions - CTG2"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PfBusCTG2    constrainedby BusData.BusTemplate
    "Bus power flow results";
  Bus bus;

  replaceable record Loads =
      LoadData.PfLoadCTG2     constrainedby LoadData.LoadTemplate
    "Loads power flow results";
  Loads loads;

  replaceable record Machines =
      MachineData.PfMachineCTG2     constrainedby MachineData.MachineTemplate
    "Machine power flow results";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PfTrafoCTG2     constrainedby TrafoData.TrafoTemplate
    "Trafos power flow results";
  Trafos trafos;

end PfCTG2;
