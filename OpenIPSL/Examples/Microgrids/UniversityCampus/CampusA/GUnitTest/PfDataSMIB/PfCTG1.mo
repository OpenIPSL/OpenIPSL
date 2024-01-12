within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GUnitTest.PfDataSMIB;
record PfCTG1 "Record for power flow solutions - CTG1"
  extends PowerFlowTemplate;

  replaceable record Bus =
      BusData.PfBusCTG1    constrainedby BusData.BusTemplate
    "Bus power flow results";
  Bus bus;

  replaceable record Loads =
      LoadData.PfLoadCTG1     constrainedby LoadData.LoadTemplate
    "Loads power flow results";
  Loads loads;

  replaceable record Machines =
      MachineData.PfMachineCTG1     constrainedby MachineData.MachineTemplate
    "Machine power flow results";
  Machines machines;

  replaceable record Trafos =
      TrafoData.PfTrafoCTG1     constrainedby TrafoData.TrafoTemplate
    "Trafos power flow results";
  Trafos trafos;

end PfCTG1;
