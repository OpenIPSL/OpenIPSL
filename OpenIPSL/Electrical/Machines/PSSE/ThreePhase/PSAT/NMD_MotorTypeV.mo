within OpenIMDML.NonMultiDomain.Motors.ThreePhase.PSAT;
model NMD_MotorTypeV "Non Multi-Domain Type V Three-Phase Induction Motor Model."
  extends
    OpenIMDML.NonMultiDomain.Motors.ThreePhase.BaseClasses.BaseNonMultiDomainThreePhase;

  // Parameter Set
  parameter OpenIPSL.Types.PerUnit Rs=0 "Stator resistance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit Xs=0.0759 "Stator reactance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit R1=0.0085 "1st cage rotor resistance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit X1=0.0759 "1st cage rotor reactance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit R2=0 "1st cage rotor resistance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit X2=0 "1st cage rotor reactance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit Xm=3.1241 "Magnetizing reactance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit a = 1 "1st coefficient of load torque" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit b = 1 "2nd coefficient of load torque" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit c = 1 "3rd coefficient of load torque" annotation (Dialog(group="Machine parameters"));

  // Variable Set
  OpenIPSL.Types.PerUnit epr;
  OpenIPSL.Types.PerUnit epm;
  OpenIPSL.Types.PerUnit eppr;
  OpenIPSL.Types.PerUnit eppm;
  OpenIPSL.Types.PerUnit X0;
  OpenIPSL.Types.PerUnit Xp;
  OpenIPSL.Types.PerUnit Xpp;
  OpenIPSL.Types.PerUnit Tp0;
  OpenIPSL.Types.PerUnit Tpp0;
  OpenIPSL.Types.PerUnit Te_motor;
  OpenIPSL.Types.PerUnit Te_sys;
  OpenIPSL.Types.PerUnit TL;
  Real alpha;
  Real beta;
  Real gamma;

initial equation
  if Sup == false then
    s = Modelica.Constants.eps;

  else
    s = (1 - Modelica.Constants.eps);
    epm=0;
    epr=0;
    eppm=0;
    eppr=0;

  end if;

equation

  //Rotor impedance based on controllable model
  X0   = (if (Ctrl == false) then Xs + Xm else (we_fix.y/w_b)*(Xs + Xm));
  Xp   = (if (Ctrl == false) then Xs + X1*Xm/(X1 + Xm) else (we_fix.y/w_b)*(Xs + X1*Xm/(X1 + Xm)));
  Xpp  = (if (Ctrl == false and R2 ==0 and X2 == 0) then Xp elseif (Ctrl == false) then (Xs + X1*X2*Xm/(X1*X2 + X1*Xm + X2*Xm)) elseif (Ctrl == true and R2 ==0 and X2 == 0) then Xp else (we_fix.y/w_b)*(Xs + X1*X2*Xm/(X1*X2 + X1*Xm + X2*Xm)));
  Tp0  = (if (Ctrl == false) then (X1 + Xm)/(w_b*R1) else (we_fix.y/w_b)*((X1 + Xm)/(w_b*R1)));
  Tpp0 = (if (Ctrl == false and R2 ==0 and X2 == 0) then Modelica.Constants.inf elseif (Ctrl == false) then (X2 + X1*Xm/(X1+Xm))/(w_b*R2) elseif  (Ctrl == true and R2 ==0 and X2 == 0) then Modelica.Constants.inf else (we_fix.y/w_b)*(X2 + X1*Xm/(X1+Xm))/(w_b*R2));

  //The link between voltages, currents and state variables is
  Vr = eppr + Rs*Ir - Xpp*Ii;
  Vi = eppm + Rs*Ii + Xpp*Ir;

  //Electromagnetic differential equations
  der(epr)  =   w_b*s*epm  - (epr + (X0 - Xp)*Ii)/Tp0;
  der(epm)  = (-w_b*s*epr) - (epm - (X0 - Xp)*Ir)/Tp0;
  der(eppr) = (-w_b*s*(epm -eppm)) + der(epr) - (epr - eppm - (Xp - Xpp)*Ii)/Tpp0;
  der(eppm) =   w_b*s*(epr - eppr) + der(epm) - (epm - eppr + (Xp - Xpp)*Ir)/Tpp0;

  //Mechanical Slip Equation
  der(s) = (TL - Te_motor)/(2*H);

  //Electromagnetic torque equation in system and machine base
  Te_sys = Te_motor*CoB;
  Te_motor = eppr*Ir + eppm*Ii;

  //Load Torque Coefficient Equations
  alpha = a + b + c;
  beta = -b - 2*c;
  gamma = c;

  //Mechanical Torque Equation
  TL = alpha + beta*s + gamma*s^2;

  annotation(preferredView = "info");
end NMD_MotorTypeV;
