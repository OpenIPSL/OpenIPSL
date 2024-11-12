within OpenIPSL.Electrical.Controls.PSSE.ES;
model EXBAS
  "Basler Static Voltage Regulator Feeding DC or AC Rotating Exciter [PSSE-MODELS]"
 extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  import OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.invFEX;
  import OpenIPSL.NonElectrical.Functions.SE;
  import Modelica.ComplexMath.j;
  import 'abs' = Modelica.ComplexMath.abs;
  OpenIPSL.NonElectrical.Continuous.SimpleLag simpleLag(
    K=1,
    T=T_R,
    y_start=ECOMP0)
    annotation (Placement(transformation(extent={{-164,-10},{-144,10}})));
  parameter Types.Time T_R=0 "Regulator input filter time constant";
  parameter Types.PerUnit K_PR=140
    "Voltage regulator proportional gain";
  parameter Types.TimeAging K_IR=20 "Voltage regulator integral gain";
  parameter Types.PerUnit K_A=7 "Regulator output gain";
  parameter Types.Time T_A=0 "Regulator output time constant";
  parameter Types.Time T_B=0.03
    "Regulator denominator (lag) time constant";
  parameter Types.Time T_C=0.214
    "Regulator numerator (lead) time constant";
  parameter Types.PerUnit V_RMAX=12.546
    "Maximum exciter field voltage";
  parameter Types.PerUnit V_RMIN=-11.282
    "Minimum exciter field voltage";
  parameter Types.PerUnit K_F=0
    "Rate feedback excitation system stabilizer gain";
  parameter Types.Time T_F=1 "Rate feedback time const";
  parameter Types.Time T_F1=0 "Feedback lead time const";
  parameter Types.Time T_F2=0 "Feedback lag time const";
  parameter Types.PerUnit K_E=1 "Exciter field proportional constant";
  parameter Types.Time T_E=4.5 "Exciter field time constant";
  parameter Types.PerUnit K_C=0.2540
    "Rectifier loading factor proportional to commutating reactance";
  parameter Types.PerUnit K_D=0.463
    "Demagnetizing factor, function of exciter alternator reactances";
  parameter Types.PerUnit E_1=2.925
    "Exciter output voltage for saturation factor S_E(E_1)";
  parameter Types.PerUnit S_EE_1=0.53
    "Exciter saturation factor at exciter output voltage E1";
  parameter Types.PerUnit E_2=3.9
    "Exciter output voltage for saturation factor S_E(E_2)";
  parameter Types.PerUnit S_EE_2=0.67
    "Exciter saturation factor at exciter output voltage E2";
  Modelica.Blocks.Math.Add3 add3_1
    annotation (Placement(transformation(extent={{-92,-42},{-72,-22}})));
  Modelica.Blocks.Math.Add3 add3_2(k3=-1)
    annotation (Placement(transformation(extent={{-58,-42},{-38,-22}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag leadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    y_start=VR0/K_A,
    x_start=VR0/K_A)
    annotation (Placement(transformation(extent={{62,-36},{82,-16}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K_A,
    T=T_A,
    outMax=V_RMAX,
    outMin=V_RMIN,
    y_start=VR0)
    annotation (Placement(transformation(extent={{92,-36},{112,-16}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.RectifierCommutationVoltageDrop
    rectifierCommutationVoltageDrop(K_C=K_C)
    annotation (Placement(transformation(extent={{174,-10},{194,10}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.RotatingExciterWithDemagnetization
    rotatingExciterWithDemagnetizationLimited(
    T_E=T_E,
    K_E=K_E,
    E_1=E_1,
    E_2=E_2,
    S_EE_1=S_EE_1,
    S_EE_2=S_EE_2,
    K_D=K_D,
    Efd0=VE0)
    annotation (Placement(transformation(extent={{144,-10},{164,10}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag leadLag1(
    K=1,
    T1=T_F1,
    T2=T_F2,
    y_start=VR0,
    x_start=VR0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={104,-82})));
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    k=K_F,
    T=T_F,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    x_start=VR0)
    annotation (Placement(transformation(extent={{82,-92},{62,-72}})));
  Modelica.Blocks.Continuous.Integrator integrator(k=K_IR, y_start=VR0/K_A)
    annotation (Placement(transformation(extent={{-12,-18},{8,2}})));
  Modelica.Blocks.Math.Gain gain(k=K_PR)
    annotation (Placement(transformation(extent={{-12,-48},{8,-28}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{22,-36},{42,-16}})));
protected
  parameter Real VR0(fixed=false);
  parameter Real VFE0(fixed=false);
  parameter Real Ifd0(fixed=false);
  parameter Real VE0(fixed=false);
initial equation
  Ifd0 = XADIFD;
  // Finding initial value of excitation voltage, VE0, via going through conditions of FEX function
  VE0 = invFEX(
    K_C=K_C,
    Efd0=Efd0,
    Ifd0=Ifd0);
  // Case IN>0 not checked because it will be resolved in the next iteration
  VFE0 = VE0*(SE(
    VE0,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2) + K_E) + Ifd0*K_D;
  VR0 = VFE0;
  V_REF = ECOMP0;
equation
  connect(ECOMP, simpleLag.u)
    annotation (Line(points={{-200,0},{-166,0}}, color={0,0,127}));
  connect(DiffV.u2, simpleLag.y) annotation (Line(points={{-122,-6},{-134,-6},{-134,
          0},{-143,0}}, color={0,0,127}));
  connect(DiffV.y, add3_1.u1) annotation (Line(points={{-99,0},{-92,0},{-92,-24},
          {-94,-24}}, color={0,0,127}));
  connect(VOEL, add3_1.u3) annotation (Line(points={{-70,-200},{-70,-70},{-106,-70},
          {-106,-40},{-94,-40}}, color={0,0,127}));
  connect(add3_1.u2, VUEL) annotation (Line(points={{-94,-32},{-130,-32},{-130,-200}},
        color={0,0,127}));
  connect(add3_1.y, add3_2.u2)
    annotation (Line(points={{-71,-32},{-60,-32}}, color={0,0,127}));
  connect(VOTHSG, add3_2.u1)
    annotation (Line(points={{-200,90},{-60,90},{-60,-24}}, color={0,0,127}));
  connect(leadLag.y, simpleLagLim.u)
    annotation (Line(points={{83,-26},{90,-26}}, color={0,0,127}));
  connect(EFD, rectifierCommutationVoltageDrop.EFD)
    annotation (Line(points={{210,0},{195,0}}, color={0,0,127}));
  connect(rectifierCommutationVoltageDrop.V_EX,
    rotatingExciterWithDemagnetizationLimited.EFD)
    annotation (Line(points={{173,0},{165.25,0}}, color={0,0,127}));
  connect(XADIFD, rotatingExciterWithDemagnetizationLimited.XADIFD) annotation (
     Line(points={{80,-200},{80,-116},{154,-116},{154,-11.25}},
                                                              color={0,0,127}));
  connect(rectifierCommutationVoltageDrop.XADIFD,
    rotatingExciterWithDemagnetizationLimited.XADIFD) annotation (Line(points={{
          184,-11},{184,-20},{154,-20},{154,-11.25}}, color={0,0,127}));
  connect(simpleLagLim.y, rotatingExciterWithDemagnetizationLimited.I_C)
    annotation (Line(points={{113,-26},{122,-26},{122,0},{142.75,0}},
                                                                   color={0,0,127}));
  connect(leadLag1.u, rotatingExciterWithDemagnetizationLimited.I_C)
    annotation (Line(points={{116,-82},{122,-82},{122,0},{142.75,0}},
                                                                   color={0,0,127}));
  connect(leadLag1.y, imDerivativeLag.u)
    annotation (Line(points={{93,-82},{84,-82}}, color={0,0,127}));
  connect(imDerivativeLag.y, add3_2.u3) annotation (Line(points={{61,-82},{-60,-82},
          {-60,-40}}, color={0,0,127}));
  connect(add.u2, gain.y) annotation (Line(points={{20,-32},{14,-32},{14,-38},{9,
          -38}}, color={0,0,127}));
  connect(add.u1, integrator.y)
    annotation (Line(points={{20,-20},{20,-8},{9,-8}}, color={0,0,127}));
  connect(leadLag.u, add.y)
    annotation (Line(points={{60,-26},{43,-26}}, color={0,0,127}));
  connect(integrator.u, add3_2.y) annotation (Line(points={{-14,-8},{-28,-8},{-28,
          -32},{-37,-32}}, color={0,0,127}));
  connect(gain.u, add3_2.y) annotation (Line(points={{-14,-38},{-28,-38},{-28,-32},
          {-37,-32}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-200,-200},{200,160}}),
        graphics={Text(
          extent={{-66,194},{70,158}},
          textColor={28,108,200},
          textString="EXBAS")}), Icon(
        coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-58,142},{76,98}},
          textColor={28,108,200},
          textString="EXBAS")}),
                  Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>Basler Static Voltage Regulator Feeding dc or ac Rotating Exciter (PSS/E Manual)</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2024-10-05</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Eric Segerstrom, ALSETLab, RPI Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end EXBAS;
