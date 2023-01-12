within OpenIPSL.Examples.Microgrids.IEEEMicrogrid.Data;
record LoadsMicrogrid "Data record for load power consumption"
  extends Modelica.Icons.Record;

  // Load 1
  parameter Real P1=0.02e6;
  parameter Real Q1=0.005e6;


  annotation (Documentation(info="<html>
This data record has the active and reactive powers in VA and Var, respectively, that are consumed by the system's loads. The data is used to initialized the network in a certain operating point.
</html>"));
end LoadsMicrogrid;
