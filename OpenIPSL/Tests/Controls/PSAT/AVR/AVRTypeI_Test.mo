within OpenIPSL.Tests.Controls.PSAT.AVR;
model AVRTypeI_Test "Simple system to test functionality of exciter (automatic voltage regulator - AVR) type I model"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Machines.PSAT.Order6 order6Type2_Inputs_Outputs(
    angle_0=0,
    ra=0.001,
    x1d=0.302,
    M=10,
    D=0,
    P_0=16035269.8692006,
    Q_0=11859436.505981,
    Sn=370000000,
    v_0=1,
    V_b=200000,
    Vn=200000) annotation (Placement(transformation(extent={{-86,-10},{-50,26}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{58,78},{82,98}})));
  Electrical.Branches.PwLine pwLine1(
    X=0.1,
    R=0.01,
    G=0,
    B=0.0005) annotation (Placement(transformation(
        origin={0,2},
        extent={{-6,-6},{6,6}})));
  Electrical.Branches.PwLine pwLinewithOpening1(
    G=0,
    R=0.01,
    X=0.1,
    opening=1,
    B=0.0005,
    t1=2,
    t2=2.15) annotation (Placement(transformation(
        origin={40,22},
        extent={{-6,-6},{6,6}})));
  Electrical.Branches.PwLine pwLine2(
    G=0,
    R=0.01,
    X=0.1,
    B=0.0005) annotation (Placement(transformation(
        origin={0,16},
        extent={{-6,-6},{6,6}})));
  Electrical.Branches.PwLine pwLine3(
    G=0,
    R=0.01,
    X=0.1,
    B=0.0005) annotation (Placement(transformation(
        origin={42,-6},
        extent={{-6,-6},{6,6}})));
  Electrical.Branches.PwLine pwLine4(
    G=0,
    R=0.01,
    X=0.1,
    B=0.0005) annotation (Placement(transformation(
        origin={40,40},
        extent={{-5.99999,-5.99998},{5.99999,6}})));
  Electrical.Loads.PSAT.PQ pwLoadPQ1(
    angle_0=0,
    P_0=8000000,
    Q_0=6000000,
    v_0=1) annotation (Placement(transformation(
        origin={74,32},
        extent={{-6,-6},{6,6}},
        rotation=90)));
  Electrical.Loads.PSAT.PQ pwLoadPQ2(
    angle_0=0,
    P_0=8000000,
    Q_0=6000000,
    v_0=1) annotation (Placement(transformation(
        origin={74.034,-6.2889},
        extent={{-6.2889,-6.0335},{6.2889,6.0335}},
        rotation=90)));
  Electrical.Buses.Bus bus
    annotation (Placement(transformation(extent={{-30,-2},{-10,18}})));
  Electrical.Buses.Bus bus1
    annotation (Placement(transformation(extent={{10,-2},{30,18}})));
  Electrical.Buses.Bus bus2
    annotation (Placement(transformation(extent={{50,22},{70,42}})));
  Electrical.Buses.Bus bus3
    annotation (Placement(transformation(extent={{50,-16},{70,4}})));
  Electrical.Controls.PSAT.AVR.AVRTypeI aVRI
    annotation (Placement(transformation(extent={{-72,36},{-92,54}})));
  Modelica.Blocks.Sources.Ramp ramp(
    duration=20,
    startTime=1,
    height=-0.1) annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        origin={-34,48})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-50,46},{-60,56}})));
equation

  connect(pwLine2.p, pwLine1.p) annotation (Line(points={{-5.4,16},{-14,16},{-14,
          2},{-5.4,2}}, color={0,0,255}));
  connect(pwLine2.n, pwLine1.n) annotation (Line(points={{5.4,16},{14,16},{14,2},
          {5.4,2}}, color={0,0,255}));
  connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(points={{34.6,40},{28,40},{28,22},{34.6,22}},
                                     color={0,0,255}));
  connect(pwLine4.n, pwLinewithOpening1.n) annotation (Line(points={{45.4,40},{52,40},{52,22},{45.4,22}},
                                     color={0,0,255}));
  connect(bus.p, pwLine1.p) annotation (Line(points={{-20,8},{-14,8},{-14,2},{-5.4,
          2}}, color={0,0,255}));
  connect(bus1.p, pwLine1.n)
    annotation (Line(points={{20,8},{14,8},{14,2},{5.4,2}}, color={0,0,255}));
  connect(bus1.p, pwLinewithOpening1.p) annotation (Line(points={{20,8},{24,8},
          {24,28},{28,28},{28,22},{34.6,22}},color={0,0,255}));
  connect(pwLine3.p, pwLinewithOpening1.p) annotation (Line(points={{36.6,-6},{
          24,-6},{24,28},{28,28},{28,22},{34.6,22}}, color={0,0,255}));
  connect(bus2.p, pwLoadPQ1.p)
    annotation (Line(points={{60,32},{68,32}}, color={0,0,255}));
  connect(bus2.p, pwLinewithOpening1.n) annotation (Line(points={{60,32},{52,32},
          {52,22},{45.4,22}}, color={0,0,255}));
  connect(bus3.p, pwLoadPQ2.p) annotation (Line(points={{60,-6},{68.0005,-6},{
          68.0005,-6.2889}}, color={0,0,255}));
  connect(pwLine3.n, bus3.p)
    annotation (Line(points={{47.4,-6},{60,-6}}, color={0,0,255}));
  connect(bus.p, order6Type2_Inputs_Outputs.p)
    annotation (Line(points={{-20,8},{-50,8}}, color={0,0,255}));
  connect(aVRI.vf, order6Type2_Inputs_Outputs.vf) annotation (Line(points={{-94,
          45},{-96,45},{-96,17},{-89.6,17}}, color={0,0,127}));
  connect(aVRI.v, order6Type2_Inputs_Outputs.v) annotation (Line(points={{-70,
          39.6},{-44,39.6},{-44,13.4},{-48.2,13.4}}, color={0,0,127}));
  connect(aVRI.vf0, order6Type2_Inputs_Outputs.vf0) annotation (Line(points={{-82,
          34.2},{-82,27.8},{-82.4,27.8}}, color={0,0,127}));
  connect(aVRI.vref0, add.u1) annotation (Line(points={{-82,55.8},{-82,62},{-49,
          62},{-49,54}}, color={0,0,127}));
  connect(ramp.y, add.u2) annotation (Line(points={{-40.6,48},{-43.25,48},{-49,
          48}}, color={0,0,127}));
  connect(add.y, aVRI.vref) annotation (Line(points={{-60.5,51},{-65.25,51},{-65.25,
          50.4},{-70,50.4}}, color={0,0,127}));
  connect(order6Type2_Inputs_Outputs.pm, order6Type2_Inputs_Outputs.pm0)
    annotation (Line(points={{-89.6,-1},{-96,-1},{-96,-16},{-82.4,-16},{-82.4,-11.8}},
        color={0,0,127}));
  annotation (
experiment(StopTime=60));
end AVRTypeI_Test;
