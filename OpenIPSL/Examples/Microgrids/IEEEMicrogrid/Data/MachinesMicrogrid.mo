within OpenIPSL.Examples.Microgrids.IEEEMicrogrid.Data;
record MachinesMicrogrid "Data record for power generation"
  extends Modelica.Icons.Record;

  // Machine Diesel Unit
  parameter Real PDT=0.05e6;
  parameter Real QDT=-0.04e6;

  // Machine Inf
  parameter Real PInf=-0.02999824e6;
  parameter Real QInf=-0.1550323e6;

  annotation (Documentation(info="<html>
This data record has the active and reactive powers in VA and Var, respectively, that are delivered by the generation units to the system. The data is used to initialized the network in a certain operating point.
</html>"));
end MachinesMicrogrid;
