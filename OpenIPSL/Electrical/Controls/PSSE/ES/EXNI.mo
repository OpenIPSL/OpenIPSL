within OpenIPSL.Electrical.Controls.PSSE.ES;
model EXNI "Type NI (NVE) - Bus or Solid Fed SCR Bridge Excitation System (AC6A from [IEEE1992])"
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  parameter Types.Time T_R=0.06 "Regulator input filter time constant";
  parameter Types.PerUnit K_A=150 "Regulator output gain";
  parameter Types.Time T_A=0 "Regulator output time constant";
  parameter Types.PerUnit V_RMAX=4 "Maximum regulator output";
  parameter Types.PerUnit V_RMIN=-4 "Minimum regulator output";
  parameter Types.PerUnit K_F=0.011 "Rate feedback excitation system stabilizer gain";
  parameter Types.Time T_F1=0.4 "Rate feedback excitation system stabilizer first time constant";
  parameter Types.Time T_F2=0.7 "Rate feedback excitation system stabilizer second time constant";
  parameter Boolean SWITCH=false "Feeding selection. False for bus fed, and True for solid fed";
  parameter Real r_cr_fd=10 "Ratio between crowbar circuit resistance and field circuit resistance";
  OpenIPSL.NonElectrical.Logical.NegCurLogic negCurLogic(RC_rfd=r_cr_fd, nstartvalue=Efd0) annotation (Placement(transformation(extent={{140,-14},{182,14}})));
  Modelica.Blocks.Math.Add3 add3_1 annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Continuous.Derivative derivativeLag(
    k=K_F,
    T=T_F1,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{34,-60},{14,-40}})));
  NonElectrical.Continuous.SimpleLag simpleLag1(
    K=1,
    T=T_F2,
    y_start=0)
    annotation (Placement(transformation(extent={{0,-60},{-20,-40}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN)
    annotation (Placement(transformation(extent={{16,-10},{36,10}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{50,30},{70,50}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{94,-14},{114,6}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=SWITCH)
    annotation (Placement(transformation(extent={{48,60},{68,80}})));
  NonElectrical.Continuous.SimpleLag TransducerDelay(
    K=1,
    T=T_R,
    y_start=ECOMP0)
    annotation (Placement(transformation(extent={{-170,-10},{-150,10}})));
  Modelica.Blocks.Math.Add Limiters annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,-150})));
protected
  parameter Real VR0(fixed=false);
  NonElectrical.Continuous.SimpleLag VR(
    K=K_A,
    T=T_A,
    y_start=VR0)
    annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
initial equation
  if SWITCH then
    VR0 = Efd0;
    V_REF = VR0/K_A + ECOMP0;
  else
    VR0 = Efd0/ECOMP0;
    V_REF = VR0/K_A + ECOMP0;
  end if;
equation
  connect(simpleLag1.u, derivativeLag.y) annotation (Line(points={{2,-50},{2,-50},{13,-50}}, color={0,0,127}));
  connect(add.y, VR.u) annotation (Line(points={{-19,0},{-19,0},{-14,0}}, color={0,0,127}));
  connect(VR.y, limiter.u) annotation (Line(points={{9,0},{9,0},{14,0}}, color={0,0,127}));
  connect(derivativeLag.u, limiter.y) annotation (Line(points={{36,-50},{64,-50},{64,0},{37,0}}, color={0,0,127}));
  connect(product.u2, limiter.y) annotation (Line(points={{48,34},{44,34},{44,20},{44,0},{37,0}}, color={0,0,127}));
  connect(product.y, switch1.u3) annotation (Line(points={{71,40},{80,40},{80,-12},{92,-12}}, color={0,0,127}));
  connect(booleanConstant.y, switch1.u2) annotation (Line(points={{69,70},{84,70},{84,-4},{92,-4}}, color={255,0,255}));
  connect(negCurLogic.Efd, EFD) annotation (Line(points={{185.5,0},{210,0}}, color={0,0,127}));
  connect(ECOMP, TransducerDelay.u) annotation (Line(points={{-200,0},{-186,0},{-172,0}}, color={0,0,127}));
  connect(TransducerDelay.y, DiffV.u2) annotation (Line(points={{-149,0},{-132,0},{-132,-6},{-122,-6}}, color={0,0,127}));
  connect(DiffV.y, add3_1.u2) annotation (Line(points={{-99,0},{-82,0},{-82,0}}, color={0,0,127}));
  connect(VOTHSG, add3_1.u1) annotation (Line(points={{-200,90},{-90,90},{-90,8},{-82,8}}, color={0,0,127}));
  connect(Limiters.u1, VUEL) annotation (Line(points={{-106,-162},{-106,-170},{-130,-170},{-130,-200}}, color={0,0,127}));
  connect(Limiters.u2, VOEL) annotation (Line(points={{-94,-162},{-94,-170},{-70,-170},{-70,-200}}, color={0,0,127}));
  connect(Limiters.y, add3_1.u3) annotation (Line(points={{-100,-139},{-100,-139},{-100,-30},{-100,-20},{-88,-20},{-88,-8},{-82,-8}}, color={0,0,127}));
  connect(add3_1.y, add.u1) annotation (Line(points={{-59,0},{-48,0},{-48,6},{-42,6}}, color={0,0,127}));
  connect(simpleLag1.y, add.u2) annotation (Line(points={{-21,-50},{-34,-50},{-48,-50},{-48,-6},{-42,-6}}, color={0,0,127}));
  connect(switch1.y, negCurLogic.Vd) annotation (Line(points={{115,-4},{120,-4},{120,7},{136.5,7}}, color={0,0,127}));
  connect(switch1.u1, limiter.y) annotation (Line(points={{92,4},{64,4},{64,0},{37,0}}, color={0,0,127}));
  connect(product.u1, TransducerDelay.u) annotation (Line(points={{48,46},{-140,46},{-140,24},{-178,24},{-178,0},{-172,0}}, color={0,0,127}));
  connect(XADIFD, negCurLogic.XadIfd) annotation (Line(points={{80,-200},{80,
          -200},{80,-54},{120,-54},{120,-7},{128,-7},{136.5,-7}}, color={0,0,
          127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-200,-200},{200,
            160}})),
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
</html>"),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={
                               Text(
          extent={{-100,160},{100,100}},
          lineColor={28,108,200},
          textString="EXNI")}));
end EXNI;
