within OpenIPSL.Electrical.Controls.PSSE.PSS;
model PSS2B "PSS2B - Dual-Input Stabilizer Model [IEEE2005]"
  extends Icons.VerifiedModel;
  extends BaseClasses.BasePSS;
  parameter Real T_w1=10 "Washout time constant 1";
  parameter Real T_w2=10 "Washout time constant 2";
  parameter Real T_6=1e-9 "Lag time constant 6";
  parameter Real T_w3=10 "Washout time constant 3";
  parameter Real T_w4=1e-9 "Washout time constant 4";
  parameter Real T_7=10 "Lag time constant 7";
  parameter Real K_S2=0.99 "Lag gain 2, T_7/H";
  parameter Real K_S3=1 "Lag gain 3";
  parameter Real T_8=0.5 "Ramp-tracking filter time constant";
  parameter Real T_9=0.1 "Ramp-tracking filter time constant";
  parameter Real K_S1=20 "PSS gain";
  parameter Real T_1=0.15 "Lead-lag time constant 1";
  parameter Real T_2=0.025 "Lead-lag time constant 2";
  parameter Real T_3=0.15 "Lead-lag time constant 3";
  parameter Real T_4=0.025 "Lead-lag time constant 4";
  parameter Real T_10=1e-9 "Lead-lag time constant 10";
  parameter Real T_11=0.033 "Lead-lag time constant 11";
  parameter Real V_S1MAX=0.08 "PSS input 1 max. limit";
  parameter Real V_S1MIN=-0.08 "PSS input 1 min. limit";
  parameter Real V_S2MAX=1.25 "PSS input 2 max. limit";
  parameter Real V_S2MIN=-1.25 "PSS input 2 min. limit";
  parameter Real V_STMAX=0.1 "PSS output max. limit, 0.1 ~ 0.2";
  parameter Real V_STMIN=-0.1 "PSS output min. limit, -0.05 ~ -0.1";
  parameter Integer M = 5 "Ramp tracking filter coefficient";
  parameter Integer N = 1 "Ramp tracking filter coefficient";
  OpenIPSL.NonElectrical.Continuous.LeadLag Leadlag1(
    K=1,
    T1=T_1,
    T2=T_2,
    y_start=0) annotation (Placement(transformation(extent={{72,-10},{92,10}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag Leadlag2(
    K=1,
    T1=T_3,
    T2=T_4,
    y_start=0) annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag SimpleLag1(
    K=1,
    T=T_6,
    y_start=0) annotation (Placement(transformation(extent={{-84,10},{-64,30}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag SimpleLag2(
    K=K_S2,
    T=T_7,
    y_start=0) annotation (Placement(transformation(extent={{-84,-30},{-64,-10}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag Leadlag3(
    K=1,
    T1=T_10,
    T2=T_11,
    y_start=0) annotation (Placement(transformation(extent={{130,-10},{150,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_STMAX, uMin=V_STMIN) annotation (Placement(transformation(extent={{160,-10},{180,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=V_S1MAX, uMin=V_S1MIN) annotation (Placement(transformation(extent={{-180,10},{-160,30}})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax=V_S2MAX, uMin=V_S2MIN) annotation (Placement(transformation(extent={{-180,-30},{-160,-10}})));
  Modelica.Blocks.Math.Add add(k2=+K_S3) annotation (Placement(transformation(extent={{-52,4},{-32,24}})));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(extent={{14,-10},{34,10}})));
  Modelica.Blocks.Math.Gain gain(k=K_S1) annotation (Placement(transformation(extent={{42,-10},{62,10}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag(
    K=T_w1,
    T=T_w1,
    y_start=0,
    x_start=V_S10) annotation (Placement(transformation(extent={{-148,10},{-128,30}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag1(
    y_start=0,
    K=T_w2,
    T=T_w2) annotation (Placement(transformation(extent={{-116,10},{-96,30}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag2(
    y_start=0,
    K=T_w3,
    T=T_w3,
    x_start=V_S20) annotation (Placement(transformation(extent={{-148,-30},{-128,-10}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag3(
    y_start=0,
    K=T_w4,
    T=T_w4) annotation (Placement(transformation(extent={{-116,-30},{-96,-10}})));
  NonElectrical.Continuous.RampTrackingFilter rampTrackingFilter(
    M=M,
    N=N,
    T_1=T_8,
    T_2=T_9) annotation (Placement(transformation(extent={{-22,4},{-2,24}})));
protected
  parameter Real V_S10(fixed=false);
  parameter Real V_S20(fixed=false);
initial equation
  V_S10 = V_S1;
  V_S20 = V_S2;

equation
  connect(Leadlag3.y, limiter.u) annotation (Line(points={{151,0},{158,0}}, color={0,0,127}));
  connect(Leadlag2.y, Leadlag3.u) annotation (Line(points={{121,0},{128,0}}, color={0,0,127}));
  connect(Leadlag2.u, Leadlag1.y) annotation (Line(points={{98,0},{93,0}}, color={0,0,127}));
  connect(SimpleLag1.y, add.u1) annotation (Line(points={{-63,20},{-54,20}}, color={0,0,127}));
  connect(SimpleLag2.y, add.u2) annotation (Line(points={{-63,-20},{-60,-20},{-60,8},{-54,8}}, color={0,0,127}));
  connect(add1.y, gain.u) annotation (Line(points={{35,0},{40,0}}, color={0,0,127}));
  connect(gain.y, Leadlag1.u) annotation (Line(points={{63,0},{70,0}}, color={0,0,127}));
  connect(derivativeLag.y, derivativeLag1.u) annotation (Line(points={{-127,20},{-118,20}}, color={0,0,127}));
  connect(derivativeLag3.u, derivativeLag2.y) annotation (Line(points={{-118,-20},{-127,-20}}, color={0,0,127}));
  connect(derivativeLag1.y, SimpleLag1.u) annotation (Line(points={{-95,20},{-86,20}}, color={0,0,127}));
  connect(derivativeLag3.y, SimpleLag2.u) annotation (Line(points={{-95,-20},{-86,-20}}, color={0,0,127}));
  connect(derivativeLag2.u, limiter2.y) annotation (Line(points={{-150,-20},{-159,-20}}, color={0,0,127}));
  connect(derivativeLag.u, limiter1.y) annotation (Line(points={{-150,20},{-159,20}}, color={0,0,127}));
  connect(add.y, rampTrackingFilter.u) annotation (Line(points={{-31,14},{-24,14}},color={0,0,127}));
  connect(rampTrackingFilter.y, add1.u1) annotation (Line(points={{-1,14},{4,14},{4,6},{12,6}}, color={0,0,127}));
  connect(add1.u2, add.u2) annotation (Line(points={{12,-6},{4,-6},{4,-20},{-60,-20},{-60,8},{-54,8}}, color={0,0,127}));
  connect(V_S1, limiter1.u)
    annotation (Line(points={{-220,40},{-190,40},{-190,20},{-182,20}},
                                                             color={0,0,127}));
  connect(V_S2, limiter2.u) annotation (Line(points={{-220,-40},{-190,-40},{-190,-20},{-182,-20}},
                      color={0,0,127}));
  connect(limiter.y, VOTHSG) annotation (Line(points={{181,0},{210,0}}, color={0,0,127}));
  annotation (Icon(graphics={Text(
          extent={{-40,80},{40,40}},
          lineColor={28,108,200},
          textString="PSS2B")}),
          Documentation(info="<html>IEEE Dual-Input Stabilizer Model.</html>",
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
<td><p>Le Qi, KTH Royal Institute of Technology</p>
    <p><a href=\"https://github.com/GiuseppeLaera\">@GiuseppeLaera</a></p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"),
    Diagram(coordinateSystem(extent={{-200,-80},{200,80}})));
end PSS2B;
