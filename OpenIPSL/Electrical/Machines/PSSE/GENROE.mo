within OpenIPSL.Electrical.Machines.PSSE;
model GENROE "ROUND ROTOR GENERATOR MODEL (EXPONENTIAL SATURATION)"
  extends Icons.VerifiedModel;
  //Import of dependencies
  import Complex;
  import Modelica.ComplexMath.arg;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  import Modelica.ComplexMath.abs;
  import Modelica.ComplexMath.conj;
  import Modelica.ComplexMath.fromPolar;
  import OpenIPSL.NonElectrical.Functions.SE_exp;
  import Modelica.ComplexMath.j;
  extends BaseClasses.baseMachine(
    EFD(start=efd0),
    XADIFD(start=efd0),
    PMECH(start=pm0),
    delta(start=delta0, fixed=true),
    id(start=id0),
    iq(start=iq0),
    ud(start=ud0),
    uq(start=uq0),
    Te(start=pm0));
  //Machine parameters
  parameter Types.PerUnit Xpq "Sub-transient reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.Time Tpq0 "q-axis transient open-circuit time constant"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Xpp=Xppd "Sub-transient reactance"
    annotation (Dialog(group="Machine parameters"));
  Types.PerUnit Epd(start=Epd0) "d-axis voltage behind transient reactance";
  Types.PerUnit Epq(start=Epq0) "q-axis voltage behind transient reactance";
  Types.PerUnit PSIkd(start=PSIkd0) "d-axis rotor flux linkage";
  Types.PerUnit PSIkq(start=PSIkq0) "q-axis rotor flux linkage";
  //State variables
  Types.PerUnit PSId(start=PSId0) "d-axis flux linkage";
  Types.PerUnit PSIq(start=PSIq0) "q-axis flux linkage";
  Types.PerUnit PSIppd(start=PSIppd0) "d-axis subtransient flux linkage";
  Types.PerUnit PSIppq(start=PSIppq0) "q-axis subtransient flux linkage";
  Types.PerUnit PSIpp "Air-gap flux";
  Types.PerUnit XadIfd(start=efd0) "d-axis machine field current";
  Types.PerUnit XaqIlq(start=0) "q-axis Machine field current";
protected
  parameter Complex Zs=Complex(R_a,Xpp) "Equivalent impedance";
  parameter Complex VT=Complex(v_0*cos(angle_0),v_0*sin(angle_0))
    "Complex terminal voltage";
  parameter Complex S=Complex(p0,q0) "Complex power on machine base";
  parameter Complex It=Complex(real(S/VT),-imag(S/VT))
    "Complex current, machine base";
  parameter Complex Is=Complex(real(It + VT/Zs),imag(It + VT/Zs))
    "Equivalent internal current source";
  parameter Complex PSIpp0=Complex(real(Zs*Is),imag(Zs*Is))
    "Sub-transient flux linkage in stator reference frame";
  parameter Real ang_PSIpp0=arg(PSIpp0) "flux angle";
  parameter Real ang_It=arg(It) "current angle";
  parameter Real ang_PSIpp0andIt=ang_PSIpp0 - ang_It "angle difference";
  parameter Types.PerUnit abs_PSIpp0=abs(PSIpp0)
    "magnitude of sub-transient flux linkage";
  parameter Real dsat=SE_exp(
      abs_PSIpp0,
      S10,
      S12,
      1,
      1.2) "To include saturation of during initialization";
  parameter Real a=abs_PSIpp0 + abs_PSIpp0*dsat*(Xq - Xl)/(Xd - Xl);
  parameter Real b=(It.re^2 + It.im^2)^0.5*(Xpp - Xq);
  //Initializion rotor angle position
  parameter Real delta0=atan(b*cos(ang_PSIpp0andIt)/(b*sin(ang_PSIpp0andIt) - a))
       + ang_PSIpp0 "initial rotor angle in radians";
  parameter Complex DQ_dq=Complex(cos(delta0),-sin(delta0))
    "Parks transformation, from stator to rotor reference frame";
  parameter Complex PSIpp0_dq=Complex(real(PSIpp0*DQ_dq),imag(PSIpp0*DQ_dq))
    "Flux linkage in rotor reference frame";
  parameter Complex I_dq=Complex(real(It*DQ_dq),-imag(It*DQ_dq));
  //"The terminal current in rotor reference frame"
  parameter Types.PerUnit PSIppq0=imag(PSIpp0_dq)
    "q-axis component of the sub-transient flux linkage";
  parameter Types.PerUnit PSIppd0=real(PSIpp0_dq)
    "d-axis component of the sub-transient flux linkage";
  //Initialization of current and voltage components in rotor reference frame (dq-axes).
  parameter Types.PerUnit iq0=real(I_dq) "q-axis component of initial current";
  parameter Types.PerUnit id0=imag(I_dq) "d-axis component of initial current";
  parameter Types.PerUnit ud0=(-(PSIppq0 - Xppq*iq0)) - R_a*id0
    "d-axis component of initial voltage";
  parameter Types.PerUnit uq0=PSIppd0 - Xppd*id0 - R_a*iq0
    "q-axis component of initial voltage";
  //Initialization current and voltage components in synchronous reference frame.
  parameter Types.PerUnit vr0=v_0*cos(angle_0)
    "Real component of initial terminal voltage";
  parameter Types.PerUnit vi0=v_0*sin(angle_0)
    "Imaginary component of initial terminal voltage";
  parameter Types.PerUnit ir0=-CoB*(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2)
    "Real component of initial armature current, systembase";
  parameter Types.PerUnit ii0=-CoB*(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2)
    "Imaginary component of initial armature current, systembase";
  //Initialization mechanical power and field voltage.
  parameter Types.PerUnit pm0=p0 + R_a*iq0*iq0 + R_a*id0*id0
    "Initial mechanical power, machine base";
  parameter Types.PerUnit efd0=dsat*PSIppd0 + PSIppd0 + (Xpd - Xpp)*id0 + (Xd - Xpd)*id0
    "Initial field voltage magnitude";
  parameter Types.PerUnit Epq0=PSIkd0 + (Xpd - Xl)*id0;
  parameter Types.PerUnit Epd0=PSIkq0 - (Xpq - Xl)*iq0;
  //Initialize remaining states:
  parameter Types.PerUnit PSIkd0=(PSIppd0 - (Xpd - Xl)*K3d*id0)/(K3d + K4d)
    "d-axis initial rotor flux linkage";
  parameter Types.PerUnit PSIkq0=((-PSIppq0) + (Xpq - Xl)*K3q*iq0)/(K3q + K4q)
    "q-axis initial rotor flux linkage";
  parameter Types.PerUnit PSId0=PSIppd0 - Xppd*id0;
  parameter Types.PerUnit PSIq0=PSIppq0 - Xppq*iq0;
  // Constants
  parameter Real K1d=(Xpd - Xppd)*(Xd - Xpd)/(Xpd - Xl)^2;
  parameter Real K2d=(Xpd - Xl)*(Xppd - Xl)/(Xpd - Xppd);
  parameter Real K1q=(Xpq - Xppq)*(Xq - Xpq)/(Xpq - Xl)^2;
  parameter Real K2q=(Xpq - Xl)*(Xppq - Xl)/(Xpq - Xppq);
  parameter Real K3d=(Xppd - Xl)/(Xpd - Xl);
  parameter Real K4d=(Xpd - Xppd)/(Xpd - Xl);
  parameter Real K3q=(Xppq - Xl)/(Xpq - Xl);
  parameter Real K4q=(Xpq - Xppq)/(Xpq - Xl);
  parameter Real CoB=M_b/S_b
    "Constant to change from system base to machine base";
initial equation
  der(Epd) = 0;
  der(Epq) = 0;
  der(PSIkd) = 0;
  der(PSIkq) = 0;
equation
  //Interfacing outputs with the internal variables
  XADIFD = XadIfd;
  ISORCE = XadIfd;
  EFD0 = efd0;
  PMECH0 = pm0;
  der(Epq) = 1/Tpd0*(EFD - XadIfd);
  der(Epd) = 1/Tpq0*(-1)*XaqIlq;
  der(PSIkd) = 1/Tppd0*(Epq - PSIkd - (Xpd - Xl)*id);
  der(PSIkq) = 1/Tppq0*(Epd - PSIkq + (Xpq - Xl)*iq);
  Te = PSId*iq - PSIq*id;
  PSId = PSIppd - Xppd*id;
  PSIq = (-PSIppq) - Xppq*iq;
  PSIppd = Epq*K3d + PSIkd*K4d;
  -PSIppq = (-Epd*K3q) - PSIkq*K4q;
  PSIpp = sqrt(PSIppd*PSIppd + PSIppq*PSIppq);
  XadIfd = K1d*(Epq - PSIkd - (Xpd - Xl)*id) + Epq + id*(Xd - Xpd) + SE_exp(
    PSIpp,
    S10,
    S12,
    1,
    1.2)*PSIppd;
  XaqIlq = K1q*(Epd - PSIkq + (Xpq - Xl)*iq) + Epd - iq*(Xq - Xpq) - SE_exp(
    PSIpp,
    S10,
    S12,
    1,
    1.2)*(-1)*PSIppq*(Xq - Xl)/(Xd - Xl);
  //change sign for PSIppq 3/3
  ud = (-PSIq) - R_a*id;
  uq = PSId - R_a*iq;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Text(
          extent={{-54,24},{54,-26}},
          lineColor={0,0,255},
          textString="GENROE")}),
          Documentation(info="<html>Round Rotor Generator Model GENROE. It is the same as GENROU model
          except that an exponential function is used as saturation.</html>",
          revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Manual</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-09</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>ALSETLab, Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end GENROE;
