within OpenIPSL.Examples.Microgrids.UniversityCampuses.Data;
record MachinesCampus1 "Data record for power generation"
  extends Modelica.Icons.Record;

  // Machine GT1
  parameter Real PGT1=2e6;
  parameter Real QGT1=-8e6;

  // Machine GT2
  parameter Real PGT2=2e6;
  parameter Real QGT2=1.4050e6;

  // Machine ST
  parameter Real PST=2e6;
  parameter Real QST=-0.9430001e6;

  // Machine Inf
  parameter Real PInf=6.5e6;
  parameter Real QInf=11.756e6;




  annotation (Documentation(info="<html>
This data record has the active and reactive powers in VA and Var, respectively, that are delivered by the generation units to the system. The data is used to initialized the network in a certain operating point.
</html>"));
end MachinesCampus1;
