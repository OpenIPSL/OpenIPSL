within OpenIPSL.Electrical.Machines.PSSE;
model CIM6 "PSSE CIM6 three-phase induction motor model"
  extends OpenIPSL.Electrical.Machines.PSSE.BaseClasses.baseMotor;
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

  parameter Real A = 1 "Load Torque Coefficient A" annotation (Dialog(group="Machine parameters"));
  parameter Real B = 1 "Load Torque Coefficient B" annotation (Dialog(group="Machine parameters"));
  parameter Real D = 1 "Load Torque Coefficient D" annotation (Dialog(group="Machine parameters"));
  parameter Real E = 1 "Load Torque Coefficient E" annotation (Dialog(group="Machine parameters"));
  parameter Real C0 = 1 "Load Torque Coefficient C0" annotation (Dialog(group="Machine parameters"));

  OpenIPSL.Types.PerUnit Te_motor "Electromagnetic torque in motor base";
  OpenIPSL.Types.PerUnit Te_sys "Electromagnetic torque in system base";
  OpenIPSL.Types.PerUnit TL "Load torque";

  OpenIPSL.Types.PerUnit Epr "Real voltage behind transient reactance";
  OpenIPSL.Types.PerUnit Epi "Imaginary voltage behind transient reactance";
  OpenIPSL.Types.PerUnit Eppr "Real voltage behind sub-transient reactance";
  OpenIPSL.Types.PerUnit Eppi "Imaginary voltage behind sub-transient reactance";
  OpenIPSL.Types.PerUnit Epp "Voltage magnitude behind sub-transient reactance";
  OpenIPSL.Types.PerUnit Ekr "Real voltage component related to 2nd cage for sub-transient reactance";
  OpenIPSL.Types.PerUnit Eki "Imaginary voltage component related to 2nd cage for sub-transient reactance";
  OpenIPSL.Types.PerUnit NUM "Numerator expression for determining EQC";
  OpenIPSL.Types.PerUnit EQC "Intermediate step equation C";
  OpenIPSL.Types.PerUnit EQ1 "Intermediate step equation 1";
  OpenIPSL.Types.PerUnit EQ2 "Intermediate step equation 2";
  OpenIPSL.Types.PerUnit EQ3 "Intermediate step equation 3";
  OpenIPSL.Types.PerUnit EQ4 "Intermediate step equation 4";
  OpenIPSL.Types.PerUnit EQ5 "Intermediate step equation 5";
  OpenIPSL.Types.PerUnit EQ6 "Intermediate step equation 6";
  OpenIPSL.Types.PerUnit EQ7 "Intermediate step equation 7";
  OpenIPSL.Types.PerUnit EQ8 "Intermediate step equation 8";
  OpenIPSL.Types.PerUnit EQ9 "Intermediate step equation 9";
  OpenIPSL.Types.PerUnit EQ10 "Intermediate step equation 10";
  OpenIPSL.Types.PerUnit EQ11 "Intermediate step equation 11";
  OpenIPSL.Types.PerUnit EQ12 "Intermediate step equation 12";
  OpenIPSL.Types.PerUnit EQ13 "Intermediate step equation 13";
  OpenIPSL.Types.PerUnit EQ14 "Intermediate step equation 14";
  OpenIPSL.Types.PerUnit EQ15 "Intermediate step equation 15";
  OpenIPSL.Types.PerUnit EQ16 "Intermediate step equation 16";
  OpenIPSL.Types.PerUnit EQ17 "Intermediate step equation 17";
  OpenIPSL.Types.PerUnit EQ18 "Intermediate step equation 18";
  OpenIPSL.Types.PerUnit EQ19 "Intermediate step equation 19";
  OpenIPSL.Types.PerUnit EQ20 "Intermediate step equation 20";
  OpenIPSL.Types.PerUnit EQ21 "Intermediate step equation 21";
  OpenIPSL.Types.PerUnit EQ22 "Intermediate step equation 22";
  OpenIPSL.Types.PerUnit EQ23 "Intermediate step equation 23";
  OpenIPSL.Types.PerUnit EQ24 "Intermediate step equation 24";
  OpenIPSL.Types.PerUnit Omegar "Rotor angular velocity";

  OpenIPSL.Types.PerUnit Ls "Sum of stator and magnetization reactances";
  OpenIPSL.Types.PerUnit Ll "Stator reactance";
  OpenIPSL.Types.PerUnit Lp "Total reactance for stator and 1st cage rotor reactances";
  OpenIPSL.Types.PerUnit Lpp "Total reactance for stator, 1st, and 2nd cage rotor reactances";

  OpenIPSL.Types.PerUnit Xa_c "Variable stator reactance";
  OpenIPSL.Types.PerUnit Xm_c "Variable magnetic impedance";
  OpenIPSL.Types.PerUnit X1_c "Variable 1st cage rotor cage reactance";
  OpenIPSL.Types.PerUnit X2_c "Variable 2nd cage rotor cage reactance";

  OpenIPSL.Types.PerUnit constant1 "Intermediate constant 1";
  OpenIPSL.Types.PerUnit constant2 "Intermediate constant 2";
  OpenIPSL.Types.PerUnit constant3 "Intermediate constant 3";
  OpenIPSL.Types.PerUnit constant4 "Intermediate constant 4";
  OpenIPSL.Types.PerUnit constant5 "Intermediate constant 5";

  Modelica.Units.SI.Time Tp0 "Transient open-circuit time constant";
  Modelica.Units.SI.Time Tpp0 "Sub-transient open-circuit time constant";

initial equation
  if Sup == false then
    der(s) = 0;
    der(Ekr) = 0;
    der(Eki) = 0;
    der(Epr) = 0;
    der(Epi) = 0;

  else
    s = (1 - C.eps);

  end if;

equation


  Xa_c = if (Ctrl == false) then Xa else (we_fix.y/w_b)*(Xa);
  Xm_c = if (Ctrl == false) then Xm else (we_fix.y/w_b)*(Xm);
  X1_c = if (Ctrl == false) then X1 else (we_fix.y/w_b)*(X1);
  X2_c = if (Ctrl == false) then X2 else (we_fix.y/w_b)*(X2);
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
  EQC = NUM/(Epp + C.eps);
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
  Vr = Eppr + Ra*Ir - Lpp*Ii;
  Vi = Eppi + Ra*Ii + Lpp*Ir;
  s = (1 - Omegar);
  der(s) = (TL - Te_motor)/(2*H);
  Te_sys = Te_motor*CoB;
  Te_motor = Eppr*Ir + Eppi*Ii;
  TL = T_nom*(A*Omegar^2 + B*Omegar + C0 + D*Omegar^E);

    annotation (preferredView = "info",Dialog(group="Machine parameters"),
    Documentation(info="<html>
<p>The CIM6 induction motor model represents an induction machine that can be either model a single or double cage motor. The model can represent two distinct
impedance circuits depending on the selected type.</p>
<p>The load torque equation for the CIM6 motor model is defines as:</p>
<blockquote><pre>
TL = T(Aw^2 + B*w + C0 + Dw^E)
</pre></blockquote>

<p>The modelling of such devices is based, mainly, on the following references:</p>
<ul>
<li><p>Siemens: \"PSS&reg;E Model Library\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-MODELS]</a>.</p>
</li>
<li><p>PowerWorld: Load Characteristic Models
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSEMotor]</a>.</p>
</li>
</ul>
</html>"));
end CIM6;
