within OpenIPSL.Electrical.Machines.PSSE;
model GENTPJ
  "WECC Type J GENERATOR: ROUND ROTOR WITH SATURATION ON BOTH AXES."
  extends OpenIPSL.Icons.VerifiedModel;
  //Import of dependencies
  import Complex;
  import Modelica.ComplexMath.arg;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  import Modelica.ComplexMath.abs;
  import Modelica.ComplexMath.conj;
  import Modelica.ComplexMath.fromPolar;
  import Modelica.ComplexMath.j;
  import OpenIPSL.NonElectrical.Functions.SE;

  extends OpenIPSL.Electrical.Machines.PSSE.BaseClasses.baseMachine(
    XADIFD(start=efd0),
    delta(start=delta0, fixed=true),
    id(start=id0),
    iq(start=iq0),
    Te(start=pm0),
    ud(start=ud0),
    uq(start=uq0));

  //Machine parameters
  parameter Types.PerUnit Xpq "q-axis transient reactance "
    annotation (Dialog(group="Machine parameters"));
  parameter Types.Time Tpq0
    "q-axis transient open-circuit time constant"
    annotation (Dialog(group="Machine parameters"));

  parameter Types.PerUnit Kis
    "Current multiplier for saturation calculation"
    annotation (Dialog(group="Machine parameters"));

  Types.PerUnit Epd(start=Epd0)
    "d-axis voltage behind transient reactance ";
  Types.PerUnit Epq(start=Epq0)
    "q-axis voltage behind transient reactance ";

  Types.PerUnit Eq1(start=Eq10);
  Types.PerUnit Eq2(start=Eq20);
  Types.PerUnit Ed1(start=Ed10);
  Types.PerUnit Ed2(start=Ed20);
  Types.PerUnit Xppdsat(start=Xppdsat0);
  Types.PerUnit Xppqsat(start=Xppqsat0);
  Types.PerUnit dsat(start=dsat0);
  Types.PerUnit qsat(start=qsat0);

  //State variables
  Types.PerUnit PSId(start=PSId0) "d-axis flux linkage ";
  Types.PerUnit PSIq(start=PSIq0) "q-axis flux linkage ";
  Types.PerUnit PSIppd(start=PSIppd0)
    "d-axis subtransient flux linkage ";
  Types.PerUnit PSIppq(start=PSIppq0)
    "q-axis subtransient flux linkage ";
  Types.PerUnit PSIpp "Air-gap flux ";
  Types.PerUnit XadIfd(start=efd0) "d-axis machine field current ";

protected
  parameter Complex Zs=Complex(R_a,Xppqsat0) "Equivalent impedance";
  parameter Complex VT=Complex(v_0*cos(angle_0),v_0*sin(angle_0)) "Complex terminal voltage";
  parameter Complex S=Complex(p0,q0) "Complex power on machine base";
  parameter Complex It=Complex(real(S/VT),-imag(S/VT)) "Complex current, machine base";
  parameter Complex Is=Complex(real(It + VT/Zs),imag(It + VT/Zs)) "Equivalent internal current source";
  parameter Complex PSIpp0=Complex(real(Zs*Is),(imag(Zs*Is) - id0*(Xppqsat0-Xppdsat0)))  "Sub-transient flux linkage in stator reference frame";
  parameter Types.Angle ang_PSIpp0=arg(PSIpp0) "flux angle";
  parameter Types.Angle ang_It=arg(It) "current angle";
  parameter Types.Angle ang_PSIpp0andIt=ang_PSIpp0 - ang_It
    "angle difference";
  parameter Types.PerUnit abs_PSIpp0=abs(PSIpp0)
    "magnitude of sub-transient flux linkage";
  parameter Complex Z = Complex(R_a,Xl);
  parameter Complex PSIag= Complex(real(VT+Z*It),(imag(VT+Z*It)));
  parameter Real dsat0=1+SE(
      (abs(PSIag)+Kis*sqrt(id0*id0+iq0*iq0)),
      S10,
      S12,
      1,
      1.2) "To include saturation during initialization";
  parameter Real qsat0=1+(Xq/Xd)*SE(
      (abs(PSIag)+Kis*sqrt(id0*id0+iq0*iq0)),
      S10,
      S12,
      1,
      1.2) "To include saturation during initialization";
  parameter Real a=(abs(PSIag))*dsat0;
  parameter Real b=(It.re^2 + It.im^2)^0.5*(Xppdsat0-Xq);
  //Initializion rotor angle position
  parameter Types.Angle delta0=ang_PSIpp0 + atan(b*cos(
      ang_PSIpp0andIt)/(b*sin(ang_PSIpp0andIt) - a))
    "initial rotor angle in radians";
  parameter Complex DQ_dq=Complex(cos(delta0),-sin(delta0))  "Parks transformation, from stator to rotor reference frame";
  parameter Complex PSIpp0_dq=PSIpp0*DQ_dq "Flux linkage in rotor reference frame";
  parameter Complex I_dq=conj(It*DQ_dq); //"The terminal current in rotor reference frame"
  parameter Types.PerUnit PSIppq0=imag(PSIpp0_dq)
    "q-axis component of the sub-transient flux linkage";
  parameter Types.PerUnit PSIppd0=real(PSIpp0_dq)
    "d-axis component of the sub-transient flux linkage";
  //Initialization of current and voltage components in rotor reference frame (dq-axes).
  parameter Types.PerUnit iq0=real(I_dq)
    "q-axis component of initial current";
  parameter Types.PerUnit id0=imag(I_dq)
    "d-axis component of initial current";
  parameter Types.PerUnit ud0=(-PSIq0) - R_a*id0
    "d-axis component of initial voltage";
  parameter Types.PerUnit uq0=PSId0 - R_a*iq0
    "q-axis component of initial voltage";
  //Initialization current and voltage components in synchronous reference frame.
  parameter Types.PerUnit vr0=v_0*cos(angle_0)
    "Real component of initial terminal voltage";
  parameter Types.PerUnit vi0=v_0*sin(angle_0)
    "Imaginary component of initial terminal voltage";
  parameter Types.PerUnit ir0=-CoB*(p0*vr0 + q0*vi0)/(vr0^2 + vi0^
      2) "Real component of initial armature current (system base)";
  parameter Types.PerUnit ii0=-CoB*(p0*vi0 - q0*vr0)/(vr0^2 + vi0^
      2) "Imaginary component of initial armature current (system base)";
  //Initialization mechanical power and field voltage.
  parameter Types.PerUnit pm0=p0 + R_a*iq0*iq0 + R_a*id0*id0
    "Initial mechanical power (machine base)";
  parameter Types.PerUnit efd0=dsat0*Eq10
    "Initial field voltage magnitude";
  parameter Types.PerUnit Epq0=PSIppd0 + id0*(Xpd - Xppd)/dsat0;
  parameter Types.PerUnit Epd0=-PSIppq0 - iq0*(Xpq - Xppq)/qsat0;
  parameter Types.PerUnit Eq10=((-1)*PSIppd0*(Xd - Xpd) + Epq0*(Xd
       - Xppd))/(Xpd - Xppd);
  parameter Types.PerUnit Ed10=(PSIppq0*(Xq - Xpq) + Epd0*(Xq -
      Xppq))/(Xpq - Xppq);
  parameter Types.PerUnit Eq20=(PSIppd0 - Epq0 + id0*((Xpd - Xppd)
      /dsat0))*((Xd - Xppd)/(Xpd - Xppd));
  parameter Types.PerUnit Ed20=(-PSIppq0 - Epd0 - iq0*((Xpq - Xppq)
      /qsat0))*((Xq - Xppq)/(Xpq - Xppq));
  //Initialize remaining variables:
  parameter Types.PerUnit Xppdsat0=((Xppd - Xl)/dsat0) + Xl;
  parameter Types.PerUnit Xppqsat0=((Xppq - Xl)/qsat0) + Xl;
  parameter Types.PerUnit PSId0=PSIppd0 - Xppdsat0*id0;
  parameter Types.PerUnit PSIq0=PSIppq0 - Xppqsat0*iq0;
  // Constants
  parameter Real CoB=M_b/S_b  "Constant to change from system base to machine base";

initial equation
  der(Epd) = 0;
  der(Epq) = 0;
  der(PSIppd) = 0;
  der(PSIppq) = 0;
equation
  //Interfacing outputs with the internal variable
  XADIFD = XadIfd;
  ISORCE = XadIfd;
  EFD0 = efd0;
  PMECH0 = pm0;
  // Differential equations:
  der(Epq) = (1/Tpd0)*(EFD - XadIfd);
  der(Epd) = (1/Tpq0)*(-1)*qsat*Ed1;
  der(PSIppd) = -(dsat)*((Xpd-Xppd)/(Xd-Xppd))*(Eq2/Tppd0);
  der(PSIppq) = (qsat)*((Xpq-Xppq)/(Xq-Xppq))*(Ed2/Tppq0);
  Te = PSId*iq - PSIq*id;
  // Unsaturated air-gap flux:
  PSIpp = sqrt((uq+iq*R_a+id*Xl)*(uq+iq*R_a+id*Xl)+(ud+id*R_a-iq*Xl)*(ud+id*R_a-iq*Xl));
  // Saturation on d-axis:
  dsat=1+SE(
      ((PSIpp+Kis*sqrt(id*id+iq*iq))),
      S10,
      S12,
      1,
      1.2);
  // Saturation on q-axis:
  qsat=1+(Xq/Xd)*SE(
      ((PSIpp+Kis*sqrt(id*id+iq*iq))),
      S10,
      S12,
      1,
      1.2);
  // Auxiliary Equations:
  Eq1= ((-1)*PSIppd*(Xd-Xpd) + Epq*(Xd-Xppd))/(Xpd-Xppd);
  Ed1= (PSIppq*(Xq-Xpq)+Epd*(Xq-Xppq))/(Xpq-Xppq);
  Eq2= (PSIppd-Epq+id*((Xpd-Xppd)/dsat))*((Xd-Xppd)/(Xpd-Xppd));
  Ed2=-(Epd+PSIppq)*((Xq-Xppq)/(Xpq-Xppq))-iq*((Xq-Xppq)/qsat);
  // Field Current:
  XadIfd = dsat*Eq1;
  // Flux and saturated inductances:
  Xppdsat=((Xppd-Xl)/dsat)+Xl;
  Xppqsat=((Xppq-Xl)/qsat)+Xl;
  PSId=PSIppd - Xppdsat*id;
  PSIq=PSIppq - Xppqsat*iq;
  // Terminal voltage:
  ud = (-PSIq) - R_a*id;
  uq = PSId - R_a*iq;
  annotation (
    Icon( graphics={Text(
          extent={{-54,24},{54,-26}},
          lineColor={0,0,255},
          textString="GENTPJ")}),
    Documentation(info="<html><p>Solid rotor generator with saturation on both axes. The saturation in this model is not only function of the air-gap flux, but also of armature current magnitude. This effect is included via parameter <code>Kis</code>.</p>
    <p> If  <code>Kis</code> is set to zero, then the model will behave like the WECC Type F Generator, that is, GENTPF.</p></html>",
    revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E and PowerWorld Manuals</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2022-04</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Md. Shamimul Islam and Marcelo de Castro, Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end GENTPJ;
