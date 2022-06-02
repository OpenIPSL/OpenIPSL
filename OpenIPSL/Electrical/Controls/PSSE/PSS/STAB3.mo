within OpenIPSL.Electrical.Controls.PSSE.PSS;
model STAB3 "STAB3 - Power Sensitive Stabilizer Model with Dual-Input Signals [PSSE-MODELS]"
  parameter Types.Time T_t=1 "Input transducer time constant";
  parameter Types.Time T_X1=1 "Low-pass filter time constant. Value must be greater than 0";
  parameter Types.Time T_X2=1 "Stabilizer washout denominator time constant. Value must be greater than 0";
  parameter Types.Time K_X=1 "Stabilizer washout numerator time constant";
  parameter Types.PerUnit V_LIM=5 "Limit value for stabilizer output";
  Modelica.Blocks.Interfaces.RealInput PELEC "Machine electrical power [pu]"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}}),
        iconTransformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput VOTHSG "PSS output signal" annotation (
      Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_LIM, uMin=-V_LIM)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Sources.Constant const(k=P_REF)
    annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
protected
  parameter Types.PerUnit P_REF(fixed=false);
  parameter Types.PerUnit PELEC0(fixed=false);
  NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=1,
    T=T_t,
    y_start=PELEC0)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  NonElectrical.Continuous.SimpleLag imSimpleLag1(
    K=1,
    T=T_X1,
    y_start=0) annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    y_start=0,
    k=-K_X,
    T=T_X2,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
initial equation
  PELEC0 = PELEC;
  P_REF = PELEC0;
equation
  connect(imSimpleLag1.y, imDerivativeLag.u)
    annotation (Line(points={{1,0},{18,0}}, color={0,0,127}));
  connect(imSimpleLag.y, feedback.u1)
    annotation (Line(points={{-59,0},{-48,0}}, color={0,0,127}));
  connect(imSimpleLag.u, PELEC)
    annotation (Line(points={{-82,0},{-120,0}}, color={0,0,127}));
  connect(feedback.y, imSimpleLag1.u)
    annotation (Line(points={{-31,0},{-22,0}}, color={0,0,127}));
  connect(imSimpleLag1.y, imDerivativeLag.u)
    annotation (Line(points={{1,0},{18,0}}, color={0,0,127}));
  connect(imDerivativeLag.y, limiter.u)
    annotation (Line(points={{41,0},{58,0}}, color={0,0,127}));
  connect(limiter.y, VOTHSG)
    annotation (Line(points={{81,0},{110,0}}, color={0,0,127}));
  connect(const.y, feedback.u2)
    annotation (Line(points={{-59,-30},{-40,-30},{-40,-8}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,-60},{100,60}})),
    Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
                                                           lineColor=
           {28,108,200}),Text(
          extent={{-40,80},{40,40}},
          lineColor={28,108,200},
          textString="STAB3"),Text(
          extent={{-92,20},{-50,-20}},
          lineColor={28,108,200},
          textString="PELEC"),Text(
          extent={{50,20},{90,-20}},
          lineColor={28,108,200},
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
end STAB3;
