within OpenIPSL.Examples.Microgrids.UniversityCampuses.Data;
record VoltagesCampus1 "Data record for voltage magnitude and angle"
  extends Modelica.Icons.Record;
  import Modelica.Constants.pi;

  // Bus B1L1
  parameter Real VB1L1=0.9959947;
  parameter Real AB1L1=0.9230999*pi/180;

  // Bus B2L1
  parameter Real VB2L1=0.9959947;
  parameter Real AB2L1=0.9230999*pi/180;

  // Bus B1L2
  parameter Real VB1L2=1.000898;
  parameter Real AB1L2=2.314087*pi/180;

  // Bus B2L2
  parameter Real VB2L2=1.000006;
  parameter Real AB2L2=0.7625568*pi/180;

  // Bus B3L2
  parameter Real VB3L2=0.9959947;
  parameter Real AB3L2=0.9230819*pi/180;

  // Bus B1L3
  parameter Real VB1L3=1.0000;
  parameter Real AB1L3=0.0000*pi/180;

  // Bus B1L4
  parameter Real VB1L4=0.9923965;
  parameter Real AB1L4=0.5341873*pi/180;

  // Bus B2L4
  parameter Real VB2L4=0.9923965;
  parameter Real AB2L4=0.5341873*pi/180;

  // Bus B3L4
  parameter Real VB3L4=0.9923965;
  parameter Real AB3L4=0.5341873*pi/180;

  // Bus B1L5
  parameter Real VB1L5=0.991003;
  parameter Real AB1L5=0.5624429*pi/180;

  // Bus B2L5
  parameter Real VB2L5=0.9918499;
  parameter Real AB2L5=0.5443972*pi/180;

  // Bus B3L5
  parameter Real VB3L5=0.9918624;
  parameter Real AB3L5=0.5390718*pi/180;

  // Bus B4L5
  parameter Real VB4L5=0.989783;
  parameter Real AB4L5=0.6036651*pi/180;

  // Bus B5L5
  parameter Real VB5L5=0.9878877;
  parameter Real AB5L5=0.6524169*pi/180;

  // Bus B6L5
  parameter Real VB6L5=0.9686251;
  parameter Real AB6L5=1.296846*pi/180;

  // Bus B1L6
  parameter Real VB1L6=0.9909459;
  parameter Real AB1L6=0.5442992*pi/180;

  // Bus B1L7
  parameter Real VB1L7=0.9887493;
  parameter Real AB1L7=0.5866807*pi/180;

  // Bus B2L7
  parameter Real VB2L7=0.990864;
  parameter Real AB2L7=0.5501698*pi/180;

  // Bus B1L8
  parameter Real VB1L8=0.9888723;
  parameter Real AB1L8=0.6023836*pi/180;

  // Bus B2L8
  parameter Real VB2L8=0.9904647;
  parameter Real AB2L8=0.5563523*pi/180;

  // Bus B1L9
  parameter Real VB1L9=0.9879395;
  parameter Real AB1L9=0.6243038*pi/180;

  // Bus B2L9
  parameter Real VB2L9=0.9888384;
  parameter Real AB2L9=0.5995681*pi/180;






  annotation (Documentation(info="<html>
This data record has the voltage magnitude, in per unit, and angle, in radians, that are used to initialized the network in a certain operating point.
</html>"));
end VoltagesCampus1;
