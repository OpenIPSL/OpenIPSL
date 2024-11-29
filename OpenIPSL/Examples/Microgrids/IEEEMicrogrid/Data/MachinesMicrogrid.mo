within OpenIPSL.Examples.Microgrids.IEEEMicrogrid.Data;
record MachinesMicrogrid "Data record for power generation"
  extends Modelica.Icons.Record;

  // Machine Diesel Unit
  parameter Modelica.Units.SI.ActivePower PDT=0.02e6;
  parameter Modelica.Units.SI.ReactivePower QDT=-0.0313e6;

  // PV
  parameter Modelica.Units.SI.ActivePower PPV=0.035e6;
  parameter Modelica.Units.SI.ReactivePower QPV=0.0115e6;

  // BESS
  parameter Modelica.Units.SI.ActivePower PBESS=0.0055e6;
  parameter Modelica.Units.SI.ReactivePower QBESS=0;

  // Machine Inf
  parameter Modelica.Units.SI.ActivePower PInf=-0.0405e6;
  parameter Modelica.Units.SI.ReactivePower QInf= 0.0121e6;



  annotation (Documentation(info="<html>
This data record has the active and reactive powers in W and var, respectively, that are delivered by the generation units to the system. The data is used to initialized the network in a certain operating point.
</html>"));
end MachinesMicrogrid;
