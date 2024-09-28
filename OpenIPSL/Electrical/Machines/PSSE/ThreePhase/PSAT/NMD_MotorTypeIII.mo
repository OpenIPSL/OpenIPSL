within OpenIMDML.NonMultiDomain.Motors.ThreePhase.PSAT;
model NMD_MotorTypeIII "Non Multi-Domain Type III Three-Phase Induction Motor Model."
  extends
    OpenIMDML.NonMultiDomain.Motors.ThreePhase.BaseClasses.BaseNonMultiDomainThreePhase;

  // Parameter Set
  parameter OpenIPSL.Types.PerUnit Rs=0 "Stator resistance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit Xs=0.0759 "Stator reactance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit R1=0.0085 "1st cage rotor resistance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit X1=0.0759 "1st cage rotor reactance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit Xm=3.1241 "Magnetizing reactance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit a = 1 "1st coefficient of load torque" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit b = 1 "2nd coefficient of load torque" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit c = 1 "3rd coefficient of load torque" annotation (Dialog(group="Machine parameters"));


  // Variable Set
  OpenIPSL.Types.PerUnit epr;
  OpenIPSL.Types.PerUnit epm;
  OpenIPSL.Types.PerUnit X0;
  OpenIPSL.Types.PerUnit Xp;
  OpenIPSL.Types.Time Tp0;
  OpenIPSL.Types.PerUnit Te_motor;
  OpenIPSL.Types.PerUnit Te_sys;
  OpenIPSL.Types.PerUnit TL;
  Real alpha;
  Real beta;
  Real gamma;

protected
  parameter Real S0 = R1/w_b;
  parameter Real W0 = -s0*w_b + w_b;
  parameter Real s0 = if Sup == true then (1 - Modelica.Constants.eps) else S0;
  parameter Real w_start = if Sup == true then Modelica.Constants.eps else W0;

initial equation
  if Sup == false then
    der(s) = Modelica.Constants.eps;
    der(epm) = Modelica.Constants.eps;
    der(epr) = Modelica.Constants.eps;

  else
    s = 1 - Modelica.Constants.eps;
    der(epm) = 0;

  end if;

equation

  //Rotor impedance based on controllable model
  X0  = (if Ctrl == false then Xs + Xm else (we_fix.y/w_b)*(Xs + Xm));
  Xp  = (if Ctrl == false then Xs + X1*Xm/(X1 + Xm) else (we_fix.y/w_b)*(Xs + X1*Xm/(X1 + Xm)));
  Tp0 = (if Ctrl == false then (X1 + Xm)/(w_b*R1) else (we_fix.y/w_b)*((X1 + Xm)/(w_b*R1)));

  //The real and imaginary current relationship
  Vr = epr + Rs*Ir - Xp*Ii;
  Vi = epm + Rs*Ii + Xp*Ir;

  //Electromagnetic differential equations
  der(epr) =   w_b*s*epm  - (epr + (X0 - Xp)*Ii)/Tp0;
  der(epm) = (-w_b*s*epr) - (epm - (X0 - Xp)*Ir)/Tp0;

  //Mechanical Slip Equation
  der(s) = (TL - Te_motor)/(2*H);

  //Electromagnetic torque equation in system and machine base
  Te_sys = Te_motor*CoB;
  Te_motor = epr*Ir + epm*Ii;

  //Load Torque Coefficient Equations
  alpha = a + b + c;
  beta = -b - 2*c;
  gamma = c;

  //Mechanical Torque Equation
  TL = alpha + beta*s + gamma*s^2;

  annotation(preferredView = "info");
end NMD_MotorTypeIII;
