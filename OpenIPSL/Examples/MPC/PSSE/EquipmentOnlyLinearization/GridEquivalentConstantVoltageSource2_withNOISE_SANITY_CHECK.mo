within OpenIPSL.Examples.MPC.PSSE.EquipmentOnlyLinearization;
model GridEquivalentConstantVoltageSource2_withNOISE_SANITY_CHECK
  "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
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
    VNOM1=220000,
    VB1=220000,
    VNOM2=24000,
    VB2=24000) if not equivalentGRID annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={-60,70})));
  OpenIPSL.Examples.OpenCPS.Generators.G1 G1(
    v_0=powerFlow.powerflow.bus.V1,
    angle_0=powerFlow.powerflow.bus.A1,
    P_0=powerFlow.powerflow.machines.PG1,
    Q_0=powerFlow.powerflow.machines.QG1,
    V_b=24000) if not equivalentGRID
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
    VNOM1=220000,
    VB1=220000,
    VNOM2=24000,
    VB2=24000,
    R=0.005,
    X=0.1) if not equivalentGRID annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=270,
        origin={50,-16})));
  GenerationUnits.PSSE.G2_3INPUTS                       G2(
    enableV_b=true,
    enableP_0=true,
    enableQ_0=true,
    v_0=powerFlow.powerflow.bus.V6,
    enablev_0=true,
    angle_0=powerFlow.powerflow.bus.A6,
    V_b=24000,
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
    t_o=3.01,
    rc_enabled=true,
    t_rc=42.01)       if not equivalentGRID                     annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={80,16})));

  //       Modelica.Blocks.Interfaces.RealOutput OUT9 annotation (Placement(transformation(extent={{140,-60},{160,-40}})));
  //   Modelica.Blocks.Interfaces.RealOutput OUT10 annotation (Placement(transformation(extent={{140,-80}, {160,-60}})));
   //      Modelica.Blocks.Interfaces.RealOutput OUT10
   // annotation (Placement(transformation(extent={{140,-116},{160,-96}})));

  PFData.PowerFlow powerFlow(redeclare record PowerFlow =
        OpenIPSL.Examples.MPC.PFData.PF04)
    annotation (Placement(transformation(extent={{-68,94},{-48,114}})));
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
      active_sigma=0.00002, samplePeriod=0.02)
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
    amplitude=0,
    f=1/200,
    phase=3.1415926535898,
    startTime=3) if not equivalentGRID
    annotation (Placement(transformation(extent={{72,-44},{82,-34}})));
  Modelica.Blocks.Math.Add add if not equivalentGRID
    annotation (Placement(transformation(extent={{86,-30},{94,-22}})));
  Modelica.Blocks.Sources.CombiTimeTable PMech_ref(table=[0,0; 0.5,-1.56e-12; 1,
        -3.21e-12; 1.5,-0.01; 2,-0.02; 2.5,-0.03; 3,-0.04; 3.5,-0.05; 4,-0.06;
        4.5,-0.07; 5,-0.068574951; 5.5,-0.06718256; 6,-0.065988475; 6.5,-0.064805414;
        7,-0.06371742; 7.5,-0.062652616; 8,-0.061666857; 8.5,-0.060802659; 9,-0.056059881;
        9.5,-0.052172381; 10,-0.051314353; 10.5,-0.05014456; 11,-0.049975614;
        11.5,-0.049729432; 12,-0.050034642; 12.5,-0.050000297; 13,-0.050065445;
        13.5,-0.05; 14,-0.049940286; 14.5,-0.050192353; 15,-0.049865244; 15.5,-0.050021999;
        16,-0.050004633; 16.5,-0.050031092; 17,-0.049999911; 17.5,-0.05; 18,-0.05;
        18.5,-0.05; 19,-0.05; 19.5,-0.05; 20,-0.05; 20.5,-0.0501; 21,-0.0499;
        21.5,-0.05; 22,-0.0501; 22.5,-0.0499; 23,-0.0501; 23.5,-0.05; 24,-0.05;
        24.5,-0.0501; 25,-0.05; 25.5,-0.05; 26,-0.05; 26.5,-0.05; 27,-0.05;
        27.5,-0.05; 28,-0.05; 28.5,-0.05; 29,-0.05; 29.5,-0.0499; 30,-0.0501;
        30.5,-0.0501; 31,-0.0501; 31.5,-0.060092326; 32,-0.062362132; 32.5,-0.061459694;
        33,-0.060546587; 33.5,-0.054152676; 34,-0.052293878; 34.5,-0.050758333;
        35,-0.049948886; 35.5,-0.049788298; 36,-0.049774073; 36.5,-0.050064162;
        37,-0.049980658; 37.5,-0.050067613; 38,-0.05; 38.5,-0.049956345; 39,-0.0501;
        39.5,-0.0499; 40,-0.0501; 40.5,-0.0501; 41,-0.0501; 41.5,-0.0501; 42,-0.0501;
        42.5,-0.0501; 43,-0.0501; 43.5,-0.0501; 44,-0.0501; 44.5,-0.0501; 45,-0.0501;
        45.5,-0.0501; 46,-0.0501; 46.5,-0.0501; 47,-0.0501; 47.5,-0.0501; 48,-0.0501;
        48.5,-0.0501; 49,-0.0501; 49.5,-0.0501])
    annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
  Modelica.Blocks.Sources.CombiTimeTable Efd_ref(table=[0,0; 0.5,3.11e-15; 1,
        6.39e-15; 1.5,0.05; 2,0.1; 2.5,0.15; 3,0.2; 3.5,0.25; 4,0.3; 4.5,
        0.275711036; 5,0.225711036; 5.5,0.175711036; 6,0.125711036; 6.5,
        0.075711036; 7,0.037103458; 7.5,0.033116466; 8,0.037029155; 8.5,
        0.042282682; 9,0.021247251; 9.5,0.012895131; 10,0.008505326; 10.5,
        0.00552348; 11,0.003375918; 11.5,0.002138951; 12,0.001401968; 12.5,
        0.001008495; 13,0.00076195; 13.5,0.000620052; 14,0.000495572; 14.5,
        0.0002867; 15,0.000262664; 15.5,0.000215242; 16,0.00015117; 16.5,
        8.68e-05; 17,6.39e-05; 17.5,4.99e-05; 18,3.77e-05; 18.5,2.22e-05; 19,
        3.42e-05; 19.5,3.28e-05; 20,2.68e-05; 20.5,-2.19e-05; 21,5.29e-06; 21.5,
        3.02e-05; 22,-2.22e-05; 22.5,2.45e-05; 23,-5.72e-07; 23.5,-1.42e-05; 24,
        1.74e-07; 24.5,-3.06e-06; 25,2.12e-05; 25.5,3.12e-05; 26,2.53e-05; 26.5,
        1.43e-05; 27,1.68e-05; 27.5,1.66e-05; 28,3.39e-05; 28.5,5.58e-05; 29,
        3.06e-05; 29.5,3.55e-05; 30,-2.31e-05; 30.5,-2.31e-05; 31,-2.31e-05;
        31.5,0.049976857; 32,0.033832085; 32.5,0.036300546; 33,0.03256398; 33.5,
        0.017274081; 34,0.010587405; 34.5,0.006564361; 35,0.003792071; 35.5,
        0.002067559; 36,0.001193387; 36.5,0.000713153; 37,0.000504683; 37.5,
        0.000372551; 38,0.0002982; 38.5,0.000252332; 39,0.000162296; 39.5,
        0.000142685; 40,7.7e-05; 40.5,7.7e-05; 41,7.7e-05; 41.5,7.7e-05; 42,
        7.7e-05; 42.5,7.7e-05; 43,7.7e-05; 43.5,7.7e-05; 44,7.7e-05; 44.5,
        7.7e-05; 45,7.7e-05; 45.5,7.7e-05; 46,7.7e-05; 46.5,7.7e-05; 47,7.7e-05;
        47.5,7.7e-05; 48,7.7e-05; 48.5,7.7e-05; 49,7.7e-05; 49.5,7.7e-05])
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
  connect(PMech_ref.y[1], G2.P_ref1)
    annotation (Line(points={{-79,-30},{-2,-30}}, color={0,0,127}));
  connect(Efd_ref.y[1], G2.Efd_ref) annotation (Line(points={{-79,-70},{-10,-70},
          {-10,-42},{-2,-42}}, color={0,0,127}));
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
end GridEquivalentConstantVoltageSource2_withNOISE_SANITY_CHECK;
