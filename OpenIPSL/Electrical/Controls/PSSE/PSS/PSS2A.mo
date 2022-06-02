within OpenIPSL.Electrical.Controls.PSSE.PSS;
model PSS2A "PSS2A - Dual-Input Stabilizer Model [IEEE1992]"
  extends BaseClasses.BasePSS;
  parameter Real T_w1=10 "Washout 1 time constant";
  parameter Real T_w2=10 "Washout 2 time constant";
  parameter Real T_6=1e-9 "Lag 1 time constant";
  parameter Real T_w3=10 "Washout 3 time constant";
  parameter Real T_w4=1e-9 "Washout 4 time constant";
  parameter Real T_7=10 "Lag 2 time constant";
  parameter Real K_S2=0.99 "Lag 2 gain";
  parameter Real K_S3=1 "gain";
  parameter Real T_8=0.5 "Ramp-tracking filter time constant";
  parameter Real T_9=0.1 "Ramp-tracking filter time constant";
  parameter Real K_S1=20 "PSS gain";
  parameter Real T_1=0.15
    "Leadlag1 time constant (data from IEEE std, not representative, need to be tuned following system parameters)";
  parameter Real T_2=0.025 "Leadlag1 time constant";
  parameter Real T_3=0.15 "Leadlag2 time constant";
  parameter Real T_4=0.025 "Leadlag2 time constant";
  parameter Real V_STMAX=0.1 "PSS output limiation";
  parameter Real V_STMIN=-0.1 "PSS output limiation";
  parameter Integer M = 5 "Ramp tracking filter coefficient";
  parameter Integer N = 1 "Ramp tracking filter coefficient";
  OpenIPSL.NonElectrical.Continuous.LeadLag Leadlag1(
    K=1,
    T1=T_1,
    T2=T_2,
    y_start=0,
    x_start=0) annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag Leadlag2(
    K=1,
    T1=T_3,
    T2=T_4,
    y_start=0,
    x_start=0) annotation (Placement(transformation(extent={{120,-10},{140,10}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag SimpleLag1(
    K=1,
    T=T_6,
    y_start=0) annotation (Placement(transformation(extent={{-100,30},{-80,50}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag SimpleLag2(
    K=K_S2,
    T=T_7,
    y_start=0) annotation (Placement(transformation(extent={{-100,-50},{-80,-30}})));
  Modelica.Blocks.Math.Add add(k2=+K_S3) annotation (Placement(transformation(extent={{-60,24},{-40,44}})));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Modelica.Blocks.Math.Gain gain(k=K_S1) annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_STMAX, uMin=V_STMIN) annotation (Placement(transformation(extent={{160,-10},{180,10}})));
  NonElectrical.Continuous.RampTrackingFilter rampTrackingFilter(
    M=M,
    N=N,
    T_1=T_8,
    T_2=T_9) annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag(
    K=T_w1,
    T=T_w1,
    y_start=0) annotation (Placement(transformation(extent={{-180,30},{-160,50}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag1(
    y_start=0,
    K=T_w2,
    T=T_w2) annotation (Placement(transformation(extent={{-140,30},{-120,50}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag2(
    y_start=0,
    K=T_w3,
    T=T_w3) annotation (Placement(transformation(extent={{-180,-50},{-160,-30}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag3(
    y_start=0,
    K=T_w4,
    T=T_w4) annotation (Placement(transformation(extent={{-140,-50},{-120,-30}})));
equation
  connect(SimpleLag1.y, add.u1) annotation (Line(points={{-79,40},{-62,40}}, color={0,0,127}));
  connect(SimpleLag2.y, add.u2) annotation (Line(points={{-79,-40},{-68,-40},{-68,28},{-62,28}},
                                                                                               color={0,0,127}));
  connect(add1.u2, add.u2) annotation (Line(points={{28,-6},{12,-6},{12,-40},{-68,-40},{-68,28},{-62,28}},
                                                                                                         color={0,0,127}));
  connect(add1.y, gain.u) annotation (Line(points={{51,0},{58,0}}, color={0,0,127}));
  connect(gain.y, Leadlag1.u) annotation (Line(points={{81,0},{88,0}}, color={0,0,127}));
  connect(Leadlag1.y, Leadlag2.u) annotation (Line(points={{111,0},{118,0}}, color={0,0,127}));
  connect(Leadlag2.y, limiter.u) annotation (Line(points={{141,0},{158,0}}, color={0,0,127}));
  connect(rampTrackingFilter.y, add1.u1) annotation (Line(points={{1,30},{12,30},{12,6},{28,6}}, color={0,0,127}));
  connect(derivativeLag.y, derivativeLag1.u) annotation (Line(points={{-159,40},{-142,40}}, color={0,0,127}));
  connect(derivativeLag1.y, SimpleLag1.u) annotation (Line(points={{-119,40},{-102,40}}, color={0,0,127}));
  connect(derivativeLag3.u, derivativeLag2.y) annotation (Line(points={{-142,-40},{-159,-40}}, color={0,0,127}));
  connect(derivativeLag3.y, SimpleLag2.u) annotation (Line(points={{-119,-40},{-102,-40}},
                                                                                         color={0,0,127}));
  connect(V_S1, derivativeLag.u)
    annotation (Line(points={{-220,40},{-182,40}}, color={0,0,127}));
  connect(V_S2, derivativeLag2.u) annotation (Line(points={{-220,-40},{-182,-40}},
                                  color={0,0,127}));
  connect(limiter.y, VOTHSG)
    annotation (Line(points={{181,0},{210,0}}, color={0,0,127}));
  connect(add.y, rampTrackingFilter.u)
    annotation (Line(points={{-39,34},{-30,34},{-30,30},{-22,30}},
                                                            color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,-80},{200,80}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                                                                                    graphics={ Text(
          extent={{-40,80},{40,40}},
          lineColor={28,108,200},
          textString="PSS2A")}),
    Documentation(revisions="<html>
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
<td><p>Authors</p></td>
<td><p><a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a></p>
    <p><a href=\"https://github.com/GiuseppeLaera\">@GiuseppeLaera</a></p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end PSS2A;
