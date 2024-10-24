within OpenIPSL.Examples.Microgrids.IEEEMicrogrid.Data;
record MachinesMicrogrid "Data record for power generation"
  extends Modelica.Icons.Record;

  // Machine Diesel Unit
  parameter Real PDT=0.02e6;
  parameter Real QDT=-0.0313e6;

  // PV
  parameter Real PPV=0.035e6;
  parameter Real QPV=0.0115e6;

  // BESS
  parameter Real PBESS=0.0055e6;
  parameter Real QBESS=0;

  // Machine Inf
  parameter Real PInf=-0.0405e6;
  parameter Real QInf= 0.0121e6;



  annotation (Documentation(info="<html>
This data record has the active and reactive powers in VA and var, respectively, that are delivered by the generation units to the system. The data is used to initialized the network in a certain operating point.
</html>"));
end MachinesMicrogrid;
