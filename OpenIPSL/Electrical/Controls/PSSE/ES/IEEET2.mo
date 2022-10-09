within OpenIPSL.Electrical.Controls.PSSE.ES;
model IEEET2 "IEEE Type 2 Excitation System [IEEE1968]"
  extends Icons.VerifiedModel;
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  import
    OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.calculate_dc_exciter_params;
  parameter Types.Time T_R=0.02 "Regulator input filter time constant";
  parameter Types.PerUnit K_A=200.0 "Regulator output gain";
  parameter Types.Time T_A=0.001 "Regulator output time constant";
  parameter Types.PerUnit V_RMAX=6.08 "Maximum regulator output";
  parameter Types.PerUnit V_RMIN=-6.08 "Minimum regulator output";
  parameter Types.PerUnit K_E=1 "Exciter field proportional constant";
  parameter Types.Time T_E=0.55 "Exciter field time constant";
  parameter Types.PerUnit K_F=0.06 "Rate feedback excitation system stabilizer gain";
  parameter Types.Time T_F1=0.3 "Rate feedback excitation system stabilizer first time constant";
  parameter Types.Time T_F2=0.6 "Rate feedback excitation system stabilizer second time constant";
  parameter Types.PerUnit E_1=2.85 "Exciter output voltage for saturation factor S_E(E_1)";
  parameter Types.PerUnit S_EE_1=0.3 "Exciter saturation factor at exciter output voltage E1";
  parameter Types.PerUnit E_2=3.8 "Exciter output voltage for saturation factor S_E(E_2)";
  parameter Types.PerUnit S_EE_2=0.6 "Exciter saturation factor at exciter output voltage E2";
  Modelica.Blocks.Math.Add3 add3_1
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  NonElectrical.Continuous.SimpleLag simpleLag(
    K=1,
    T=T_F2,
    y_start=0) annotation (Placement(transformation(extent={{20,-60},{0,-40}})));
  Modelica.Blocks.Continuous.Derivative derivativeLag(
    k=K_F,
    y_start=0,
    T=T_F1,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    x_start=VR0)
    annotation (Placement(transformation(extent={{80,-60},{60,-40}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K_A,
    T=T_A,
    y_start=VR0,
    outMax=V_RMAX0,
    outMin=V_RMIN0)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  BaseClasses.RotatingExciter rotatingExciter(
    T_E=T_E,
    K_E=K_E0,
    E_1=E_1,
    E_2=E_2,
    S_EE_1=S_EE_1,
    S_EE_2=S_EE_2,
    Efd0=Efd0)
    annotation (Placement(transformation(extent={{140,-10},{160,10}})));
  NonElectrical.Continuous.SimpleLag TransducerDelay(
    K=1,
    T=T_R,
    y_start=ECOMP0)
    annotation (Placement(transformation(extent={{-170,-10},{-150,10}})));
  Modelica.Blocks.Math.Add Limiters annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,-150})));
protected
  parameter Types.PerUnit V_RMAX0(fixed=false);
  parameter Types.PerUnit V_RMIN0(fixed=false);
  parameter Types.PerUnit K_E0(fixed=false);
  //parameter Types.PerUnit Efd0(fixed=false);
  parameter Types.PerUnit SE_Efd0(fixed=false);
  parameter Types.PerUnit VR0(fixed=false);
initial equation
  SE_Efd0 = OpenIPSL.NonElectrical.Functions.SE(
    EFD0,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2);
  (V_RMAX0,V_RMIN0,K_E0) = calculate_dc_exciter_params(
    V_RMAX,
    V_RMIN,
    K_E,
    E_2,
    S_EE_2,
    Efd0,
    SE_Efd0);
  VR0 = Efd0*(K_E0 + SE_Efd0);
  V_REF = VR0/K_A + ECOMP0;
equation
  connect(add3_1.y, add.u1) annotation (Line(points={{-39,0},{-33.65,0},{-33.65,
          6},{-22,6}}, color={0,0,127}));
  connect(simpleLag.y, add.u2) annotation (Line(points={{-1,-50},{-34,-50},{-34,
          -6},{-22,-6}}, color={0,0,127}));
  connect(simpleLag.u, derivativeLag.y)
    annotation (Line(points={{22,-50},{59,-50}}, color={0,0,127}));
  connect(add.y, simpleLagLim.u)
    annotation (Line(points={{1,0},{58,0}}, color={0,0,127}));
  connect(rotatingExciter.EFD, EFD)
    annotation (Line(points={{161.25,0},{210,0}}, color={0,0,127}));
  connect(ECOMP, TransducerDelay.u)
    annotation (Line(points={{-200,0},{-172,0},{-172,0}}, color={0,0,127}));
  connect(TransducerDelay.y, DiffV.u2) annotation (Line(points={{-149,0},{-132,
          0},{-132,-6},{-122,-6}}, color={0,0,127}));
  connect(simpleLagLim.y, rotatingExciter.I_C)
    annotation (Line(points={{81,0},{122,0},{138.75,0}}, color={0,0,127}));
  connect(DiffV.y, add3_1.u2)
    annotation (Line(points={{-99,0},{-62,0},{-62,0}}, color={0,0,127}));
  connect(VOTHSG, add3_1.u1) annotation (Line(points={{-200,90},{-80,90},{-80,8},
          {-62,8}}, color={0,0,127}));
  connect(VUEL, Limiters.u1) annotation (Line(points={{-130,-200},{-130,-172},{
          -106,-172},{-106,-162}}, color={0,0,127}));
  connect(Limiters.u2, VOEL) annotation (Line(points={{-94,-162},{-94,-172},{-70,
          -172},{-70,-200}}, color={0,0,127}));
  connect(Limiters.y, add3_1.u3) annotation (Line(points={{-100,-139},{-100,-139},
          {-100,-20},{-80,-20},{-80,-8},{-62,-8}}, color={0,0,127}));
  connect(derivativeLag.u, rotatingExciter.I_C) annotation (Line(points={{82,-50},
          {120,-50},{120,0},{138.75,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-200,-200},{200,160}})),
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-100,160},{100,100}},
          textColor={28,108,200},
          textString="IEEET2")}),
    Documentation(info="<html>IEEE Type 2 Excitation System Model.</html>",
    revisions="<html><table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS&reg;E Manual</td>
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
end IEEET2;
