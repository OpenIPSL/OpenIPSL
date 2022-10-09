within OpenIPSL.Electrical.Controls.PSSE.PSS;
model STABNI "STABNI - Power Sensitive Stabilizer Model Type NI (NVE) [PSSE-MODELS]"
  parameter Types.PerUnit K=1 "Input low-pass filter gain. It must be equal to or greater than 0";
  parameter Types.Time T_1=1 "Stabilizer filter time constant. It must be greater than 0";
  parameter Types.Time T_2=1 "Input low-pass filter time constant. It must be equal to or greater than 0";
  parameter Types.Time T_0=1 "Stabilizer filter time constant. It must be greater than 0";
  parameter Types.PerUnit LIMIT=5 "Limit value for stabilizer output";
  Modelica.Blocks.Interfaces.RealInput PELEC annotation (Placement(
        transformation(extent={{-160,-20},{-120,20}}), iconTransformation(
          extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput VOTHSG annotation (Placement(
        transformation(extent={{120,-10},{140,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=LIMIT, uMin=-LIMIT)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
protected
  parameter Types.PerUnit PELEC0(fixed=false);
protected
  NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=K,
    T=T_2,
    y_start=K*PELEC0)
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T_1,
    T2=T_0,
    y_start=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    T=T_0,
    k=T_0,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Modelica.Blocks.Continuous.Derivative imDerivativeLag1(
    T=T_0,
    k=T_0,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  NonElectrical.Continuous.SimpleLag imSimpleLag1(
    K=1,
    T=T_0,
    y_start=0) annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Math.Gain gain(k=-1)
    annotation (Placement(transformation(extent={{96,-10},{116,10}})));
initial equation
  PELEC0 = PELEC;
equation
  connect(VOTHSG, gain.y)
    annotation (Line(points={{130,0},{124,0},{117,0}}, color={0,0,127}));
  connect(PELEC, imSimpleLag.u)
    annotation (Line(points={{-140,0},{-102,0}}, color={0,0,127}));
  connect(imSimpleLag.y, imDerivativeLag.u)
    annotation (Line(points={{-79,0},{-72,0}}, color={0,0,127}));
  connect(imDerivativeLag.y, imDerivativeLag1.u)
    annotation (Line(points={{-49,0},{-45.5,0},{-42,0}}, color={0,0,127}));
  connect(imDerivativeLag1.y, imLeadLag.u)
    annotation (Line(points={{-19,0},{-15.5,0},{-12,0}}, color={0,0,127}));
  connect(imLeadLag.y, imSimpleLag1.u)
    annotation (Line(points={{11,0},{14.5,0},{18,0}}, color={0,0,127}));
  connect(limiter.y, gain.u)
    annotation (Line(points={{81,0},{88,0},{94,0}}, color={0,0,127}));
  connect(limiter.u, imSimpleLag1.y)
    annotation (Line(points={{58,0},{41,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-120,-40},{120,
            40}})),
    Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
                                                           lineColor=
           {28,108,200}),Text(
          extent={{-40,80},{40,40}},
          textColor={28,108,200},
          textString="STABNI"),Text(
          extent={{-92,20},{-50,-20}},
          textColor={28,108,200},
          textString="PELEC"),Text(
          extent={{48,20},{90,-20}},
          textColor={28,108,200},
          textString="VOTHSG")}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Manual</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2015-08-03 </p></td>
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
end STABNI;
