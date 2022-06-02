within OpenIPSL.Electrical.Controls.PSSE.ES;
model IEEEX1 "1979 IEEE Type 1 Excitation System Model and 1981 IEEE Type DC1 Model"
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  import
    OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.calculate_dc_exciter_params;
  parameter Types.Time T_R=0 "Regulator input filter time constant";
  parameter Types.PerUnit K_A=40 "Regulator output gain";
  parameter Types.Time T_A=0.04 "Regulator output time constant";
  parameter Types.Time T_B=0 "Regulator denominator (lag) time constant";
  parameter Types.Time T_C=0 "Regulator numerator (lead) time constant";
  parameter Types.PerUnit V_RMAX=7.3 "Maximum regulator output";
  parameter Types.PerUnit V_RMIN=-7.3 "Minimum regulator output";
  parameter Types.PerUnit K_E=1 "Exciter field proportional constant";
  parameter Types.Time T_E=0.8 "Exciter field time constant";
  parameter Types.PerUnit K_F=0.03 "Rate feedback excitation system stabilizer gain";
  parameter Types.Time T_F=1 "Rate feedback time constant";
  parameter Types.PerUnit E_1=2.4 "Exciter output voltage for saturation factor S_E(E_1)";
  parameter Types.PerUnit S_EE_1=0.03 "Exciter saturation factor at exciter output voltage E1";
  parameter Types.PerUnit E_2=5.0000 "Exciter output voltage for saturation factor S_E(E_2)";
  parameter Types.PerUnit S_EE_2=0.50000 "Exciter saturation factor at exciter output voltage E2";
  NonElectrical.Continuous.LeadLag LL(
    T1=T_C,
    T2=T_B,
    K=1,
    y_start=VR0/K_A,
    x_start=V_REF - ECOMP0)
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Blocks.Math.Add3 V_Erro1(k3=-1)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    k=K_F,
    T=T_F,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    x_start=Efd0)
    annotation (Placement(transformation(extent={{80,-60},{60,-40}})));
  Modelica.Blocks.Math.Add3 V_Erro2
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  NonElectrical.Continuous.SimpleLagLim SL(
    K=K_A,
    T=T_A,
    y_start=VR0,
    outMax=V_RMAX0,
    outMin=V_RMIN0)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  BaseClasses.RotatingExciter rotatingExciter(
    T_E=T_E,
    E_1=E_1,
    E_2=E_2,
    S_EE_1=S_EE_1,
    S_EE_2=S_EE_2,
    Efd0=Efd0,
    K_E=K_E0)
    annotation (Placement(transformation(extent={{120,-20},{160,20}})));
  NonElectrical.Continuous.SimpleLag TransducerDelay(
    K=1,
    T=T_R,
    y_start=ECOMP0)
    annotation (Placement(transformation(extent={{-170,-10},{-150,10}})));
protected
  parameter Types.PerUnit SE_Efd0(fixed=false);
  parameter Types.PerUnit VR0(fixed=false);
  parameter Types.PerUnit V_RMAX0(fixed=false);
  parameter Types.PerUnit K_E0(fixed=false);
  parameter Types.PerUnit V_RMIN0(fixed=false);
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
  connect(V_Erro1.y, LL.u)
    annotation (Line(points={{-19,0},{-2,0}}, color={0,0,127}));
  connect(LL.y, SL.u)
    annotation (Line(points={{21,0},{58,0}}, color={0,0,127}));
  connect(DiffV.y, V_Erro1.u2)
    annotation (Line(points={{-99,0},{-42,0}}, color={0,0,127}));
  connect(SL.y, rotatingExciter.I_C)
    annotation (Line(points={{81,0},{117.5,0}}, color={0,0,127}));
  connect(rotatingExciter.EFD, EFD)
    annotation (Line(points={{162.5,0},{210,0}}, color={0,0,127}));
  connect(imDerivativeLag.y, V_Erro1.u3) annotation (Line(points={{59,-50},{-50,
          -50},{-50,-8},{-42,-8}}, color={0,0,127}));
  connect(imDerivativeLag.u, EFD) annotation (Line(points={{82,-50},{180,-50},{
          180,0},{210,0}}, color={0,0,127}));
  connect(VOTHSG, V_Erro2.u1) annotation (Line(points={{-200,90},{-100,90},{-100,
          58},{-82,58}}, color={0,0,127}));
  connect(VUEL, V_Erro2.u2) annotation (Line(points={{-130,-200},{-130,-200},{-130,
          -30},{-130,-28},{-94,-28},{-94,50},{-82,50}}, color={0,0,127}));
  connect(VOEL, V_Erro2.u3) annotation (Line(points={{-70,-200},{-70,20},{-88,
          20},{-88,42},{-82,42}}, color={0,0,127}));
  connect(V_Erro2.y, V_Erro1.u1) annotation (Line(points={{-59,50},{-50,50},{-50,
          8},{-42,8}}, color={0,0,127}));
  connect(TransducerDelay.y, DiffV.u2) annotation (Line(points={{-149,0},{-132,
          0},{-132,-6},{-122,-6}}, color={0,0,127}));
  connect(TransducerDelay.u, ECOMP)
    annotation (Line(points={{-172,0},{-200,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-200,-200},{200,160}},
        grid={2,2})),
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={Text(
          extent={{-100,160},{100,100}},
          lineColor={28,108,200},
          textString="IEEEX1")}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS&reg;E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2016-04-29</td>
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
end IEEEX1;
