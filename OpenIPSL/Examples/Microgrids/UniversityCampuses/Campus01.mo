within OpenIPSL.Examples.Microgrids.UniversityCampuses;
model Campus01
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Buses.Bus B1L1(
    V_b=13800,
    v_0=0.9963676,
    angle_0=0.015964200291422)                  annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-70,240})));
  OpenIPSL.Electrical.Buses.Bus B2L1(
    V_b=13800,
    v_0=0.9963676,
    angle_0=0.015964200291422)                  annotation (Placement(
        transformation(
        extent={{-20,20},{20,-20}},
        rotation=90,
        origin={120,240})));
  OpenIPSL.Electrical.Buses.Bus B1L4(
    V_b=13800,
    v_0=0.9914145,
    angle_0=0.007860537090645)                  annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,60})));
  OpenIPSL.Electrical.Buses.Bus B2L4(
    V_b=13800,
    v_0=0.9914145,
    angle_0=0.007860537090645)                  annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={20,60})));
  OpenIPSL.Electrical.Buses.Bus B3L4(
    V_b=13800,
    v_0=0.9914145,
    angle_0=0.007860537090645)                  annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={140,60})));
  OpenIPSL.Electrical.Machines.PSSE.GENCLS UTILITY(
    V_b=13800,
    P_0=7867754,
    Q_0=10350770,
    v_0=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,170})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100000000, fn=60)
    annotation (Placement(transformation(extent={{80,-280},{200,-220}})));
  OpenIPSL.Electrical.Buses.Bus B1L2(
    V_b=13800,
    v_0=1.032378,
    angle_0=0.031715442488833)                  annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,180})));
  OpenIPSL.Electrical.Buses.Bus B2L2(V_b=13800, angle_0=0.01994277780511)
                                                annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={100,180})));
  OpenIPSL.Electrical.Buses.Bus B3L2(V_b=13800, angle_0=0.012789133968108)
                                                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={140,180})));
  OpenIPSL.Electrical.Buses.Bus B1L5(
    V_b=13800,
    v_0=0.9904618,
    angle_0=0.0079203844306959)                 annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-130,0})));
  OpenIPSL.Electrical.Buses.Bus B2L5(
    V_b=13800,
    v_0=0.9908763,
    angle_0=0.0080399743910425)                 annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-100,0})));
  OpenIPSL.Electrical.Buses.Bus B3L5(
    V_b=13800,
    v_0=0.990826,
    angle_0=0.0079143421008255)                 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={6,0})));
  OpenIPSL.Electrical.Buses.Bus B4L5(
    V_b=13800,
    v_0=0.9894211,
    angle_0=0.0090804698779114)                 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,0})));
  OpenIPSL.Electrical.Buses.Bus B5L5(
    V_b=13800,
    v_0=0.9870049,
    angle_0=0.0099380792937809)                 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,0})));
  OpenIPSL.Electrical.Buses.Bus B6L5(
    V_b=13800,
    v_0=0.9816263,
    angle_0=0.014693010674683)                  annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={140,0})));
  OpenIPSL.Electrical.Loads.PSSE.Load LOAD1(
    V_b=13800,
    P_0=818000,
    Q_0=388000,
    v_0=0.9904618,
    angle_0=0.0079203844306959)             annotation (Placement(
        transformation(extent={{-170,-30},{-150,-10}})));
  OpenIPSL.Electrical.Loads.PSSE.Load LOAD5(
    V_b=13800,
    P_0=266000,
    Q_0=101000,
    v_0=0.9908763,
    angle_0=0.0080399743910425)             annotation (Placement(
        transformation(extent={{-110,-28},{-90,-8}})));
  OpenIPSL.Electrical.Buses.Bus B1L7(
    V_b=13800,
    v_0=0.9918253,
    angle_0=0.0087523357612318)                 annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-130,-100})));
  OpenIPSL.Electrical.Loads.PSSE.Load LOAD2(
    V_b=13800,                                          P_0=0,
    v_0=0.9918253,
    angle_0=0.0087523357612318)             annotation (Placement(
        transformation(extent={{-160,-140},{-140,-120}})));
  OpenIPSL.Electrical.Loads.PSSE.Load LOAD10(
    V_b=13800,
    P_0=1677000,
    Q_0=967000,
    v_0=0.9816263,
    angle_0=0.014693010674683)
    annotation (Placement(transformation(extent={{130,-28},{150,-8}})));
  OpenIPSL.Electrical.Branches.PwLine Line18(
    R=0.4,
    X=0.1,
    G=0,
    B=0)                                     annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-130,-50})));
  OpenIPSL.Electrical.Branches.PwLine Line21(
    R=0.5,
    X=0.001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-110,-130})));
  OpenIPSL.Electrical.Buses.Bus B1L8(
    V_b=13800,
    v_0=0.9864689,
    angle_0=0.0089414945455629)                 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,-160})));
  OpenIPSL.Electrical.Branches.PwLine Line9(
    R=0.1,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-130,30})));
  OpenIPSL.Electrical.Branches.PwLine Line10(
    R=0.2,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,30})));
  OpenIPSL.Electrical.Branches.PwLine Line11(
    R=0.2,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,30})));
  OpenIPSL.Electrical.Branches.PwLine Line12(
    R=0.2,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-40,30})));
  OpenIPSL.Electrical.Branches.PwLine Line13(
    R=0.2,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,30})));
  OpenIPSL.Electrical.Branches.PwLine Line14(
    R=0.3,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,30})));
  OpenIPSL.Electrical.Branches.PwLine Line15(
    R=0.2,
    X=0.001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,30})));
  OpenIPSL.Electrical.Branches.PwLine Line16(
    R=0.2,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,30})));
  OpenIPSL.Electrical.Branches.PwLine Line17(
    R=0.7,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={140,30})));
  OpenIPSL.Electrical.Loads.PSSE.Load LOAD9(
    V_b=13800,
    P_0=2170000,
    Q_0=1120000,
    v_0=0.9870049,
    angle_0=0.0099380792937809)
    annotation (Placement(transformation(extent={{70,-28},{90,-8}})));
  OpenIPSL.Electrical.Loads.PSSE.Load LOAD8(
    V_b=13800,
    P_0=1290000,
    Q_0=602000,
    v_0=0.9894211,
    angle_0=0.0090804698779114)
    annotation (Placement(transformation(extent={{40,-28},{60,-8}})));
  OpenIPSL.Electrical.Branches.PwLine Line19(
    R=0.2,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={6,-20})));
  OpenIPSL.Electrical.Buses.Bus B1L6(
    V_b=13800,
    v_0=0.9898204,
    angle_0=0.0079465538975003)                 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={6,-40})));
  OpenIPSL.Electrical.Branches.PwLine Line20(
    R=0.2,
    X=0.001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={6,-70})));
  OpenIPSL.Electrical.Loads.PSSE.Load LOAD7(
    V_b=13800,
    P_0=305000,
    Q_0=167000,
    v_0=0.9898204,
    angle_0=0.0079465538975003)
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
  OpenIPSL.Electrical.Buses.Bus B1L9(
    V_b=13800,
    v_0=0.9846188,
    angle_0=0.0093144940959944)                 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,-220})));
  OpenIPSL.Electrical.Branches.PwLine Line24(
    R=0.2,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,-190})));
  OpenIPSL.Electrical.Loads.PSSE.Load LOAD3(
    V_b=13800,
    P_0=610000,
    Q_0=338000,
    v_0=0.9846188,
    angle_0=0.0093144940959944)
    annotation (Placement(transformation(extent={{-90,-260},{-70,-240}})));
  OpenIPSL.Electrical.Buses.Bus B2L9(
    V_b=13800,
    v_0=0.9841169,
    angle_0=0.0095954676709559)                 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={10,-220})));
  OpenIPSL.Electrical.Branches.PwLine Line25(
    R=0.001,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={10,-190})));
  OpenIPSL.Electrical.Loads.PSSE.Load LOAD4(
    V_b=13800,
    P_0=509000,
    Q_0=285000,
    v_0=0.9841169,
    angle_0=0.0095954676709559)
    annotation (Placement(transformation(extent={{0,-260},{20,-240}})));
  OpenIPSL.Electrical.Buses.Bus B2L7(
    V_b=13800,
    v_0=0.9893567,
    angle_0=0.0080351817169165)                 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,-100})));
  OpenIPSL.Electrical.Branches.PwLine Line22(
    R=0.2,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,-130})));
  OpenIPSL.Electrical.Branches.PwLine Line23(
    R=0.1,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,-130})));
  OpenIPSL.Electrical.Buses.Bus B2L8(
    V_b=13800,
    v_0=0.9888251,
    angle_0=0.0077923837286838)                 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,-160})));
  OpenIPSL.Electrical.Loads.PSSE.Load LOAD6(
    V_b=13800,
    P_0=381000,
    Q_0=144000,
    v_0=0.9888251,
    angle_0=0.0077923837286838)
    annotation (Placement(transformation(extent={{30,-200},{50,-180}})));
  OpenIPSL.Electrical.Branches.PwLine Line2(
    R=0.2,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-20,210})));
  OpenIPSL.Electrical.Branches.PwLine Line3(
    R=0.2,
    X=0.001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,210})));
  OpenIPSL.Electrical.Branches.PwLine Line6(
    R=0.5,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,120})));
  OpenIPSL.Electrical.Buses.Bus B1L3(V_b=13800, v_0=1.0)
                                                annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={20,140})));
  OpenIPSL.Electrical.Branches.PwLine Line7(
    R=0.2,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,98})));
  OpenIPSL.Electrical.Branches.PwLine Line8(
    R=0.2,
    X=0.001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,120})));
  OpenIPSL.Electrical.Branches.PwLine Line1(
    R=0.3,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,210})));
  OpenIPSL.Electrical.Branches.PwLine Line4(
    R=0.2,
    X=0.001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={100,210})));
  OpenIPSL.Electrical.Branches.PwLine Line5(
    R=0.4,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={140,210})));
  OpenIPSL.Electrical.Events.Breaker Br1(enableTrigger=false) annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={20,248})));
  OpenIPSL.Electrical.Events.Breaker Br2
    annotation (Placement(transformation(extent={{-46,54},{-34,66}})));
  OpenIPSL.Electrical.Events.Breaker Br3(rc_enabled=false, t_rc=10.5)
    annotation (Placement(transformation(extent={{74,54},{86,66}})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0.1,
    X=0.1,
    t1=20,
    t2=20.3)
    annotation (Placement(transformation(extent={{-50,200},{-30,220}})));
  Electrical.Machines.PSSE.Plant GT01(
    P_0=12960000,
    Q_0=-5000000,
    v_0=1.032378,
    angle_0=0.031715442488833,
    redeclare OpenIPSL.Electrical.Machines.PSSE.GENROE machine(
      P_0=GT01.P_0,
      Q_0=GT01.Q_0,
      v_0=GT01.v_0,
      angle_0=GT01.angle_0,
      M_b=16667000,
      Tpd0=5,
      Tppd0=0.05,
      Tppq0=0.1,
      H=4,
      D=0,
      Xd=1.41,
      Xq=1.35,
      Xpd=0.104,
      Xppd=0.072,
      Xppq=0.072,
      Xl=0.12,
      S10=0.1,
      S12=0.5,
      R_a=0,
      Xpq=0.104,
      Tpq0=0.7,
      Xpp=0.2),
    redeclare OpenIPSL.Electrical.Controls.PSSE.ES.ESAC1A exciter,
    redeclare OpenIPSL.Electrical.Controls.PSSE.TG.GAST governor,
    redeclare OpenIPSL.Electrical.Controls.PSSE.PSS.DisabledPSS pss)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,156})));
  Electrical.Machines.PSSE.Plant GT02(
    P_0=13010000,
    Q_0=-1972906,
    v_0=1,
    angle_0=0.01994277780511,
    redeclare Electrical.Machines.PSSE.GENROE machine(
      P_0=GT02.P_0,
      Q_0=GT02.Q_0,
      v_0=GT02.v_0,
      angle_0=GT02.angle_0,
      M_b=16667000,
      Tpd0=5,
      Tppd0=0.05,
      Tppq0=0.1,
      H=4,
      D=0,
      Xd=1.41,
      Xq=1.35,
      Xpd=0.104,
      Xppd=0.072,
      Xppq=0.072,
      Xl=0.12,
      S10=0.1,
      S12=0.5,
      R_a=0,
      Xpq=0.104,
      Tpq0=0.7,
      Xpp=0.2),
    redeclare Electrical.Controls.PSSE.ES.ESAC1A exciter,
    redeclare Electrical.Controls.PSSE.TG.GAST governor,
    redeclare Electrical.Controls.PSSE.PSS.DisabledPSS pss) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={100,156})));
  Electrical.Machines.PSSE.Plant STG1(
    P_0=640000,
    Q_0=813107.4,
    v_0=1,
    angle_0=0.012789133968108,
    redeclare OpenIPSL.Electrical.Machines.PSSE.GENROE machine(
      P_0=STG1.P_0,
      Q_0=STG1.Q_0,
      v_0=STG1.v_0,
      angle_0=STG1.angle_0,
      M_b=1000000,
      Tpd0=0.01,
      Tppd0=0.1,
      Tppq0=0.1,
      H=2,
      D=0,
      Xd=0.1,
      Xq=0.1,
      Xpd=0.01,
      Xppd=0.07,
      Xppq=0.07,
      Xl=0.001,
      S10=0.5,
      S12=0.2,
      Xpq=0.01,
      Tpq0=0.01),
    redeclare OpenIPSL.Electrical.Controls.PSSE.ES.ESAC1A exciter,
    redeclare OpenIPSL.Electrical.Controls.PSSE.TG.TGOV1 governor,
    redeclare OpenIPSL.Electrical.Controls.PSSE.PSS.DisabledPSS pss)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={140,156})));
equation
  connect(LOAD1.p, B1L5.p) annotation (Line(points={{-160,-10},{-160,-6},{-130,
          -6},{-130,0}},      color={0,0,255}));
  connect(B2L5.p, LOAD5.p)
    annotation (Line(points={{-100,0},{-100,-8}},      color={0,0,255}));
  connect(LOAD2.p, B1L7.p) annotation (Line(points={{-150,-120},{-150,-106},{
          -130,-106},{-130,-100}},
                              color={0,0,255}));
  connect(Line18.p, B1L7.p)
    annotation (Line(points={{-130,-59},{-130,-100}},  color={0,0,255}));
  connect(Line18.n, B1L5.p)
    annotation (Line(points={{-130,-41},{-130,0}},     color={0,0,255}));
  connect(Line21.n, B1L7.p) annotation (Line(points={{-110,-121},{-110,-106},{
          -130,-106},{-130,-100}},  color={0,0,255}));
  connect(LOAD10.p, B6L5.p)
    annotation (Line(points={{140,-8},{140,0}},      color={0,0,255}));
  connect(B5L5.p, LOAD9.p)
    annotation (Line(points={{80,0},{80,-8}},      color={0,0,255}));
  connect(LOAD8.p, B4L5.p)
    annotation (Line(points={{50,-8},{50,0}},      color={0,0,255}));
  connect(B3L5.p, Line19.n)
    annotation (Line(points={{6,0},{6,-11}},         color={0,0,255}));
  connect(Line19.p, B1L6.p)
    annotation (Line(points={{6,-29},{6,-40}},       color={0,0,255}));
  connect(B1L6.p, Line20.n)
    annotation (Line(points={{6,-40},{6,-61}},       color={0,0,255}));
  connect(LOAD7.p, B1L6.p) annotation (Line(points={{30,-60},{30,-46},{6,-46},{
          6,-40}},     color={0,0,255}));
  connect(Line21.p, B1L9.p) annotation (Line(points={{-110,-139},{-110,-200},{
          -80,-200},{-80,-220}},    color={0,0,255}));
  connect(Line24.p, B1L9.p) annotation (Line(points={{-30,-199},{-30,-214},{-80,
          -214},{-80,-220}},        color={0,0,255}));
  connect(LOAD3.p, B1L9.p)
    annotation (Line(points={{-80,-240},{-80,-220}},   color={0,0,255}));
  connect(Line25.p, B2L9.p)
    annotation (Line(points={{10,-199},{10,-220}},   color={0,0,255}));
  connect(B2L9.p, LOAD4.p)
    annotation (Line(points={{10,-220},{10,-240}},   color={0,0,255}));
  connect(Line24.n, B1L8.p)
    annotation (Line(points={{-30,-181},{-30,-160}}, color={0,0,255}));
  connect(Line25.n, B1L8.p) annotation (Line(points={{10,-181},{10,-166},{-30,
          -166},{-30,-160}},      color={0,0,255}));
  connect(Line22.n, B2L7.p)
    annotation (Line(points={{-30,-121},{-30,-100}}, color={0,0,255}));
  connect(Line22.p, B1L8.p)
    annotation (Line(points={{-30,-139},{-30,-160}}, color={0,0,255}));
  connect(Line20.p, B2L7.p) annotation (Line(points={{6,-79},{6,-94},{-30,-94},
          {-30,-100}},            color={0,0,255}));
  connect(Line23.n, B2L7.p) annotation (Line(points={{40,-121},{40,-116},{-30,
          -116},{-30,-100}}, color={0,0,255}));
  connect(Line23.p, B2L8.p)
    annotation (Line(points={{40,-139},{40,-160}}, color={0,0,255}));
  connect(B2L8.p, LOAD6.p)
    annotation (Line(points={{40,-160},{40,-180}}, color={0,0,255}));
  connect(Line3.p, B3L4.p) annotation (Line(points={{60,201},{60,70},{140,70},{
          140,60}},        color={0,0,255}));
  connect(Line2.p, B2L4.p) annotation (Line(points={{-20,201},{-20,70},{20,70},
          {20,60}},      color={0,0,255}));
  connect(B2L2.p, Line4.p)
    annotation (Line(points={{100,180},{100,201}},
                                                 color={0,0,255}));
  connect(Line4.n, B2L1.p) annotation (Line(points={{100,219},{100,232},{120,
          232},{120,240}}, color={0,0,255}));
  connect(Line5.n, B2L1.p) annotation (Line(points={{140,219},{140,232},{120,
          232},{120,240}},     color={0,0,255}));
  connect(Line5.p, B3L2.p)
    annotation (Line(points={{140,201},{140,180}}, color={0,0,255}));
  connect(Line1.p, B1L2.p)
    annotation (Line(points={{-70,201},{-70,180}}, color={0,0,255}));
  connect(Line1.n, B1L1.p)
    annotation (Line(points={{-70,219},{-70,240}}, color={0,0,255}));
  connect(B1L1.p, Br1.s) annotation (Line(points={{-70,240},{-70,248},{14,248}},
                 color={0,0,255}));
  connect(Br1.r, B2L1.p) annotation (Line(points={{26,248},{120,248},{120,240}},
                 color={0,0,255}));
  connect(Line3.n, B2L1.p) annotation (Line(points={{60,219},{60,232},{120,232},
          {120,240}},      color={0,0,255}));
  connect(Line2.n, B1L1.p) annotation (Line(points={{-20,219},{-20,232},{-70,
          232},{-70,240}},     color={0,0,255}));
  connect(Line7.n, B2L4.p) annotation (Line(points={{20,89},{20,60}},
                         color={0,0,255}));
  connect(Line7.p, B1L3.p) annotation (Line(points={{20,107},{20,140}},
                                            color={0,0,255}));
  connect(Br2.r, B2L4.p) annotation (Line(points={{-34,60},{-34,58},{20,58},{20,
          60}},           color={0,0,255}));
  connect(Br2.s, B1L4.p) annotation (Line(points={{-46,60},{-46,58},{-100,58},{
          -100,60}},        color={0,0,255}));
  connect(Br3.s, B2L4.p) annotation (Line(points={{74,60},{74,58},{20,58},{20,
          60}},      color={0,0,255}));
  connect(Br3.r, B3L4.p) annotation (Line(points={{86,60},{86,58},{140,58},{140,
          60}},            color={0,0,255}));
  connect(Line8.p, B1L3.p)
    annotation (Line(points={{101,120},{20,120},{20,140}},
                                                   color={0,0,255}));
  connect(Line6.p, B1L3.p) annotation (Line(points={{-61,120},{20,120},{20,140}},
                                 color={0,0,255}));
  connect(Line6.n, B1L4.p) annotation (Line(points={{-79,120},{-100,120},{-100,
          60}},                     color={0,0,255}));
  connect(Line8.n, B3L4.p)
    annotation (Line(points={{119,120},{140,120},{140,60}},
                                                        color={0,0,255}));
  connect(Line9.n, B1L4.p) annotation (Line(points={{-130,39},{-130,50},{-100,
          50},{-100,60}},         color={0,0,255}));
  connect(Line10.n, B1L4.p)
    annotation (Line(points={{-100,39},{-100,60}},    color={0,0,255}));
  connect(Line11.n, B1L4.p) annotation (Line(points={{-70,39},{-70,50},{-100,50},
          {-100,60}},            color={0,0,255}));
  connect(Line12.n, B2L4.p) annotation (Line(points={{-40,39},{-40,52},{20,52},
          {20,60}},        color={0,0,255}));
  connect(Line13.n, B2L4.p) annotation (Line(points={{-10,39},{-10,52},{20,52},
          {20,60}},        color={0,0,255}));
  connect(Line14.n, B2L4.p)
    annotation (Line(points={{20,39},{20,60}},  color={0,0,255}));
  connect(Line15.n, B2L4.p) annotation (Line(points={{50,39},{50,52},{20,52},{
          20,60}},       color={0,0,255}));
  connect(Line16.n, B2L4.p) annotation (Line(points={{80,39},{80,52},{20,52},{
          20,60}},       color={0,0,255}));
  connect(Line17.n, B3L4.p)
    annotation (Line(points={{140,39},{140,60}},    color={0,0,255}));
  connect(Line17.p, B6L5.p)
    annotation (Line(points={{140,21},{140,0}},      color={0,0,255}));
  connect(Line16.p, B5L5.p)
    annotation (Line(points={{80,21},{80,0}},      color={0,0,255}));
  connect(Line15.p, B4L5.p)
    annotation (Line(points={{50,21},{50,0}},      color={0,0,255}));
  connect(Line14.p, B3L5.p) annotation (Line(points={{20,21},{20,8},{6,8},{6,0}},
                             color={0,0,255}));
  connect(Line13.p, B3L5.p) annotation (Line(points={{-10,21},{-10,8},{6,8},{6,
          0}},                    color={0,0,255}));
  connect(Line10.p, B2L5.p)
    annotation (Line(points={{-100,21},{-100,0}},      color={0,0,255}));
  connect(Line9.p, B1L5.p)
    annotation (Line(points={{-130,21},{-130,0}},      color={0,0,255}));
  connect(Line11.p, B2L7.p) annotation (Line(points={{-70,21},{-70,-94},{-30,
          -94},{-30,-100}},       color={0,0,255}));
  connect(Line12.p, B2L7.p) annotation (Line(points={{-40,21},{-40,-94},{-30,
          -94},{-30,-100}},       color={0,0,255}));
  connect(UTILITY.p, B1L3.p)
    annotation (Line(points={{20,160},{20,140}}, color={0,0,255}));
  connect(pwFault.p, B1L1.p) annotation (Line(points={{-51.6667,210},{-58,210},
          {-58,232},{-70,232},{-70,240}},      color={0,0,255}));
  connect(GT01.pwPin, B1L2.p)
    annotation (Line(points={{-70,167},{-70,180}}, color={0,0,255}));
  connect(GT02.pwPin, B2L2.p)
    annotation (Line(points={{100,167},{100,180}}, color={0,0,255}));
  connect(STG1.pwPin, B3L2.p)
    annotation (Line(points={{140,167},{140,180}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-220,
            -300},{220,300}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-220,-300},{220,
            300}})),
    experiment(
      StopTime=29.9,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end Campus01;
