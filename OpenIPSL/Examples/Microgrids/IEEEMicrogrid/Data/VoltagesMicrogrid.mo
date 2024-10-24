within OpenIPSL.Examples.Microgrids.IEEEMicrogrid.Data;
record VoltagesMicrogrid
  "Data record for voltage magnitude and angle"
  extends Modelica.Icons.Record;
  import Modelica.Constants.pi;

  // Bus HVBus
  parameter Real V1=1.00000;
  parameter Real A1=0*pi/180;

  // Bus LVBus
  parameter Real V2=1.00;
  parameter Real A2=0.001322568*pi/180;

  // Bus SubBus
  parameter Real V3=1.00;
  parameter Real A3=0.001845621*pi/180;

  // Bus CentralBus
  parameter Real V4=1.00;
  parameter Real A4=0.002433209*pi/180;

  // Bus LoadBus
  parameter Real V5=1.00;
  parameter Real A5=0.002433209*pi/180;

  // Bus CapBus
  parameter Real V6=1.00;
  parameter Real A6=0.003302665*pi/180;

  // Bus Motor
  parameter Real V7=1.00;
  parameter Real A7=0.002433209*pi/180;


  annotation (Documentation(info="<html>
This data record has the voltage magnitude, in per unit, and angle, in radians, that are used to initialized the network in a certain operating point.
</html>"));
end VoltagesMicrogrid;
