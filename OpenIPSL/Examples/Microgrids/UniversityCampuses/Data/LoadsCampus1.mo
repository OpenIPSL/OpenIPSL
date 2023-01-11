within OpenIPSL.Examples.Microgrids.UniversityCampuses.Data;
record LoadsCampus1 "Data record for load power consumption"
  extends Modelica.Icons.Record;

  // Load 1
  parameter Real P1=0.8180e6;
  parameter Real Q1=0.3880e6;

  // Load 2
  parameter Real P2=0.2660e6;
  parameter Real Q2=0.1010e6;

  // Load 3
  parameter Real P3=1.2900e6;
  parameter Real Q3=0.6020e6;

  // Load 4
  parameter Real P4=2.1700e6;
  parameter Real Q4=1.1200e6;

  // Load 5
  parameter Real P5=1.6770e6;
  parameter Real Q5=0.9670e6;

  // Load 6
  parameter Real P6=0.3050e6;
  parameter Real Q6=0.1670e6;

  // Load 7
  parameter Real P7=0.3400e6;
  parameter Real Q7=0.1000e6;

  // Load 8
  parameter Real P8=0.3810e6;
  parameter Real Q8=0.1440e6;

  // Load 9
  parameter Real P9=0.6100e6;
  parameter Real Q9=0.3380e6;

  // Load 10
  parameter Real P10=0.5090e6;
  parameter Real Q10=0.2850e6;



  annotation (Documentation(info="<html>
This data record has the active and reactive powers in VA and Var, respectively, that are consumed by the system's loads. The data is used to initialized the network in a certain operating point.
</html>"));
end LoadsCampus1;
