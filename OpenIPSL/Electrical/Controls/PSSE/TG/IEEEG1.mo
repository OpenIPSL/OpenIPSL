within OpenIPSL.Electrical.Controls.PSSE.TG;
model IEEEG1 "IEEEG1 - 1981 IEEE Type 1 Turbine-Governor Model"
  extends Icons.VerifiedModel;
  Modelica.Blocks.Interfaces.RealInput SPEED_HP "Machine speed deviation from nominal [pu]"
    annotation (Placement(transformation(extent={{-180,-10},{-160,10}}),
                                                                       iconTransformation(extent={{-100,-20},{-60,20}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag imLeadLag(
    K=K,
    T1=T_2,
    T2=T_1,
    y_start=0)
    annotation (Placement(transformation(extent={{-146,-8},{-130,8}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=1,
    T=T_4,
    y_start=P0) annotation (Placement(transformation(extent={{-22,-8},{-6,8}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag imSimpleLag1(
    K=1,
    T=T_5,
    y_start=P0) annotation (Placement(transformation(extent={{20,-8},{36,8}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag imSimpleLag2(
    K=1,
    T=T_6,
    y_start=P0) annotation (Placement(transformation(extent={{60,-8},{76,8}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag imSimpleLag3(
    K=1,
    T=T_7,
    y_start=P0)
    annotation (Placement(transformation(extent={{100,-8},{116,8}})));
  Modelica.Blocks.Math.Gain imGain1(k=K_1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={8,24})));
  Modelica.Blocks.Math.Gain imGain2(k=K_2) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={8,-24})));
  Modelica.Blocks.Math.Gain imGain3(k=K_3) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={48,24})));
  Modelica.Blocks.Math.Gain imGain4(k=K_4) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={48,-24})));
  Modelica.Blocks.Math.Gain imGain5(k=K_5) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={88,24})));
  Modelica.Blocks.Math.Gain imGain6(k=K_6) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={88,-24})));
  Modelica.Blocks.Math.Gain imGain7(k=K_7) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={128,24})));
  Modelica.Blocks.Math.Gain imGain8(k=K_8) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={128,-24})));
  Modelica.Blocks.Interfaces.RealOutput PMECH_HP
    "Turbine mechanical power [pu]" annotation (Placement(transformation(extent={{160,40},{180,60}}),
                                 iconTransformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH_LP
    "Turbine mechanical power [pu]" annotation (Placement(transformation(extent={{160,-60},{180,-40}}),
                                   iconTransformation(extent={{100,-50},{120,-30}})));
  parameter Types.PerUnit P0=1 "Power reference of the governor";
  parameter Real K=20 "Regulation gain [1/pu]";
  parameter Types.Time T_1=1e-8 "Control time constant";
  parameter Types.Time T_2=1e-8 "Control time constant";
  parameter Types.Time T_3=0.1 "Control time constant";
  parameter Types.TimeAging U_o=0.1 "Max. rate if valve opening";
  parameter Types.TimeAging U_c=-0.1 "Max. rate if valve closing";
  parameter Types.PerUnit P_MAX=0.903 "Max. valve position";
  parameter Types.PerUnit P_MIN=0 "Min. valve position";
  parameter Types.Time T_4=0.4 "HP section time constant";
  parameter Types.PerUnit K_1=0.3 "Fraction of power from high pressure turbine (upper branch)";
  parameter Types.PerUnit K_2=0 "Fraction of power from high pressure turbine (lower branch)";
  parameter Types.Time T_5=9 "Reheat plus intermediate pressure turbine time constant";
  parameter Types.PerUnit K_3=0.4 "Fraction of power from intermediate pressure turbine (upper branch)";
  parameter Types.PerUnit K_4=0 "Fraction of power from intermediate pressure turbine (lower branch)";
  parameter Types.Time T_6=0.5 "Reheater plus intermediate pressure turbine time constant (second)";
  parameter Types.PerUnit K_5=0.3 "Fraction of power from low pressure turbine (first LP, upper branch)";
  parameter Types.PerUnit K_6=0 "Fraction of power from low pressure turbine (first LP, lower branch)";
  parameter Types.Time T_7=1e-8 "Low pressure turbine time constant";
  parameter Types.PerUnit K_7=0 "Fraction of power from low pressure turbine (second LP, upper branch)";
  parameter Types.PerUnit K_8=0 "Fraction of power from low pressure turbine (second LP, lower branch)";
  Modelica.Blocks.Sources.Constant Pref(k=P0) "Power reference "
    annotation (Placement(transformation(extent={{-146,26},{-130,42}})));
  Modelica.Blocks.Math.Add3 add3_1(k2=-1, k3=-1)
    annotation (Placement(transformation(extent={{-114,-8},{-98,8}})));
  Modelica.Blocks.Math.Gain gain(k=1/T_3)
    annotation (Placement(transformation(extent={{-92,-8},{-76,8}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=U_o, uMin=U_c)
    annotation (Placement(transformation(extent={{-70,-8},{-54,8}})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator(
    k=1,
    outMax=P_MAX,
    outMin=P_MIN,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=P0)
    annotation (Placement(transformation(extent={{-48,-8},{-32,8}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{56,44},{68,56}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{56,-56},{68,-44}})));
  Modelica.Blocks.Math.Add add2
    annotation (Placement(transformation(extent={{96,-56},{108,-44}})));
  Modelica.Blocks.Math.Add add3
    annotation (Placement(transformation(extent={{96,44},{108,56}})));
  Modelica.Blocks.Math.Add add4
    annotation (Placement(transformation(extent={{136,-56},{148,-44}})));
  Modelica.Blocks.Math.Add add5
    annotation (Placement(transformation(extent={{136,44},{148,56}})));
equation
  connect(SPEED_HP, imLeadLag.u) annotation (Line(points={{-170,0},{-147.6,0}}, color={0,0,127}));
  connect(Pref.y, add3_1.u1) annotation (Line(points={{-129.2,34},{-124,34},{-124,6.4},{-115.6,6.4}}, color={0,0,127}));
  connect(add3_1.u2, imLeadLag.y) annotation (Line(points={{-115.6,0},{-129.2,0}}, color={0,0,127}));
  connect(add3_1.y, gain.u) annotation (Line(points={{-97.2,0},{-93.6,0}}, color={0,0,127}));
  connect(gain.y, limiter.u) annotation (Line(points={{-75.2,0},{-71.6,0}}, color={0,0,127}));
  connect(limiter.y, limIntegrator.u) annotation (Line(points={{-53.2,0},{-49.6,0}}, color={0,0,127}));
  connect(imSimpleLag1.u, imSimpleLag.y) annotation (Line(points={{18.4,0},{-5.2,0}}, color={0,0,127}));
  connect(limIntegrator.y, imSimpleLag.u) annotation (Line(points={{-31.2,0},{-23.6,0}}, color={0,0,127}));
  connect(add3_1.u3, imSimpleLag.u) annotation (Line(points={{-115.6,-6.4},{-124,-6.4},{-124,-30},{-28,-30},{-28,0},{-23.6,0}},
                                                                                                                              color={0,0,127}));
  connect(imGain1.u, imSimpleLag.y) annotation (Line(points={{8,16.8},{8,0},{-5.2,0}}, color={0,0,127}));
  connect(imGain2.u, imSimpleLag.y) annotation (Line(points={{8,-16.8},{8,0},{-5.2,0}}, color={0,0,127}));
  connect(imSimpleLag1.y, imSimpleLag2.u) annotation (Line(points={{36.8,0},{58.4,0}}, color={0,0,127}));
  connect(imGain3.u, imSimpleLag2.u) annotation (Line(points={{48,16.8},{48,0},{58.4,0}}, color={0,0,127}));
  connect(imGain4.u, imSimpleLag2.u) annotation (Line(points={{48,-16.8},{48,0},{58.4,0}},color={0,0,127}));
  connect(add.u2, imGain3.y) annotation (Line(points={{54.8,46.4},{48,46.4},{48,30.6}}, color={0,0,127}));
  connect(imGain1.y, add.u1) annotation (Line(points={{8,30.6},{8,53.6},{54.8,53.6}}, color={0,0,127}));
  connect(add1.u1, imGain4.y) annotation (Line(points={{54.8,-46.4},{48,-46.4},{48,-30.6}}, color={0,0,127}));
  connect(imGain2.y, add1.u2) annotation (Line(points={{8,-30.6},{8,-53.6},{54.8,-53.6}}, color={0,0,127}));
  connect(imSimpleLag2.y, imSimpleLag3.u) annotation (Line(points={{76.8,0},{98.4,0}}, color={0,0,127}));
  connect(imGain5.u, imSimpleLag3.u) annotation (Line(points={{88,16.8},{88,0},{98.4,0}}, color={0,0,127}));
  connect(imGain6.u, imSimpleLag3.u) annotation (Line(points={{88,-16.8},{88,0},{98.4,0}}, color={0,0,127}));
  connect(imGain6.y, add2.u1) annotation (Line(points={{88,-30.6},{88,-46.4},{94.8,-46.4}}, color={0,0,127}));
  connect(add1.y, add2.u2) annotation (Line(points={{68.6,-50},{88,-50},{88,-53.6},{94.8,-53.6}}, color={0,0,127}));
  connect(add.y, add3.u1) annotation (Line(points={{68.6,50},{88,50},{88,53.6},{94.8,53.6}}, color={0,0,127}));
  connect(imGain5.y, add3.u2) annotation (Line(points={{88,30.6},{88,46.4},{94.8,46.4}}, color={0,0,127}));
  connect(imSimpleLag3.y, imGain7.u) annotation (Line(points={{116.8,0},{128,0},{128,16.8}}, color={0,0,127}));
  connect(imGain8.u, imGain7.u) annotation (Line(points={{128,-16.8},{128,16.8}},color={0,0,127}));
  connect(add4.y, PMECH_LP) annotation (Line(points={{148.6,-50},{170,-50}}, color={0,0,127}));
  connect(imGain8.y, add4.u1) annotation (Line(points={{128,-30.6},{128,-46.4},{134.8,-46.4}}, color={0,0,127}));
  connect(add2.y, add4.u2) annotation (Line(points={{108.6,-50},{128,-50},{128,-53.6},{134.8,-53.6}}, color={0,0,127}));
  connect(add3.y, add5.u1) annotation (Line(points={{108.6,50},{128,50},{128,53.6},{134.8,53.6}}, color={0,0,127}));
  connect(imGain7.y, add5.u2) annotation (Line(points={{128,30.6},{128,46.4},{134.8,46.4}}, color={0,0,127}));
  connect(add5.y, PMECH_HP) annotation (Line(points={{148.6,50},{170,50}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-160,-80},{160,80}}, preserveAspectRatio=
            false)),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}},
                                                        preserveAspectRatio=
            true), graphics={Rectangle(extent={{-100,100},{100,-100}},
                                                                     lineColor={28,108,200}),
                     Text(
          extent={{-50,20},{10,-20}},
          lineColor={28,108,200},
          textString="SPEED_HP"),Text(
          extent={{30,60},{90,20}},
          lineColor={28,108,200},
          textString="PMECH_HP"),Text(
          extent={{30,-20},{88,-60}},
          lineColor={28,108,200},
          textString="PMECH_LP"),Text(
          extent={{-100,160},{100,100}},
          lineColor={28,108,200},
          textString="IEEEG1")}),
    Documentation(info="<html>Governor IEEEG1, IEEG1_GE and
    IEEEG1D IEEE Type 1 Speed-Governor Model.</html>",
    revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
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
<td><p>Le Qi, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end IEEEG1;
