within OpenIPSL.Electrical.Controls.PSSE.PSS;
model IEE2ST "IEE2ST - IEEE Stabilizing Model With Dual-Input Signals (extension of IEEEST, [PSSE-AGV2])"
  parameter Types.PerUnit K_1=1 "First input filter gain";
  parameter Types.PerUnit K_2=1 "Second input filter gain";
  parameter Types.Time T_1=0.005 "First input filter time constant";
  parameter Types.Time T_2=0.005 "Second input filter time constant";
  parameter Types.Time T_3=10 "Power system stabilizer washout numerator time constant. If T_3 equals 0, sT_3 will equal 1.0";
  parameter Types.Time T_4=10 "Power system stabilizer washout denominator time constant. It must be greater than 0";
  parameter Types.Time T_5=0.16 "First power system stabilizer numerator (lead) time constant";
  parameter Types.Time T_6=0.02 "First power system stabilizer denominator (lag) time constant";
  parameter Types.Time T_7=0.16 "Second power system stabilizer numerator (lead) time constant";
  parameter Types.Time T_8=0.02 "Second power system stabilizer denominator (lag) time constant";
  parameter Types.Time T_9=0.16 "Third power system stabilizer numerator (lead) time constant";
  parameter Types.Time T_10=0.02 "Third power system stabilizer denominator (lag) time constant";
  parameter Types.PerUnit L_SMAX = 0.1 "Maximum output for sequence of washout filters";
  parameter Types.PerUnit L_SMIN = -0.1 "Minimum output for sequence of washout filters";
  parameter Types.PerUnit V_CU=0 "Maximum power system stabilizer output";
  parameter Types.PerUnit V_CL=0 "Minimum power system stabilizer output";
  Modelica.Blocks.Interfaces.RealInput V_S1 "PSS input signal 1"
    annotation (Placement(transformation(extent={{-220,20},{-180,60}}), iconTransformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput V_S2 "PSS input signal 2"
    annotation (Placement(transformation(extent={{-220,-60},{-180,-20}}), iconTransformation(extent={{-140,-60},{-100,-20}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=L_SMAX, uMin=L_SMIN)
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealOutput VOTHSG "PSS output signal"
    annotation (Placement(transformation(extent={{180,-10},{200,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    k=T_3,
    T=T_4,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=K_1,
    T=T_1,
    y_start=K_1*ICS10)
    annotation (Placement(transformation(extent={{-150,30},{-130,50}})));
  NonElectrical.Continuous.SimpleLag imSimpleLag1(
    K=K_2,
    T=T_2,
    y_start=ICS20)
    annotation (Placement(transformation(extent={{-150,-50},{-130,-30}})));
  NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T_5,
    T2=T_6,
    y_start=0) annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  NonElectrical.Continuous.LeadLag imLeadLag1(
    K=1,
    T1=T_7,
    T2=T_8,
    y_start=0) annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  NonElectrical.Continuous.LeadLag imLeadLag2(
    K=1,
    T1=T_9,
    T2=T_10,
    y_start=0) annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Interfaces.RealInput VCT
    "Compensated machine terminal voltage [pu]" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-80}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
protected
  Modelica.Blocks.Interfaces.RealOutput VSS
    annotation (Placement(transformation(extent={{136,-10},{156,10}})));
protected
  parameter Types.PerUnit ICS10(fixed=false);
  parameter Types.PerUnit ICS20(fixed=false);
initial equation
  ICS10 = V_S1;
  ICS20 = V_S2;
equation
  if V_CU == 0 and not V_CL == 0 then
    if VCT > V_CL then
      VOTHSG = VSS;
    else
      VOTHSG = 0;
    end if;
  elseif V_CL == 0 and not V_CU == 0 then
    if VCT < V_CU then
      VOTHSG = VSS;
    else
      VOTHSG = 0;
    end if;
  elseif V_CU == 0 and V_CL == 0 then
    VOTHSG = VSS;
  elseif VCT > V_CL and VCT < V_CU then
    VOTHSG = VSS;
  else
    VOTHSG = 0;
  end if;
  connect(limiter.y, VSS)
    annotation (Line(points={{121,0},{146,0}}, color={0,0,127}));
  connect(V_S2, imSimpleLag1.u)
    annotation (Line(points={{-200,-40},{-152,-40}}, color={0,0,127}));
  connect(imSimpleLag1.y, add.u2) annotation (Line(points={{-129,-40},{-120,-40},
          {-120,-6},{-102,-6}}, color={0,0,127}));
  connect(V_S1, imSimpleLag.u)
    annotation (Line(points={{-200,40},{-152,40}}, color={0,0,127}));
  connect(imSimpleLag.y, add.u1) annotation (Line(points={{-129,40},{-120,40},{
          -120,6},{-102,6}}, color={0,0,127}));
  connect(imLeadLag2.y, limiter.u)
    annotation (Line(points={{81,0},{98,0}}, color={0,0,127}));
  connect(imLeadLag1.y, imLeadLag2.u)
    annotation (Line(points={{41,0},{49.5,0},{58,0}}, color={0,0,127}));
  connect(imLeadLag.y, imLeadLag1.u)
    annotation (Line(points={{1,0},{9.5,0},{18,0}}, color={0,0,127}));
  connect(imLeadLag.u, imDerivativeLag.y)
    annotation (Line(points={{-22,0},{-39,0}}, color={0,0,127}));
  connect(add.y, imDerivativeLag.u)
    annotation (Line(points={{-79,0},{-62,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-60},{180,
            60}})),
    Icon( graphics={Text(
          extent={{-88,60},{-50,20}},
          lineColor={28,108,200},
          textString="ICS1"),Text(
          extent={{-90,-20},{-50,-60}},
          lineColor={28,108,200},
          textString="ICS2"),Text(
          extent={{-20,-70},{20,-92}},
          lineColor={28,108,200},
          textString="VCT"),Text(
          extent={{50,20},{90,-20}},
          lineColor={28,108,200},
          textString="VOTHSG"),Text(
          extent={{-40,80},{40,40}},
          lineColor={28,108,200},
          textString="IEE2ST"),Rectangle(extent={{-100,100},{100,-100}},
          lineColor={28,108,200})}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS&reg;E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-08-17</td>
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
end IEE2ST;
