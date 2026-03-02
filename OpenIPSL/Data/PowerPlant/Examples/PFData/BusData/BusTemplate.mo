within OpenIPSL.Data.PowerPlant.Examples.PFData.BusData;
partial record BusTemplate "Record template for power flow solutions in buses"
  extends Modelica.Icons.Record;

  parameter OpenIPSL.Types.PerUnit v1 "Voltage magnitude at bus 'FAULT'"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.Angle A1 "Voltage angle at bus 'FAULT'" annotation (Dialog(enable=false));

  parameter OpenIPSL.Types.PerUnit v2 "Voltage magnitude at bus 'GEN1'"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.Angle A2 "Voltage angle at bus 'GEN1'" annotation (Dialog(enable=false));

  parameter OpenIPSL.Types.PerUnit v3 "Voltage magnitude at bus 'GEN2'"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.Angle A3 "Voltage angle at bus 'GEN2'" annotation (Dialog(enable=false));

  parameter OpenIPSL.Types.PerUnit v4 "Voltage magnitude at bus 'LOAD'"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.Angle A4 "Voltage angle at bus 'LOAD'" annotation (Dialog(enable=false));

  parameter OpenIPSL.Types.PerUnit v5 "Voltage magnitude at bus 'SHUNT'"
    annotation (Dialog(enable=false));
  parameter OpenIPSL.Types.Angle A5 "Voltage angle at bus 'SHUNT'" annotation (Dialog(enable=false));

end BusTemplate;
