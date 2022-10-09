within OpenIPSL.Electrical.ThreePhase.Loads;
model WyeLoad_3Ph "Three-phase wye load"
  extends ThreePhaseComponent;
  import Modelica.Constants.pi;
  OpenIPSL.Interfaces.PwPin A(vr(start=var0), vi(start=vai0)) annotation (
      Placement(
      transformation(
        extent={{80.0,0.0},{100.0,20.0}},
        origin={0.0,0.0}),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={159,100})));
  OpenIPSL.Interfaces.PwPin B(vr(start=vbr0), vi(start=vbi0)) annotation (
      Placement(
      transformation(
        extent={{-10.0,0.0},{10.0,20.0}},
        origin={0.0,0.0}),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={70,100})));
  OpenIPSL.Interfaces.PwPin C(vr(start=vcr0), vi(start=vci0)) annotation (
      Placement(
      transformation(
        extent={{-100.0,0.0},{-80.0,20.0}},
        origin={0.0,0.0}),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={-19,100})));
  parameter Integer ModelType=0 "0- Constant Power Model, 1- ZIP Model;"
    annotation (choices(choice=0 "Constant Power", choice=1 "ZIP Model"),
      Dialog(group="Power flow"));
  parameter Types.PerUnit VA=1
    "Voltage magnitude"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Angle AngA = 0 "Voltage angle for phase A"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit VB=1 "Voltage magnitude"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Angle AngB = -2*pi/3 "Voltage angle for phase B"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit VC=1 "Voltage magnitude"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Angle AngC = 2*pi/3 "Voltage angle for phase C"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ActivePower P_a=1e6
    "Initial active power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ReactivePower Q_a=0
    "Initial reactive power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ActivePower P_b=1e6
    "Initial active power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ReactivePower Q_b=0
    "Initial reactive power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ActivePower P_c=1e6
    "Initial active power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ReactivePower Q_c=0
    "Initial reactive power"
    annotation (Dialog(group="Power flow data"));

  parameter Real A_pa=0 "Percentage of Constant Power Load for Phase A (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real B_pa=0 "Percentage of Constant Current Load for Phase A (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real C_pa=0 "Percentage of Constant Impedance Load for Phase A (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real A_pb=0 "Percentage of Constant Power Load for Phase B (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real B_pb=0 "Percentage of Constant Current Load for Phase B (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real C_pb=0
    "Percentage of Constant Impedance Load] for Phase B (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real A_pc=0 "Percentage of Constant Power Load for Phase C (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real B_pc=0 "Percentage of Constant Current Load for Phase C (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real C_pc=0 "Percentage of Constant Impedance Load for Phase C (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));

protected
  parameter Real[1, 6] TPhasePower=[P_a, P_b, P_c, Q_a, Q_b, Q_c]/S_p;
  parameter Real[1, 9] ZIP_coef=[A_pa/100, B_pa/100, C_pa/100, A_pb/100, B_pb/
      100, C_pb/100, A_pc/100, B_pc/100, C_pc/100];
  // Calculating V and V2
  Real Va=sqrt(A.vr^2 + A.vi^2);
  Real Vb=sqrt(B.vr^2 + B.vi^2);
  Real Vc=sqrt(C.vr^2 + C.vi^2);
  Real Va2=Va^2;
  Real Vb2=Vb^2;
  Real Vc2=Vc^2;
  // Calculating the Coefficients for Adjusting the Power
  Real Coef_A=ZIP_coef[1, 1] + ZIP_coef[1, 2]*Va + ZIP_coef[1, 3]*Va2;
  Real Coef_B=ZIP_coef[1, 4] + ZIP_coef[1, 5]*Vb + ZIP_coef[1, 6]*Vb2;
  Real Coef_C=ZIP_coef[1, 7] + ZIP_coef[1, 8]*Vc + ZIP_coef[1, 9]*Vc2;
  Real[1, 3] in_coef=[Coef_A, Coef_B, Coef_C];

  function Coefficients
    input Real[1, 3] in_coef;
    input Integer ModelType;
    output Real[1, 3] Coef;
  algorithm
    if ModelType == 0 then
      Coef := [1, 1, 1];
    elseif ModelType == 1 then
      Coef := in_coef;
    end if;
  end Coefficients;
  Real[1, 3] Coef=Coefficients(in_coef, ModelType);

  // Calculating new value for Active and Reactive Power
  Real Pa=TPhasePower[1, 1]*Coef[1, 1];
  Real Pb=TPhasePower[1, 2]*Coef[1, 2];
  Real Pc=TPhasePower[1, 3]*Coef[1, 3];
  Real Qa=TPhasePower[1, 4]*Coef[1, 1];
  Real Qb=TPhasePower[1, 5]*Coef[1, 2];
  Real Qc=TPhasePower[1, 6]*Coef[1, 3];

  // Initializing voltages for each pin
  parameter Real var0=VA*cos(AngA) "Initialization";
  parameter Real vai0=VA*sin(AngA) "Initialization";
  parameter Real vbr0=VB*cos(AngB) "Initialization";
  parameter Real vbi0=VB*sin(AngB) "Initialization";
  parameter Real vcr0=VC*cos(AngC) "Initialization";
  parameter Real vci0=VC*sin(AngC) "Initialization";

equation
  Pa = A.vr*A.ir + A.vi*A.ii;
  Qa = A.vi*A.ir - A.vr*A.ii;
  Pb = B.vr*B.ir + B.vi*B.ii;
  Qb = B.vi*B.ir - B.vr*B.ii;
  Pc = C.vr*C.ir + C.vi*C.ii;
  Qc = C.vi*C.ir - C.vr*C.ii;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false),
        graphics={Line(points={{-100,100},{100,100},{0,-100},{-100,100}}, color=
           {28,108,200}),Text(
          textColor={28,108,200},
          extent={{-62,90},{66,45}},
          textString="Grounded-Wye Load"),Text(
          origin={18,4},
          textColor={28,108,200},
          extent={{-62,45},{28,26}},
          textString="PQ/ZIP Load")}),
          Documentation(info="<html>
<p>This is a three-phase wye load model.</p>
<p>The user needs to input the active (<strong><em>P_a</em></strong>, <strong><em>P_b</em></strong> and <strong><em>P_c</em></strong>) and reactive (<strong><em>Q_a</em></strong>, <strong><em>Q_b</em></strong> and <strong><em>Q_c</em></strong>) powers consumed by each phase.
Since the values come from independent parameters, the model allows the representation of unbalanced loads.</p>
<p>In addition, the model allows the load to be represented as constant power, or as a ZIP model.
In the first approach, the powers consumed by each phase are kept constant throughout simulation.
The latter approach allows the load to be represented as a sum of three terms: constant impedance, constant current and constant power.
This means that, depending on voltage levels supplied, the load will consume different values of power.</p>
</html>"));
end WyeLoad_3Ph;
