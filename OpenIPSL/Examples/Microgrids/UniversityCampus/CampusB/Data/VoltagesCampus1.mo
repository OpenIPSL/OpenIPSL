within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusB.Data;
record VoltagesCampus1 "Data record for voltage magnitude and angle"
  extends Modelica.Icons.Record;
  import Modelica.Constants.pi;

  // Bus B1L1
  parameter Real VB1L1=0.9960279;
  parameter Real AB1L1=0.425989*pi/180;

  // Bus B2L1
  parameter Real VB2L1=0.9960279;
  parameter Real AB2L1=0.425989*pi/180;

  // Bus B1L2
  parameter Real VB1L2=1.00093;
  parameter Real AB1L2=1.82279*pi/180;

  // Bus B2L2
  parameter Real VB2L2=0.9999925;
  parameter Real AB2L2=0.247211*pi/180;

  // Bus B3L2
  parameter Real VB3L2=0.9960279;
  parameter Real AB3L2=0.425989*pi/180;

  // Bus B1L3
  parameter Real VB1L3=1.0000;
  parameter Real AB1L3=0.0000*pi/180;

  // Bus B1L4
  parameter Real VB1L4=0.992577;
  parameter Real AB1L4=0.0444074*pi/180;

  // Bus B2L4
  parameter Real VB2L4=0.992577;
  parameter Real AB2L4=0.0444074*pi/180;

  // Bus B3L4
  parameter Real VB3L4=0.992577;
  parameter Real AB3L4=0.0444074*pi/180;

  // Bus B1L5
  parameter Real VB1L5=0.9912935;
  parameter Real AB1L5=0.070656*pi/180;

  // Bus B2L5
  parameter Real VB2L5=0.9920305;
  parameter Real AB2L5=0.0546208*pi/180;

  // Bus B3L5
  parameter Real VB3L5=0.9921045;
  parameter Real AB3L5=0.0482479*pi/180;

  // Bus B4L5
  parameter Real VB4L5=0.989964;
  parameter Real AB4L5=0.113864*pi/180;

  // Bus B5L5
  parameter Real VB5L5=0.9893169;
  parameter Real AB5L5=0.13374*pi/180;

  // Bus B6L5
  parameter Real VB6L5=0.9688569;
  parameter Real AB6L5=0.441645*pi/180;

  // Bus B1L6
  parameter Real VB1L6=0.9912949;
  parameter Real AB1L6=0.0520638*pi/180;

  // Bus B1L7
  parameter Real VB1L7=0.9895068;
  parameter Real AB1L7=0.090479*pi/180;

  // Bus B2L7
  parameter Real VB2L7=0.9912695;
  parameter Real AB2L7=0.069*pi/180;

  // Bus B1L8
  parameter Real VB1L8=0.9897282;
  parameter Real AB1L8=0.101351*pi/180;

  // Bus B2L8
  parameter Real VB2L8=0.9908705;
  parameter Real AB2L8=0.0642161*pi/180;

  // Bus B1L9
  parameter Real VB1L9=0.9892222;
  parameter Real AB1L9=0.114896*pi/180;

  // Bus B2L9
  parameter Real VB2L9=0.9896949;
  parameter Real AB2L9=0.0986142*pi/180;

  // Bus PV1B1
  parameter Real VPV1B1=0.9895245;
  parameter Real APV1B1=0.8042775*pi/180;

 // Bus PV1B2
  parameter Real VPV1B2=0.9894509;
  parameter Real APV1B2=0.7939371*pi/180;

 // Bus PV2B1
  parameter Real VPV2B1=0.9896978;
  parameter Real APV2B1=0.7665736*pi/180;

  // Bus PV2B2
  parameter Real VPV2B2=0.9896949;
  parameter Real APV2B2=0.7662135*pi/180;

  // Bus PV3B1
  parameter Real VPV3B1=0.9688582;
  parameter Real APV3B1=1.474061*pi/180;

  // Bus PV3B2
  parameter Real VPV3B2=0.9688582;
  parameter Real APV3B2=1.474061*pi/180;

  // Bus PV4B1
  parameter Real VPV4B1=0.9913135;
  parameter Real APV4B1=0.7200715*pi/180;

  // Bus PV4B2
  parameter Real VPV4B2=0.9913135;
  parameter Real APV4B2=0.7200715*pi/180;

  // Bus PV5B1
  parameter Real VPV5B1=0.9894778;
  parameter Real APV5B1=0.8212546*pi/180;

  // Bus PV5B2
  parameter Real VPV5B2=0.9894778;
  parameter Real APV5B2=0.8212546*pi/180;

  annotation (Documentation(info="<html>
This data record has the voltage magnitude, in per unit, and angle, in radians, that are used to initialized the network in a certain operating point.
</html>"));
end VoltagesCampus1;
