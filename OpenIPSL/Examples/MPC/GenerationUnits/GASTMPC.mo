within OpenIPSL.Examples.MPC.GenerationUnits;
model GASTMPC "GAST - Gas Turbine-Governor"
  extends Icons.VerifiedModel;
  extends Electrical.Controls.PSSE.TG.BaseClasses.BaseGovernor;
  parameter Types.PerUnit R=0.05 "Speed droop gain";
  parameter Types.Time T_1=0.4 "Valve response time constant";
  parameter Types.Time T_2=0.1 "Turbine response time constant";
  parameter Types.Time T_3=3.0 "Load limit response time constant";
  parameter Types.PerUnit AT=0.9 "Ambient temperature load limit";
  parameter Types.PerUnit K_T=2.0 "Load-limited feedback path adjustment gain";
  parameter Types.PerUnit V_MAX=0.1 "Operational control high limit on fuel valve opening";
  parameter Types.PerUnit V_MIN=0.025 "Low output control limit on fuel valve opening";
  parameter Types.PerUnit D_turb=0.0 "Turbine damping";
  Modelica.Blocks.Math.Add add(k1=-1)
    annotation (Placement(transformation(extent={{-80,16},{-60,-4}})));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={40,-50})));
  Modelica.Blocks.Math.Add add2(k2=+1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-20,-56})));
  Modelica.Blocks.Math.Add add3(k1=-1)
    annotation (Placement(transformation(extent={{120,-10},{140,10}})));
  Modelica.Blocks.Math.Gain gDturb(k=D_turb)
    annotation (Placement(transformation(extent={{-40,29},{-20,50}})));
  Modelica.Blocks.Math.Gain gKt(k=K_T) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={10,-50})));
  Modelica.Blocks.Math.Gain g1_R(k=1/R) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={-110,0})));
  NonElectrical.Logical.LV_GATE lV_Gate
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Sources.Constant const(k=AT)
    annotation (Placement(transformation(extent={{90,-80},{70,-60}})));
  NonElectrical.Continuous.SimpleLag    simpleLagLim(
    K=1,
    T=T_1,
    y_start=pm0) annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Blocks.Interfaces.RealInput PMECHControllable annotation (Placement(
        transformation(extent={{-260,110},{-220,150}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
  Modelica.Blocks.Math.Add add4(k1=+1)
    annotation (Placement(transformation(extent={{-180,120},{-160,100}})));
  Modelica.Blocks.Interfaces.RealOutput TF2_out
    "Connector of Real output signal" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={68,-210}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={90,110})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_MAX, uMin=V_MIN)
    annotation (Placement(transformation(extent={{32,-10},{52,10}})));
  NonElectrical.Continuous.SimpleLag simpleLag(
    K=1,
    T=T_2,
    y_start=pm0)
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  NonElectrical.Continuous.SimpleLag simpleLag1(
    K=1,
    T=T_3,
    y_start=pm0)
    annotation (Placement(transformation(extent={{100,-42},{80,-22}})));
protected
  parameter Types.PerUnit pm0(fixed=false);
initial algorithm
  pm0 := PMECH0;
equation
  connect(gDturb.y, add3.u1) annotation (Line(
      points={{-19,39.5},{100,39.5},{100,6},{118,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(g1_R.y, add.u1) annotation (Line(
      points={{-99,0},{-82,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, gKt.u) annotation (Line(
      points={{29,-50},{22,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gKt.y, add2.u2) annotation (Line(
      points={{-1,-50},{-8,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y,lV_Gate.u1) annotation (Line(
      points={{-59,6},{-42,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lV_Gate.u2, add2.y) annotation (Line(
      points={{-42,-6},{-48,-6},{-48,-56},{-31,-56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, add2.u1) annotation (Line(points={{69,-70},{0,-70},{0,-62},{-8,-62}},
                      color={0,0,127}));
  connect(simpleLagLim.u,lV_Gate.y) annotation (Line(points={{-2,0},{-19,0}},
                                 color={0,0,127}));
  connect(add3.y, PMECH)
    annotation (Line(points={{141,0},{250,0}}, color={0,0,127}));
  connect(SPEED, g1_R.u) annotation (Line(points={{-240,-120},{-152,-120},{-152,0},{-122,0}},
                            color={0,0,127}));
  connect(gDturb.u, g1_R.u) annotation (Line(points={{-42,39.5},{-152,39.5},{-152,0},{-122,0}},
                       color={0,0,127}));
  connect(add1.u1, const.y) annotation (Line(points={{52,-56},{60,-56},{60,-70},{69,-70}}, color={0,0,127}));
  connect(add4.u2, PMECHControllable) annotation (Line(points={{-182,116},{-214,
          116},{-214,130},{-240,130}}, color={0,0,127}));
  connect(PMECH0, add4.u1) annotation (Line(points={{-240,80},{-190,80},{-190,
          104},{-182,104}}, color={0,0,127}));
  connect(add4.y, add.u2) annotation (Line(points={{-159,110},{-88,110},{-88,12},
          {-82,12}}, color={0,0,127}));
  connect(simpleLagLim.y, limiter.u)
    annotation (Line(points={{21,0},{30,0}}, color={0,0,127}));
  connect(simpleLag.y, add3.u2) annotation (Line(points={{91,0},{108,0},{108,-6},
          {118,-6}}, color={0,0,127}));
  connect(limiter.y, simpleLag.u)
    annotation (Line(points={{53,0},{68,0}}, color={0,0,127}));
  connect(simpleLag1.u, add3.u2) annotation (Line(points={{102,-32},{108,-32},{
          108,-6},{118,-6}}, color={0,0,127}));
  connect(simpleLag1.y, add1.u2) annotation (Line(points={{79,-32},{60,-32},{60,
          -44},{52,-44}}, color={0,0,127}));
  connect(TF2_out, add1.u2) annotation (Line(points={{68,-210},{68,-124},{134,
          -124},{134,-42},{68,-42},{68,-32},{60,-32},{60,-44},{52,-44}}, color=
          {0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-240,-200},{240,180}},
        preserveAspectRatio=false,
        grid={2,2})),
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        grid={2,2}),
        graphics={Text(
          extent={{-100,160},{100,100}},
          lineColor={28,108,200},
          textString="GAST")}),
    Documentation(info="<html>Gas Turbine-Governor Model.</html>",
  revisions="<html>
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
end GASTMPC;
