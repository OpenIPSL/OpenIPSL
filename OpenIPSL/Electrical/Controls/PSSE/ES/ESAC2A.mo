within OpenIPSL.Electrical.Controls.PSSE.ES;
model ESAC2A "AC2A Excitation System [IEEE2005]"
import OpenIPSL.NonElectrical.Functions.SE;
  import OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.invFEX;
  extends Icons.VerifiedModel;
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  parameter Types.Time T_R=0 "Regulator input filter time constant";
  parameter Types.Time T_B=0 "Regulator denominator (lag) time constant";
  parameter Types.Time T_C=0 "Regulator numerator (lead) time constant";
  parameter Types.PerUnit K_A=400 "Regulator output gain";
  parameter Types.Time T_A=0.02 "Regulator output time constant";
  parameter Types.PerUnit V_AMAX=9 "Maximum regulator output";
  parameter Types.PerUnit V_AMIN=-5.43 "Minimum regulator output";
  parameter Types.PerUnit K_B = 1 "Second stage regulator gain";
  parameter Types.PerUnit V_RMAX=9 "Maximum exciter field output";
  parameter Types.PerUnit V_RMIN=-5.43 "Minimum exciter field output";
  parameter Types.Time T_E=0.8 "Exciter field time constant";
  parameter Types.PerUnit V_FEMAX=4.4 "Maximum exciter field current limit reference";
  parameter Types.PerUnit K_H = 0 "Exciter field current regulator feedback gain";
  parameter Types.PerUnit K_F=0.03 "Rate feedback excitation system stabilizer gain";
  parameter Types.Time T_F=1 "Rate feedback time constant";
  parameter Types.PerUnit K_C=0.2 "Rectifier loading factor proportional to commutating reactance";
  parameter Types.PerUnit K_D=0.48 "Demagnetizing factor, function of exciter alternator reactances";
  parameter Types.PerUnit K_E=1 "Exciter field proportional constant";
  parameter Types.PerUnit E_1=5.25 "Exciter output voltage for saturation factor S_E(E_1)";
  parameter Types.PerUnit E_2=7 "Exciter output voltage for saturation factor S_E(E_2)";
  parameter Types.PerUnit S_EE_1=0.03 "Exciter saturation factor at exciter output voltage E1";
  parameter Types.PerUnit S_EE_2=0.1 "Exciter saturation factor at exciter output voltage E2";
  NonElectrical.Logical.HV_GATE hV_GATE
    annotation (Placement(transformation(extent={{32,30},{52,50}})));
  NonElectrical.Logical.LV_GATE lV_GATE
    annotation (Placement(transformation(extent={{64,30},{84,50}})));
  NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    y_start=VR0/K_A,
    x_start=VR0/K_A)
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=1,
    y_start=ECOMP0,
    T=T_R) annotation (Placement(transformation(extent={{-170,-10},{-150,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=V_RMAX, uMin=V_RMIN)
    annotation (Placement(transformation(extent={{94,30},{114,50}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K_A,
    T=T_A,
    y_start=VR0,
    outMax=V_AMAX,
    outMin=V_AMIN)
    annotation (Placement(transformation(extent={{-32,0},{-12,20}})));
  Modelica.Blocks.Continuous.Derivative derivative(
    k=K_F,
    T=T_F,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=0,
    x_start=VFE0)
    annotation (Placement(transformation(extent={{38,-98},{18,-78}})));
  BaseClasses.RotatingExciterWithDemagnetizationVarLim
    rotatingExciterWithDemagnetization(
    T_E=T_E,
    K_E=K_E,
    E_1=E_1,
    E_2=E_2,
    S_EE_1=S_EE_1,
    S_EE_2=S_EE_2,
    K_D=K_D,
    Efd0=VE0) annotation (Placement(transformation(extent={{124,30},{144,50}})));
  Modelica.Blocks.Math.Add3 add3_1(k3=-1)
    annotation (Placement(transformation(extent={{-88,30},{-68,50}})));
  BaseClasses.RectifierCommutationVoltageDrop rectifierCommutationVoltageDrop(
      K_C=K_C)
    annotation (Placement(transformation(extent={{160,30},{180,50}})));
  Modelica.Blocks.Sources.Constant lowLim(k=0)
    annotation (Placement(transformation(extent={{180,70},{160,90}})));
  Modelica.Blocks.Sources.Constant FEMAX(k=V_FEMAX)
    annotation (Placement(transformation(extent={{40,120},{60,140}})));
  Modelica.Blocks.Math.Add DiffV1(k2=-K_D)
    annotation (Placement(transformation(extent={{80,120},{100,140}})));
  NonElectrical.Functions.ImSE se1(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2) annotation (Placement(transformation(
        extent={{-9,-6},{9,6}},
        rotation=180,
        origin={171,108})));
  Modelica.Blocks.Sources.Constant const(k=K_E)
    annotation (Placement(transformation(extent={{180,120},{160,140}})));
  Modelica.Blocks.Math.Add DiffV2
    annotation (Placement(transformation(extent={{150,108},{130,128}})));
  Modelica.Blocks.Math.Division division annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={110,80})));
  Modelica.Blocks.Math.Add DiffV3(k1=-1)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=180,
        origin={6,4})));
  Modelica.Blocks.Math.Gain gain(k=K_H)
    annotation (Placement(transformation(extent={{36,-54},{16,-34}})));
  Modelica.Blocks.Math.Gain gain1(k=K_B)
    annotation (Placement(transformation(extent={{0,30},{20,50}})));
protected
  parameter Real VR0(fixed=false);
  parameter Real Efd0(fixed=false);
  parameter Real Ifd0(fixed=false);
  parameter Real VE0(fixed=false);
  parameter Real VFE0(fixed=false);
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
  V_REF = VR0/K_A + ECOMP0;
equation
  connect(imLeadLag.y, simpleLagLim.u)
    annotation (Line(points={{-39,10},{-34,10}}, color={0,0,127}));
  connect(limiter1.y, rotatingExciterWithDemagnetization.I_C)
    annotation (Line(points={{115,40},{122.75,40}}, color={0,0,127}));
  connect(ECOMP, imSimpleLag.u)
    annotation (Line(points={{-200,0},{-172,0}}, color={0,0,127}));
  connect(VUEL,hV_GATE.u2) annotation (Line(points={{-130,-200},{-130,-22},{26,-22},{26,34},{30,34}},
                                   color={0,0,127}));
  connect(imSimpleLag.y, DiffV.u2) annotation (Line(points={{-149,0},{-132,0},{
          -132,-6},{-122,-6}}, color={0,0,127}));
  connect(add3_1.y, imLeadLag.u)
    annotation (Line(points={{-67,40},{-64,40},{-64,10},{-62,10}},
                                                 color={0,0,127}));
  connect(DiffV.y, add3_1.u2) annotation (Line(points={{-99,0},{-96,0},{-96,40},
          {-90,40}}, color={0,0,127}));
  connect(VOTHSG, add3_1.u1) annotation (Line(points={{-200,90},{-150,90},{-96,
          90},{-96,48},{-90,48}}, color={0,0,127}));
  connect(derivative.y, add3_1.u3) annotation (Line(points={{17,-88},{-94,-88},{
          -94,32},{-90,32}},
                         color={0,0,127}));
  connect(derivative.u, rotatingExciterWithDemagnetization.V_FE) annotation (
      Line(points={{40,-88},{120,-88},{120,33.75},{122.75,33.75}}, color={0,
          0,127}));
  connect(rotatingExciterWithDemagnetization.EFD,
    rectifierCommutationVoltageDrop.V_EX)
    annotation (Line(points={{145.25,40},{159,40}}, color={0,0,127}));
  connect(rectifierCommutationVoltageDrop.XADIFD,
    rotatingExciterWithDemagnetization.XADIFD) annotation (Line(points={{170,29},{170,-20},{134,-20},{134,28.75}},
                                                       color={0,0,127}));
  connect(rectifierCommutationVoltageDrop.EFD, EFD) annotation (Line(points={{
          181,40},{190,40},{190,0},{210,0}}, color={0,0,127}));
  connect(lV_GATE.y, limiter1.u)
    annotation (Line(points={{85,40},{92,40}}, color={0,0,127}));
  connect(lowLim.y, rotatingExciterWithDemagnetization.outMin) annotation (Line(
        points={{159,80},{150,80},{150,47.5},{145.25,47.5}}, color={0,0,127}));
  connect(FEMAX.y, DiffV1.u1) annotation (Line(points={{61,130},{68,130},{68,
          136},{78,136}}, color={0,0,127}));
  connect(DiffV1.u2, rotatingExciterWithDemagnetization.XADIFD) annotation (
      Line(points={{78,124},{68,124},{68,-20},{134,-20},{134,28.75}},
                   color={0,0,127}));
  connect(se1.VE_IN, EFD) annotation (Line(points={{180.9,108},{190,108},{190,0},
          {210,0}}, color={0,0,127}));
  connect(DiffV2.u1, const.y) annotation (Line(points={{152,124},{156,124},{156,
          130},{159,130}}, color={0,0,127}));
  connect(DiffV2.u2, se1.VE_OUT) annotation (Line(points={{152,112},{156,112},{
          156,108},{161.46,108}}, color={0,0,127}));
  connect(division.u1, DiffV1.y) annotation (Line(points={{116,92},{116,92},{116,128},{116,130},{101,130}},
                                         color={0,0,127}));
  connect(DiffV2.y, division.u2)
    annotation (Line(points={{129,118},{104,118},{104,92}}, color={0,0,127}));
  connect(division.y, rotatingExciterWithDemagnetization.outMax) annotation (
      Line(points={{110,69},{110,60},{118,60},{118,47.5},{122.75,47.5}}, color=
          {0,0,127}));
  connect(XADIFD, rotatingExciterWithDemagnetization.XADIFD) annotation (Line(points={{80,-200},{80,-140},{134,-140},{134,28.75}}, color={0,0,127}));
  connect(simpleLagLim.y, DiffV3.u2)
    annotation (Line(points={{-11,10},{-6,10}}, color={0,0,127}));
  connect(gain.u, rotatingExciterWithDemagnetization.V_FE) annotation (Line(
        points={{38,-44},{120,-44},{120,33.75},{122.75,33.75}}, color={0,0,127}));
  connect(gain.y, DiffV3.u1) annotation (Line(points={{15,-44},{-20,-44},{-20,-2},
          {-6,-2}}, color={0,0,127}));
  connect(DiffV3.y, gain1.u) annotation (Line(points={{17,4},{20,4},{20,24},{-14,
          24},{-14,40},{-2,40}}, color={0,0,127}));
  connect(gain1.y,hV_GATE.u1)
    annotation (Line(points={{21,40},{24,40},{24,46},{30,46}},
                                                           color={0,0,127}));
  connect(VOEL, lV_GATE.u2) annotation (Line(points={{-70,-200},{-70,-60},{58,-60},{58,34},{62,34}}, color={0,0,127}));
  connect(hV_GATE.y, lV_GATE.u1) annotation (Line(points={{53,40},{57.5,40},{57.5,46},{62,46}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-200,-200},{200,160}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}),
        graphics={ Text(
          extent={{-100,160},{100,100}},
          lineColor={28,108,200},
          textString="ESAC2A")}),
    Documentation(info="<html>IEEE Type AC2A Excitation System Model.</html>",
  revisions="<html><table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Manual</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-09</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>ALSETLab, Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end ESAC2A;
