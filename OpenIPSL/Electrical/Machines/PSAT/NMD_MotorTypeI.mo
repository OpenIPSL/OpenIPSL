within OpenIPSL.Electrical.Machines.PSAT;
model NMD_MotorTypeI
  "Non Multi-Domain Type I Three-Phase Induction Motor Model."
  extends
    OpenIMDML.NonMultiDomain.Motors.ThreePhase.BaseClasses.BaseNonMultiDomainThreePhase;

  // Parameter Set
  parameter OpenIPSL.Types.PerUnit Xs=0.0759 "Stator reactance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit R1=0.0085 "1st cage rotor resistance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit X1=0.0759 "1st cage rotor reactance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit Xm=3.1241 "Magnetizing reactance" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit a = 1 "1st coefficient of load torque" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit b = 1 "2nd coefficient of load torque" annotation (Dialog(group="Machine parameters"));
  parameter OpenIPSL.Types.PerUnit c = 1 "3rd coefficient of load torque" annotation (Dialog(group="Machine parameters"));

  // Variable Set
  OpenIPSL.Types.PerUnit Re;
  OpenIPSL.Types.PerUnit Xe;
  OpenIPSL.Types.PerUnit Xmag;
  OpenIPSL.Types.PerUnit Omegar "Rotor angular velocity";
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
  else
    s = 1 - Modelica.Constants.eps;
  end if;

equation

  //Real and Imaginary currents drawn by the motor in the motor base
  Ii = (-p.vr/Xmag) + (p.vi*Re - p.vr*Xe)/(Re*Re + Xe*Xe);
  Ir =   p.vi/Xmag  + (p.vr*Re + p.vi*Xe)/(Re*Re + Xe*Xe);

  //Rotor impedance
  Re = R1/s;
  Xe = (if Ctrl == false then Xs + X1 else (we_fix.y/w_b)*(Xs + X1));

  //Magnetization Impedance
  Xmag = (if Ctrl == false then Xm else (we_fix.y/w_b)*Xm);

  //Mechanical Swing Equation
  s = (1 - Omegar);
  der(s) = (TL - P_motor)/(2*H);

  //Load Torque Coefficient Equations
  alpha = a + b + c;
  beta = -b - 2*c;
  gamma = c;

  //Mechanical Torque Equation
  TL = alpha + beta*s + gamma*s^2;

  annotation(preferredView = "info");
end NMD_MotorTypeI;
