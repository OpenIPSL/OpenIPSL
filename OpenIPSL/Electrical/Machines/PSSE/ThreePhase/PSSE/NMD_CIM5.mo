within OpenIMDML.NonMultiDomain.Motors.ThreePhase.PSSE;
model NMD_CIM5 "Non Multi-Domain PSSE CIM5 Three-Phase Induction Motor Model."
  extends BaseClasses.BaseNonMultiDomainThreePhase;
  import Modelica.Constants.eps;
  import OpenIPSL.NonElectrical.Functions.SE;

  parameter Integer Mtype = 1 "1- Motor Type A; 2- Motor Type B" annotation (Dialog(group=
          "Motor Setup"), choices(choice=1, choice=2));
  parameter OpenIPSL.Types.PerUnit Ra=0 "Stator resistance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit Xa=0.0759 "Stator reactance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit Xm=3.1241 "Magnetizing reactance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit R1=0.0085 "1st cage rotor resistance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit X1=0.0759 "1st cage rotor reactance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit R2=0 "2nd cage rotor resistance. To model single cage motor set R2 = 0." annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit X2=0 "2nd cage rotor reactance. To model single cage motor set X2 = 0." annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit E1=1 "First Saturation Voltage Value"
                                                                        annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit SE1 = 0.06 "Saturation Factor at E1" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit E2=1.2 "Second Saturation Voltage Value"
                                                                           annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit SE2 = 0.6 "Saturation Factor at E2" annotation (Dialog(group="Machine parameters"));
  parameter Modelica.Units.SI.Time H = 0.4 "Inertia constant" annotation (Dialog(group="Machine parameters"));
  parameter Real T_nom = 1 "Load torque at 1 pu speed" annotation (Dialog(group="Machine parameters"));
  parameter Real D = 1 "Load Damping Factor" annotation (Dialog(group="Machine parameters"));

  OpenIPSL.Types.PerUnit Te_motor;
  OpenIPSL.Types.PerUnit Te_sys;
  OpenIPSL.Types.PerUnit TL;

  OpenIPSL.Types.PerUnit Epr;
  OpenIPSL.Types.PerUnit Epi;
  OpenIPSL.Types.PerUnit Eppr;
  OpenIPSL.Types.PerUnit Eppi;
  OpenIPSL.Types.PerUnit Epp;
  OpenIPSL.Types.PerUnit Ekr;
  OpenIPSL.Types.PerUnit Eki;
  OpenIPSL.Types.PerUnit NUM;
  OpenIPSL.Types.PerUnit EQC;
  OpenIPSL.Types.PerUnit EQ1;
  OpenIPSL.Types.PerUnit EQ2;
  OpenIPSL.Types.PerUnit EQ3;
  OpenIPSL.Types.PerUnit EQ4;
  OpenIPSL.Types.PerUnit EQ5;
  OpenIPSL.Types.PerUnit EQ6;
  OpenIPSL.Types.PerUnit EQ7;
  OpenIPSL.Types.PerUnit EQ8;
  OpenIPSL.Types.PerUnit EQ9;
  OpenIPSL.Types.PerUnit EQ10;
  OpenIPSL.Types.PerUnit EQ11;
  OpenIPSL.Types.PerUnit EQ12;
  OpenIPSL.Types.PerUnit EQ13;
  OpenIPSL.Types.PerUnit EQ14;
  OpenIPSL.Types.PerUnit EQ15;
  OpenIPSL.Types.PerUnit EQ16;
  OpenIPSL.Types.PerUnit EQ17;
  OpenIPSL.Types.PerUnit EQ18;
  OpenIPSL.Types.PerUnit EQ19;
  OpenIPSL.Types.PerUnit EQ20;
  OpenIPSL.Types.PerUnit EQ21;
  OpenIPSL.Types.PerUnit EQ22;
  OpenIPSL.Types.PerUnit EQ23;
  OpenIPSL.Types.PerUnit EQ24;
  OpenIPSL.Types.PerUnit Omegar "Rotor angular velocity";

  OpenIPSL.Types.PerUnit Ls;
  OpenIPSL.Types.PerUnit Ll;
  OpenIPSL.Types.PerUnit Lp;
  OpenIPSL.Types.PerUnit Lpp;

  OpenIPSL.Types.PerUnit Xa_c;
  OpenIPSL.Types.PerUnit Xm_c;
  OpenIPSL.Types.PerUnit X1_c;
  OpenIPSL.Types.PerUnit X2_c;

  OpenIPSL.Types.PerUnit constant1;
  OpenIPSL.Types.PerUnit constant2;
  OpenIPSL.Types.PerUnit constant3;
  OpenIPSL.Types.PerUnit constant4;
  OpenIPSL.Types.PerUnit constant5;

  Modelica.Units.SI.Time Tp0;
  Modelica.Units.SI.Time Tpp0;

initial equation
  if Sup == false then
    der(s) = 0;
    der(Ekr) = 0;
    der(Eki) = 0;
    der(Epr) = 0;
    der(Epi) = 0;

  else
    s = (1 - Modelica.Constants.eps);

  end if;

equation

  // Frequency dependent circuit impedances
  Xa_c = if (Ctrl == false) then Xa else (we_fix.y/w_b)*(Xa);
  Xm_c = if (Ctrl == false) then Xm else (we_fix.y/w_b)*(Xm);
  X1_c = if (Ctrl == false) then X1 else (we_fix.y/w_b)*(X1);
  X2_c = if (Ctrl == false) then X2 else (we_fix.y/w_b)*(X2);

  // Frequency dependent parameters and constants
  Ls = Xa_c + Xm_c;
  Ll = Xa_c;
  Lp = Xa_c + X1_c*Xm_c/(X1_c + Xm_c);
  Lpp = if (Mtype == 1 and R2 == 0 and X2 == 0) then Lp elseif (Mtype == 1) then Xa_c + X1_c*Xm_c*X2_c/(X1_c*X2_c + X1_c*Xm_c + X2_c*Xm_c) elseif (Mtype == 2 and R2 == 0 and X2 == 0) then Lp else Xa_c + (Xm_c*(X1_c+X2_c)/(X1_c + X2_c + Xm_c));
  Tp0 = if (Mtype == 1) then (X1_c + Xm_c)/(w_b*R1) elseif (Mtype == 2 and R2 == 0 and X2 == 0) then (X1_c + Xm_c)/(w_b*R1) else (X1_c + X2_c +Xm_c)/(w_b*R2);
  Tpp0 = if (Mtype == 1 and R2 == 0 and X2 == 0) then 1e-7 elseif (Mtype == 1) then (X2_c + (X1_c*Xm_c/(X1_c + Xm_c)))/(w_b*R2) elseif (Mtype == 2 and R2 == 0 and X2 == 0) then 1e-7 else (1/((1/(X1_c+Xm_c) + 1/X2_c)))/(w_b*R1);
  constant5 = Ls - Lp;
  constant3 = Lp - Ll;
  constant4 = (Lp - Lpp)/((Lp - Ll)^2);
  constant2 = (Lp - Lpp)/(Lp - Ll);
  constant1 = (Lpp - Ll)/(Lp - Ll);

  // Steady-State circuit set of algebraic-differential equations
  Eppr = EQ1 + EQ2;
  EQ1 = Epr*constant1;
  EQ2 = Ekr*constant2;
  EQ3 = Tpp0*der(Ekr);
  EQ3 = EQ4 + EQ5;
  EQ4 = (Tpp0*w_b*s)*Eki;
  EQ5 = Epr - Ekr - EQ6;
  EQ6 = Ii*constant3;
  EQ7 = EQ5*constant4;
  EQ8 = EQ7 + Ii;
  EQ9 = EQ8*constant5;
  EQ10 = Eppi*EQC;
  EQ11 = Epi*(Tp0*w_b*s);
  EQ12 = EQ10 + EQ11 - Epr - EQ9;
  EQ12 = Tp0*der(Epr);
  EQC = NUM/(Epp + eps);
  NUM = SE(Epp,SE1,SE2,1,1.2);
  Epp = sqrt(Eppr^2 + Eppi^2);
  EQ13 = EQC*Eppr;
  EQ14 = Epr*(Tp0*w_b*s);
  EQ22 = Ir - EQ21;
  EQ15 = EQ22*constant5;
  EQ16 = EQ15 - EQ14 - EQ13 - Epi;
  EQ16 = Tp0*der(Epi);
  EQ17 = Ir*constant3;
  EQ18 = EQ17 + Epi - Eki;
  EQ21 = EQ18*constant4;
  EQ19 = Ekr*(Tpp0*w_b*s);
  EQ20 = EQ18 - EQ19;
  EQ20 = Tpp0*der(Eki);
  EQ24 = Epi*constant1;
  EQ23 = Eki*constant2;
  Eppi = EQ23 + EQ24;

  //The link between voltages, currents and state variables is
  Vr = Eppr + Ra*Ir - Lpp*Ii;
  Vi = Eppi + Ra*Ii + Lpp*Ir;

  // Mechanical Equation
  s = (1 - Omegar);
  der(s) = (TL - Te_motor)/(2*H);

  //Electromagnetic torque equation in system and machine base
  Te_sys = Te_motor*CoB;
  Te_motor = Eppr*Ir + Eppi*Ii;

  //Mechanical Torque Equation
  TL = T_nom*(1 - s)^D;

    annotation (preferredView = "info",Dialog(group="Machine parameters"));
end NMD_CIM5;
