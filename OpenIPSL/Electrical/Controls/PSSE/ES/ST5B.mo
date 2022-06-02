within OpenIPSL.Electrical.Controls.PSSE.ES;
model ST5B "ST5B Excitation System [IEEE2005]"
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  parameter Types.Time T_R=0.025 "Regulator input filter time constant";
  parameter Types.Time T_C1=0.1 "Voltage regulator numerator (lead) time constant (first block)";
  parameter Types.Time T_B1=0.2 "Voltage regulator denominator (lag) time constant (first block)";
  parameter Types.Time T_C2=1 "Voltage regulator numerator (lead) time constant (second block)";
  parameter Types.Time T_B2=1 "Voltage regulator denominator (lag) time constant (second block)";
  parameter Types.PerUnit K_R=1 "Voltage regulator gain";
  parameter Types.PerUnit V_RMAX=10 "Maximum regulator output";
  parameter Types.PerUnit V_RMIN=-10 "Minimum regulator output";
  parameter Types.Time T_1=0.58 "Thyristor bridge firing control equivalent time constant";
  parameter Types.PerUnit K_C=0.3 "Rectifier loading factor proportional to commutating reactance";
  parameter Types.Time T_UC1=1 "UEL regulator numerator (lead) time constant (first block)";
  parameter Types.Time T_UB1=1 "UEL regulator denominator (lag) time constant (first block)";
  parameter Types.Time T_UC2=1 "UEL regulator numerator (lead) time constant (second block)";
  parameter Types.Time T_UB2=1 "UEL regulator denominator (lag) time constant (second block)";
  parameter Types.Time T_OC1=1 "OEL regulator numerator (lead) time constant (first block)";
  parameter Types.Time T_OB1=1 "OEL regulator denominator (lag) time constant (first block)";
  parameter Types.Time T_OC2=1 "OEL regulator numerator (lead) time constant (second block)";
  parameter Types.Time T_OB2=1 "OEL regulator denominator (lag) time constant (second block)";
  Modelica.Blocks.Math.Add VERR1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={-10,0})));
  NonElectrical.Logical.LV_GATE lV_Gate
    annotation (Placement(transformation(extent={{-52,-10},{-32,10}})));
  NonElectrical.Logical.HV_GATE hV_Gate
    annotation (Placement(transformation(extent={{-86,-10},{-66,10}})));
  NonElectrical.Continuous.LeadLagLim imLimitedLeadLag(
    K=1,
    outMax=V_RMAX/K_R,
    T1=T_C1,
    T2=T_B1,
    outMin=V_RMIN/K_R,
    y_start=VR0/K_R)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  NonElectrical.Continuous.LeadLagLim imLimitedLeadLag2(
    K=1,
    outMax=V_RMAX/K_R,
    T1=T_C2,
    T2=T_B2,
    outMin=V_RMIN/K_R,
    y_start=VR0/K_R)
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Blocks.Math.Gain K_r(k=K_R) annotation (Placement(transformation(
        extent={{-10,-9.5},{10,9.5}},
        origin={90,0.5})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN)
    annotation (Placement(transformation(extent={{108,-10},{128,10}})));
  Modelica.Blocks.Math.Add VERR2(k1=-1, k2=1) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        origin={150,0})));
  Modelica.Blocks.Math.Gain K_c(k=K_C) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={130,-92})));
  NonElectrical.Continuous.LeadLagLim imLimitedLeadLag1(
    K=1,
    T1=T_UC1,
    T2=T_UB1,
    outMin=V_RMIN/K_R,
    y_start=VR0/K_R,
    outMax=V_RMAX/K_R)
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  NonElectrical.Continuous.LeadLagLim imLimitedLeadLag3(
    K=1,
    outMax=V_RMAX/K_R,
    T1=T_UC1,
    T2=T_UB1,
    outMin=V_RMIN/K_R,
    y_start=VR0/K_R)
    annotation (Placement(transformation(extent={{50,-60},{70,-40}})));
  NonElectrical.Continuous.LeadLagLim imLimitedLeadLag4(
    K=1,
    outMax=V_RMAX/K_R,
    T1=T_OC1,
    T2=T_OB1,
    outMin=V_RMIN/K_R,
    y_start=VR0/K_R)
    annotation (Placement(transformation(extent={{20,-100},{40,-80}})));
  NonElectrical.Continuous.LeadLagLim imLimitedLeadLag5(
    K=1,
    outMax=V_RMAX/K_R,
    T1=T_OC1,
    T2=T_OB1,
    outMin=V_RMIN/K_R,
    y_start=VR0/K_R)
    annotation (Placement(transformation(extent={{50,-100},{70,-80}})));
  NonElectrical.Continuous.SimpleLagLimVar simpleLagLimVar(
    K=1,
    T=T_1,
    y_start=Efd0)
    annotation (Placement(transformation(extent={{174,-10},{194,10}})));
  Modelica.Blocks.Math.Gain high(k=V_RMAX) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={106,-30})));
  Modelica.Blocks.Math.Gain low(k=V_RMIN) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={104,-70})));
  NonElectrical.Continuous.SimpleLag TransducerDelay(
    K=1,
    T=T_R,
    y_start=ECOMP0) annotation (Placement(transformation(extent={{-170,-10},{-150,10}})));
protected
  parameter Types.PerUnit VR0(fixed=false);
initial equation
  VR0 = Efd0 + K_C*XADIFD;
  V_REF = VR0/K_R + ECOMP;
equation
  connect(VERR1.y, imLimitedLeadLag.u) annotation (Line(points={{1,0},{1,0},{18,0}}, color={0,0,127}));
  connect(imLimitedLeadLag.y, imLimitedLeadLag2.u) annotation (Line(points={{41,0},{41,0},{48,0}}, color={0,0,127}));
  connect(imLimitedLeadLag1.u, imLimitedLeadLag.u) annotation (Line(points={{18,-50},{8,-50},{8,0},{18,0}}, color={0,0,127}));
  connect(imLimitedLeadLag1.y, imLimitedLeadLag3.u) annotation (Line(points={{41,-50},{41,-50},{48,-50}}, color={0,0,127}));
  connect(imLimitedLeadLag4.u, imLimitedLeadLag.u) annotation (Line(points={{18,-90},{8,-90},{8,0},{18,0}}, color={0,0,127}));
  connect(VERR2.y, simpleLagLimVar.u) annotation (Line(points={{161,0},{161,0},{172,0}}, color={0,0,127}));
  connect(low.y, simpleLagLimVar.outMin) annotation (Line(points={{115,-70},{176,-70},{176,-14}}, color={0,0,127}));
  connect(high.y, simpleLagLimVar.outMax) annotation (Line(points={{117,-30},{168,-30},{168,32},{192,32},{192,14}}, color={0,0,127}));
  connect(K_c.y, VERR2.u1) annotation (Line(points={{130,-81},{130,-81},{130,-6},{138,-6}}, color={0,0,127}));
  connect(imLimitedLeadLag4.y, imLimitedLeadLag5.u) annotation (Line(points={{41,-90},{41,-90},{48,-90}}, color={0,0,127}));
  connect(imLimitedLeadLag2.y, K_r.u) annotation (Line(points={{71,0},{78,0},{78,0.5}}, color={0,0,127}));
  connect(lV_Gate.y, VERR1.u2) annotation (Line(points={{-31,0},{-28,0},{-28,-6},{-22,-6}},
                                                                              color={0,0,127}));
  connect(K_r.y, limiter.u) annotation (Line(points={{101,0.5},{104.5,0.5},{104.5,0},{106,0}}, color={0,0,127}));
  connect(limiter.y, VERR2.u2) annotation (Line(points={{129,0},{132,0},{132,6},{138,6}}, color={0,0,127}));
  connect(simpleLagLimVar.y, EFD) annotation (Line(points={{195,0},{210,0},{210,0}}, color={0,0,127}));
  connect(ECOMP, TransducerDelay.u) annotation (Line(points={{-200,0},{-172,0},{-172,0}}, color={0,0,127}));
  connect(TransducerDelay.y, DiffV.u2) annotation (Line(points={{-149,0},{-132,0},{-132,-6},{-122,-6}}, color={0,0,127}));
  connect(high.u, TransducerDelay.u) annotation (Line(points={{94,-30},{-178,-30},{-178,0},{-172,0}}, color={0,0,127}));
  connect(low.u, TransducerDelay.u) annotation (Line(points={{92,-70},{80,-70},{80,-30},{-178,-30},{-178,0},{-172,0}}, color={0,0,127}));
  connect(VOTHSG, VERR1.u1) annotation (Line(points={{-200,90},{-28,90},{-28,6},{-22,6}}, color={0,0,127}));
  connect(XADIFD, K_c.u) annotation (Line(points={{80,-200},{80,-200},{80,-124},
          {80,-120},{130,-120},{130,-104}}, color={0,0,127}));
  connect(hV_Gate.y, lV_Gate.u1) annotation (Line(points={{-65,0},{-60,0},{-60,6},{-54,6}}, color={0,0,127}));
  connect(lV_Gate.u2, VOEL) annotation (Line(points={{-54,-6},{-60,-6},{-60,-100},{-70,-100},{-70,-200}}, color={0,0,127}));
  connect(hV_Gate.u2, VUEL) annotation (Line(points={{-88,-6},{-94,-6},{-94,-100},{-130,-100},{-130,-200}}, color={0,0,127}));
  connect(DiffV.y, hV_Gate.u1) annotation (Line(points={{-99,0},{-94,0},{-94,6},{-88,6}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-200,-200},{200,160}},
        grid={2,2})),
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=true,
        grid={2,2}), graphics={Text(
          extent={{-100,160},{100,100}},
          lineColor={28,108,200},
          textString="ST5B")}),
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
end ST5B;
