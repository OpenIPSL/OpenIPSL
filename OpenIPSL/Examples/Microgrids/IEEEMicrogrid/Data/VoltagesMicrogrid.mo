within OpenIPSL.Examples.Microgrids.IEEEMicrogrid.Data;
record VoltagesMicrogrid
  "Data record for voltage magnitude and angle"
  extends Modelica.Icons.Record;
  import Modelica.Constants.pi;

  // Bus HVBus
  parameter Real V1=1.00000;
  parameter Real A1=0*pi/180;

  // Bus LVBus
  parameter Real V2=1.0000;
  parameter Real A2=0*pi/180;

  // Bus SubBus
  parameter Real V3=1.000034;
  parameter Real A3=-0.0006039513*pi/180;

  // Bus CentralBus
  parameter Real V4=1.000072;
  parameter Real A4=-0.001997927*pi/180;

  // Bus LoadBus
  parameter Real V5=1.000013;
  parameter Real A5=-0.002251726*pi/180;

  // Bus CapBus
  parameter Real V6=1.000072;
  parameter Real A6=-0.001997927*pi/180;

  annotation (Documentation(info="<html>
This data record has the voltage magnitude, in per unit, and angle, in radians, that are used to initialized the network in a certain operating point.
</html>"));
end VoltagesMicrogrid;
