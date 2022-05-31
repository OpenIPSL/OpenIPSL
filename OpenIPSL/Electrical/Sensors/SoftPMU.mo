within OpenIPSL.Electrical.Sensors;
model SoftPMU "Model of a PMU measuring phasors on a line"
  outer OpenIPSL.Electrical.SystemBase SysData;
  OpenIPSL.Interfaces.PwPin p
    "the positive direction of the current is from connector p ..." annotation (
     Placement(transformation(extent={{-80,-10},{-60,10}}), iconTransformation(
          extent={{-80,-10},{-60,10}})));
  OpenIPSL.Interfaces.PwPin n "... and to connector n" annotation (Placement(
        transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{
            60,-10},{80,10}})));
  parameter Types.PerUnit v_0 = 1 "Voltage magnitude initial value" annotation (Dialog(group="Initialization"));
  parameter Types.Angle angle_0 = 0 "Voltage angle initial value" annotation (Dialog(group="Initialization"));
  parameter Types.Time Ts = 0.01 "Derivative smoothing filter time constant" annotation (Dialog(group="PMU parameters"));
  parameter Types.Frequency fn = SysData.fn "System base frequency" annotation (Dialog(group="PMU parameters"));
public
  Types.PerUnit Vr=p.vr "real part of the voltage phasor";
  Types.PerUnit Vi=p.vi "imaginary part of the voltage phasor";
  Types.PerUnit Ir=p.ir "real part of the current phasor";
  Types.PerUnit Ii=p.ii "imaginary part of the current phasor";
  Types.Frequency freq "frequency estimate";
protected
  parameter Types.PerUnit vr_0=v_0*cos(angle_0);
  parameter Types.PerUnit vi_0=v_0*sin(angle_0);
public
  NonElectrical.Nonlinear.FrequencyCalc fCalc(
    real_start=vr_0,
    imag_start=vi_0,
    start_guess=true,
    Ts=Ts)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
equation
  connect(p, n);
  fCalc.real_part = p.vr;
  fCalc.imag_part = p.vi;
  freq = fCalc.y/(2*C.pi) + fn;
  annotation (Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-60,20},{60,-20}},
          lineColor={0,0,255},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),Text(
          extent={{-60,20},{60,-20}},
          lineColor={255,255,0},
          textString="%name"),Polygon(
          points={{-42,34},{28,34},{28,24},{48,36},{28,48},{28,38},{-42,38},{-42,
            34}},
          lineColor={28,108,200},
          fillPattern=FillPattern.Solid,
          fillColor={28,108,200}),Ellipse(extent={{-60,62},{62,-60}}, lineColor=
           {28,108,200}),Text(
          extent={{-36,-26},{44,-48}},
          lineColor={28,108,200},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid,
          textString="PMU")}), Documentation(info="<html>
<p>This device can be used to simulate a Phasorial Measurement Unit (PMU) designed for estimating the grid's frequency at a local node.
Frequency estimates are provided given the following: initial conditions for the node's voltage phasor; nominal frequency value; and time constant associated with the 
smoothing filter used in derivative calculations.</p>
<h5>Note</h5>
<p><em>The calculated frequency is just an estimate and can deviate by a certain margin of error.</em></p>
</html>"));
end SoftPMU;
