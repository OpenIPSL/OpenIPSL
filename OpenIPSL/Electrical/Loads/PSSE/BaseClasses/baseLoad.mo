within OpenIPSL.Electrical.Loads.PSSE.BaseClasses;
partial model baseLoad "Base load for PSSE models"
  extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enabledisplayPF=false,
    final enablefn=false,
    final enableV_b=false,
    final enableS_b=true,
    final enableangle_0=true,
    final enablev_0=true,
    final enableQ_0=true,
    final enableP_0=true);
 import Modelica.ComplexMath.j;
  parameter Types.ComplexPower S_p=Complex(P_0,Q_0)
    "Consumption of original constant power load";
  parameter Types.ComplexPower S_i=Complex(0.0,0.0)
    "Consumption of original constant current load";
  parameter Types.ComplexPower S_y=Complex(0.0,0.0)
    "Consumption of original constant shunt admittance load";
  parameter Complex a=Complex(1.0,0.0)
    "Load transfer fraction for constant current load";
  parameter Complex b=Complex(0.0,1.0)
    "Load transfer fraction for constant shunt admittance load";
  parameter Types.PerUnit PQBRAK=0.7 "Constant power characteristic threshold";
  parameter Integer characteristic=1 annotation (choices(choice=1, choice=2));
  OpenIPSL.Interfaces.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0))
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  Types.Angle angle(start=angle_0) "Bus voltage angle";
  Types.PerUnit v(start=v_0) "Bus voltage magnitude";
  Types.PerUnit P "Active power consumption";
  Types.PerUnit Q "Reactive power consumption";
protected
  parameter Types.PerUnit p0=(S_i.re*v_0 + S_y.re*v_0^2 + S_p.re)/S_b "Initial active power";
  parameter Types.PerUnit q0=(S_i.im*v_0 + S_y.im*v_0^2 + S_p.im)/S_b "Initial reactive power";
  parameter Types.PerUnit vr0=v_0*cos(angle_0) "Initial real voltage";
  parameter Types.PerUnit vi0=v_0*sin(angle_0) "Initial imaginary voltage";
  parameter Types.PerUnit ir0=(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2) "Initial real current";
  parameter Types.PerUnit ii0=(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2) "Initial imaginary current";
  parameter Complex S_P=Complex((1 - a.re - b.re)*S_p.re, (1 - a.im - b.im)*S_p.im)
      /S_b "[pu]";
  parameter Complex S_I=(S_i + Complex(a.re*S_p.re/v_0, a.im*S_p.im/v_0))/S_b
    "[pu]";
  parameter Complex S_Y=(S_y + Complex(b.re*S_p.re/v_0^2, b.im*S_p.im/v_0^2))/
      S_b "[pu]";
  //Constant current load vary function when voltage is below 0.5
  parameter Real a2=1.502;
  parameter Real b2=1.769;
  //Constant Power load vary function when voltage is below 0.5
  parameter Real a0=0.4881;
  parameter Real a1=-0.4999;
  parameter Real b1=0.1389;
  parameter Real wp=3.964;
protected
  Real kP(start=1);
  Real kI(start=1);
equation
  P = p.vr*p.ir + p.vi*p.ii;
  Q = (-p.vr*p.ii) + p.vi*p.ir;
  angle = atan2(p.vi, p.vr);
  v = sqrt(p.vr^2 + p.vi^2);
  //Voltage dependency characteristic
  if characteristic == 1 then
    if v < PQBRAK/2 and v > 0 then
      kP = 2*(v/PQBRAK)^2;
      kI = 1;
    elseif v > PQBRAK/2 and v < PQBRAK then
      kP = 1 - 2*((v - PQBRAK)/PQBRAK)^2;
      kI = 1;
    else
      kP = 1;
      kI = 1;
    end if;
  else
    if v < PQBRAK then
      kP = a0 + a1*cos(v*wp) + b1*sin(v*wp);
    else
      kP = 1;
    end if;
    if v < 0.5 then
      kI = a2*b2*v^(b2 - 1)*exp(-a2*v^b2);
    else
      kI = 1;
    end if;
  end if;
  annotation (Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}}), graphics={Line(points={{-100,100},{100,100},{0,-100},
          {-100,100}}, color={28,108,200}),Text(
          extent={{-60,80},{60,40}},
          lineColor={28,108,200},
          textString="%P_0+j%Q_0"),Text(
          extent={{-150,-110},{150,-150}},
          lineColor={0,0,255},
          textString="%name")}));
end baseLoad;
