within OpenIPSL.Electrical.Sensors;
model SoftPMU "model of a PMU measuring phasors on a line"
  outer OpenIPSL.Electrical.SystemBase SysData;
  import Modelica.ComplexMath.conj;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  import Modelica.ComplexMath.j;
  import Modelica.Constants.pi;
  OpenIPSL.Interfaces.PwPin p
    "the positive direction of the current is from connector p ..." annotation (
     Placement(transformation(extent={{-80,-10},{-60,10}}), iconTransformation(
          extent={{-80,-10},{-60,10}})));
  OpenIPSL.Interfaces.PwPin n "... and to connector n" annotation (Placement(
        transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{
            60,-10},{80,10}})));
  parameter Real V_0 "initial guess"
    annotation (Dialog(group="Line parameters"));
  parameter Real angle_0 "Reactance (pu)"
    annotation (Dialog(group="Line parameters"));
public
  Real Vr=p.vr "real part of the voltage phasor in pu";
  Real Vi=p.vi "imaginary part of the voltage phasor in pu";
  Real Ir=p.ir "real part of the current phasor in pu";
  Real Ii=p.ii "imaginary part of the current phasor in pu";
  Real freq "frequency in Hertz";
protected
  parameter Real vr_0=V_0*cos(angle_0*pi/180);
  parameter Real vi_0=V_0*sin(angle_0*pi/180);
public
  NonElectrical.Nonlinear.FrenquencyCalc fCalc(
    real_start=vr_0,
    imag_start=vi_0,
    start_guess=true)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
equation
  connect(p, n);
  fCalc.real_part = p.vr;
  fCalc.imag_part = p.vi;
  freq = (fCalc.y*180/pi) + SysData.fn;
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
          textString="PMU")}));
end SoftPMU;
