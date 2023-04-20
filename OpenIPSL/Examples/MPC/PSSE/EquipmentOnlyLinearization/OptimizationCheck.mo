within OpenIPSL.Examples.MPC.PSSE.EquipmentOnlyLinearization;
model OptimizationCheck "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
  extends Modelica.Icons.Example;

  parameter Boolean equivalentGRID = false;
  parameter Boolean equivalentInfBUS = false;

  OpenIPSL.Electrical.Buses.Bus B1(v_0=powerFlow.powerflow.bus.V1, angle_0=
        powerFlow.powerflow.bus.A1) if not equivalentGRID
    annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
  OpenIPSL.Electrical.Buses.Bus B2(v_0=powerFlow.powerflow.bus.V2, angle_0=
        powerFlow.powerflow.bus.A1) if not equivalentGRID
    annotation (Placement(transformation(extent={{-50,60},{-30,80}})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T1(
    R=0.001,
    X=0.2,
    G=0,
    B=0,
    VNOM1=13800,
    VB1=13800,
    VNOM2=6000,
    VB2=6000)  if not equivalentGRID annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={-60,70})));
  OpenIPSL.Examples.OpenCPS.Generators.G1 G1(
    enableV_b=true,
    v_0=powerFlow.powerflow.bus.V1,
    angle_0=powerFlow.powerflow.bus.A1,
    P_0=powerFlow.powerflow.machines.PG1,
    Q_0=powerFlow.powerflow.machines.QG1,
    V_b=6000)  if not equivalentGRID
    annotation (Placement(transformation(extent={{-112,60},{-92,80}})));
  OpenIPSL.Electrical.Branches.PwLine L1(
    R=0.001,
    X=0.2,
    G=0,
    B=0) if not equivalentGRID annotation (Placement(transformation(extent={{-26,66},{-14,74}})));
  OpenIPSL.Electrical.Buses.Bus B3(v_0=powerFlow.powerflow.bus.V3, angle_0=
        powerFlow.powerflow.bus.A3) if not equivalentGRID
    annotation (Placement(transformation(extent={{-10,60},{10,80}})));
  OpenIPSL.Electrical.Buses.Bus B4(v_0=powerFlow.powerflow.bus.V4, angle_0=
        powerFlow.powerflow.bus.V4) if not equivalentGRID
    annotation (Placement(transformation(extent={{50,60},{70,80}})));
  OpenIPSL.Electrical.Branches.PwLine L2_1(
    R=0.0005,
    X=0.1,
    G=0,
    B=0) if not equivalentGRID annotation (Placement(transformation(extent={{24,76},{36,84}})));
  OpenIPSL.Electrical.Branches.PwLine L2_2(
    R=0.0005,
    X=0.1,
    G=0,
    B=0) if not equivalentGRID annotation (Placement(transformation(extent={{24,56},{36,64}})));
  OpenIPSL.Electrical.Buses.Bus B5(angle_0=powerFlow.powerflow.bus.A5, v_0=
        powerFlow.powerflow.bus.V5) if not equivalentGRID
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,6})));
  OpenIPSL.Electrical.Branches.PwLine L3(
    R=0.001,
    X=0.2,
    G=0,
    B=0) if not equivalentGRID annotation (Placement(transformation(
        extent={{-6,-4},{6,4}},
        rotation=-90,
        origin={80,50})));
  OpenIPSL.Electrical.Buses.Bus B6(v_0=powerFlow.powerflow.bus.V6, angle_0=
        powerFlow.powerflow.bus.A6)
                                   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={34,-36})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T2(
    G=0,
    B=0,
    VNOM1=13800,
    VB1=13800,
    VNOM2=6000,
    VB2=6000,
    R=0.005,
    X=0.1) if not equivalentGRID annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=270,
        origin={50,-16})));
  GenerationUnits.PSSE.G2_16MVA                         G2(
    enableV_b=true,
    enableP_0=true,
    enableQ_0=true,
    v_0=powerFlow.powerflow.bus.V6,
    enablev_0=true,
    angle_0=powerFlow.powerflow.bus.A6,
    V_b=6000,
    P_0=powerFlow.powerflow.machines.PG2,
    Q_0=powerFlow.powerflow.machines.QG2,
    enableangle_0=true)
                  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={10,-36})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100000000, fn=60)
    annotation (Placement(transformation(extent={{-128,94},{-74,114}})));
  OpenIPSL.Electrical.Loads.PSSE.Load Load1(
    V_b=220000,
    P_0=powerFlow.powerflow.loads.PL1,
    Q_0=powerFlow.powerflow.loads.QL1,
    v_0=powerFlow.powerflow.bus.V3,
    angle_0=powerFlow.powerflow.bus.A3) if not equivalentGRID
    annotation (Placement(transformation(extent={{-20,36},{0,56}})));
  Electrical.Events.Breaker breaker(enableTrigger=false,
    t_o=5.01,
    rc_enabled=true,
    t_rc=80.01)       if not equivalentGRID                     annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={80,16})));

  //       Modelica.Blocks.Interfaces.RealOutput OUT9 annotation (Placement(transformation(extent={{140,-60},{160,-40}})));
  //   Modelica.Blocks.Interfaces.RealOutput OUT10 annotation (Placement(transformation(extent={{140,-80}, {160,-60}})));
   //      Modelica.Blocks.Interfaces.RealOutput OUT10
   // annotation (Placement(transformation(extent={{140,-116},{160,-96}})));

  PFData.PowerFlow powerFlow(redeclare record PowerFlow =
        OpenIPSL.Examples.MPC.PFData.PF01)
    annotation (Placement(transformation(extent={{-68,96},{-48,116}})));
  Electrical.Machines.PSSE.GENCLS IB(
    V_b=220000,
    v_0=powerFlow.powerflow.bus.V4,
    angle_0=powerFlow.powerflow.bus.A4,
    P_0=powerFlow.powerflow.machines.Pinf,
    Q_0=powerFlow.powerflow.machines.Qinf,
    M_b=100000000,
    X_d=1) if not equivalentGRID annotation (Placement(transformation(extent={{110,60},{100,80}})));
  Electrical.Loads.PSSE.Load_ExtInput Load2(
    P_0=powerFlow.powerflow.loads.PL2,
    Q_0=powerFlow.powerflow.loads.QL2,
    v_0=powerFlow.powerflow.bus.V5,
    angle_0=powerFlow.powerflow.bus.A5,
    d_P=0,
    t1=100,
    d_t=1000) if not equivalentGRID
    annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
  Electrical.Loads.NoiseInjections.WhiteNoiseInjection whiteNoiseInjection(
      active_sigma=0.0005,  samplePeriod=0.02)
                           if not equivalentGRID
    annotation (Placement(transformation(extent={{70,-28},{82,-16}})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false,
      fixedSeed=10000)
    annotation (Placement(transformation(extent={{-42,92},{-22,112}})));
  Electrical.Loads.PSSE.Load Load_for_Lin(
    V_b=220000,
    P_0=powerFlow.powerflow.machines.PG2,
    Q_0=powerFlow.powerflow.machines.QG2,
    v_0=powerFlow.powerflow.bus.V6,
    angle_0=powerFlow.powerflow.bus.A6) if equivalentGRID annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={42,-70})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=0.01,
    f=1/260,
    phase=3.1415926535898,
    startTime=5.5)
                 if not equivalentGRID
    annotation (Placement(transformation(extent={{72,-44},{82,-34}})));
  Modelica.Blocks.Math.Add add if not equivalentGRID
    annotation (Placement(transformation(extent={{86,-30},{94,-22}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(table=[0,0; 1,0; 2,0; 3,
        0; 4,0; 5,0; 6,0; 7,0; 8,0; 9,0; 10,0; 11,0; 12,0; 13,0; 14,0; 15,0; 16,
        0; 17,0; 18,0; 19,0; 20,0; 21,0; 22,0; 23,0; 24,0; 25,0; 26,0; 27,0; 28,
        0; 29,0; 30,0; 31,0; 32,0; 33,0; 34,0; 35,0; 36,0; 37,0; 38,0; 39,0; 40,
        0; 41,0; 42,0; 43,0; 44,0; 45,0; 46,0; 47,0; 48,0; 49,0; 50,0; 51,0; 52,
        0; 53,0; 54,0; 55,0; 56,0; 57,0; 58,0; 59,0; 60,0; 61,0; 62,0; 63,0; 64,
        0; 65,0; 66,0; 67,0; 68,0; 69,0; 70,0; 71,0; 72,0; 73,0; 74,0; 75,0; 76,
        0; 77,0; 78,0; 79,0; 80,0; 81,0; 82,0; 83,0; 84,0; 85,0; 86,0; 87,0; 88,
        0; 89,0; 90,0; 91,0; 92,0; 93,0; 94,0; 95,0; 96,0; 97,0; 98,0; 99,0],
      smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments)
    annotation (Placement(transformation(extent={{-100,-22},{-80,-2}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(table=[0,0; 1,0; 2,0;
        3,0; 4,0; 5,0; 6,0; 7,0; 8,0; 9,0; 10,0; 11,0; 12,0; 13,0; 14,0; 15,0;
        16,0; 17,0; 18,0; 19,0; 20,0; 21,0; 22,0; 23,0; 24,0; 25,0; 26,0; 27,0;
        28,0; 29,0; 30,0; 31,0; 32,0; 33,0; 34,0; 35,0; 36,0; 37,0; 38,0; 39,0;
        40,0; 41,0; 42,0; 43,0; 44,0; 45,0; 46,0; 47,0; 48,0; 49,0; 50,0; 51,0;
        52,0; 53,0; 54,0; 55,0; 56,0; 57,0; 58,0; 59,0; 60,0; 61,0; 62,0; 63,0;
        64,0; 65,0; 66,0; 67,0; 68,0; 69,0; 70,0; 71,0; 72,0; 73,0; 74,0; 75,0;
        76,0; 77,0; 78,0; 79,0; 80,0; 81,0; 82,0; 83,0; 84,0; 85,0; 86,0; 87,0;
        88,0; 89,0; 90,0; 91,0; 92,0; 93,0; 94,0; 95,0; 96,0; 97,0; 98,0; 99,0],
      smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments)
    annotation (Placement(transformation(extent={{-100,-80},{-80,-60}})));
equation
  connect(T1.p,B2. p)
    annotation (Line(points={{-51.2,70},{-40,70}},        color={0,0,255}));
  connect(B1.p, T1.n)
    annotation (Line(points={{-80,70},{-68.8,70}}, color={0,0,255}));
  connect(G1.conn, B1.p)
    annotation (Line(points={{-91,70},{-80,70}}, color={0,0,255}));
  connect(L1.n,B3. p)
    annotation (Line(points={{-14.6,70},{0,70}},            color={0,0,255}));
  connect(L1.p,B2. p) annotation (Line(points={{-25.4,70},{-40,70}},
        color={0,0,255}));
  connect(L2_2.n,B4. p) annotation (Line(points={{35.4,60},{44,60},{44,70},
          {60,70}},
                color={0,0,255}));
  connect(L2_1.n,B4. p) annotation (Line(points={{35.4,80},{44,80},{44,70},
          {60,70}},
                color={0,0,255}));
  connect(L2_1.p,B3. p) annotation (Line(points={{24.6,80},{16,80},{16,70},
          {0,70}},     color={0,0,255}));
  connect(L2_2.p,B3. p) annotation (Line(points={{24.6,60},{16,60},{16,70},
          {0,70}},
        color={0,0,255}));
  connect(G2.conn,B6. p)
    annotation (Line(points={{21,-36},{34,-36}}, color={0,0,255}));
  connect(Load1.p, B3.p)
    annotation (Line(points={{-10,56},{-10,70},{0,70}}, color={0,0,255}));
  connect(L3.p,B4. p) annotation (Line(points={{80,55.4},{80,70},{60,70}},
                             color={0,0,255}));
  connect(breaker.s,B5. p)
    annotation (Line(points={{80,12},{80,6}},    color={0,0,255}));
  connect(breaker.r, L3.n)
    annotation (Line(points={{80,20},{80,44.6}},color={0,0,255}));
  connect(T2.n,B6. p)
    annotation (Line(points={{50,-24.8},{50,-36},{34,-36}},
                                                   color={0,0,255}));
  connect(T2.p,B5. p) annotation (Line(points={{50,-7.2},{50,0},{80,0},{80,6}},
                        color={0,0,255}));

  connect(IB.p, B4.p)
    annotation (Line(points={{100,70},{60,70}}, color={0,0,255}));
  connect(Load2.p, B5.p) annotation (Line(points={{110,-20},{110,0},{80,0},{80,6}},
        color={0,0,255}));
  connect(Load_for_Lin.p, B6.p)
    annotation (Line(points={{42,-60},{42,-36},{34,-36}}, color={0,0,255}));
  connect(sine.y, add.u2) annotation (Line(points={{82.5,-39},{82.5,-34},{85.2,-34},
          {85.2,-28.4}}, color={0,0,127}));
  connect(whiteNoiseInjection.y, add.u1) annotation (Line(points={{82.54,-22.06},
          {82.54,-23.6},{85.2,-23.6}}, color={0,0,127}));
  connect(add.y, Load2.u) annotation (Line(points={{94.4,-26},{94.4,-24.5},{101.9,
          -24.5}}, color={0,0,127}));
  connect(combiTimeTable.y[1], G2.P_ref1) annotation (Line(points={{-79,-12},{
          -10,-12},{-10,-30},{-2,-30}}, color={0,0,127}));
  connect(combiTimeTable1.y[1], G2.Efd_ref) annotation (Line(points={{-79,-70},
          {-10,-70},{-10,-42},{-2,-42}}, color={0,0,127}));
    annotation (Placement(transformation(extent={{140,-20},{160,0}})),
                Placement(transformation(extent={{140,-40},{160,-20}})),
                Placement(transformation(extent={{140,-60},{160,-40}})),
                Placement(transformation(extent={{140,-80},{160,-60}})),
               Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-140,-120},{140,120}}), graphics={
        Rectangle(
          extent={{-128,26},{124,-112}},
          lineColor={238,46,47},
          lineThickness=0.5),
        Rectangle(
          extent={{-128,88},{124,28}},
          lineColor={0,128,255},
          lineThickness=0.5),
        Polygon(
          points={{-124,20},{-124,-108},{72,-108},{72,-60},{0,20},{-124,20}},
          lineColor={0,140,72},
          lineThickness=0.5),
        Text(
          extent={{74,-88},{122,-108}},
          textColor={238,46,47},
          textString="Microgrid"),
        Text(
          extent={{76,48},{128,24}},
          textColor={28,108,200},
          textString="Utility Grid"),
        Text(
          extent={{-16,-84},{70,-112}},
          textColor={0,140,72},
          textString="Linearization Unit")}),
    Documentation(info="<html>
<p>This example system shows how the preparation for resynchronization of Generator 2 to the grid. Note that at 2 seconds, a signal is triggered so voltages between buses 3 and 4 should be equal.</p>
<p>Simulate the system for 10 seconds. Variables of interest are:</p>
<ul>
<li><code>B3.v</code></li>
<li><code>B4.v</code></li>
<li><code>G1.gen.SPEED</code></li>
<li><code>G2.gen.SPEED</code></li>
</ul>
<p>Note the behavior of those variables before and after the connection of generator G2 to the main grid.</p>
</html>"),
    experiment(
      StopTime=100,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end OptimizationCheck;
