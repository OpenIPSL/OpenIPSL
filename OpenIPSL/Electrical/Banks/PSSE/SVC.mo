within OpenIPSL.Electrical.Banks.PSSE;
model SVC "On bus 10106 & 10114"
  OpenIPSL.Interfaces.PwPin VIB
    "Voltage signal connected to stepdown transformer"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Sources.Constant imSetPoint(k=Vref)
    annotation (Placement(transformation(extent={{-76,20},{-64,32}})));
  Modelica.Blocks.Sources.Constant imSetPoint1(k=Bref)
    annotation (Placement(transformation(extent={{-52,20},{-38,34}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag imLeadLag(
    K=K,
    T1=T1,
    T2=T3,
    y_start=init_SVC_Leadlag)
    annotation (Placement(transformation(extent={{-6,0},{10,16}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag imLeadLag1(
    K=1,
    T1=T2,
    T2=T4,
    y_start=init_SVC_Leadlag)
    annotation (Placement(transformation(extent={{18,0},{34,16}})));
  Modelica.Blocks.Nonlinear.Limiter imLimited(uMin=Vmin, uMax=Vmax)
    annotation (Placement(transformation(extent={{42,0},{58,16}})));
  NonElectrical.Continuous.SimpleLagLim imLimitedSimpleLag(
    K=1,
    T=T5,
    outMin=var_C,
    y_start=init_SVC_Lag,
    outMax=var_R)
    annotation (Placement(transformation(extent={{66,0},{82,16}})));
  OpenIPSL.Electrical.Banks.PwShunt shunt
    annotation (Placement(transformation(extent={{80,-40},{100,-20}})));
  OpenIPSL.NonElectrical.Logical.Relay3 imRelay
    annotation (Placement(transformation(extent={{30,-40},{50,-20}})));
  Modelica.Blocks.Sources.Constant Q_capacitors(k=var_C) "If Verr>Vov"
    annotation (Placement(transformation(extent={{-20,-20},{-10,-10}})));
  Modelica.Blocks.Sources.Constant Q_Reactors(k=var_R) "If Verr<-Vov"
    annotation (Placement(transformation(extent={{-20,-38},{-10,-28}})));
  Modelica.Blocks.Math.Gain imGain(k=1/Sbase)
    annotation (Placement(transformation(extent={{60,-36},{72,-24}})));
  parameter Types.PerUnit Vref "Reference voltage";
  parameter Types.PerUnit Bref "Reference susceptance";
  parameter Real K=150 "Steady-state gain";
  parameter Types.Time T1 "Time constant";
  parameter Types.Time T2 "Time constant";
  parameter Types.Time T3 "Time constant";
  parameter Types.Time T4 "Time constant";
  parameter Types.Time T5=0.03 "Time constant of thyristor bridge";
  parameter Types.PerUnit Vmax;
  parameter Types.PerUnit Vmin;
  parameter Types.PerUnit Vov=0.5 "Override voltage";
  parameter Types.ApparentPower Sbase "Base power of the bus";
  parameter Real init_SVC_Leadlag "Initial value";
  parameter Real init_SVC_Lag "Initial value";
  parameter Real OtherSignals;
  parameter Types.ReactivePower var_C=100e6
    "Total compensation capacity of shunt capacitor, 100(10106)/200(10114)";
  parameter Types.ReactivePower var_R=-50e6
    "Total compensation capacity of shunt reactor";
  Modelica.Blocks.Sources.Constant imSetPoint2(k=OtherSignals)
    annotation (Placement(transformation(extent={{-52,-20},{-40,-8}})));
  OpenIPSL.Electrical.Sensors.PwVoltage absoluteVoltage
    annotation (Placement(transformation(extent={{-82,-8},{-66,8}})));
  Modelica.Blocks.Math.Add add(k1=1, k2=-1)
    annotation (Placement(transformation(extent={{-58,0},{-46,12}})));
  Modelica.Blocks.Math.Add3 add3_1(k1=-1, k3=-1)
    annotation (Placement(transformation(extent={{-24,2},{-12,14}})));
equation
  connect(VIB, absoluteVoltage.p) annotation (Line(
      points={{-100,0},{-82,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(shunt.p, VIB) annotation (Line(
      points={{90,-20},{90,50},{-94,50},{-94,0},{-100,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(imRelay.y, imGain.u) annotation (Line(points={{51.5,-30},{51.5,-30},{
          58.8,-30}}, color={0,0,127}));
  connect(shunt.Q, imGain.y)
    annotation (Line(points={{79,-30},{79,-30},{72.6,-30}}, color={0,0,127}));
  connect(imLimitedSimpleLag.y, imRelay.u2) annotation (Line(points={{82.8,8},{
          86,8},{86,-16},{20,-16},{20,-22.5},{28,-22.5}}, color={0,0,127}));
  connect(imLimited.y, imLimitedSimpleLag.u)
    annotation (Line(points={{58.8,8},{60,8},{64.4,8}}, color={0,0,127}));
  connect(imLeadLag1.y, imLimited.u)
    annotation (Line(points={{34.8,8},{34.8,8},{40.4,8}}, color={0,0,127}));
  connect(imLeadLag.y, imLeadLag1.u)
    annotation (Line(points={{10.8,8},{16.4,8}}, color={0,0,127}));
  connect(Q_Reactors.y, imRelay.u4) annotation (Line(points={{-9.5,-33},{28,-33},
          {28,-32.5}}, color={0,0,127}));
  connect(Q_capacitors.y, imRelay.u3) annotation (Line(points={{-9.5,-15},{0,-15},
          {0,-27.5},{28,-27.5}}, color={0,0,127}));
  connect(add.u2, absoluteVoltage.v) annotation (Line(points={{-59.2,2.4},{-62,
          2.4},{-62,-4.8},{-65.2,-4.8}}, color={0,0,127}));
  connect(imSetPoint.y, add.u1) annotation (Line(points={{-63.4,26},{-59.2,26},
          {-59.2,9.6}}, color={0,0,127}));
  connect(add3_1.y, imLeadLag.u)
    annotation (Line(points={{-11.4,8},{-10.65,8},{-7.6,8}}, color={0,0,127}));
  connect(imSetPoint2.y, add3_1.u3) annotation (Line(points={{-39.4,-14},{-34,-14},
          {-34,3.2},{-25.2,3.2}}, color={0,0,127}));
  connect(imSetPoint1.y, add3_1.u1) annotation (Line(points={{-37.3,27},{-34,27},
          {-34,12.8},{-25.2,12.8}}, color={0,0,127}));
  connect(add.y, add3_1.u2)
    annotation (Line(points={{-45.4,6},{-25.2,6},{-25.2,8}}, color={0,0,127}));
  connect(imRelay.u1, add3_1.u2) annotation (Line(points={{28,-37.5},{0,-37.5},
          {0,-46},{-36,-46},{-36,8},{-25.2,8}}, color={0,0,127}));
  annotation (
    Diagram(graphics={Text(
          extent={{-44,16},{-34,12}},
          textColor={255,0,0},
          textString="Verr"),Text(
          extent={{-82,28},{-58,24}},
          textColor={255,0,0},
          textString="Vref"),Text(
          extent={{-50,38},{-42,42}},
          textColor={255,0,0},
          textString="Bref"),Text(
          extent={{-80,-14},{-68,-20}},
          textColor={255,0,0},
          textString="|VB|")}),
    Icon(graphics={Rectangle(extent={{-100,
          100},{100,-100}}, lineColor={0,0,255}),Text(
          extent={{-20,-60},{20,-100}},
          textColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="SVC"),Line(
          points={{38,60},{18,40},{8,0},{18,-40},{40,-60}},
          color={0,0,255},
          smooth=Smooth.Bezier),Line(
          points={{-10,60},{-10,-60}},
          color={0,0,255},
          smooth=Smooth.Bezier),Line(
          points={{-100,0},{-10,0}},
          color={0,0,255},
          smooth=Smooth.Bezier),Line(points={{50,-40},{90,-40}}, color={0,0,255}),
          Line(points={{60,-50},{80,-50}}, color={0,0,255}),Line(points={{10,0},
          {70,0},{70,-40}}, color={0,0,255})}));
end SVC;
