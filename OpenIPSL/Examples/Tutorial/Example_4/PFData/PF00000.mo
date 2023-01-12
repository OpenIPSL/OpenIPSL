within OpenIPSL.Examples.Tutorial.Example_4.PFData;
record PF00000 "Record for power flow solutions - Id 00000"
extends OpenIPSL.Examples.Tutorial.Example_4.PFData.PowerFlowTemplate;

replaceable record Bus =
      OpenIPSL.Examples.Tutorial.Example_4.PFData.BusData.PFBus00000
    constrainedby
    OpenIPSL.Examples.Tutorial.Example_4.PFData.BusData.BusTemplate
                                                            "Power flow results for buses";
  Bus bus;

replaceable record Load =
      OpenIPSL.Examples.Tutorial.Example_4.PFData.LoadData.PFLoad00000
    constrainedby
    OpenIPSL.Examples.Tutorial.Example_4.PFData.LoadData.LoadTemplate
    "Power flow results for loads";
  Load load;

replaceable record Machine =
      OpenIPSL.Examples.Tutorial.Example_4.PFData.MachineData.PFMachine00000
    constrainedby
    OpenIPSL.Examples.Tutorial.Example_4.PFData.MachineData.MachineTemplate
    "Power flow results for machines";
  Machine machine;

replaceable record Trafo =
      OpenIPSL.Examples.Tutorial.Example_4.PFData.TrafoData.PFTrafo00000
    constrainedby
    OpenIPSL.Examples.Tutorial.Example_4.PFData.TrafoData.TrafoTemplate
    "Power flow results for transformers";
  Trafo trafo;

end PF00000;
