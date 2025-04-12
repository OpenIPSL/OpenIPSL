within OpenIPSL.Examples.Microgrids.IEEEMicrogrid.Data;
record VoltagesMicrogrid
  "Data record for voltage magnitude and angle"
  extends Modelica.Icons.Record;

  // Bus HVBus
  parameter Modelica.Units.SI.PerUnit V1=1.00000;
  parameter Modelica.Units.SI.Angle A1=0*C.pi/180;

  // Bus LVBus
  parameter Modelica.Units.SI.PerUnit V2=1.00;
  parameter Modelica.Units.SI.Angle A2=0.001322568*C.pi/180;

  // Bus SubBus
  parameter Modelica.Units.SI.PerUnit V3=1.00;
  parameter Modelica.Units.SI.Angle A3=0.001845621*C.pi/180;

  // Bus CentralBus
  parameter Modelica.Units.SI.PerUnit V4=1.00;
  parameter Modelica.Units.SI.Angle A4=0.002433209*C.pi/180;

  // Bus LoadBus
  parameter Modelica.Units.SI.PerUnit V5=1.00;
  parameter Modelica.Units.SI.Angle A5=0.002433209*C.pi/180;

  // Bus CapBus
  parameter Modelica.Units.SI.PerUnit V6=1.00;
  parameter Modelica.Units.SI.Angle A6=0.003302665*C.pi/180;

  // Bus Motor
  parameter Modelica.Units.SI.PerUnit V7=1.00;
  parameter Modelica.Units.SI.Angle A7=0.002433209*C.pi/180;


  annotation (Documentation(info="<html>
This data record has the voltage magnitude, in per unit, and angle, in radians, that are used to initialized the network in a certain operating point.
</html>"));
end VoltagesMicrogrid;
