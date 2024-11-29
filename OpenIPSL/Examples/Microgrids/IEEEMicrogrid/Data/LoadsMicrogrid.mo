within OpenIPSL.Examples.Microgrids.IEEEMicrogrid.Data;
record LoadsMicrogrid "Data record for load power consumption"
  extends Modelica.Icons.Record;

  // Load 1
  parameter Modelica.Units.SI.ActivePower P1=0.02e6;
  parameter Modelica.Units.SI.ReactivePower Q1=0.0123e6;


  annotation (Documentation(info="<html>
This data record has the active and reactive powers in W and var, respectively, that are consumed by the system's loads. The data is used to initialized the network in a certain operating point.
</html>"));
end LoadsMicrogrid;
