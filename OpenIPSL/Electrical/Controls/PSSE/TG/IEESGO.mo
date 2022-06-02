within OpenIPSL.Electrical.Controls.PSSE.TG;
model IEESGO "IEESGO - IEEE Standard Model for Turbine-Governor"
  extends Icons.VerifiedModel;
extends BaseClasses.BaseGovernor;
  parameter Types.Time T_1=0.2 "Controller lag";
  parameter Types.Time T_2=0 "Controller lead compensation";
  parameter Types.Time T_3=0.5 "Governor lag";
  parameter Types.Time T_4=0.12 "Delay due to steam inlet volumes associated with steam chest and inlet piping";
  parameter Types.Time T_5=5 "Reheater delay including hot and cold leads";
  parameter Types.Time T_6=0.5 "Delay due to IP-LP turbine, crossover pipes, and LP end hoods";
  parameter Real K_1=20 "Regulation gain [1/pu]";
  parameter Types.PerUnit K_2=0.59 "Intermediate pressure turbine fraction";
  parameter Types.PerUnit K_3=0.43 "Low pressure turbine fraction ";
  parameter Types.PerUnit P_MAX=0.98 "Upper power limit";
  parameter Types.PerUnit P_MIN=0 "Lower power limit";
  OpenIPSL.NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=K_1,
    T=T_1,
    y_start=0) annotation (Placement(transformation(extent={{-180,-130},{-160,-110}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T_2,
    T2=T_3,
    y_start=0) annotation (Placement(transformation(extent={{-140,-130},{-120,-110}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag imSimpleLag1(
    K=1,
    T=T_4,
    y_start=p0) annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag imSimpleLag2(
    K=K_2,
    T=T_5,
    y_start=p0*K_2) annotation (Placement(transformation(extent={{80,-80},{100,-60}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag imSimpleLag3(
    K=K_3,
    T=T_6,
    y_start=p0*K_2*K_3) annotation (Placement(transformation(extent={{120,-80},{
            140,-60}})));
  Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(transformation(extent={{-60,-10},
            {-40,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=P_MAX, uMin=P_MIN) annotation (Placement(transformation(extent={{-20,-10},
            {0,10}})));
  Modelica.Blocks.Math.Gain gain(k=1 - K_2) annotation (Placement(transformation(extent={{120,-10},
            {140,10}})));
  Modelica.Blocks.Math.Gain gain1(k=1 - K_3) annotation (Placement(transformation(extent={{120,-40},
            {140,-20}})));
  Modelica.Blocks.Math.Add3 add3_1 annotation (Placement(transformation(extent={{160,-18},
            {180,2}})));
protected
  parameter Types.PerUnit p0(fixed=false);
initial algorithm
  p0 := PMECH0;

equation
  connect(imSimpleLag.y, imLeadLag.u) annotation (Line(points={{-159,-120},{-142,
          -120}}, color={0,0,127}));
  connect(imLeadLag.y, add.u2) annotation (Line(points={{-119,-120},{-80,-120},{
          -80,-6},{-62,-6}}, color={0,0,127}));
  connect(add.y, limiter.u) annotation (Line(points={{-39,0},{-22,0}}, color={0,0,127}));
  connect(limiter.y, imSimpleLag1.u) annotation (Line(points={{1,0},{1,0},{18,0}}, color={0,0,127}));
  connect(imSimpleLag2.y, imSimpleLag3.u) annotation (Line(points={{101,-70},{118,
          -70}}, color={0,0,127}));
  connect(gain1.u, imSimpleLag3.u) annotation (Line(points={{118,-30},{110,-30},
          {110,-70},{118,-70}}, color={0,0,127}));
  connect(PMECH0, add.u1) annotation (Line(points={{-240,80},{-80,80},{-80,6},{-62,
          6}}, color={0,0,127}));
  connect(SPEED, imSimpleLag.u) annotation (Line(points={{-240,-120},{-212,-120},
          {-182,-120}}, color={0,0,127}));
  connect(imSimpleLag1.y, gain.u)
    annotation (Line(points={{41,0},{118,0}}, color={0,0,127}));
  connect(imSimpleLag2.u, gain.u) annotation (Line(points={{78,-70},{60,-70},{60,
          0},{118,0}}, color={0,0,127}));
  connect(gain.y, add3_1.u1)
    annotation (Line(points={{141,0},{141,0},{158,0}}, color={0,0,127}));
  connect(gain1.y, add3_1.u2) annotation (Line(points={{141,-30},{148,-30},{148,
          -8},{158,-8}}, color={0,0,127}));
  connect(imSimpleLag3.y, add3_1.u3) annotation (Line(points={{141,-70},{152,-70},
          {152,-16},{158,-16}}, color={0,0,127}));
  connect(add3_1.y, PMECH) annotation (Line(points={{181,-8},{188,-8},{188,0},{250,
          0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-240,-200},{240,160}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
         graphics={Text(
          extent={{-100,160},{100,100}},
          lineColor={28,108,200},
          textString="IEESGO")}),
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
<td><p>Author</p></td>
<td><p>ALSETLab, Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end IEESGO;
