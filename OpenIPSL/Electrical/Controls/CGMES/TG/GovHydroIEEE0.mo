within OpenIPSL.Electrical.Controls.CGMES.TG;
class GovHydroIEEE0 "CGMES Simplified Hydro Governor"
  parameter Real K=5 "Governor gain";
  parameter Types.Time T1=0.25 "Governor lag time constant";
  parameter Types.Time T2=0 "Governor lead time constant";
  parameter Types.Time T3=0.1 "Gate actuator time constant";
  parameter Types.Time T4=0.04 "Water starting time";
  parameter Types.PerUnit Pmax=1.5 "Gate maximum";
  parameter Types.PerUnit Pmin=0.5 "Gate minimum";
  NonElectrical.Continuous.LeadLag GovernorA(
    K=K,
    T1=T2,
    T2=T1,
    y_start=0) annotation (Placement(transformation(
        origin={-70,0},
        extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Add difference(k2=-1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Continuous.TransferFunction GovernorB(a={T3,1}, b={1}) annotation (Placement(transformation(
        origin={-40,0},
        extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Continuous.TransferFunction waterway(
    a={0.5*T4,1},
    b={-T4,1},
    y_start=0) "Turbine and Waterway transferfunction" annotation (Placement(transformation(
        origin={74,0},
        extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=Pmax, uMin=Pmin) annotation (Placement(transformation(
        origin={40,0},
        extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealInput SPEED annotation (Placement(
      transformation(
        origin={-120,0},
        extent={{-20,-20},{20,20}}),
      iconTransformation(
        origin={-120,0},
        extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealInput Pref annotation (Placement(
      transformation(
        origin={-120,80},
        extent={{-20,-20},{20,20}}),
      iconTransformation(
        origin={-120,80},
        extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH annotation (Placement(
      transformation(
        origin={110,0},
        extent={{-10,-10},{10,10}}),
      iconTransformation(
        origin={110,0},
        extent={{-10,-10},{10,10}})));
equation
  connect(waterway.y, PMECH) annotation (Line(points={{85,0},{102,0},{102,0},{110,0}}, color={0,0,127}));
  connect(limiter.y, waterway.u) annotation (Line(points={{51,0},{60,0},{60,0},{62,0}}, color={0,0,127}));
  connect(difference.y, limiter.u) annotation (Line(points={{11,0},{28,0}}, color={0,0,127}));
  connect(GovernorB.y, difference.u2) annotation (Line(points={{-29,0},{-20,0},{-20,-6},{-12,-6}}, color={0,0,127}));
  connect(GovernorA.y, GovernorB.u) annotation (Line(points={{-59,0},{-52,0}}, color={0,0,127}));
  connect(SPEED, GovernorA.u) annotation (Line(points={{-120,0},{-82,0}}, color={0,0,127}));
  connect(Pref, difference.u1) annotation (Line(points={{-120,80},{-20,80},{-20,6},{-12,6}}, color={0,0,127}));
  annotation (Icon(graphics={
        Text(
          extent={{80,-80},{-80,-40}},
          lineColor={0,0,255},
          textString="GovHydroIEEE0"),
        Text(
          extent={{-52,70},{-92,90}},
          textString="Pref",
          lineColor={28,108,200}),
        Text(
          extent={{-32,-10},{-92,10}},
          textString="SPEED",
          lineColor={28,108,200}),
        Text(
          extent={{90,-10},{30,10}},
          textString="PMECH",
          lineColor={28,108,200}),
        Rectangle(
          lineThickness=2,
          borderPattern=BorderPattern.Raised,
          extent={{-100,100},{100,-100}})}),
 Documentation(info="<html>
<p>This diagram is supplied to document the CIM interpretation of the
model given in <a href=\"modelica://OpenIPSL.UsersGuide.References\">[IEEE1973]</a>.
However the general recommondation is to use alternative more sophisticated implementations like
<a href=\"modelica://OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV\">HYGOV</a> instead.
</p>
</html>",
        revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>CGMES</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-11-17</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/dietmarw\">@dietmarw</a>,
       <a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a>
       (original: Mengjia Zhang, SmarTS Lab)</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end GovHydroIEEE0;
