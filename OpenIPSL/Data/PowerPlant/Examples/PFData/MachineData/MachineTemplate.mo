within OpenIPSL.Data.PowerPlant.Examples.PFData.MachineData;
partial record MachineTemplate
  "Record template for power flow solutions in machines"
  extends Modelica.Icons.Record;
  parameter OpenIPSL.Types.ActivePower PG1 "machine: generator1"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.ReactivePower QG1 "machine: generator1"
    annotation (Dialog(enable=false));

  parameter OpenIPSL.Types.ActivePower PG2 "machine: generator2"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.ReactivePower QG2 "machine: generator2"
    annotation (Dialog(enable=false));

end MachineTemplate;
