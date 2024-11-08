within OpenIPSL.Electrical.Controls.PSSE.TG;
model IEEEG2 "IEEE Type 2 Speed-Governing Model [PSSE-MODELS]"
  extends OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.BaseGovernor;
  parameter Real K=20 "Permanent governor gain K=1/R (pu on generator MVA base)";
  parameter Types.Time T_1=50 "Compensator time constant (sec)";
  parameter Types.Time T_2=5 "Compensator time constant (sec)";
  parameter Types.Time T_3=1 "Governor time constant (sec)";
  parameter Types.Time T_4=1.5 "Water starting time (sec)";
  parameter Types.PerUnit P_MAX=1.043 "Upper power limit (pu on machine MVA rating)";
  parameter Types.PerUnit P_MIN=0.09 "Lower power limit (pu on machine MVA rating)";
  OpenIPSL.NonElectrical.Continuous.LeadLag leadLag(
    K=K,
    T1=T_2,
    T2=T_1,
    y_start=0)
    annotation (Placement(transformation(extent={{-192,-150},{-134,-92}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{0,-24},{48,24}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=P_MAX, uMin=P_MIN)
    annotation (Placement(transformation(extent={{80,-24},{128,24}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag leadLag2(
    K=1,
    T1=-T_4,
    T2=0.5*T_4,
    y_start=p0)
    annotation (Placement(transformation(extent={{162,-26},{214,26}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag simpleLag(
    K=1,
    T=T_3,
    y_start=0)
    annotation (Placement(transformation(extent={{-94,-148},{-40,-94}})));
protected
  parameter Types.PerUnit p0(fixed=false);
initial algorithm
  p0 := PMECH0;
equation
  connect(PMECH0, add.u1) annotation (Line(points={{-240,80},{-80,80},{-80,14.4},
          {-4.8,14.4}}, color={0,0,127}));
  connect(SPEED, leadLag.u) annotation (Line(points={{-240,-120},{-202,-120},{-202,
          -121},{-197.8,-121}}, color={0,0,127}));
  connect(add.y, limiter.u)
    annotation (Line(points={{50.4,0},{75.2,0}}, color={0,0,127}));
  connect(limiter.y, leadLag2.u)
    annotation (Line(points={{130.4,0},{156.8,0}}, color={0,0,127}));
  connect(leadLag2.y, PMECH)
    annotation (Line(points={{216.6,0},{250,0}}, color={0,0,127}));
  connect(leadLag.y, simpleLag.u) annotation (Line(points={{-131.1,-121},{-118.55,
          -121},{-118.55,-121},{-99.4,-121}}, color={0,0,127}));
  connect(simpleLag.y, add.u2) annotation (Line(points={{-37.3,-121},{-37.3,-120},
          {-20,-120},{-20,-14},{-4.8,-14},{-4.8,-14.4}}, color={0,0,127}));
  annotation (Icon(graphics={Text(
          extent={{-88,48},{10,-50}},
          lineColor={28,108,200},
          textString="IEEEG2")}),
        Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>IEEE Type 2 Speed-Governing Model (PSS/E Manual)</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-08-11</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Giuseppe Laera, ALSETLab, RPI Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end IEEEG2;
