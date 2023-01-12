within OpenIPSL.Examples.Tutorial.Example_4.PFData.MachineData;
partial record MachineTemplate
  "Record template for power flow solutions in machines"

parameter OpenIPSL.Types.ActivePower PG1 "Active power from machine 'genunit'" annotation(Dialog(enable = false));
parameter OpenIPSL.Types.ReactivePower QG1 "Reactive power from machine 'genunit'" annotation(Dialog(enable = false));

parameter OpenIPSL.Types.ActivePower PG2 "Active power from machine 'infinitebus'" annotation(Dialog(enable = false));
parameter OpenIPSL.Types.ReactivePower QG2 "Reactive power from machine 'genunit'" annotation(Dialog(enable = false));

end MachineTemplate;
