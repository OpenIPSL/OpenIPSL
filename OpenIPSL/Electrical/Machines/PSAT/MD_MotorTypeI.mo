within OpenIPSL.Electrical.Machines.PSAT;
model MD_MotorTypeI
  "Multidomain type I three-phase induction motor model"
  extends
    OpenIMDML.MultiDomain.Motors.ThreePhase.BaseClasses.BaseMultiDomainThreePhase;

  // Parameter Set
  parameter OpenIPSL.Types.PerUnit Xs=0.0759 "Stator reactance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit R1=0.0085 "1st cage rotor resistance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit X1=0.0759 "1st cage rotor reactance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit Xm=3.1241 "Magnetizing reactance" annotation (Dialog(group="Machine parameters"));

  // Variable Set
  OpenIPSL.Types.PerUnit Re;
  OpenIPSL.Types.PerUnit Xe;
  OpenIPSL.Types.PerUnit Xmag;
  OpenIPSL.Types.PerUnit Omegar "Rotor angular velocity";
  OpenIPSL.Types.PerUnit Pmotor;
equation

  //Real and Imaginary currents drawn by the motor in the motor base
  Ii = (-p.vr/Xmag) + (p.vi*Re - p.vr*Xe)/(Re*Re + Xe*Xe);
  Ir =   p.vi/Xmag  + (p.vr*Re + p.vi*Xe)/(Re*Re + Xe*Xe);

  //Active Power Calculation based on current calculation
  Pmotor = (if Ctrl == false then P_motor else P_motor/(we_fix.y/w_b));

  //Rotor impedance
  Re = R1/max(s,Modelica.Constants.eps);
  Xe = (if Ctrl == false then Xs + X1 else (we_fix.y/w_b)*(Xs + X1));

  //Magnetization Impedance
  Xmag = (if Ctrl == false then Xm else (we_fix.y/w_b)*Xm);

  //Mechanical Swing Equation
  s = (1 - Omegar);
  der(s) = (Tmech_pu_motor - Pmotor)/(2*H);

  annotation(preferredView = "info");
end MD_MotorTypeI;
