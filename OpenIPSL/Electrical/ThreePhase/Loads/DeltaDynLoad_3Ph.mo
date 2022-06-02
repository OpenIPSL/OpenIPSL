within OpenIPSL.Electrical.ThreePhase.Loads;
model DeltaDynLoad_3Ph "Variable three-phase delta load"
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
  parameter Types.ActivePower P_ab=1e6 "Active power for line AB"
    annotation (Dialog(group="Power flow"));
  parameter Types.ReactivePower Q_ab=0 "Reactive power for line AB"
    annotation (Dialog(group="Power flow"));
  parameter Types.ActivePower P_bc=1e6 "Active power for line BC"
    annotation (Dialog(group="Power flow"));
  parameter Types.ReactivePower Q_bc=0 "Reactive power for line BC"
    annotation (Dialog(group="Power flow"));
  parameter Types.ActivePower P_ca=1e6 "Active power for line CA"
    annotation (Dialog(group="Power flow"));
  parameter Types.ReactivePower Q_ca=0 "Reactive power for line CA"
    annotation (Dialog(group="Power flow"));
  parameter Real A_ab=0 "Percentage of Constant Power Load for Line AB (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real B_ab=0 "Percentage of Constant Current Load for Line AB (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real C_ab=0 "Percentage of Constant Impedance Load for Line AB (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real A_bc=0 "Percentage of Constant Power Load for Line BC (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real B_bc=0 "Percentage of Constant Current Load for Line BC (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real C_bc=0
    "Percentage of Constant Impedance Load] for Line BC (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real A_ca=0 "Percentage of Constant Power Load for Line CA (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real B_ca=0 "Percentage of Constant Current Load for Line CA (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real C_ca=0 "Percentage of Constant Impedance Load for Line CA (%)"
    annotation (Dialog(group="Load Parameters for ZIP Model"));

protected
  Real[1, 6] TPhasePower=[P_ab, P_bc, Pca, Q_ab, Q_bc, Q_ca]/S_p*DynFact;
  parameter Real[1, 9] ZIP_coef=[A_ab/100, B_ab/100, C_ab/100, A_bc/100, B_bc/
      100, C_bc/100, A_ca/100, B_ca/100, C_ca/100];

  // Calculating the Line Voltage in p.u.
  Real Vabr=(A.vr - B.vr)/sqrt(3);
  Real Vabi=(A.vi - B.vi)/sqrt(3);
  Real Vbcr=(B.vr - C.vr)/sqrt(3);
  Real Vbci=(B.vi - C.vi)/sqrt(3);
  Real Vcar=(C.vr - A.vr)/sqrt(3);
  Real Vcai=(C.vi - A.vi)/sqrt(3);

  // Calculating the Magnitude of V and V squared
  Real Vab=sqrt(Vabr^2 + Vabi^2);
  Real Vbc=sqrt(Vbcr^2 + Vbci^2);
  Real Vca=sqrt(Vcar^2 + Vcai^2);
  Real Vab2=Vab^2;
  Real Vbc2=Vbc^2;
  Real Vca2=Vca^2;

  // Calculating the Coefficients for Adjusting the Power
  Real Coef_A=ZIP_coef[1, 1] + ZIP_coef[1, 2]*Vab + ZIP_coef[1, 3]*Vab2;
  Real Coef_B=ZIP_coef[1, 4] + ZIP_coef[1, 5]*Vbc + ZIP_coef[1, 6]*Vbc2;
  Real Coef_C=ZIP_coef[1, 7] + ZIP_coef[1, 8]*Vca + ZIP_coef[1, 9]*Vca2;

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
    parameter Real coef_A=Coef[1, 1];
    parameter Real coef_B=Coef[1, 2];
    parameter Real coef_C=Coef[1, 3];
    // Identifying input elements for Power
    parameter Real Pab_cor=TPhasePower[1, 1]*coef_A;
    parameter Real Pbc_cor=TPhasePower[1, 2]*coef_B;
    parameter Real Pca_cor=TPhasePower[1, 3]*coef_C;
    parameter Real Qab_cor=TPhasePower[1, 4]*coef_A;
    parameter Real Qbc_cor=TPhasePower[1, 5]*coef_B;
    parameter Real Qca_cor=TPhasePower[1, 6]*coef_C;
  algorithm
    Cor_Power := [Pab_cor, Pbc_cor, Pca_cor, Qab_cor, Qbc_cor, Qca_cor];
  end PowerDefinition;

  Real[1, 6] Power=PowerDefinition(
      ModelType,
      TPhasePower,
      Coef);
  Real Pab=Power[1, 1];
  Real Pbc=Power[1, 2];
  Real Pca=Power[1, 3];
  Real Qab=Power[1, 4];
  Real Qbc=Power[1, 5];
  Real Qca=Power[1, 6];

  // Calculating the Line Current in Delta Load:

  Real Iabr=(Pab*Vabr + Qab*Vabi)/Vab2;
  Real Iabi=(Pab*Vabi - Qab*Vabr)/Vab2;
  Real Ibcr=(Pbc*Vbcr + Qbc*Vbci)/Vbc2;
  Real Ibci=(Pbc*Vbci - Qbc*Vbcr)/Vbc2;
  Real Icar=(Pca*Vcar + Qca*Vcai)/Vca2;
  Real Icai=(Pca*Vcai - Qca*Vcar)/Vca2;

equation

  A.ir = (Iabr - Icar)/sqrt(3);
  A.ii = (Iabi - Icai)/sqrt(3);
  B.ir = (Ibcr - Iabr)/sqrt(3);
  B.ii = (Ibci - Iabi)/sqrt(3);
  C.ir = (Icar - Ibcr)/sqrt(3);
  C.ii = (Icai - Ibci)/sqrt(3);

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false),
        graphics={Line(points={{-100,100},{100,100},{0,-100},{-100,100}}, color=
           {28,108,200}),Text(
          lineColor={28,108,200},
          extent={{-62,90},{66,45}},
          textString="Delta Dynamic Load"),Text(
          origin={20,6},
          lineColor={28,108,200},
          extent={{-62,45},{22,30}},
          textString="PQ/ZIP Load")}),
    Documentation(info="<html>
<p>This is a three-phase delta load model that allows the user to vary the power consumed during the simulation.</p>
<p>The user needs to input the active (<strong><em>P_ab</em></strong>, <strong><em>P_bc</em></strong> and <strong><em>P_ca</em></strong>) and reactive (<strong><em>Q_ab</em></strong>, <strong><em>Q_bc</em></strong> and <strong><em>Q_ca</em></strong>) powers consumed between phases.
Since the values come from independent parameters, the model allows the representation of unbalanced loads.</p>
<p>In addition, the model allows the load to be represented as constant power, or as a ZIP model.
In the first approach, the load consumes the same value of active and reactive powers between phases throughout the simulation.
The latter approach allows the load to be represented as a sum of three terms: constant impedance, constant current and constant power. This means that, depending on voltage levels supplied, the load will consume different values of power.</p>
<p>In addition to that, the real input <strong><em>DynFact</em></strong> multiplies the power being consumed by the load.
This allows the load to vary over time during the simulation.
It is also important to note that <strong><em>DynFact</em></strong> multiplies all variables <strong><em>P_ab</em></strong>, <strong><em>P_bc</em></strong>, <strong><em>P_ca</em></strong>, <strong><em>Q_ab</em></strong>, <strong><em>Q_bc</em></strong> and <strong><em>Q_ca</em></strong>.
That means that this model does not allow load variation to be performed only in selected variables. </p>
</html>"));
end DeltaDynLoad_3Ph;
