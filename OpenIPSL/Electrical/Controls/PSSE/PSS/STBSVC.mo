within OpenIPSL.Electrical.Controls.PSSE.PSS;
model STBSVC "STBSVC - WECC Supplementary Signal for Static var Compensator [PSSE-MODELS]"
  extends BaseClasses.BasePSS;
  parameter Types.PerUnit K_S1=1 "First input low-pass filter gain. It must be greater than 0";
  parameter Types.Time T_S7=1 "First input low-pass filter time constant";
  parameter Types.Time T_S8=1 "First input regulator numerator (lead) time constant";
  parameter Types.Time T_S9=1 "First input regulator denominaor (lag) time constant. It must be greater than 0";
  parameter Types.Time T_S13=1 "Stabilizer washout numerator time constant. It must be greater than 0";
  parameter Types.Time T_S14=1 "Stabilizer washout denominator time constant. It must be greater than 0";
  parameter Types.PerUnit K_S3=1 "Stabilizer washout proportional gain";
  parameter Types.PerUnit V_SCS=2 "Stabilizer output limit value";
  parameter Types.PerUnit K_S2=1 "Second input low-pass filter gain";
  parameter Types.Time T_S10=1 "Second input low-pass filter time constant";
  parameter Types.Time T_S11=1 "Second input regulator numerator (lead) time constant";
  parameter Types.Time T_S12=1 "Second input regulator denominaor (lag) time constant. It must be greater than 0 if K_S2 is different from 0";
  NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=K_S1,
    y_start=V_S10,
    T=T_S7) annotation (Placement(transformation(extent={{-120,30},{-100,50}})));
  NonElectrical.Continuous.SimpleLag imSimpleLag1(
    y_start=V_S10,
    K=K_S2,
    T=T_S10)
    annotation (Placement(transformation(extent={{-118,-50},{-98,-30}})));
  NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T_S8,
    T2=T_S9,
    y_start=V_S10)
    annotation (Placement(transformation(extent={{-80,30},{-60,50}})));
  NonElectrical.Continuous.LeadLag imLeadLag1(
    K=1,
    T1=T_S11,
    T2=T_S12,
    y_start=V_S20)
    annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    k=T_S13,
    T=T_S14,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Math.Gain gain(k=K_S3)
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_SCS, uMin=-V_SCS)
    annotation (Placement(transformation(extent={{120,-10},{140,10}})));
protected
  parameter Types.PerUnit V_S10(fixed=false);
  parameter Types.PerUnit V_S20(fixed=false);
initial equation
  V_S10 = V_S1;
  V_S20 = V_S2;
equation
  connect(gain.y, limiter.u)
    annotation (Line(points={{101,0},{118,0}}, color={0,0,127}));
  connect(limiter.y, VOTHSG)
    annotation (Line(points={{141,0},{210,0}},color={0,0,127}));
  connect(V_S1, imSimpleLag.u)
    annotation (Line(points={{-220,40},{-122,40}}, color={0,0,127}));
  connect(imSimpleLag.y, imLeadLag.u)
    annotation (Line(points={{-99,40},{-82,40}}, color={0,0,127}));
  connect(imLeadLag.y, add.u1) annotation (Line(points={{-59,40},{-30,40},{-30,6},{-14,6}},
                       color={0,0,127}));
  connect(V_S2, imSimpleLag1.u) annotation (Line(points={{-220,-40},{-120,-40}},
                       color={0,0,127}));
  connect(imSimpleLag1.y, imLeadLag1.u) annotation (Line(points={{-97,-40},{-82,-40}},
                           color={0,0,127}));
  connect(imLeadLag1.y, add.u2) annotation (Line(points={{-59,-40},{-30,-40},{-30,-6},{-14,-6}},
                         color={0,0,127}));
  connect(imDerivativeLag.y, gain.u)
    annotation (Line(points={{61,0},{78,0}}, color={0,0,127}));
  connect(add.y, imDerivativeLag.u)
    annotation (Line(points={{9,0},{38,0}}, color={0,0,127}));
  annotation (
   Icon(graphics={ Text(
          extent={{-60,80},{60,40}},
          lineColor={28,108,200},
          textString="STBSVC")}));
end STBSVC;
