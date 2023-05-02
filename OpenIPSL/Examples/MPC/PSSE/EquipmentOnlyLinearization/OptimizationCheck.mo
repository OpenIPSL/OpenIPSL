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
    t_o=1.01,
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
        OpenIPSL.Examples.MPC.PFData.PF03)
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
      active_sigma=0.0000000005,
                            samplePeriod=0.02)
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
    f=1/260,
    phase=3.1415926535898,
    startTime=5.5)
                 if not equivalentGRID
    annotation (Placement(transformation(extent={{72,-44},{82,-34}})));
  Modelica.Blocks.Math.Add add if not equivalentGRID
    annotation (Placement(transformation(extent={{86,-30},{94,-22}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(table=[0,0; 0.5,-2.74e-16;
        1,1.23e-16; 1.5,-0.023553414; 2,0.00226445; 2.5,-0.000819532; 3,-0.000893047;
        3.5,-0.000556498; 4,0.000878186; 4.5,0.000122204; 5,0.000654087; 5.5,
        0.001129671; 6,0.00068535; 6.5,0.001316455; 7,0.00113267; 7.5,
        0.001340342; 8,0.001660903; 8.5,0.001058399; 9,0.001485748; 9.5,
        0.001592657; 10,0.001172465; 10.5,0.001786355; 11,0.001258804; 11.5,
        0.001414307; 12,0.001851642; 12.5,0.001654247; 13,0.001478177; 13.5,
        0.001573347; 14,0.00144412; 14.5,0.001425876; 15,0.001481962; 15.5,
        0.001685424; 16,0.001280223; 16.5,0.002188429; 17,0.001212146; 17.5,
        0.001057434; 18,0.002316195; 18.5,0.000823138; 19,0.001872715; 19.5,
        0.002281925; 20,0.000212087; 20.5,0.00178869; 21,0.001550175; 21.5,
        0.001323849; 22,0.001369638; 22.5,0.00158283; 23,0.001811996; 23.5,
        0.00161486; 24,0.001157025; 24.5,0.001801794],
      smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments)
    annotation (Placement(transformation(extent={{-100,-22},{-80,-2}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(table=[0,0; 0.5,
        1.8e-12; 1,3.6e-12; 1.5,0.05; 2,0.1; 2.5,0.15; 3,0.2; 3.5,0.25; 4,
        0.263776487; 4.5,0.248614171; 5,0.25716742; 5.5,0.260606863; 6,
        0.265122641; 6.5,0.267769058; 7,0.270142912; 7.5,0.272213427; 8,
        0.273112005; 8.5,0.274493162; 9,0.275297708; 9.5,0.275799832; 10,
        0.276775287; 10.5,0.27692303; 11,0.277860691; 11.5,0.277428421; 12,
        0.277819019; 12.5,0.277601462; 13,0.278020966; 13.5,0.277941926; 14,
        0.277907842; 14.5,0.279245122; 15,0.277951751; 15.5,0.278432571; 16,
        0.277688224; 16.5,0.2780227; 17,0.278208204; 17.5,0.278856276; 18,
        0.277871199; 18.5,0.278786755; 19,0.278471166; 19.5,0.277629014; 20,
        0.278792724; 20.5,0.278436379; 21,0.278419601; 21.5,0.278409225; 22,
        0.278597382; 22.5,0.278101802; 23,0.278311091; 23.5,0.278380683; 24,
        0.279124937; 24.5,0.278239024],
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
      StopTime=25,
      __Dymola_NumberOfIntervals=1000,
      __Dymola_Algorithm="Dassl"));
end OptimizationCheck;
