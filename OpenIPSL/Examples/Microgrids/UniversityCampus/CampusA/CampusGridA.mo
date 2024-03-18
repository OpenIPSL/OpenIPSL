within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA;
model CampusGridA "Microgrid model for university campus A"
    extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Buses.Bus AENB(
    V_b=69000,
    v_0=pf.powerflow.bus.V2,
    angle_0=pf.powerflow.bus.A2)               annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,138})));
  OpenIPSL.Electrical.Buses.Bus H2E(
    V_b=12000,
    v_0=pf.powerflow.bus.V3,
    angle_0=pf.powerflow.bus.A3)              annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-110,78})));
  OpenIPSL.Electrical.Buses.Bus H4S(
    V_b=12000,
    v_0=pf.powerflow.bus.V4,
    angle_0=pf.powerflow.bus.A4)              annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,78})));
  OpenIPSL.Electrical.Buses.Bus H3N(
    V_b=12000,
    v_0=pf.powerflow.bus.V5,
    angle_0=pf.powerflow.bus.A5)              annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,78})));
  OpenIPSL.Electrical.Buses.Bus H1W(
    V_b=12000,
    v_0=pf.powerflow.bus.V6,
    angle_0=pf.powerflow.bus.A6)              annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={110,78})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T1(
    R=0.02,
    X=0.153700,
    G=0,
    B=0,
    CW=2,
    VNOM1=69000,
    VNOM2=12000,
    S_n=30000000) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-110,110})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T2(
    R=0.02,
    X=0.153700,
    G=0,
    B=0,
    CW=2,
    VNOM1=69000,
    VNOM2=12000,
    S_n=30000000) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,110})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T4(
    R=0.02,
    X=0.153700,
    G=0,
    B=0,
    CW=2,
    VNOM1=69000,
    VNOM2=12000,
    S_n=30000000) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={110,110})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T3(
    R=0.02,
    X=0.153700,
    G=0,
    B=0,
    CW=2,
    VNOM1=69000,
    VNOM2=12000,
    S_n=30000000) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,110})));
  OpenIPSL.Electrical.Branches.PwLine X1(
    R=0,
    X=0.5021,
    G=0,
    B=0)
    annotation (Placement(transformation(extent={{-90,58},{-70,78}})));
  OpenIPSL.Electrical.Branches.PwLine X2(
    R=0,
    X=0.5021,
    G=0,
    B=0)
    annotation (Placement(transformation(extent={{-10,58},{10,78}})));
  OpenIPSL.Electrical.Branches.PwLine X4(
    R=0,
    X=0.5021,
    G=0,
    B=0)
    annotation (Placement(transformation(extent={{70,58},{90,78}})));
  OpenIPSL.Electrical.Buses.Bus A1W(
    V_b=12000,
    v_0=pf.powerflow.bus.V7,
    angle_0=pf.powerflow.bus.A7)              annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,26})));
  OpenIPSL.Electrical.Buses.Bus A2E(
    V_b=12000,
    v_0=pf.powerflow.bus.V8,
    angle_0=pf.powerflow.bus.A8)              annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,26})));
  OpenIPSL.Electrical.Branches.PwLine X3(
    R=0,
    X=0.5021,
    G=0,
    B=0)
    annotation (Placement(transformation(extent={{-10,44},{10,64}})));
  OpenIPSL.Electrical.Buses.Bus W1W(
    V_b=12000,
    v_0=pf.powerflow.bus.V9,
    angle_0=pf.powerflow.bus.A9)              annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,-32})));
  OpenIPSL.Electrical.Buses.Bus W2E(
    V_b=12000,
    v_0=pf.powerflow.bus.V10,
    angle_0=pf.powerflow.bus.A10)             annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,-32})));
  OpenIPSL.Electrical.Branches.PwLine X5(
    R=0,
    X=0.5021,
    G=0,
    B=0)
    annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));
  OpenIPSL.Electrical.Buses.Bus W3N(
    V_b=12000,
    v_0=pf.powerflow.bus.V11,
    angle_0=pf.powerflow.bus.A11)             annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-110,-102})));
  OpenIPSL.Electrical.Buses.Bus W4S(
    V_b=12000,
    v_0=pf.powerflow.bus.V12,
    angle_0=pf.powerflow.bus.A12)             annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={110,-102})));
  OpenIPSL.Electrical.Branches.PwLine X6(
    R=0,
    X=0.5021,
    G=0,
    B=0)                                 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-120,-42})));
  OpenIPSL.Electrical.Branches.PwLine X7(
    R=0,
    X=0.5021,
    G=0,
    B=0)                                 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={120,-42})));
  OpenIPSL.Electrical.Buses.Bus B416N(
    V_b=4160,
    v_0=pf.powerflow.bus.V13,
    angle_0=pf.powerflow.bus.A13)                 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-160})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T6(
    R=0.01,
    X=0.057620,
    G=0,
    B=0,
    CW=2,
    VNOM1=12000,
    VNOM2=4160,
    S_n=7500000) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,-126})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T5(
    R=0.01,
    X=0.05762,
    G=0,
    B=0,
    CW=2,
    VNOM1=12000,
    VNOM2=4160,
    S_n=7500000) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-90,-126})));
  OpenIPSL.Electrical.Buses.Bus AENA(
    V_b=69000,
    v_0=pf.powerflow.bus.V1,
    angle_0=pf.powerflow.bus.A1)               annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,168})));
  OpenIPSL.Electrical.Branches.PwLine L1(
    R=0.01,
    X=0.01,
    G=0,
    B=0)                                 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,152})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60)
    annotation (Placement(transformation(extent={{74,160},{140,200}})));
  OpenIPSL.Electrical.Branches.PwLine L3(
    R=0,
    X=0.0001,
    G=0,
    B=0) annotation (Placement(transformation(extent={{84,30},{104,50}})));
  OpenIPSL.Electrical.Loads.PSSE.Load Load01(
    P_0=pf.powerflow.loads.PL1,
    Q_0=pf.powerflow.loads.QL1,
    v_0=pf.powerflow.bus.V3,
    angle_0=pf.powerflow.bus.A3)
    annotation (Placement(transformation(extent={{-124,58},{-112,68}})));
  OpenIPSL.Electrical.Loads.PSSE.Load Load02(
    P_0=pf.powerflow.loads.PL2,
    Q_0=pf.powerflow.loads.QL2,
    v_0=pf.powerflow.bus.V4,
    angle_0=pf.powerflow.bus.A4)
    annotation (Placement(transformation(extent={{-48,38},{-36,48}})));
  OpenIPSL.Electrical.Loads.PSSE.Load Load03(
    P_0=pf.powerflow.loads.PL3,
    Q_0=pf.powerflow.loads.QL3,
    v_0=pf.powerflow.bus.V5,
    angle_0=pf.powerflow.bus.A5)
    annotation (Placement(transformation(extent={{32,38},{44,48}})));
  OpenIPSL.Electrical.Loads.PSSE.Load Load04(
    P_0=pf.powerflow.loads.PL4,
    Q_0=pf.powerflow.loads.QL4,
    v_0=pf.powerflow.bus.V6,
    angle_0=pf.powerflow.bus.A6)
    annotation (Placement(transformation(extent={{120,56},{132,66}})));
  OpenIPSL.Electrical.Loads.PSSE.Load Load05(
    P_0=pf.powerflow.loads.PL5,
    Q_0=pf.powerflow.loads.QL5,
    v_0=pf.powerflow.bus.V7,
    angle_0=pf.powerflow.bus.A7)
    annotation (Placement(transformation(extent={{-40,2},{-28,12}})));
  OpenIPSL.Electrical.Loads.PSSE.Load Load06(
    P_0=pf.powerflow.loads.PL6,
    Q_0=pf.powerflow.loads.QL6,
    v_0=pf.powerflow.bus.V8,
    angle_0=pf.powerflow.bus.A8)
    annotation (Placement(transformation(extent={{28,2},{40,12}})));
  OpenIPSL.Electrical.Loads.PSSE.Load Load09(
    P_0=pf.powerflow.loads.PL9,
    Q_0=pf.powerflow.loads.QL9,
    v_0=pf.powerflow.bus.V11,
    angle_0=pf.powerflow.bus.A11)
    annotation (Placement(transformation(extent={{-132,-126},{-120,-116}})));
  OpenIPSL.Electrical.Loads.PSSE.Load Load10(
    P_0=pf.powerflow.loads.PL10,
    Q_0=pf.powerflow.loads.QL10,
    v_0=pf.powerflow.bus.V12,
    angle_0=pf.powerflow.bus.A12)
    annotation (Placement(transformation(extent={{124,-126},{136,-116}})));
  OpenIPSL.Electrical.Loads.PSSE.Load Load07(
    P_0=pf.powerflow.loads.PL7,
    Q_0=pf.powerflow.loads.QL7,
    v_0=pf.powerflow.bus.V9,
    angle_0=pf.powerflow.bus.A9)
    annotation (Placement(transformation(extent={{-102,-56},{-90,-46}})));
  OpenIPSL.Electrical.Loads.PSSE.Load Load08(
    P_0=pf.powerflow.loads.PL8,
    Q_0=pf.powerflow.loads.QL8,
    v_0=pf.powerflow.bus.V10,
    angle_0=pf.powerflow.bus.A10)
    annotation (Placement(transformation(extent={{94,-54},{106,-44}})));
  OpenIPSL.Electrical.Loads.PSSE.Load Load11(
    P_0=pf.powerflow.loads.PL11,
    Q_0=pf.powerflow.loads.QL11,
    v_0=pf.powerflow.bus.V13,
    angle_0=pf.powerflow.bus.A13)
    annotation (Placement(transformation(extent={{-24,-186},{-12,-176}})));
  PfData.PowerFlow pf(redeclare record PowerFlow = PfData.Pf00000)
    annotation (Placement(transformation(extent={{-114,154},{-94,174}})));
  OpenIPSL.Electrical.Branches.PwLine L2(
    R=0,
    X=0.0001,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-102,30},{-82,50}})));
  OpenIPSL.Electrical.Branches.PwLine L4(
    R=0,
    X=0.0001,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-8,10},{12,30}})));
  OpenIPSL.Electrical.Branches.PwLine L5(
    R=0,
    X=0.0001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,-6})));
  OpenIPSL.Electrical.Branches.PwLine L6(
    R=0,
    X=0.0001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,-6})));
  OpenIPSL.Electrical.Branches.PwLine L7(
    R=0,
    X=0.0001,
    G=0,
    B=0)
    annotation (Placement(transformation(extent={{-10,-106},{10,-86}})));
  OpenIPSL.Electrical.Banks.PSSE.Shunt BC01(G=0, B=0.036)
    annotation (Placement(transformation(extent={{44,-24},{56,-12}})));
  OpenIPSL.Electrical.Banks.PSSE.Shunt BC02(G=0, B=0.03)
                                            annotation (Placement(
        transformation(extent={{-116,-152},{-104,-140}})));
  OpenIPSL.Electrical.Banks.PSSE.Shunt BC03(G=0, B=0.03)
                                            annotation (Placement(
        transformation(extent={{10,-188},{22,-176}})));
  GenerationGroups.CTG2.CTG2MachineComplete
                                        CTB(
    P_0=pf.powerflow.machines.PG3,
    Q_0=pf.powerflow.machines.QG3,
    v_0=pf.powerflow.bus.V9,
    angle_0=pf.powerflow.bus.A9,
    displayPF=false,
    V_b=12000) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,-84})));
  GenerationGroups.CTG1.CTG1MachineComplete
                                        CTA(
    P_0=pf.powerflow.machines.PG2,
    Q_0=pf.powerflow.machines.QG2,
    v_0=pf.powerflow.bus.V7,
    angle_0=pf.powerflow.bus.A7,
    displayPF=false,
    V_b=12000) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,-24})));
  GenerationGroups.STG1.STG1MachineComplete
                                        STGA(
    P_0=pf.powerflow.machines.PG4,
    Q_0=pf.powerflow.machines.QG4,
    v_0=pf.powerflow.bus.V10,
    angle_0=pf.powerflow.bus.A10,
    displayPF=false,
    V_b=12000) annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={81,-83})));
  GenerationGroups.STG2.STG2MachineComplete
                                        STGB(
    P_0=pf.powerflow.machines.PG5,
    Q_0=pf.powerflow.machines.QG5,
    v_0=pf.powerflow.bus.V12,
    angle_0=pf.powerflow.bus.A12,
    displayPF=false,
    V_b=12000) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={110,-158})));
  OpenIPSL.Electrical.Buses.Bus A1WG(
    V_b=12000,
    v_0=pf.powerflow.bus.V7,
    angle_0=pf.powerflow.bus.A7,
    displayPF=true)                           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,-8})));
  OpenIPSL.Electrical.Branches.PwLine L8(
    R=0,
    X=0.0001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,6})));
  OpenIPSL.Electrical.Buses.Bus W1WG(
    V_b=12000,
    v_0=pf.powerflow.bus.V9,
    angle_0=pf.powerflow.bus.A9)              annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,-68})));
  OpenIPSL.Electrical.Branches.PwLine L9(
    R=0,
    X=0.0001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,-54})));
  OpenIPSL.Electrical.Branches.PwLine L10(
    R=0,
    X=0.0001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,-52})));
  OpenIPSL.Electrical.Buses.Bus W2EG(
    V_b=12000,
    v_0=pf.powerflow.bus.V10,
    angle_0=pf.powerflow.bus.A10)             annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,-66})));
  OpenIPSL.Electrical.Buses.Bus W4SG(
    V_b=12000,
    v_0=pf.powerflow.bus.V12,
    angle_0=pf.powerflow.bus.A12)             annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={110,-142})));
  OpenIPSL.Electrical.Branches.PwLine L11(
    R=0,
    X=0.0001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={110,-126})));
  Electrical.Events.PwFault pwFault(
    R=0.5,
    X=0.5,
    t1=100,
    t2=1001)
    annotation (Placement(transformation(extent={{-48,-66},{-36,-54}})));
  Electrical.Machines.PSSE.GENCLS          UTILITY(
    V_b=69000,
    P_0=pf.powerflow.machines.PG1,
    Q_0=pf.powerflow.machines.QG1,
    v_0=pf.powerflow.bus.V1,
    angle_0=pf.powerflow.bus.A1,
    R_a=0,
    omega(fixed=false))
           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,200})));
  Electrical.Events.Breaker BreakerMicrogrid(
    enableTrigger=false,
    t_o=2,
    rc_enabled=false,
    t_rc=2.5) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={0,180})));
  Electrical.Buses.Bus          AENA1(
    V_b=69000,
    v_0=pf.powerflow.bus.V1,
    angle_0=pf.powerflow.bus.A1)               annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,194})));
equation
  connect(AENA.p, L1.n)
    annotation (Line(points={{0,168},{5.55112e-16,161}}, color={0,0,255}));
  connect(L1.p, AENB.p) annotation (Line(points={{-5.55112e-16,143},{0,138}},
        color={0,0,255}));
  connect(T1.p, AENB.p) annotation (Line(points={{-110,121},{-110,130},{0,130},{
          0,138}}, color={0,0,255}));
  connect(T2.p, AENB.p) annotation (Line(points={{-50,121},{-50,130},{0,130},{0,
          138}}, color={0,0,255}));
  connect(T3.p, AENB.p) annotation (Line(points={{50,121},{50,130},{0,130},{0,138}},
        color={0,0,255}));
  connect(T4.p, AENB.p) annotation (Line(points={{110,121},{110,130},{0,130},{0,
          138}}, color={0,0,255}));
  connect(T1.n, H2E.p)
    annotation (Line(points={{-110,99},{-110,78}}, color={0,0,255}));
  connect(T2.n, H4S.p)
    annotation (Line(points={{-50,99},{-50,78},{-50,78}}, color={0,0,255}));
  connect(T3.n, H3N.p)
    annotation (Line(points={{50,99},{50,78}}, color={0,0,255}));
  connect(T4.n, H1W.p)
    annotation (Line(points={{110,99},{110,78},{110,78}}, color={0,0,255}));
  connect(H2E.p, X1.p) annotation (Line(points={{-110,78},{-110,68},{-89,68}},
        color={0,0,255}));
  connect(X1.n, H4S.p) annotation (Line(points={{-71,68},{-50,68},{-50,78}},
        color={0,0,255}));
  connect(H4S.p, X2.p)
    annotation (Line(points={{-50,78},{-50,68},{-9,68}}, color={0,0,255}));
  connect(X2.n, H3N.p)
    annotation (Line(points={{9,68},{50,68},{50,78}}, color={0,0,255}));
  connect(H3N.p, X4.p)
    annotation (Line(points={{50,78},{50,68},{71,68}}, color={0,0,255}));
  connect(X4.n, H1W.p)
    annotation (Line(points={{89,68},{110,68},{110,78}}, color={0,0,255}));
  connect(X3.p, H2E.p) annotation (Line(points={{-9,54},{-110,54},{-110,78}},
        color={0,0,255}));
  connect(X3.n, H1W.p)
    annotation (Line(points={{9,54},{110,54},{110,78}}, color={0,0,255}));
  connect(A1W.p, X6.n) annotation (Line(points={{-50,26},{-50,20},{-120,20},
          {-120,-33}}, color={0,0,255}));
  connect(X6.p, W3N.p) annotation (Line(points={{-120,-51},{-120,-60},{-110,
          -60},{-110,-102}}, color={0,0,255}));
  connect(W1W.p, X5.p) annotation (Line(points={{-80,-32},{-80,-40},{-9,-40}},
                     color={0,0,255}));
  connect(X5.n, W2E.p)
    annotation (Line(points={{9,-40},{80,-40},{80,-32}}, color={0,0,255}));
  connect(A2E.p, X7.n) annotation (Line(points={{50,26},{50,20},{120,20},{
          120,-33}}, color={0,0,255}));
  connect(X7.p, W4S.p) annotation (Line(points={{120,-51},{120,-60},{110,
          -60},{110,-102}}, color={0,0,255}));
  connect(T5.p, W3N.p) annotation (Line(points={{-90,-115},{-90,-110},{-110,-110},
          {-110,-102}}, color={0,0,255}));
  connect(T6.p, W4S.p) annotation (Line(points={{80,-115},{80,-110},{110,-110},{
          110,-102}}, color={0,0,255}));
  connect(T5.n, B416N.p) annotation (Line(points={{-90,-137},{-90,-146},{0,-146},
          {0,-160}}, color={0,0,255}));
  connect(T6.n, B416N.p) annotation (Line(points={{80,-137},{80,-146},{0,-146},{
          0,-160}}, color={0,0,255}));
  connect(Load11.p, B416N.p) annotation (Line(points={{-18,-176},{-18,-168},
          {0,-168},{0,-160}}, color={0,0,255}));
  connect(A1W.p, L2.n) annotation (Line(points={{-50,26},{-50,40},{-83,40}},
        color={0,0,255}));
  connect(A2E.p, L3.p)
    annotation (Line(points={{50,26},{50,40},{85,40}}, color={0,0,255}));
  connect(L3.n, H1W.p) annotation (Line(points={{103,40},{110,40},{110,78}},
        color={0,0,255}));
  connect(A1W.p, L4.p)
    annotation (Line(points={{-50,26},{-50,20},{-7,20}}, color={0,0,255}));
  connect(L4.n, A2E.p)
    annotation (Line(points={{11,20},{50,20},{50,26}}, color={0,0,255}));
  connect(W1W.p, L5.p)
    annotation (Line(points={{-80,-32},{-80,-15}}, color={0,0,255}));
  connect(L5.n, H4S.p) annotation (Line(points={{-80,3},{-80,60},{-50,60},{
          -50,78}}, color={0,0,255}));
  connect(W2E.p, L6.p)
    annotation (Line(points={{80,-32},{80,-15}}, color={0,0,255}));
  connect(L6.n, H3N.p) annotation (Line(points={{80,3},{80,60},{50,60},{50,
          78}}, color={0,0,255}));
  connect(W3N.p, L7.p) annotation (Line(points={{-110,-102},{-110,-96},{-9,
          -96}}, color={0,0,255}));
  connect(L7.n, W4S.p) annotation (Line(points={{9,-96},{110,-96},{110,-102}},
        color={0,0,255}));
  connect(Load09.p, W3N.p) annotation (Line(points={{-126,-116},{-126,-110},{-110,
          -110},{-110,-102}}, color={0,0,255}));
  connect(Load10.p, W4S.p) annotation (Line(points={{130,-116},{130,-110},{110,-110},
          {110,-102}}, color={0,0,255}));
  connect(Load08.p, W2E.p)
    annotation (Line(points={{100,-44},{100,-32},{80,-32}}, color={0,0,255}));
  connect(Load07.p, W1W.p)
    annotation (Line(points={{-96,-46},{-96,-32},{-80,-32}}, color={0,0,255}));
  connect(Load05.p, A1W.p)
    annotation (Line(points={{-34,12},{-34,26},{-50,26}}, color={0,0,255}));
  connect(Load06.p, A2E.p)
    annotation (Line(points={{34,12},{34,26},{50,26}}, color={0,0,255}));
  connect(Load01.p, H2E.p)
    annotation (Line(points={{-118,68},{-118,78},{-110,78}}, color={0,0,255}));
  connect(Load02.p, H4S.p)
    annotation (Line(points={{-42,48},{-42,78},{-50,78}}, color={0,0,255}));
  connect(Load03.p, H3N.p)
    annotation (Line(points={{38,48},{38,78},{50,78}}, color={0,0,255}));
  connect(Load04.p, H1W.p)
    annotation (Line(points={{126,66},{126,78},{110,78}}, color={0,0,255}));
  connect(BC02.p, W3N.p)
    annotation (Line(points={{-110,-140},{-110,-102}}, color={0,0,255}));
  connect(BC01.p, A2E.p)
    annotation (Line(points={{50,-12},{50,26}}, color={0,0,255}));
  connect(BC03.p, B416N.p) annotation (Line(points={{16,-176},{16,-168},{0,-168},
          {0,-160}}, color={0,0,255}));
  connect(L8.p, A1WG.p)
    annotation (Line(points={{-50,-3},{-50,-8}}, color={0,0,255}));
  connect(A1WG.p, CTA.pwPin)
    annotation (Line(points={{-50,-8},{-50,-13}}, color={0,0,255}));
  connect(L8.n, A1W.p)
    annotation (Line(points={{-50,15},{-50,26}}, color={0,0,255}));
  connect(W1WG.p, CTB.pwPin)
    annotation (Line(points={{-80,-68},{-80,-73}}, color={0,0,255}));
  connect(L9.p, W1WG.p)
    annotation (Line(points={{-80,-63},{-80,-68}}, color={0,0,255}));
  connect(L9.n, W1W.p)
    annotation (Line(points={{-80,-45},{-80,-32}}, color={0,0,255}));
  connect(W2EG.p, STGA.pwPin)
    annotation (Line(points={{80,-66},{80,-73.1},{81,-73.1}},
                                                 color={0,0,255}));
  connect(W2EG.p, L10.p)
    annotation (Line(points={{80,-66},{80,-61}}, color={0,0,255}));
  connect(L10.n, W2E.p)
    annotation (Line(points={{80,-43},{80,-32}}, color={0,0,255}));
  connect(STGB.pwPin, W4SG.p)
    annotation (Line(points={{110,-147},{110,-142}}, color={0,0,255}));
  connect(L11.n, W4S.p)
    annotation (Line(points={{110,-117},{110,-102}}, color={0,0,255}));
  connect(L11.p, W4SG.p)
    annotation (Line(points={{110,-135},{110,-142}}, color={0,0,255}));
  connect(pwFault.p, W1W.p) annotation (Line(points={{-49,-60},{-60,-60},{-60,
          -40},{-80,-40},{-80,-32}}, color={0,0,255}));
  connect(AENA1.p, BreakerMicrogrid.r)
    annotation (Line(points={{0,194},{0,186}}, color={0,0,255}));
  connect(UTILITY.p, AENA1.p)
    annotation (Line(points={{-60,200},{0,200},{0,194}}, color={0,0,255}));
  connect(L2.p, H2E.p)
    annotation (Line(points={{-101,40},{-110,40},{-110,78}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}})),            Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-160,-200},{160,220}})),
    experiment(
      StopTime=50,
      __Dymola_NumberOfIntervals=5000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p> University Campus A microgrid is located in Texas and is connected to the local utility through four 69kV feeder. 
The utility bus voltage level is reduced to 12kV through four step-down transformers, namely T1 through T4. 
The microgrid also contains a 4.16kV portion in bus B15, stepped down from 12kV to 4.16kV through transformers T5, and T6.
The university campus microgrid is powered by two combustion turbo generators (CTs) and four steam turbo generators (STs). The two oldest steam turbine generation units rarely operate, typically online for a few days a year in extreme load conditions.
For that reason, the model contains two CTs and two STs, producing power at 12kV each. 
The maximum amount of power that the combined generation units can produce is approximately 127MW. </p>
</html>"));
end CampusGridA;
