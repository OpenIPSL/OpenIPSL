within OpenIPSL.Electrical.Controls.PSSE.ES;
model ESURRY "AC1A Excitation System"
  import OpenIPSL.NonElectrical.Functions.SE;
  import OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.invFEX;
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter(
      VoltageReference(k=V_REF));
  extends OpenIPSL.Icons.VerifiedModel;
  parameter OpenIPSL.Types.Time T_R=0 "Regulator input filter time constant";
  parameter OpenIPSL.Types.Time T_1=0 "Regulator input filter time constant";
  parameter OpenIPSL.Types.Time T_A=0 "leadlag denominator (lag) time constant";
  parameter OpenIPSL.Types.Time T_B=0 "leadlag numerator (lead) time constant";
  parameter OpenIPSL.Types.Time T_C=0
    "leadlaglim denominator (lag) time constant";
  parameter OpenIPSL.Types.Time T_D=0
    "leadlaglim numerator (lead) time constant";
  parameter OpenIPSL.Types.Time T_E=0.8 "Exciter field time constant";
  parameter OpenIPSL.Types.PerUnit K_10=1 "";
  parameter OpenIPSL.Types.PerUnit K_16=1 "";
  parameter OpenIPSL.Types.PerUnit K_F=0.03
    "Rate feedback excitation system gain";
  parameter OpenIPSL.Types.Time T_F=1 "Rate feedback time const";
  parameter OpenIPSL.Types.PerUnit K_C=0.2
    "Rectifier loading factor proportional to commutating reactance";
  parameter OpenIPSL.Types.PerUnit K_D=0.48
    "Demagnetizing factor, function of exciter alternator reactances";
  parameter OpenIPSL.Types.PerUnit K_E=1 "Exciter field proportional constant";
  parameter OpenIPSL.Types.PerUnit E_1=5.25
    "Exciter output voltage for saturation factor S_E(E_1)";
  parameter OpenIPSL.Types.PerUnit E_2=7
    "Exciter output voltage for saturation factor S_E(E_2)";
  parameter OpenIPSL.Types.PerUnit S_EE_1=0.03
    "Exciter saturation factor at exciter output voltage E1";
  parameter OpenIPSL.Types.PerUnit S_EE_2=0.1
    "Exciter saturation factor at exciter output voltage E2";
  parameter OpenIPSL.Types.PerUnit V_RMAX=6.03 "Maximum exciter field output";
  parameter OpenIPSL.Types.PerUnit V_RMIN=-5.43 "Minimum exciter field output";
  OpenIPSL.NonElectrical.Continuous.SimpleLag simpleLag(
    K=1,
    T=T_R,
    y_start=ECOMP0)
    annotation (Placement(transformation(extent={{-164,-10},{-144,10}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag leadLag(
    K=1,
    T1=T_A,
    T2=T_B,
    y_start=((VR0 - (I_REF - (K_16*VFE0)))/K_10),
    x_start=((VR0 - (I_REF - (K_16*VFE0)))/K_10))
    annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag leadLag1(
    K=1,
    T1=T_C,
    T2=T_D,
    y_start=((VR0 - (I_REF - (K_16*VFE0)))/K_10),
    x_start=((VR0 - (I_REF - (K_16*VFE0)))/K_10))
    annotation (Placement(transformation(extent={{-24,-10},{-4,10}})));
  Modelica.Blocks.Math.Gain gain(k=K_10)
    annotation (Placement(transformation(extent={{4,-10},{24,10}})));
  Modelica.Blocks.Math.Add3 add3_2(k3=-1)
    annotation (Placement(transformation(extent={{40,-12},{60,8}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN)
    annotation (Placement(transformation(extent={{74,-12},{94,8}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.RotatingExciterWithDemagnetizationLimited
    rotatingExciterWithDemagnetization(
    T_E=T_E,
    K_E=K_E,
    E_1=E_1,
    E_2=E_2,
    S_EE_1=S_EE_1,
    S_EE_2=S_EE_2,
    redeclare replaceable Modelica.Blocks.Continuous.LimIntegrator sISO(
      outMin=0,
      k=1/rotatingExciterWithDemagnetization.T_E,
      initType=Modelica.Blocks.Types.Init.InitialOutput,
      y_start=rotatingExciterWithDemagnetization.Efd0,
      outMax=Modelica.Constants.inf),
    K_D=K_D,
    Efd0=VE0,
    Sum(k3=K_D))
    annotation (Placement(transformation(extent={{112,-10},{132,10}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.RectifierCommutationVoltageDrop
    rectifierCommutationVoltageDrop(K_C=K_C)
    annotation (Placement(transformation(extent={{158,-10},{178,10}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag simpleLag1(
    K=1,
    T=T_1,
    y_start=VFE0)
    annotation (Placement(transformation(extent={{-120,-110},{-100,-90}})));
  Modelica.Blocks.Math.Gain gain1(k=K_16)
    annotation (Placement(transformation(extent={{-62,-110},{-42,-90}})));
  Modelica.Blocks.Sources.Constant const(k=I_REF)
    annotation (Placement(transformation(extent={{-62,-74},{-42,-54}})));
  Modelica.Blocks.Math.Add3 add3_3(k2=-1)
    annotation (Placement(transformation(extent={{-16,-110},{4,-90}})));
  Modelica.Blocks.Continuous.Derivative washout(
    k=K_F,
    T=T_F,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    x_start=VFE0)
    annotation (Placement(transformation(extent={{10,-128},{30,-108}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-88,-10},{-68,10}})));
protected
  parameter Real Efd0(fixed=false);
  parameter Real V_REF(fixed=false);
  parameter Real I_REF(fixed=false);
  parameter Real ECOMP0(fixed=false);
  parameter Real VR0(fixed=false);
  parameter Real Ifd0(fixed=false);
  parameter Real VE0(fixed=false);
  parameter Real VFE0(fixed=false);

initial equation
  Efd0 = EFD0;
  ECOMP0 = ECOMP;
  Ifd0 = XADIFD;
  VE0 = invFEX(
    K_C=K_C,
    Efd0=Efd0,
    Ifd0=Ifd0);
  VFE0 = VE0*(SE(
    VE0,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2) + K_E) + Ifd0*K_D;

  VR0 = VFE0;
  V_REF = ((VR0-(I_REF-(K_16*VFE0)))/K_10) + ECOMP0;
  I_REF=(K_16*VFE0);
equation
  connect(ECOMP, simpleLag.u)
    annotation (Line(points={{-200,0},{-166,0}}, color={0,0,127}));
  connect(simpleLag.y, DiffV.u2) annotation (Line(points={{-143,0},{-136,0},{-136,
          -6},{-122,-6}}, color={0,0,127}));
  connect(leadLag.y, leadLag1.u)
    annotation (Line(points={{-35,0},{-26,0}}, color={0,0,127}));
  connect(leadLag1.y, gain.u)
    annotation (Line(points={{-3,0},{2,0}}, color={0,0,127}));
  connect(gain.y,add3_2. u1)
    annotation (Line(points={{25,0},{34,0},{34,6},{38,6}},
                                             color={0,0,127}));
  connect(add3_2.y, limiter.u)
    annotation (Line(points={{61,-2},{72,-2}}, color={0,0,127}));
  connect(limiter.y, rotatingExciterWithDemagnetization.I_C)
    annotation (Line(points={{95,-2},{102,-2},{102,0},{110.75,0}},
                                                   color={0,0,127}));
  connect(rotatingExciterWithDemagnetization.EFD,
    rectifierCommutationVoltageDrop.V_EX) annotation (Line(points={{133.25,0},{157,
          0}},                      color={0,0,127}));
  connect(rectifierCommutationVoltageDrop.EFD, EFD)
    annotation (Line(points={{179,0},{210,0}}, color={0,0,127}));
  connect(gain1.y,add3_3. u2)
    annotation (Line(points={{-41,-100},{-18,-100}}, color={0,0,127}));
  connect(const.y, add3_3.u1) annotation (Line(points={{-41,-64},{-30,-64},{-30,
          -92},{-18,-92}}, color={0,0,127}));
  connect(simpleLag1.y, gain1.u)
    annotation (Line(points={{-99,-100},{-64,-100}}, color={0,0,127}));
  connect(add3_3.y,add3_2. u2) annotation (Line(points={{5,-100},{26,-100},{26,-2},
          {38,-2}}, color={0,0,127}));
  connect(washout.u, gain1.u) annotation (Line(points={{8,-118},{-72,-118},{-72,
          -100},{-64,-100}}, color={0,0,127}));
  connect(washout.y, add3_2.u3) annotation (Line(points={{31,-118},{34,-118},{34,
          -10},{38,-10}}, color={0,0,127}));
  connect(rotatingExciterWithDemagnetization.V_FE, simpleLag1.u) annotation (
      Line(points={{110.75,-6.25},{106,-6.25},{106,-140},{-130,-140},{-130,-100},
          {-122,-100}}, color={0,0,127}));
  connect(XADIFD, rotatingExciterWithDemagnetization.XADIFD) annotation (Line(
        points={{80,-200},{80,-164},{122,-164},{122,-11.25}}, color={0,0,127}));
  connect(rectifierCommutationVoltageDrop.XADIFD,
    rotatingExciterWithDemagnetization.XADIFD) annotation (Line(points={{168,-11},
          {168,-42},{122,-42},{122,-11.25}}, color={0,0,127}));
  connect(VUEL,add3_3. u3) annotation (Line(points={{-130,-200},{-130,-148},{-30,
          -148},{-30,-108},{-18,-108}}, color={0,0,127}));
  connect(DiffV.y, add.u2) annotation (Line(points={{-99,0},{-96,0},{-96,-6},{-90,
          -6}}, color={0,0,127}));
  connect(VOTHSG, add.u1) annotation (Line(points={{-200,90},{-120,90},{-120,20},
          {-96,20},{-96,6},{-90,6}}, color={0,0,127}));
  connect(add.y, leadLag.u)
    annotation (Line(points={{-67,0},{-58,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-200,-200},{200,160}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}),
        graphics={             Text(
          extent={{-100,160},{100,100}},
          lineColor={28,108,200},
          textString="ESURRY")}),
    Documentation(info="<html>IEEE Type AC1A Excitation System Model.</html>",
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
<td><p><a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a></p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end ESURRY;
