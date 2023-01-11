within OpenIPSL.Examples.Microgrids.UniversityCampuses.CampusA;
model SystemCampusA "Campus Model 1"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Buses.Bus B1L1(
    V_b=13800,
    v_0=PF_results.voltages.VB1L1,
    angle_0=PF_results.voltages.AB1L1)          annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-88,240})));
  OpenIPSL.Electrical.Buses.Bus B2L1(
    V_b=13800,
    v_0=PF_results.voltages.VB2L1,
    angle_0=PF_results.voltages.AB2L1)          annotation (Placement(
        transformation(
        extent={{-20,20},{20,-20}},
        rotation=90,
        origin={102,240})));
  OpenIPSL.Electrical.Buses.Bus B1L4(
    V_b=13800,
    v_0=PF_results.voltages.VB1L4,
    angle_0=PF_results.voltages.AB1L4)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-120,60})));
  OpenIPSL.Electrical.Buses.Bus B2L4(
    V_b=13800,
    v_0=PF_results.voltages.VB2L4,
    angle_0=PF_results.voltages.AB2L4)          annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={2,60})));
  OpenIPSL.Electrical.Buses.Bus B3L4(
    V_b=13800,
    v_0=PF_results.voltages.VB3L4,
    angle_0=PF_results.voltages.AB3L4)          annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={122,60})));
  OpenIPSL.Electrical.Machines.PSSE.GENCLS UTILITY(
    V_b=13800,
    P_0=PF_results.machines.PInf,
    Q_0=PF_results.machines.QInf,
    v_0=PF_results.voltages.VB1L3,
    angle_0=PF_results.voltages.AB1L3)
           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={2,190})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100000000, fn=60)
    annotation (Placement(transformation(extent={{80,-260},{140,-220}})));
  OpenIPSL.Electrical.Buses.Bus B1L2(
    V_b=13800,
    v_0=PF_results.voltages.VB1L2,
    angle_0=PF_results.voltages.AB1L2)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-88,180})));
  OpenIPSL.Electrical.Buses.Bus B2L2(
    V_b=13800,
    v_0=PF_results.voltages.VB2L2,
    angle_0=PF_results.voltages.AB2L2)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={82,180})));
  OpenIPSL.Electrical.Buses.Bus B3L2(
    V_b=13800,
    v_0=PF_results.voltages.VB3L2,
    angle_0=PF_results.voltages.AB3L2)            annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={122,180})));
  OpenIPSL.Electrical.Buses.Bus B1L5(
    V_b=13800,
    v_0=PF_results.voltages.VB1L5,
    angle_0=PF_results.voltages.AB1L5)          annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-148,0})));
  OpenIPSL.Electrical.Buses.Bus B2L5(
    V_b=13800,
    v_0=PF_results.voltages.VB2L5,
    angle_0=PF_results.voltages.AB2L5)          annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-118,0})));
  OpenIPSL.Electrical.Buses.Bus B3L5(
    V_b=13800,
    v_0=PF_results.voltages.VB3L5,
    angle_0=PF_results.voltages.AB3L5)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-12,0})));
  OpenIPSL.Electrical.Buses.Bus B4L5(
    V_b=13800,
    v_0=PF_results.voltages.VB4L5,
    angle_0=PF_results.voltages.AB4L5)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={32,0})));
  OpenIPSL.Electrical.Buses.Bus B5L5(
    V_b=13800,
    v_0=PF_results.voltages.VB5L5,
    angle_0=PF_results.voltages.AB5L5)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={62,0})));
  OpenIPSL.Electrical.Buses.Bus B6L5(
    V_b=13800,
    v_0=PF_results.voltages.VB6L5,
    angle_0=PF_results.voltages.AB6L5)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={122,0})));
  OpenIPSL.Electrical.Loads.PSSE.Load LOAD1(
    V_b=13800,
    P_0=PF_results.loads.P1,
    Q_0=PF_results.loads.Q1,
    v_0=PF_results.voltages.VB1L5,
    angle_0=PF_results.voltages.AB1L5)      annotation (Placement(
        transformation(extent={{-188,-30},{-168,-10}})));
  OpenIPSL.Electrical.Loads.PSSE.Load LOAD2(
    V_b=13800,
    P_0=PF_results.loads.P2,
    Q_0=PF_results.loads.Q2,
    v_0=PF_results.voltages.VB2L5,
    angle_0=PF_results.voltages.AB2L5)
    annotation (Placement(transformation(extent={{-128,-28},{-108,-8}})));
  OpenIPSL.Electrical.Buses.Bus B1L7(
    V_b=13800,
    v_0=PF_results.voltages.VB1L7,
    angle_0=PF_results.voltages.AB1L7)          annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-148,-100})));
  OpenIPSL.Electrical.Loads.PSSE.Load LOAD7(
    V_b=13800,
    P_0=PF_results.loads.P7,
    Q_0=PF_results.loads.Q7,
    v_0=PF_results.voltages.VB1L7,
    angle_0=PF_results.voltages.AB1L7)
    annotation (Placement(transformation(extent={{-178,-140},{-158,-120}})));
  OpenIPSL.Electrical.Loads.PSSE.Load LOAD5(
    V_b=13800,
    P_0=PF_results.loads.P5,
    Q_0=PF_results.loads.Q5,
    v_0=PF_results.voltages.VB6L5,
    angle_0=PF_results.voltages.AB6L5)
    annotation (Placement(transformation(extent={{112,-28},{132,-8}})));
  OpenIPSL.Electrical.Branches.PwLine Line18(
    R=0.4,
    X=0.1,
    G=0,
    B=0)                                     annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-148,-50})));
  OpenIPSL.Electrical.Branches.PwLine Line21(
    R=0.5,
    X=0.001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-128,-130})));
  OpenIPSL.Electrical.Buses.Bus B1L8(
    V_b=13800,
    v_0=PF_results.voltages.VB1L8,
    angle_0=PF_results.voltages.AB1L8)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-48,-160})));
  OpenIPSL.Electrical.Branches.PwLine Line9(
    R=0.1,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-148,30})));
  OpenIPSL.Electrical.Branches.PwLine Line10(
    R=0.2,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-118,30})));
  OpenIPSL.Electrical.Branches.PwLine Line11(
    R=0.2,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-88,30})));
  OpenIPSL.Electrical.Branches.PwLine Line12(
    R=0.2,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-58,30})));
  OpenIPSL.Electrical.Branches.PwLine Line13(
    R=0.2,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-28,30})));
  OpenIPSL.Electrical.Branches.PwLine Line14(
    R=0.3,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={2,30})));
  OpenIPSL.Electrical.Branches.PwLine Line15(
    R=0.2,
    X=0.001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={32,30})));
  OpenIPSL.Electrical.Branches.PwLine Line16(
    R=0.2,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={62,30})));
  OpenIPSL.Electrical.Branches.PwLine Line17(
    R=0.7,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={122,30})));
  OpenIPSL.Electrical.Loads.PSSE.Load LOAD4(
    V_b=13800,
    P_0=PF_results.loads.P4,
    Q_0=PF_results.loads.Q4,
    v_0=PF_results.voltages.VB5L5,
    angle_0=PF_results.voltages.AB5L5)
    annotation (Placement(transformation(extent={{52,-28},{72,-8}})));
  OpenIPSL.Electrical.Loads.PSSE.Load LOAD3(
    V_b=13800,
    P_0=PF_results.loads.P3,
    Q_0=PF_results.loads.Q3,
    v_0=PF_results.voltages.VB4L5,
    angle_0=PF_results.voltages.AB4L5)
    annotation (Placement(transformation(extent={{22,-28},{42,-8}})));
  OpenIPSL.Electrical.Branches.PwLine Line19(
    R=0.2,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-12,-20})));
  OpenIPSL.Electrical.Buses.Bus B1L6(
    V_b=13800,
    v_0=PF_results.voltages.VB1L6,
    angle_0=PF_results.voltages.AB1L6)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-12,-40})));
  OpenIPSL.Electrical.Branches.PwLine Line20(
    R=0.2,
    X=0.001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-12,-70})));
  OpenIPSL.Electrical.Loads.PSSE.Load LOAD6(
    V_b=13800,
    P_0=PF_results.loads.P6,
    Q_0=PF_results.loads.Q6,
    v_0=PF_results.voltages.VB1L6,
    angle_0=PF_results.voltages.AB1L6)
    annotation (Placement(transformation(extent={{2,-80},{22,-60}})));
  OpenIPSL.Electrical.Buses.Bus B1L9(
    V_b=13800,
    v_0=PF_results.voltages.VB1L9,
    angle_0=PF_results.voltages.AB1L9)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-98,-220})));
  OpenIPSL.Electrical.Branches.PwLine Line24(
    R=0.2,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-48,-190})));
  OpenIPSL.Electrical.Loads.PSSE.Load LOAD9(
    V_b=13800,
    P_0=PF_results.loads.P9,
    Q_0=PF_results.loads.Q9,
    v_0=PF_results.voltages.VB1L9,
    angle_0=PF_results.voltages.AB1L9)
    annotation (Placement(transformation(extent={{-108,-260},{-88,-240}})));
  OpenIPSL.Electrical.Buses.Bus B2L9(
    V_b=13800,
    v_0=PF_results.voltages.VB2L9,
    angle_0=PF_results.voltages.AB2L9)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-8,-220})));
  OpenIPSL.Electrical.Branches.PwLine Line25(
    R=0.001,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-8,-190})));
  OpenIPSL.Electrical.Loads.PSSE.Load LOAD10(
    V_b=13800,
    P_0=PF_results.loads.P10,
    Q_0=PF_results.loads.Q10,
    v_0=PF_results.voltages.VB2L9,
    angle_0=PF_results.voltages.AB2L9)
    annotation (Placement(transformation(extent={{-18,-260},{2,-240}})));
  OpenIPSL.Electrical.Buses.Bus B2L7(
    V_b=13800,
    v_0=PF_results.voltages.VB2L7,
    angle_0=PF_results.voltages.AB2L7)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-48,-100})));
  OpenIPSL.Electrical.Branches.PwLine Line22(
    R=0.2,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-48,-130})));
  OpenIPSL.Electrical.Branches.PwLine Line23(
    R=0.1,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={22,-130})));
  OpenIPSL.Electrical.Buses.Bus B2L8(
    V_b=13800,
    v_0=PF_results.voltages.VB2L8,
    angle_0=PF_results.voltages.AB2L8)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={22,-160})));
  OpenIPSL.Electrical.Loads.PSSE.Load LOAD8(
    V_b=13800,
    P_0=PF_results.loads.P8,
    Q_0=PF_results.loads.Q8,
    v_0=PF_results.voltages.VB2L8,
    angle_0=PF_results.voltages.AB2L8)
    annotation (Placement(transformation(extent={{12,-200},{32,-180}})));
  OpenIPSL.Electrical.Branches.PwLine Line2(
    R=0.2,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-38,210})));
  OpenIPSL.Electrical.Branches.PwLine Line3(
    R=0.2,
    X=0.001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={162,210})));
  OpenIPSL.Electrical.Branches.PwLine Line6(
    R=0.5,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-90,106})));
  OpenIPSL.Electrical.Buses.Bus B1L3(
    V_b=13800,
    v_0=PF_results.voltages.VB1L3,
    angle_0=PF_results.voltages.AB1L3)          annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={2,140})));
  OpenIPSL.Electrical.Branches.PwLine Line7(
    R=0.2,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={2,88})));
  OpenIPSL.Electrical.Branches.PwLine Line8(
    R=0.2,
    X=0.001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={92,106})));
  OpenIPSL.Electrical.Branches.PwLine Line1(
    R=0.3,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-88,210})));
  OpenIPSL.Electrical.Branches.PwLine Line4(
    R=0.2,
    X=0.001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={82,210})));
  OpenIPSL.Electrical.Branches.PwLine Line5(
    R=0.4,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={122,210})));
  OpenIPSL.Electrical.Events.Breaker Br1(enableTrigger=false) annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={2,248})));
  OpenIPSL.Electrical.Events.Breaker Br2
    annotation (Placement(transformation(extent={{-64,54},{-52,66}})));
  OpenIPSL.Electrical.Events.Breaker Br3(rc_enabled=false, t_rc=10.5)
    annotation (Placement(transformation(extent={{56,54},{68,66}})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0.01,
    X=0.5,
    t1=10,
    t2=10.1)
    annotation (Placement(transformation(extent={{64,-148},{84,-128}})));
  GeneratorGroups.GasTurbineUnit GT1(
    P_0=PF_results.machines.PGT1,
    Q_0=PF_results.machines.QGT1,
    v_0=PF_results.voltages.VB1L2,
    angle_0=PF_results.voltages.AB1L2)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-88,138})));
  GeneratorGroups.GasTurbineUnit GT2(
    P_0=PF_results.machines.PGT2,
    Q_0=PF_results.machines.QGT2,
    v_0=PF_results.voltages.VB2L2,
    angle_0=PF_results.voltages.AB2L2)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={82,136})));
  GeneratorGroups.SteamTurbineUnit steamTurbineUnit(
    P_0=PF_results.machines.PST,
    Q_0=PF_results.machines.QST,
    v_0=PF_results.voltages.VB3L2,
    angle_0=PF_results.voltages.AB3L2)
                                 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={122,140})));
  Electrical.Events.Breaker BrST(enableTrigger=false, t_o=0) annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={122,166})));
  inner Data.PF_results PF_results(
    redeclare record Voltages =
        OpenIPSL.Examples.Microgrids.UniversityCampuses.CampusA.Data.VoltagesCampus1,
    redeclare record Machines =
        OpenIPSL.Examples.Microgrids.UniversityCampuses.CampusA.Data.MachinesCampus1,
    redeclare record Loads =
        OpenIPSL.Examples.Microgrids.UniversityCampuses.CampusA.Data.LoadsCampus1)
    annotation (Placement(transformation(extent={{160,-256},{200,-216}})));

  Electrical.Events.Breaker BrGT1(enableTrigger=false)       annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-88,166})));
  Electrical.Events.Breaker BrGT2(enableTrigger=false)       annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={82,166})));
  Electrical.Events.Breaker BrUTILITY(enableTrigger=false, t_o=5) annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={2,164})));
equation
  connect(LOAD1.p, B1L5.p) annotation (Line(points={{-178,-10},{-178,-6},{-148,
          -6},{-148,0}},      color={0,0,255}));
  connect(B2L5.p, LOAD2.p)
    annotation (Line(points={{-118,0},{-118,-8}}, color={0,0,255}));
  connect(LOAD7.p, B1L7.p) annotation (Line(points={{-168,-120},{-168,-106},{-148,
          -106},{-148,-100}}, color={0,0,255}));
  connect(Line18.p, B1L7.p)
    annotation (Line(points={{-148,-59},{-148,-100}},  color={0,0,255}));
  connect(Line18.n, B1L5.p)
    annotation (Line(points={{-148,-41},{-148,0}},     color={0,0,255}));
  connect(Line21.n, B1L7.p) annotation (Line(points={{-128,-121},{-128,-106},{
          -148,-106},{-148,-100}},  color={0,0,255}));
  connect(LOAD5.p, B6L5.p)
    annotation (Line(points={{122,-8},{122,0}}, color={0,0,255}));
  connect(B5L5.p, LOAD4.p)
    annotation (Line(points={{62,0},{62,-8}}, color={0,0,255}));
  connect(LOAD3.p, B4L5.p)
    annotation (Line(points={{32,-8},{32,0}}, color={0,0,255}));
  connect(B3L5.p, Line19.n)
    annotation (Line(points={{-12,0},{-12,-11}},     color={0,0,255}));
  connect(Line19.p, B1L6.p)
    annotation (Line(points={{-12,-29},{-12,-40}},   color={0,0,255}));
  connect(B1L6.p, Line20.n)
    annotation (Line(points={{-12,-40},{-12,-61}},   color={0,0,255}));
  connect(LOAD6.p, B1L6.p) annotation (Line(points={{12,-60},{12,-46},{-12,-46},
          {-12,-40}}, color={0,0,255}));
  connect(Line21.p, B1L9.p) annotation (Line(points={{-128,-139},{-128,-200},{
          -98,-200},{-98,-220}},    color={0,0,255}));
  connect(Line24.p, B1L9.p) annotation (Line(points={{-48,-199},{-48,-214},{-98,
          -214},{-98,-220}},        color={0,0,255}));
  connect(LOAD9.p, B1L9.p)
    annotation (Line(points={{-98,-240},{-98,-220}}, color={0,0,255}));
  connect(Line25.p, B2L9.p)
    annotation (Line(points={{-8,-199},{-8,-220}},   color={0,0,255}));
  connect(B2L9.p, LOAD10.p)
    annotation (Line(points={{-8,-220},{-8,-240}}, color={0,0,255}));
  connect(Line24.n, B1L8.p)
    annotation (Line(points={{-48,-181},{-48,-160}}, color={0,0,255}));
  connect(Line25.n, B1L8.p) annotation (Line(points={{-8,-181},{-8,-166},{-48,
          -166},{-48,-160}},      color={0,0,255}));
  connect(Line22.n, B2L7.p)
    annotation (Line(points={{-48,-121},{-48,-100}}, color={0,0,255}));
  connect(Line22.p, B1L8.p)
    annotation (Line(points={{-48,-139},{-48,-160}}, color={0,0,255}));
  connect(Line20.p, B2L7.p) annotation (Line(points={{-12,-79},{-12,-94},{-48,
          -94},{-48,-100}},       color={0,0,255}));
  connect(Line23.n, B2L7.p) annotation (Line(points={{22,-121},{22,-116},{-48,
          -116},{-48,-100}}, color={0,0,255}));
  connect(Line23.p, B2L8.p)
    annotation (Line(points={{22,-139},{22,-160}}, color={0,0,255}));
  connect(B2L8.p, LOAD8.p)
    annotation (Line(points={{22,-160},{22,-180}}, color={0,0,255}));
  connect(Line3.p, B3L4.p) annotation (Line(points={{162,201},{162,76},{122,76},
          {122,60}},       color={0,0,255}));
  connect(Line2.p, B2L4.p) annotation (Line(points={{-38,201},{-38,62},{2,62},{
          2,60}},        color={0,0,255}));
  connect(B2L2.p, Line4.p)
    annotation (Line(points={{82,180},{82,201}}, color={0,0,255}));
  connect(Line4.n, B2L1.p) annotation (Line(points={{82,219},{82,232},{102,232},
          {102,240}},      color={0,0,255}));
  connect(Line5.n, B2L1.p) annotation (Line(points={{122,219},{122,232},{102,
          232},{102,240}},     color={0,0,255}));
  connect(Line5.p, B3L2.p)
    annotation (Line(points={{122,201},{122,180}}, color={0,0,255}));
  connect(Line1.p, B1L2.p)
    annotation (Line(points={{-88,201},{-88,180}}, color={0,0,255}));
  connect(Line1.n, B1L1.p)
    annotation (Line(points={{-88,219},{-88,240}}, color={0,0,255}));
  connect(B1L1.p, Br1.s) annotation (Line(points={{-88,240},{-88,248},{-4,248}},
                 color={0,0,255}));
  connect(Br1.r, B2L1.p) annotation (Line(points={{8,248},{102,248},{102,240}},
                 color={0,0,255}));
  connect(Line3.n, B2L1.p) annotation (Line(points={{162,219},{162,232},{102,
          232},{102,240}}, color={0,0,255}));
  connect(Line2.n, B1L1.p) annotation (Line(points={{-38,219},{-38,232},{-88,
          232},{-88,240}},     color={0,0,255}));
  connect(Line7.n, B2L4.p) annotation (Line(points={{2,79},{2,60}},
                         color={0,0,255}));
  connect(Line7.p, B1L3.p) annotation (Line(points={{2,97},{2,140}},
                                            color={0,0,255}));
  connect(Br2.r, B2L4.p) annotation (Line(points={{-52,60},{-52,58},{2,58},{2,
          60}},           color={0,0,255}));
  connect(Br2.s, B1L4.p) annotation (Line(points={{-64,60},{-64,58},{-120,58},
          {-120,60}},       color={0,0,255}));
  connect(Br3.s, B2L4.p) annotation (Line(points={{56,60},{56,58},{2,58},{2,60}},
                     color={0,0,255}));
  connect(Br3.r, B3L4.p) annotation (Line(points={{68,60},{68,58},{122,58},{122,
          60}},            color={0,0,255}));
  connect(Line8.p, B1L3.p)
    annotation (Line(points={{83,106},{2,106},{2,140}},
                                                   color={0,0,255}));
  connect(Line6.p, B1L3.p) annotation (Line(points={{-81,106},{2,106},{2,140}},
                                 color={0,0,255}));
  connect(Line6.n, B1L4.p) annotation (Line(points={{-99,106},{-120,106},{-120,
          60}},                     color={0,0,255}));
  connect(Line8.n, B3L4.p)
    annotation (Line(points={{101,106},{122,106},{122,60}},
                                                        color={0,0,255}));
  connect(Line9.n, B1L4.p) annotation (Line(points={{-148,39},{-148,50},{-120,
          50},{-120,60}},         color={0,0,255}));
  connect(Line10.n, B1L4.p)
    annotation (Line(points={{-118,39},{-118,60},{-120,60}},
                                                      color={0,0,255}));
  connect(Line11.n, B1L4.p) annotation (Line(points={{-88,39},{-88,50},{-120,50},
          {-120,60}},            color={0,0,255}));
  connect(Line12.n, B2L4.p) annotation (Line(points={{-58,39},{-58,52},{2,52},{
          2,60}},          color={0,0,255}));
  connect(Line13.n, B2L4.p) annotation (Line(points={{-28,39},{-28,52},{2,52},{
          2,60}},          color={0,0,255}));
  connect(Line14.n, B2L4.p)
    annotation (Line(points={{2,39},{2,60}},    color={0,0,255}));
  connect(Line15.n, B2L4.p) annotation (Line(points={{32,39},{32,52},{2,52},{2,
          60}},          color={0,0,255}));
  connect(Line16.n, B2L4.p) annotation (Line(points={{62,39},{62,52},{2,52},{2,
          60}},          color={0,0,255}));
  connect(Line17.n, B3L4.p)
    annotation (Line(points={{122,39},{122,60}},    color={0,0,255}));
  connect(Line17.p, B6L5.p)
    annotation (Line(points={{122,21},{122,0}},      color={0,0,255}));
  connect(Line16.p, B5L5.p)
    annotation (Line(points={{62,21},{62,0}},      color={0,0,255}));
  connect(Line15.p, B4L5.p)
    annotation (Line(points={{32,21},{32,0}},      color={0,0,255}));
  connect(Line14.p, B3L5.p) annotation (Line(points={{2,21},{2,8},{-12,8},{-12,
          0}},               color={0,0,255}));
  connect(Line13.p, B3L5.p) annotation (Line(points={{-28,21},{-28,8},{-12,8},{
          -12,0}},                color={0,0,255}));
  connect(Line10.p, B2L5.p)
    annotation (Line(points={{-118,21},{-118,0}},      color={0,0,255}));
  connect(Line9.p, B1L5.p)
    annotation (Line(points={{-148,21},{-148,0}},      color={0,0,255}));
  connect(Line11.p, B2L7.p) annotation (Line(points={{-88,21},{-88,-94},{-48,
          -94},{-48,-100}},       color={0,0,255}));
  connect(Line12.p, B2L7.p) annotation (Line(points={{-58,21},{-58,-94},{-48,
          -94},{-48,-100}},       color={0,0,255}));
  connect(pwFault.p, B2L8.p) annotation (Line(points={{62.3333,-138},{28,-138},
          {28,-160},{22,-160}}, color={0,0,255}));
  connect(steamTurbineUnit.pwPin, BrST.s)
    annotation (Line(points={{122,151},{122,160}}, color={0,0,255}));
  connect(BrST.r, B3L2.p)
    annotation (Line(points={{122,172},{122,180}}, color={0,0,255}));
  connect(BrGT1.r, B1L2.p)
    annotation (Line(points={{-88,172},{-88,180}}, color={0,0,255}));
  connect(GT1.pwPin, BrGT1.s)
    annotation (Line(points={{-88,149},{-88,160}}, color={0,0,255}));
  connect(GT2.pwPin, BrGT2.s)
    annotation (Line(points={{82,147},{82,160}}, color={0,0,255}));
  connect(BrGT2.r, B2L2.p)
    annotation (Line(points={{82,172},{82,180}}, color={0,0,255}));
  connect(BrUTILITY.s, B1L3.p) annotation (Line(points={{2,158},{2,149},{2,149},
          {2,140}}, color={0,0,255}));
  connect(BrUTILITY.r, UTILITY.p) annotation (Line(points={{2,170},{2,175},{2,
          175},{2,180}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-220,
            -300},{220,300}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-220,-300},{220,
            300}})),
    experiment(StopTime=30, __Dymola_Algorithm="Dassl"));
end SystemCampusA;
