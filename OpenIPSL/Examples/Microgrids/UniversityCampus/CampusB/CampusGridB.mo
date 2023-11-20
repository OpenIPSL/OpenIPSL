within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusB;
model CampusGridB "Microgrid Model for University Campus B"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Buses.Bus B1L1(
    V_b=13800,
    v_0=pf.powerflow.bus.VB1L1,
    angle_0=pf.powerflow.bus.AB1L1)             annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-90,272})));
  OpenIPSL.Electrical.Buses.Bus B2L1(
    V_b=13800,
    v_0=pf.powerflow.bus.VB2L1,
    angle_0=pf.powerflow.bus.VB2L1)             annotation (Placement(
        transformation(
        extent={{-20,20},{20,-20}},
        rotation=90,
        origin={100,272})));
  OpenIPSL.Electrical.Buses.Bus B1L4(
    V_b=13800,
    v_0=pf.powerflow.bus.VB1L4,
    angle_0=pf.powerflow.bus.AB1L4)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-122,92})));
  OpenIPSL.Electrical.Buses.Bus B2L4(
    V_b=13800,
    v_0=pf.powerflow.bus.VB2L4,
    angle_0=pf.powerflow.bus.AB2L4)          annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={0,92})));
  OpenIPSL.Electrical.Buses.Bus B3L4(
    V_b=13800,
    v_0=pf.powerflow.bus.VB3L4,
    angle_0=pf.powerflow.bus.AB3L4)          annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={160,92})));
  OpenIPSL.Electrical.Machines.PSSE.GENCLS UTILITY(
    V_b=13800,
    P_0=pf.powerflow.machines.PG1,
    Q_0=pf.powerflow.machines.QG1,
    v_0=pf.powerflow.bus.VB1L3,
    angle_0=pf.powerflow.bus.AB1L3,
    R_a=0.01)
           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-4,220})));
  OpenIPSL.Electrical.Buses.Bus B1L2(
    V_b=13800,
    v_0=pf.powerflow.bus.VB1L2,
    angle_0=pf.powerflow.bus.AB1L2)             annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-90,212})));
  OpenIPSL.Electrical.Buses.Bus B2L2(
    V_b=13800,
    v_0=pf.powerflow.bus.VB2L2,
    angle_0=pf.powerflow.bus.AB2L2)             annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,212})));
  OpenIPSL.Electrical.Buses.Bus B3L2(
    V_b=13800,
    v_0=pf.powerflow.bus.VB3L2,
    angle_0=pf.powerflow.bus.AB3L2)            annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={120,212})));
  OpenIPSL.Electrical.Buses.Bus B1L5(
    V_b=13800,
    v_0=pf.powerflow.bus.VB1L5,
    angle_0=pf.powerflow.bus.AB1L5)          annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-150,32})));
  OpenIPSL.Electrical.Buses.Bus B2L5(
    V_b=13800,
    v_0=pf.powerflow.bus.VB2L5,
    angle_0=pf.powerflow.bus.AB2L5)          annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-122,32})));
  OpenIPSL.Electrical.Buses.Bus B3L5(
    V_b=13800,
    v_0=pf.powerflow.bus.VB3L5,
    angle_0=pf.powerflow.bus.AB3L5)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-14,32})));
  OpenIPSL.Electrical.Buses.Bus B4L5(
    V_b=13800,
    v_0=pf.powerflow.bus.VB4L5,
    angle_0=pf.powerflow.bus.AB4L5)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={26,32})));
  OpenIPSL.Electrical.Buses.Bus B5L5(
    V_b=13800,
    v_0=pf.powerflow.bus.VB5L5,
    angle_0=pf.powerflow.bus.AB5L5)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,32})));
  OpenIPSL.Electrical.Buses.Bus B6L5(
    V_b=13800,
    v_0=pf.powerflow.bus.VB6L5,
    angle_0=pf.powerflow.bus.AB6L5)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={160,32})));
  OpenIPSL.Electrical.Loads.PSSE.Load L1(
    V_b=13800,
    P_0=pf.powerflow.loads.PL1,
    Q_0=pf.powerflow.loads.QL1,
    v_0=pf.powerflow.bus.VB1L5,
    angle_0=pf.powerflow.bus.AB1L5)
    annotation (Placement(transformation(extent={{-190,2},{-170,22}})));
  OpenIPSL.Electrical.Loads.PSSE.Load L2(
    V_b=13800,
    P_0=pf.powerflow.loads.PL2,
    Q_0=pf.powerflow.loads.QL2,
    v_0=pf.powerflow.bus.VB2L5,
    angle_0=pf.powerflow.bus.AB2L5)
    annotation (Placement(transformation(extent={{-132,4},{-112,24}})));
  OpenIPSL.Electrical.Buses.Bus B1L7(
    V_b=13800,
    v_0=pf.powerflow.bus.VB1L7,
    angle_0=pf.powerflow.bus.AB1L7)          annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-150,-68})));
  OpenIPSL.Electrical.Loads.PSSE.Load L7(
    V_b=13800,
    P_0=pf.powerflow.loads.PL7,
    Q_0=pf.powerflow.loads.QL7,
    v_0=pf.powerflow.bus.VB1L7,
    angle_0=pf.powerflow.bus.AB1L7)
    annotation (Placement(transformation(extent={{-180,-108},{-160,-88}})));
  OpenIPSL.Electrical.Loads.PSSE.Load L5(
    V_b=13800,
    P_0=pf.powerflow.loads.PL5,
    Q_0=pf.powerflow.loads.QL5,
    v_0=pf.powerflow.bus.VB6L5,
    angle_0=pf.powerflow.bus.AB6L5)
    annotation (Placement(transformation(extent={{170,-20},{190,0}})));
  OpenIPSL.Electrical.Branches.PwLine Line18(
    R=0.4,
    X=0.1,
    G=0,
    B=0)                                     annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-150,-18})));
  OpenIPSL.Electrical.Branches.PwLine Line21(
    R=0.5,
    X=0.001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-130,-98})));
  OpenIPSL.Electrical.Buses.Bus B1L8(
    V_b=13800,
    v_0=pf.powerflow.bus.VB1L8,
    angle_0=pf.powerflow.bus.AB1L8)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,-128})));
  OpenIPSL.Electrical.Branches.PwLine Line9(
    R=0.1,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-150,62})));
  OpenIPSL.Electrical.Branches.PwLine Line10(
    R=0.2,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-122,62})));
  OpenIPSL.Electrical.Branches.PwLine Line11(
    R=0.2,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-90,62})));
  OpenIPSL.Electrical.Branches.PwLine Line12(
    R=0.2,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,62})));
  OpenIPSL.Electrical.Branches.PwLine Line13(
    R=0.2,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,62})));
  OpenIPSL.Electrical.Branches.PwLine Line14(
    R=0.3,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,62})));
  OpenIPSL.Electrical.Branches.PwLine Line15(
    R=0.2,
    X=0.001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={26,62})));
  OpenIPSL.Electrical.Branches.PwLine Line16(
    R=0.2,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,62})));
  OpenIPSL.Electrical.Branches.PwLine Line17(
    R=0.7,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={160,62})));
  OpenIPSL.Electrical.Loads.PSSE.Load L4(
    V_b=13800,
    P_0=pf.powerflow.loads.PL4,
    Q_0=pf.powerflow.loads.QL4,
    v_0=pf.powerflow.bus.VB5L5,
    angle_0=pf.powerflow.bus.AB5L5)
    annotation (Placement(transformation(extent={{50,4},{70,24}})));
  OpenIPSL.Electrical.Loads.PSSE.Load L3(
    V_b=13800,
    P_0=pf.powerflow.loads.PL3,
    Q_0=pf.powerflow.loads.QL3,
    v_0=pf.powerflow.bus.VB4L5,
    angle_0=pf.powerflow.bus.AB4L5)
    annotation (Placement(transformation(extent={{16,4},{36,24}})));
  OpenIPSL.Electrical.Branches.PwLine Line19(
    R=0.2,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-14,12})));
  OpenIPSL.Electrical.Buses.Bus B1L6(
    V_b=13800,
    v_0=pf.powerflow.bus.VB1L6,
    angle_0=pf.powerflow.bus.AB1L6)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-14,-8})));
  OpenIPSL.Electrical.Branches.PwLine Line20(
    R=0.2,
    X=0.001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-14,-38})));
  OpenIPSL.Electrical.Loads.PSSE.Load L6(
    V_b=13800,
    P_0=pf.powerflow.loads.PL6,
    Q_0=pf.powerflow.loads.QL6,
    v_0=pf.powerflow.bus.VB1L6,
    angle_0=pf.powerflow.bus.AB1L6)
    annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  OpenIPSL.Electrical.Buses.Bus B1L9(
    V_b=13800,
    v_0=pf.powerflow.bus.VB1L9,
    angle_0=pf.powerflow.bus.AB1L9)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,-188})));
  OpenIPSL.Electrical.Branches.PwLine Line24(
    R=0.2,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,-158})));
  OpenIPSL.Electrical.Loads.PSSE.Load L9(
    V_b=13800,
    P_0=pf.powerflow.loads.PL9,
    Q_0=pf.powerflow.loads.QL9,
    v_0=pf.powerflow.bus.VB1L9,
    angle_0=pf.powerflow.bus.AB1L9)
    annotation (Placement(transformation(extent={{-90,-240},{-70,-220}})));
  OpenIPSL.Electrical.Buses.Bus B2L9(
    V_b=13800,
    v_0=pf.powerflow.bus.VB2L9,
    angle_0=pf.powerflow.bus.AB2L9)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,-188})));
  OpenIPSL.Electrical.Branches.PwLine Line25(
    R=0.001,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,-158})));
  OpenIPSL.Electrical.Loads.PSSE.Load L10(
    V_b=13800,
    P_0=pf.powerflow.loads.PL10,
    Q_0=pf.powerflow.loads.QL10,
    v_0=pf.powerflow.bus.VB2L9,
    angle_0=pf.powerflow.bus.AB2L9)
    annotation (Placement(transformation(extent={{0,-240},{20,-220}})));
  OpenIPSL.Electrical.Buses.Bus B2L7(
    V_b=13800,
    v_0=pf.powerflow.bus.VB2L7,
    angle_0=pf.powerflow.bus.AB2L7)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,-68})));
  OpenIPSL.Electrical.Branches.PwLine Line22(
    R=0.2,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,-98})));
  OpenIPSL.Electrical.Branches.PwLine Line23(
    R=0.1,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,-98})));
  OpenIPSL.Electrical.Buses.Bus B2L8(
    V_b=13800,
    v_0=pf.powerflow.bus.VB2L8,
    angle_0=pf.powerflow.bus.AB2L8)          annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,-128})));
  OpenIPSL.Electrical.Loads.PSSE.Load L8(
    V_b=13800,
    P_0=pf.powerflow.loads.PL8,
    Q_0=pf.powerflow.loads.QL8,
    v_0=pf.powerflow.bus.VB2L8,
    angle_0=pf.powerflow.bus.AB2L8)
    annotation (Placement(transformation(extent={{10,-168},{30,-148}})));
  OpenIPSL.Electrical.Branches.PwLine Line2(
    R=0.2,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-40,242})));
  OpenIPSL.Electrical.Branches.PwLine Line3(
    R=0.2,
    X=0.001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={160,242})));
  OpenIPSL.Electrical.Branches.PwLine Line6(
    R=0.5,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-92,138})));
  OpenIPSL.Electrical.Buses.Bus B1L3(
    V_b=13800,
    v_0=pf.powerflow.bus.VB1L3,
    angle_0=pf.powerflow.bus.AB1L3)          annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={12,172})));
  OpenIPSL.Electrical.Branches.PwLine Line7(
    R=0.2,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,120})));
  OpenIPSL.Electrical.Branches.PwLine Line8(
    R=0.2,
    X=0.001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={90,138})));
  OpenIPSL.Electrical.Branches.PwLine Line1(
    R=0.3,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-90,242})));
  OpenIPSL.Electrical.Branches.PwLine Line4(
    R=0.2,
    X=0.001,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,242})));
  OpenIPSL.Electrical.Branches.PwLine Line5(
    R=0.4,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={120,242})));
  OpenIPSL.Electrical.Events.Breaker Br1(enableTrigger=false) annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={0,280})));
  OpenIPSL.Electrical.Events.Breaker Br2
    annotation (Placement(transformation(extent={{-66,86},{-54,98}})));
  OpenIPSL.Electrical.Events.Breaker Br3(rc_enabled=false, t_rc=10.5)
    annotation (Placement(transformation(extent={{54,86},{66,98}})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0.5,
    X=0.5,
    t1=2,
    t2=2.1)
    annotation (Placement(transformation(extent={{112,40},{132,60}})));
  GeneratorGroups.GasTurbineUnit GT1(
    P_0=pf.powerflow.machines.PG2,
    Q_0=pf.powerflow.machines.QG2,
    v_0=pf.powerflow.bus.VB1L2,
    angle_0=pf.powerflow.bus.AB1L2) annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=90,
        origin={-90,168})));
  GeneratorGroups.GasTurbineUnit GT2(
    P_0=pf.powerflow.machines.PG3,
    Q_0=pf.powerflow.machines.QG3,
    v_0=pf.powerflow.bus.VB2L2,
    angle_0=pf.powerflow.bus.AB2L2) annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=90,
        origin={80,168})));
  GeneratorGroups.SteamTurbineUnit ST(
    P_0=pf.powerflow.machines.PG4,
    Q_0=pf.powerflow.machines.QG4,
    v_0=pf.powerflow.bus.VB3L2,
    angle_0=pf.powerflow.bus.AB3L2) annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=90,
        origin={120,168})));
  Electrical.Events.Breaker BrST(enableTrigger=false)        annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={120,198})));

  Electrical.Events.Breaker BrGT1(enableTrigger=false)       annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-90,198})));
  Electrical.Events.Breaker BrGT2(enableTrigger=false)       annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={80,198})));
  Electrical.Events.Breaker BrU(
    enableTrigger=false,
    rc_enabled=false,
    t_rc=2.5) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={12,196})));
  Electrical.Renewables.PSSE.PV PV1(
    M_b=409500,
    V_b=600,
    P_0(displayUnit="kW") = pf.powerflow.machines.PVP1,
    Q_0=pf.powerflow.machines.PVQ1,
    v_0=pf.powerflow.bus.VPV1B1,
    angle_0=pf.powerflow.bus.APV1B1,
    QFunctionality=0,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.REGCA1
      RenewableGenerator,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECB1
      RenewableController,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.PlantController.REPCA1
      PlantController)
             annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=90,
        origin={-120,-282})));
  Electrical.Buses.Bus          PV1B1(
    V_b=13800,
    v_0=pf.powerflow.bus.VPV1B1,
    angle_0=pf.powerflow.bus.APV1B1)         annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-120,-260})));
  Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer(
    R=0,
    X=0.057,
    G=0,
    B=0,
    VB1=600,
    VB2=13800) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-120,-244})));
  Electrical.Buses.Bus          PV1B2(
    V_b=13800,
    v_0=pf.powerflow.bus.VPV1B2,
    angle_0=pf.powerflow.bus.APV1B2)         annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-120,-228})));
  Electrical.Branches.PwLine          Line26(
    R=0.04,
    X=0.08,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-120,-214})));
  Electrical.Renewables.PSSE.PV PV2(
    M_b=12600,
    V_b=600,
    P_0(displayUnit="kW") = pf.powerflow.machines.PVP2,
    Q_0=pf.powerflow.machines.PVQ2,
    v_0=pf.powerflow.bus.VPV2B1,
    angle_0=pf.powerflow.bus.APV2B1,
    QFunctionality=0,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.REGCA1
      RenewableGenerator,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECB1
      RenewableController,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.PlantController.REPCA1
      PlantController)
             annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=90,
        origin={-30,-282})));
  Electrical.Buses.Bus          PV2B1(
    V_b=13800,
    v_0=pf.powerflow.bus.VPV2B1,
    angle_0=pf.powerflow.bus.APV2B1)         annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,-260})));
  Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer1(
    R=0,
    X=0.057,
    G=0,
    B=0,
    VB1=600,
    VB2=13800) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,-244})));
  Electrical.Buses.Bus          PV2B2(
    V_b=13800,
    v_0=pf.powerflow.bus.VPV2B2,
    angle_0=pf.powerflow.bus.APV2B2)         annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,-228})));
  Electrical.Branches.PwLine          Line27(
    R=0.02,
    X=0.04,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,-214})));
  Electrical.Renewables.PSSE.PV PV3(
    V_b=600,
    P_0(displayUnit="kW") = pf.powerflow.machines.PVP3,
    Q_0=pf.powerflow.machines.PVQ3,
    v_0=pf.powerflow.bus.VPV3B1,
    angle_0=pf.powerflow.bus.APV3B1,
    QFunctionality=0,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.REGCA1
      RenewableGenerator,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECB1
      RenewableController,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.PlantController.REPCA1
      PlantController,
    M_b=7400)
             annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=90,
        origin={140,-66})));
  Electrical.Buses.Bus          PV3B1(
    V_b=13800,
    v_0=pf.powerflow.bus.VPV3B1,
    angle_0=pf.powerflow.bus.APV3B1)         annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={140,-42})));
  Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer2(
    R=0,
    X=0.057,
    G=0,
    B=0,
    VB1=600,
    VB2=13800) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={140,-26})));
  Electrical.Buses.Bus          PV3B2(
    V_b=13800,
    v_0=pf.powerflow.bus.VPV3B2,
    angle_0=pf.powerflow.bus.APV3B2)         annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={140,-10})));
  Electrical.Branches.PwLine          Line28(
    R=0.01,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={140,4})));
  Electrical.Renewables.PSSE.PV PV4(
    M_b=103200,
    V_b=600,
    P_0(displayUnit="kW") = pf.powerflow.machines.PVP4,
    Q_0=pf.powerflow.machines.PVQ4,
    v_0=pf.powerflow.bus.VPV4B1,
    angle_0=pf.powerflow.bus.APV4B1,
    QFunctionality=0,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.REGCA1
      RenewableGenerator,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECB1
      RenewableController,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.PlantController.REPCA1
      PlantController)
             annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=90,
        origin={50,-94})));
  Electrical.Buses.Bus          PV4B1(
    V_b=13800,
    v_0=pf.powerflow.bus.VPV4B1,
    angle_0=pf.powerflow.bus.APV4B1)         annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-70})));
  Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer3(
    R=0,
    X=0.057,
    G=0,
    B=0,
    VB1=600,
    VB2=13800) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-54})));
  Electrical.Buses.Bus          PV4B2(
    V_b=13800,
    v_0=pf.powerflow.bus.VPV4B2,
    angle_0=pf.powerflow.bus.APV4B2)         annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-38})));
  Electrical.Branches.PwLine          Line29(
    R=0.001,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-24})));
  Electrical.Renewables.PSSE.PV PV5(
    V_b=600,
    P_0=pf.powerflow.machines.PVP5,
    Q_0=pf.powerflow.machines.PVQ5,
    v_0=pf.powerflow.bus.VPV5B1,
    angle_0=pf.powerflow.bus.APV5B1,
    QFunctionality=0,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.REGCA1
      RenewableGenerator,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECB1
      RenewableController,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.PlantController.REPCA1
      PlantController,
    M_b=894700)
             annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=90,
        origin={90,-56})));
  Electrical.Buses.Bus          PV5B1(
    V_b=13800,
    v_0=pf.powerflow.bus.VPV5B1,
    angle_0=pf.powerflow.bus.APV5B1)         annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={90,-32})));
  Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer4(
    R=0,
    X=0.057,
    G=0,
    B=0,
    VB1=600,
    VB2=13800) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={90,-16})));
  Electrical.Buses.Bus          PV5B2(
    V_b=13800,
    v_0=pf.powerflow.bus.VPV5B2,
    angle_0=pf.powerflow.bus.APV5B2)         annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={90,0})));
  Electrical.Branches.PwLine          Line30(
    R=0.03,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={90,14})));
  inner Electrical.SystemBase          SysData(S_b=100000000, fn=60)
    annotation (Placement(transformation(extent={{66,-272},{126,-232}})));

  PfData.PowerFlow pf(redeclare record PowerFlow =
        OpenIPSL.Examples.Microgrids.UniversityCampus.CampusB.PfData.Pf00000)
    annotation (Placement(transformation(extent={{140,-266},{182,-224}})));
equation
  connect(L1.p, B1L5.p) annotation (Line(points={{-180,22},{-180,26},{-150,26},{
          -150,32}}, color={0,0,255}));
  connect(B2L5.p, L2.p)
    annotation (Line(points={{-122,32},{-122,24}}, color={0,0,255}));
  connect(L7.p, B1L7.p) annotation (Line(points={{-170,-88},{-170,-74},{-150,-74},
          {-150,-68}}, color={0,0,255}));
  connect(Line18.p, B1L7.p)
    annotation (Line(points={{-150,-27},{-150,-68}},   color={0,0,255}));
  connect(Line18.n, B1L5.p)
    annotation (Line(points={{-150,-9},{-150,32}},     color={0,0,255}));
  connect(Line21.n, B1L7.p) annotation (Line(points={{-130,-89},{-130,-74},{-150,
          -74},{-150,-68}},         color={0,0,255}));
  connect(L5.p, B6L5.p) annotation (Line(points={{180,0},{180,20},{160,20},{160,
          32}}, color={0,0,255}));
  connect(B5L5.p, L4.p)
    annotation (Line(points={{60,32},{60,24}}, color={0,0,255}));
  connect(L3.p, B4L5.p)
    annotation (Line(points={{26,24},{26,32}}, color={0,0,255}));
  connect(B3L5.p, Line19.n)
    annotation (Line(points={{-14,32},{-14,21}},     color={0,0,255}));
  connect(Line19.p, B1L6.p)
    annotation (Line(points={{-14,3},{-14,-8}},      color={0,0,255}));
  connect(B1L6.p, Line20.n)
    annotation (Line(points={{-14,-8},{-14,-29}},    color={0,0,255}));
  connect(L6.p, B1L6.p) annotation (Line(points={{10,-40},{10,-12},{-14,-12},{-14,
          -8}}, color={0,0,255}));
  connect(Line21.p, B1L9.p) annotation (Line(points={{-130,-107},{-130,-182},{-100,
          -182},{-100,-188}},       color={0,0,255}));
  connect(Line24.p, B1L9.p) annotation (Line(points={{-50,-167},{-50,-182},{-100,
          -182},{-100,-188}},       color={0,0,255}));
  connect(L9.p, B1L9.p) annotation (Line(points={{-80,-220},{-80,-200},{-100,-200},
          {-100,-188}}, color={0,0,255}));
  connect(Line25.p, B2L9.p)
    annotation (Line(points={{-10,-167},{-10,-188}}, color={0,0,255}));
  connect(B2L9.p, L10.p) annotation (Line(points={{-10,-188},{-10,-200},{10,-200},
          {10,-220}}, color={0,0,255}));
  connect(Line24.n, B1L8.p)
    annotation (Line(points={{-50,-149},{-50,-128}}, color={0,0,255}));
  connect(Line25.n, B1L8.p) annotation (Line(points={{-10,-149},{-10,-134},{-50,
          -134},{-50,-128}},      color={0,0,255}));
  connect(Line22.n, B2L7.p)
    annotation (Line(points={{-50,-89},{-50,-68}},   color={0,0,255}));
  connect(Line22.p, B1L8.p)
    annotation (Line(points={{-50,-107},{-50,-128}}, color={0,0,255}));
  connect(Line20.p, B2L7.p) annotation (Line(points={{-14,-47},{-14,-62},{-50,-62},
          {-50,-68}},             color={0,0,255}));
  connect(Line23.n, B2L7.p) annotation (Line(points={{20,-89},{20,-84},{-50,-84},
          {-50,-68}},        color={0,0,255}));
  connect(Line23.p, B2L8.p)
    annotation (Line(points={{20,-107},{20,-128}}, color={0,0,255}));
  connect(B2L8.p, L8.p)
    annotation (Line(points={{20,-128},{20,-148}}, color={0,0,255}));
  connect(Line3.p, B3L4.p) annotation (Line(points={{160,233},{160,92}},
                           color={0,0,255}));
  connect(Line2.p, B2L4.p) annotation (Line(points={{-40,233},{-40,98},{0,98},{0,
          92}},          color={0,0,255}));
  connect(B2L2.p, Line4.p)
    annotation (Line(points={{80,212},{80,233}}, color={0,0,255}));
  connect(Line4.n, B2L1.p) annotation (Line(points={{80,251},{80,264},{100,264},
          {100,272}},      color={0,0,255}));
  connect(Line5.n, B2L1.p) annotation (Line(points={{120,251},{120,264},{100,264},
          {100,272}},          color={0,0,255}));
  connect(Line5.p, B3L2.p)
    annotation (Line(points={{120,233},{120,212}}, color={0,0,255}));
  connect(Line1.p, B1L2.p)
    annotation (Line(points={{-90,233},{-90,212}}, color={0,0,255}));
  connect(Line1.n, B1L1.p)
    annotation (Line(points={{-90,251},{-90,272}}, color={0,0,255}));
  connect(B1L1.p, Br1.s) annotation (Line(points={{-90,272},{-90,280},{-6,280}},
                 color={0,0,255}));
  connect(Br1.r, B2L1.p) annotation (Line(points={{6,280},{100,280},{100,272}},
                 color={0,0,255}));
  connect(Line3.n, B2L1.p) annotation (Line(points={{160,251},{160,264},{100,264},
          {100,272}},      color={0,0,255}));
  connect(Line2.n, B1L1.p) annotation (Line(points={{-40,251},{-40,264},{-90,264},
          {-90,272}},          color={0,0,255}));
  connect(Line7.n, B2L4.p) annotation (Line(points={{0,111},{0,92}},
                         color={0,0,255}));
  connect(Line7.p, B1L3.p) annotation (Line(points={{1.55431e-15,129},{1.55431e-15,
          134},{0,134},{0,138},{12,138},{12,172}},
                                            color={0,0,255}));
  connect(Br2.r, B2L4.p) annotation (Line(points={{-54,92},{-54,90},{0,90},{0,92}},
                          color={0,0,255}));
  connect(Br2.s, B1L4.p) annotation (Line(points={{-66,92},{-66,90},{-122,90},{-122,
          92}},             color={0,0,255}));
  connect(Br3.s, B2L4.p) annotation (Line(points={{54,92},{54,90},{0,90},{0,92}},
                     color={0,0,255}));
  connect(Line8.p, B1L3.p)
    annotation (Line(points={{81,138},{12,138},{12,172}},
                                                   color={0,0,255}));
  connect(Line6.p, B1L3.p) annotation (Line(points={{-83,138},{12,138},{12,172}},
                                 color={0,0,255}));
  connect(Line6.n, B1L4.p) annotation (Line(points={{-101,138},{-122,138},{-122,
          92}},                     color={0,0,255}));
  connect(Line8.n, B3L4.p)
    annotation (Line(points={{99,138},{160,138},{160,92}},
                                                        color={0,0,255}));
  connect(Line9.n, B1L4.p) annotation (Line(points={{-150,71},{-150,76},{-122,76},
          {-122,92}},             color={0,0,255}));
  connect(Line10.n, B1L4.p)
    annotation (Line(points={{-122,71},{-122,92}},    color={0,0,255}));
  connect(Line11.n, B1L4.p) annotation (Line(points={{-90,71},{-90,76},{-122,76},
          {-122,92}},            color={0,0,255}));
  connect(Line12.n, B2L4.p) annotation (Line(points={{-60,71},{-60,76},{0,76},{0,
          92}},            color={0,0,255}));
  connect(Line13.n, B2L4.p) annotation (Line(points={{-30,71},{-30,76},{0,76},{0,
          92}},            color={0,0,255}));
  connect(Line14.n, B2L4.p)
    annotation (Line(points={{0,71},{0,92}},    color={0,0,255}));
  connect(Line15.n, B2L4.p) annotation (Line(points={{26,71},{26,76},{0,76},{0,92}},
                         color={0,0,255}));
  connect(Line16.n, B2L4.p) annotation (Line(points={{60,71},{60,76},{0,76},{0,92}},
                         color={0,0,255}));
  connect(Line17.n, B3L4.p)
    annotation (Line(points={{160,71},{160,92}},    color={0,0,255}));
  connect(Line17.p, B6L5.p)
    annotation (Line(points={{160,53},{160,32}},     color={0,0,255}));
  connect(Line16.p, B5L5.p)
    annotation (Line(points={{60,53},{60,32}},     color={0,0,255}));
  connect(Line15.p, B4L5.p)
    annotation (Line(points={{26,53},{26,32}},     color={0,0,255}));
  connect(Line14.p, B3L5.p) annotation (Line(points={{0,53},{0,40},{-14,40},{-14,
          32}},              color={0,0,255}));
  connect(Line13.p, B3L5.p) annotation (Line(points={{-30,53},{-30,40},{-14,40},
          {-14,32}},              color={0,0,255}));
  connect(Line10.p, B2L5.p)
    annotation (Line(points={{-122,53},{-122,32}},     color={0,0,255}));
  connect(Line9.p, B1L5.p)
    annotation (Line(points={{-150,53},{-150,32}},     color={0,0,255}));
  connect(Line11.p, B2L7.p) annotation (Line(points={{-90,53},{-90,-62},{-50,-62},
          {-50,-68}},             color={0,0,255}));
  connect(Line12.p, B2L7.p) annotation (Line(points={{-60,53},{-60,-62},{-50,-62},
          {-50,-68}},             color={0,0,255}));
  connect(ST.pwPin, BrST.s)
    annotation (Line(points={{120,183.4},{120,192}}, color={0,0,255}));
  connect(BrST.r, B3L2.p)
    annotation (Line(points={{120,204},{120,212}}, color={0,0,255}));
  connect(BrGT1.r, B1L2.p)
    annotation (Line(points={{-90,204},{-90,212}}, color={0,0,255}));
  connect(GT1.pwPin, BrGT1.s)
    annotation (Line(points={{-90,183.4},{-90,192}},
                                                   color={0,0,255}));
  connect(GT2.pwPin, BrGT2.s)
    annotation (Line(points={{80,183.4},{80,192}},
                                                 color={0,0,255}));
  connect(BrGT2.r, B2L2.p)
    annotation (Line(points={{80,204},{80,212}}, color={0,0,255}));
  connect(BrU.s, B1L3.p)
    annotation (Line(points={{12,190},{12,172}}, color={0,0,255}));
  connect(BrU.r, UTILITY.p)
    annotation (Line(points={{12,202},{12,220},{6,220}}, color={0,0,255}));
  connect(PV1.pwPin, PV1B1.p)
    annotation (Line(points={{-120,-268},{-120,-260}}, color={0,0,255}));
  connect(twoWindingTransformer.p, PV1B1.p)
    annotation (Line(points={{-120,-255},{-120,-260}}, color={0,0,255}));
  connect(twoWindingTransformer.n, PV1B2.p)
    annotation (Line(points={{-120,-233},{-120,-228}}, color={0,0,255}));
  connect(PV1B2.p, Line26.p)
    annotation (Line(points={{-120,-228},{-120,-223}}, color={0,0,255}));
  connect(PV2.pwPin, PV2B1.p)
    annotation (Line(points={{-30,-268},{-30,-260}}, color={0,0,255}));
  connect(twoWindingTransformer1.p, PV2B1.p)
    annotation (Line(points={{-30,-255},{-30,-260}}, color={0,0,255}));
  connect(twoWindingTransformer1.n, PV2B2.p)
    annotation (Line(points={{-30,-233},{-30,-228}}, color={0,0,255}));
  connect(PV2B2.p, Line27.p)
    annotation (Line(points={{-30,-228},{-30,-223}}, color={0,0,255}));
  connect(Line27.n, L10.p) annotation (Line(points={{-30,-205},{-30,-200},{10,-200},
          {10,-220}}, color={0,0,255}));
  connect(Br3.r, B3L4.p) annotation (Line(points={{66,92},{66,90},{160,90},{160,
          92}}, color={0,0,255}));
  connect(PV3.pwPin, PV3B1.p)
    annotation (Line(points={{140,-52},{140,-42}}, color={0,0,255}));
  connect(twoWindingTransformer2.p, PV3B1.p)
    annotation (Line(points={{140,-37},{140,-42}}, color={0,0,255}));
  connect(twoWindingTransformer2.n, PV3B2.p)
    annotation (Line(points={{140,-15},{140,-10}}, color={0,0,255}));
  connect(PV3B2.p, Line28.p)
    annotation (Line(points={{140,-10},{140,-5}}, color={0,0,255}));
  connect(Line28.n, B6L5.p) annotation (Line(points={{140,13},{140,20},{160,20},
          {160,32}}, color={0,0,255}));
  connect(PV4.pwPin, PV4B1.p)
    annotation (Line(points={{50,-80},{50,-70}}, color={0,0,255}));
  connect(twoWindingTransformer3.p, PV4B1.p)
    annotation (Line(points={{50,-65},{50,-70}}, color={0,0,255}));
  connect(twoWindingTransformer3.n, PV4B2.p)
    annotation (Line(points={{50,-43},{50,-38}}, color={0,0,255}));
  connect(PV4B2.p, Line29.p)
    annotation (Line(points={{50,-38},{50,-33}}, color={0,0,255}));
  connect(Line29.n, B1L6.p) annotation (Line(points={{50,-15},{50,-12},{-14,-12},
          {-14,-8}}, color={0,0,255}));
  connect(PV5.pwPin, PV5B1.p)
    annotation (Line(points={{90,-42},{90,-32}}, color={0,0,255}));
  connect(twoWindingTransformer4.p, PV5B1.p)
    annotation (Line(points={{90,-27},{90,-32}}, color={0,0,255}));
  connect(twoWindingTransformer4.n, PV5B2.p)
    annotation (Line(points={{90,-5},{90,0}}, color={0,0,255}));
  connect(PV5B2.p, Line30.p)
    annotation (Line(points={{90,0},{90,5}}, color={0,0,255}));
  connect(Line30.n, B5L5.p) annotation (Line(points={{90,23},{90,28},{60,28},{60,
          32}}, color={0,0,255}));
  connect(pwFault.p, Line30.p) annotation (Line(points={{110.333,50},{106,50},{
          106,4},{90,4},{90,5}}, color={0,0,255}));
  connect(Line26.n, B1L9.p) annotation (Line(points={{-120,-205},{-120,-200},{
          -100,-200},{-100,-188}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-220,-300},
            {220,300}})),                                        Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-220,-300},{220,300}})),
    experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end CampusGridB;
