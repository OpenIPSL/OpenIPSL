within OpenIPSL.Electrical.Controls.PSSE.ES;
model EXST1 "ST1 Excitation System [IEEE1981]"
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  parameter Types.Time T_R=0.02 "Regulator input filter time constant";
  parameter Types.PerUnit V_IMAX=0.2 "Maximum voltage error (regulator input)";
  parameter Types.PerUnit V_IMIN=0 "Minimum voltage error (regulator input)";
  parameter Types.Time T_C=1 "Regulator numerator (lead) time constant";
  parameter Types.Time T_B=1 "Regulator denominator (lag) time constant";
  parameter Types.PerUnit K_A=80 "Voltage regulator gain";
  parameter Types.Time T_A=0.05 "Voltage regulator time constant";
  parameter Types.PerUnit V_RMAX=8 "Maximum exciter output";
  parameter Types.PerUnit V_RMIN=-3 "Minimum exciter output";
  parameter Types.PerUnit K_C=0.2 "Rectifier loading factor proportional to commutating reactance";
  parameter Types.PerUnit K_F=0.1 "Rate feedback gain";
  parameter Types.Time T_F=1 "Rate feedback time constant";
  OpenIPSL.NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    y_start=Efd0/K_A,
    x_start=Efd0/K_A)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_IMAX, uMin=V_IMIN)
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  NonElectrical.Continuous.SimpleLag Vm1(
    y_start=Efd0,
    K=1,
    T=T_A) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={130,0})));
  Modelica.Blocks.Math.Gain K_a(k=K_A) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={90,0})));
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    k=K_F,
    T=T_F,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{92,-70},{72,-50}})));
  NonElectrical.Continuous.SimpleLag TransducerDelay(
    K=1,
    T=T_R,
    y_start=ECOMP0)
    annotation (Placement(transformation(extent={{-170,-10},{-150,10}})));
  Modelica.Blocks.Math.Add3 add3_2
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Math.Add Limiters annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,-150})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
protected
  Modelica.Blocks.Interfaces.RealOutput EFD1 annotation (Placement(
        transformation(extent={{180,-10},{200,10}}), iconTransformation(extent=
            {{302,-64},{322,-44}})));
initial equation
  V_REF = Efd0/K_A + ECOMP0;
equation
  if EFD > ECOMP*V_RMAX - K_C*XADIFD then
    EFD = ECOMP*V_RMAX - K_C*XADIFD;
  elseif EFD < ECOMP*V_RMIN - K_C*XADIFD then
    EFD = ECOMP*V_RMIN - K_C*XADIFD;
  else
    EFD = EFD1;
  end if;
  connect(imLeadLag.y, K_a.u)
    annotation (Line(points={{61,0},{70,0},{78,0}}, color={0,0,127}));
  connect(imLeadLag.u, limiter.y)
    annotation (Line(points={{38,0},{30,0},{21,0}}, color={0,0,127}));
  connect(K_a.y, Vm1.u)
    annotation (Line(points={{101,0},{118,0}}, color={0,0,127}));
  connect(Vm1.y, EFD1)
    annotation (Line(points={{141,0},{170,0},{190,0}}, color={0,0,127}));
  connect(imDerivativeLag.u, EFD1) annotation (Line(points={{94,-60},{170,-60},
          {170,0},{190,0}}, color={0,0,127}));
  connect(ECOMP, TransducerDelay.u)
    annotation (Line(points={{-200,0},{-186,0},{-172,0}}, color={0,0,127}));
  connect(TransducerDelay.y, DiffV.u2) annotation (Line(points={{-149,0},{-132,
          0},{-132,-6},{-122,-6}}, color={0,0,127}));
  connect(VOTHSG, add3_2.u1) annotation (Line(points={{-200,90},{-148,90},{-90,
          90},{-90,8},{-82,8}}, color={0,0,127}));
  connect(DiffV.y, add3_2.u2)
    annotation (Line(points={{-99,0},{-90.5,0},{-82,0}}, color={0,0,127}));
  connect(VUEL, Limiters.u1) annotation (Line(points={{-130,-200},{-130,-172},{
          -106,-172},{-106,-162}}, color={0,0,127}));
  connect(Limiters.u2, VOEL) annotation (Line(points={{-94,-162},{-94,-174},{-70,
          -174},{-70,-200}}, color={0,0,127}));
  connect(Limiters.y, add3_2.u3) annotation (Line(points={{-100,-139},{-100,-139},
          {-100,-20},{-90,-20},{-90,-8},{-82,-8}}, color={0,0,127}));
  connect(feedback.y, limiter.u)
    annotation (Line(points={{-21,0},{-11.5,0},{-2,0}}, color={0,0,127}));
  connect(feedback.u1, add3_2.y)
    annotation (Line(points={{-38,0},{-59,0},{-59,0}}, color={0,0,127}));
  connect(feedback.u2, imDerivativeLag.y) annotation (Line(points={{-30,-8},{-30,
          -8},{-30,-60},{71,-60}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-200,-200},{200,160}})),
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=true), graphics={
                               Text(
          extent={{-100,160},{100,100}},
          textColor={28,108,200},
          textString="EXST1")}),
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
end EXST1;
