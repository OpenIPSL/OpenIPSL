within OpenIPSL.Tests.Branches.Generic;
model ULTC "Example model to demonstrate the working of the generic ULTC"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Buses.Bus B1 annotation (
    Placement(transformation(extent={{-80,-10},{-60,10}})));
  OpenIPSL.Electrical.Buses.Bus B2 annotation (
    Placement(transformation(extent={{-20,-10},{0,10}})));
  OpenIPSL.Electrical.Buses.Bus B3 annotation (
    Placement(transformation(extent={{20,-10},{40,10}})));
  OpenIPSL.Electrical.Buses.Bus B4 annotation (
    Placement(transformation(extent={{60,-10},{80,10}})));
  OpenIPSL.Electrical.Branches.PwLine Line12_a(
    G=0,
    R=0,
    X=0.65,
    B=0) annotation (Placement(transformation(
        origin={-40,20},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Branches.PwLine Line34(
    G=0,
    R=0,
    X=0.80,
    B=0) annotation (Placement(transformation(
        origin={50,0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Buses.InfiniteBus slack(v_0=1.05) annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Electrical.Branches.Generic.ULTC ultc annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  OpenIPSL.Electrical.Branches.PwLine Line12_b(
    B=0,
    G=0,
    R=0,
    X=0.40625,
    t1=20,
    t2=200) annotation (Placement(transformation(extent={{-50,-30},{-30,-10}})));
  inner OpenIPSL.Electrical.SystemBase SysData annotation (
    Placement(transformation(origin={-70,90}, extent={{-30,-10},{30,10}})));
  Electrical.Loads.PSAT.ExponentialRecovery load(
    P_0=40000000,
    Tp=5,
    Tq=5,
    alpha_s=0,
    alpha_t=2,
    beta_s=0,
    beta_t=2) annotation (Placement(transformation(extent={{80,-30},{100,-10}})));
equation
  connect(Line12_a.n, B2.p) annotation (Line(points={{-31,20},{-20,20},{-20,0},{-10,0}}, color={0,0,255}));
  connect(Line12_a.p, B1.p) annotation (Line(points={{-49,20},{-60,20},{-60,0},{-70,0}}, color={0,0,255}));
  connect(B3.p, Line34.p) annotation (Line(points={{30,0},{41,0}}, color={0,0,255}));
  connect(Line34.n, B4.p) annotation (Line(points={{59,0},{70,0}}, color={0,0,255}));
  connect(slack.p, B1.p) annotation (Line(points={{-80,0},{-70,0}}, color={0,0,255}));
  connect(ultc.n, B3.p) annotation (Line(points={{21,0},{30,0}}, color={0,0,255}));
  connect(ultc.p, B2.p) annotation (Line(points={{-1,0},{-10,0}}, color={0,0,255}));
  connect(Line12_b.n, B2.p) annotation (Line(points={{-31,-20},{-20,-20},{-20,0},{-10,0}}, color={0,0,255}));
  connect(Line12_b.p, B1.p) annotation (Line(points={{-49,-20},{-60,-20},{-60,0},{-70,0}}, color={0,0,255}));
  connect(B4.p, load.p) annotation (Line(points={{70,0},{90,0},{90,-10}}, color={0,0,255}));
  annotation (experiment(StopTime = 350, Interval = 0.01, Tolerance = 0.0001));
end ULTC;
