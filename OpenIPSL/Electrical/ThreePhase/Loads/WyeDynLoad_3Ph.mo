within OpenIPSL.Electrical.ThreePhase.Loads;
model WyeDynLoad_3Ph "Variable balanced three-phase wye load"
  extends ThreePhaseComponent;
  import Modelica.Blocks.Interfaces.*;

  Modelica.Blocks.Interfaces.RealInput DynFact "Load Curve [pu]" annotation (
      Placement(
      transformation(
        origin={-88,0},
        extent={{-20,-20},{20,20}}),
      iconTransformation(
        origin={-52,0},
        extent={{-20,-20},{20,20}})));
  OpenIPSL.Interfaces.PwPin A annotation (Placement(
      transformation(
        extent={{-56.0,-10.0},{-36.0,10.0}},
        origin={0.0,0.0}),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={159,100})));
  OpenIPSL.Interfaces.PwPin B annotation (Placement(
      transformation(
        extent={{-56.0,-10.0},{-36.0,10.0}},
        origin={0.0,0.0}),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={70,100})));
  OpenIPSL.Interfaces.PwPin C annotation (Placement(
      transformation(
        extent={{-56.0,-10.0},{-36.0,10.0}},
        origin={0.0,0.0}),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={-19,100})));
  parameter Integer ModelType=0 "0- Constant Power Model, 1- ZIP Model;"
    annotation (choices(choice=0 "Constant Power", choice=1 "ZIP Model"),
      Dialog(group="Power flow"));

  parameter Types.ActivePower P_a=1e6 "Base Active power for phase A"
    annotation (Dialog(group="Power flow"));
  parameter Types.ReactivePower Q_a=0 "Base Reactive power for phase A"
    annotation (Dialog(group="Power flow"));
  parameter Types.ActivePower P_b=1e6 "Base Active power for phase B"
    annotation (Dialog(group="Power flow"));
  parameter Types.ReactivePower Q_b=0 "Base Reactive power for phase B"
    annotation (Dialog(group="Power flow"));
  parameter Types.ActivePower P_c=1e6 "Base Active power for phase C"
    annotation (Dialog(group="Power flow"));
  parameter Types.ReactivePower Q_c=0 "Base Reactive power for phase C"
    annotation (Dialog(group="Power flow"));

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
  Real[1, 6] TPhasePower=[P_a, P_b, P_c, Q_a, Q_b, Q_c]/S_p*DynFact;
  parameter Real[1, 9] ZIP_coef=[A_pa/100, B_pa/100, C_pa/100, A_pb/100, B_pb/
      100, C_pb/100, A_pc/100, B_pc/100, C_pc/100];

  // Calculating V and V2
  Real Va=sqrt((A.vr)^2 + (A.vi)^2);
  Real Vb=sqrt((B.vr)^2 + (B.vi)^2);
  Real Vc=sqrt((C.vr)^2 + (C.vi)^2);
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

  function PowerDefinition
    input Integer ModelType;
    input Real[1, 6] TPhasePower;
    input Real[1, 3] Coef;
    output Real[1, 6] Cor_Power;
    // Identifying input elements for the Coefficients
  protected
    Real coef_A=Coef[1, 1];
    Real coef_B=Coef[1, 2];
    Real coef_C=Coef[1, 3];
    // Identifying input elements for Power
    Real Pan=TPhasePower[1, 1];
    Real Pbn=TPhasePower[1, 2];
    Real Pcn=TPhasePower[1, 3];
    Real Qan=TPhasePower[1, 4];
    Real Qbn=TPhasePower[1, 5];
    Real Qcn=TPhasePower[1, 6];
    // Calculating Corrected Power
    Real Pa_cor=Pan*coef_A;
    Real Pb_cor=Pbn*coef_B;
    Real Pc_cor=Pcn*coef_C;
    Real Qa_cor=Qan*coef_A;
    Real Qb_cor=Qbn*coef_B;
    Real Qc_cor=Qcn*coef_C;
  algorithm
    if ModelType == 0 then
      Cor_Power := [Pan, Pbn, Pcn, Qan, Qbn, Qcn];
    elseif ModelType == 1 then
      Cor_Power := [Pa_cor, Pb_cor, Pc_cor, Qa_cor, Qb_cor, Qc_cor];
    end if;
  end PowerDefinition;

  Real[1, 6] Power=PowerDefinition(
      ModelType,
      TPhasePower,
      Coef);
  Real Pa=Power[1, 1];
  Real Pb=Power[1, 2];
  Real Pc=Power[1, 3];
  Real Qa=Power[1, 4];
  Real Qb=Power[1, 5];
  Real Qc=Power[1, 6];

equation
  Pa = (A.vr*A.ir + A.vi*A.ii);
  Qa = (A.vi*A.ir - A.vr*A.ii);
  Pb = (B.vr*B.ir + B.vi*B.ii);
  Qb = (B.vi*B.ir - B.vr*B.ii);
  Pc = (C.vr*C.ir + C.vi*C.ii);
  Qc = (C.vi*C.ir - C.vr*C.ii);

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false),
        graphics={Line(points={{-100,100},{100,100},{0,-100},{-100,100}}, color=
           {28,108,200}),Text(
          lineColor={28,108,200},
          extent={{-62,90},{66,45}},
          textString="Grounded-Wye Dynamic Load"),Text(
          origin={20,6},
          lineColor={28,108,200},
          extent={{-62,45},{22,30}},
          textString="PQ/ZIP Load")}),
    Documentation(info="<html>
<p>This is a three-phase wye load model that allows the user to vary the power consumed during the simulation.</p>
<p>The user needs to input the active (<strong><em>P_a</em></strong>, <strong><em>P_b</em></strong> and <strong><em>P_c</em></strong>) and reactive (<strong><em>Q_a</em></strong>, <strong><em>Q_b</em></strong> and <strong><em>Q_c</em></strong>) powers consumed by each phase.
Since the values come from independent parameters, the model allows the representation of unbalanced loads.</p>
<p>In addition, the model allows the load to be represented as constant power, or as a ZIP model.
In the first approach, the load consumes the same value of active and reactive powers by each phase throughout the simulation.
The latter approach allows the load to be represented as a sum of three terms: constant impedance, constant current and constant power. This means that, depending on voltage levels supplied, the load will consume different values of power.</p>
<p>In addition to that, the real input <strong><em>DynFact</em></strong> multiplies the power being consumed by the load.
This allows the load to vary over time during the simulation.
It is also important to note that <strong><em>DynFact</em></strong> multiplies all variables <strong><em>P_a</em></strong>, <strong><em>P_b</em></strong>, <strong><em>P_c</em></strong>, <strong><em>Q_a</em></strong>, <strong><em>Q_b</em></strong> and <strong><em>Q_c</em></strong>.
That means that this model does not allow load variation to be performed only in selected variables.</p>
</html>"));
end WyeDynLoad_3Ph;
