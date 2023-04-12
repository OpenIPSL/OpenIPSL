within OpenIPSL.Examples.MPC.PSSE.EquipmentOnlyLinearization;
model GridEquivalentConstantVoltageSource2_withNOISE_V2
  "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
  extends Modelica.Icons.Example;

  parameter Boolean equivalentGRID= true;
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
        extent={{-6,-4},{6,4}},
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
        origin={80,10})));
  OpenIPSL.Electrical.Branches.PwLine L3(
    R=0.001,
    X=0.2,
    G=0,
    B=0) if not equivalentGRID annotation (Placement(transformation(
        extent={{-6,-4},{6,4}},
        rotation=-90,
        origin={80,40})));
  OpenIPSL.Electrical.Buses.Bus B6(v_0=powerFlow.powerflow.bus.V6, angle_0=
        powerFlow.powerflow.bus.A6)
                                   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,-20})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T2(
    G=0,
    B=0,
    VNOM1=220000,
    VB1=220000,
    VNOM2=24000,
    VB2=24000,
    R=0.005,
    X=0.1) if not equivalentGRID annotation (Placement(transformation(
        extent={{-6,-4},{6,4}},
        rotation=270,
        origin={60,-6})));
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
        rotation=90,
        origin={60,-40})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100000000,
                                                        fn=50)
    annotation (Placement(transformation(extent={{-140,100},{-80,120}})));
  OpenIPSL.Electrical.Loads.PSSE.Load Load1(
    V_b=220000,
    P_0=powerFlow.powerflow.loads.PL1,
    Q_0=powerFlow.powerflow.loads.QL1,
    v_0=powerFlow.powerflow.bus.V3,
    angle_0=powerFlow.powerflow.bus.A3) if not equivalentGRID
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Electrical.Events.Breaker breaker(enableTrigger=false,
    t_o=1.01,
    rc_enabled=false) if not equivalentGRID                     annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={80,22})));

  Modelica.Blocks.Interfaces.RealInput IN1(start=0)
    "Connector of Real input signal 2" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-160,-40})));
  Modelica.Blocks.Sources.Constant IN11(k=0)
    annotation (Placement(transformation(extent={{-120,-70},{-100,-50}})));
  Modelica.Blocks.Math.Add AddU1
    annotation (Placement(transformation(extent={{-80,-56},{-60,-36}})));
  Modelica.Blocks.Sources.Constant IN22(k=0)
    annotation (Placement(transformation(extent={{-120,-110},{-100,-90}})));
  Modelica.Blocks.Math.Add AddU2
    annotation (Placement(transformation(extent={{-80,-96},{-60,-76}})));
  Modelica.Blocks.Interfaces.RealInput IN2(start=0)
    "Connector of Real input signal 2" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-160,-80})));
Modelica.Blocks.Interfaces.RealOutput OUT1
    annotation (Placement(transformation(extent={{140,70},{160,90}})));
  Modelica.Blocks.Interfaces.RealOutput OUT2
    annotation (Placement(transformation(extent={{140,50},{160,70}})));
  Modelica.Blocks.Interfaces.RealOutput OUT3
    annotation (Placement(transformation(extent={{140,30},{160,50}})));
  Modelica.Blocks.Interfaces.RealOutput OUT4
    annotation (Placement(transformation(extent={{140,10},{160,30}})));
     Modelica.Blocks.Interfaces.RealOutput OUT5
    annotation (Placement(transformation(extent={{140,-10},{160,10}})));
     Modelica.Blocks.Interfaces.RealOutput OUT6
    annotation (Placement(transformation(extent={{140,-30},{160,-10}})));
         Modelica.Blocks.Interfaces.RealOutput OUT7 annotation (Placement(transformation(extent={{140,-50},
            {160,-30}})));
  Electrical.Sources.VoltageSourceReImInput EquivalentInfiniteBus if equivalentInfBUS
    annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={86,104})));
  Modelica.Blocks.Sources.Constant VR1(k=0.999211) if equivalentInfBUS
    annotation (Placement(transformation(extent={{114,106},{104,116}})));

  Modelica.Blocks.Sources.Constant VI1(k=-0.00980921) if equivalentInfBUS
    annotation (Placement(transformation(extent={{114,90},{104,100}})));

     Modelica.Blocks.Interfaces.RealOutput OUT8 annotation (Placement(transformation(extent={{140,-70},
            {160,-50}})));
  //       Modelica.Blocks.Interfaces.RealOutput OUT9 annotation (Placement(transformation(extent={{140,-60},{160,-40}})));
  //   Modelica.Blocks.Interfaces.RealOutput OUT10 annotation (Placement(transformation(extent={{140,-80}, {160,-60}})));
     Modelica.Blocks.Interfaces.RealOutput OUT9
    annotation (Placement(transformation(extent={{140,-90},{160,-70}})));

  PFData.PowerFlow powerFlow(redeclare record PowerFlow =
        OpenIPSL.Examples.MPC.PFData.PF04)
    annotation (Placement(transformation(extent={{-68,102},{-54,116}})));
  Electrical.Machines.PSSE.GENCLS IB(
    V_b=220000,
    v_0=powerFlow.powerflow.bus.V4,
    angle_0=powerFlow.powerflow.bus.A4,
    P_0=powerFlow.powerflow.machines.Pinf,
    Q_0=powerFlow.powerflow.machines.Qinf,
    M_b=100000000,
    X_d=1) if not equivalentGRID annotation (Placement(transformation(extent={{110,60},{100,80}})));
  Electrical.Loads.PSSE.Load_ExtInput load_ExtInput(
    P_0=powerFlow.powerflow.loads.PL2,
    Q_0=powerFlow.powerflow.loads.QL2,
    v_0=powerFlow.powerflow.bus.V5,
    angle_0=powerFlow.powerflow.bus.A5,
    d_P=0,
    t1=100,
    d_t=1000) if not equivalentGRID
           annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
  Electrical.Loads.NoiseInjections.WhiteNoiseInjection whiteNoiseInjection(
      active_sigma=0.000025, samplePeriod=0.02)
                           if not equivalentGRID
    annotation (Placement(transformation(extent={{76,-30},{88,-18}})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false,
      fixedSeed=10000)
    annotation (Placement(transformation(extent={{-40,102},{-28,114}})));
  Electrical.Sources.VoltageSourceReImInput EquivalentInfiniteBus1
                                                                  if equivalentGRID
    annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=180,
        origin={4,-20})));
  Modelica.Blocks.Sources.Constant VR2(k=1)        if equivalentGRID
    annotation (Placement(transformation(extent={{-30,-22},{-20,-12}})));
  Modelica.Blocks.Sources.Constant VI2(k=0)           if equivalentGRID
    annotation (Placement(transformation(extent={{-30,-38},{-20,-28}})));
equation
  //OUT1 = G2.SPEED1;
  OUT1 = G2.gen.SPEED;
  //OUT2 = G2.PMECH1;
  OUT2 = G2.gASTMPC.PMECH;
  OUT3 = G2.gen.ANGLE;
  OUT4 = G2.gASTMPC.TF2_out;
  OUT5 = B6.angle;
  OUT6 = B6.v;
  OUT7 = B6.p.vr;
  OUT8 = B6.p.vi;
  //OUT9 = B5.p.vr;
  //OUT10 = B5.p.vi;
  OUT9 = G2.gen.PELEC;
  connect(T1.p,B2. p)
    annotation (Line(points={{-53.4,70},{-40,70}},        color={0,0,255}));
  connect(B1.p, T1.n)
    annotation (Line(points={{-80,70},{-66.6,70}}, color={0,0,255}));
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
    annotation (Line(points={{60,-29},{60,-20}}, color={0,0,255}));
  connect(Load1.p, B3.p)
    annotation (Line(points={{-10,40},{-10,70},{0,70}}, color={0,0,255}));
  connect(L3.p,B4. p) annotation (Line(points={{80,45.4},{80,70},{60,70}},
                             color={0,0,255}));
  connect(breaker.s,B5. p)
    annotation (Line(points={{80,18},{80,10}},   color={0,0,255}));
  connect(breaker.r, L3.n)
    annotation (Line(points={{80,26},{80,34.6}},color={0,0,255}));
  connect(T2.n,B6. p)
    annotation (Line(points={{60,-12.6},{60,-20}}, color={0,0,255}));
  connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-60},{-82,-60},{
          -82,-52}},  color={0,0,127}));
  connect(IN1, AddU1.u1) annotation (Line(points={{-160,-40},{-82,-40}},
                 color={0,0,127}));
  connect(T2.p,B5. p) annotation (Line(points={{60,0.6},{60,2},{80,2},{80,10}},
                        color={0,0,255}));

  connect(IN22.y,AddU2. u2) annotation (Line(points={{-99,-100},{-82,-100},{-82,
          -92}}, color={0,0,127}));
  connect(IN2,AddU2. u1) annotation (Line(points={{-160,-80},{-82,-80}},
                 color={0,0,127}));
  connect(AddU2.y, G2.Efd_ref)
    annotation (Line(points={{-59,-86},{66,-86},{66,-52}}, color={0,0,127}));
  connect(AddU1.y, G2.P_ref1) annotation (Line(points={{-59,-46},{44,-46},{
          44,-52},{54,-52}},                  color={0,0,127}));
  connect(VI1.y, EquivalentInfiniteBus.vIm) annotation (Line(points={{103.5,95},
          {93.2,95},{93.2,101.6}}, color={0,0,127}));
  connect(VR1.y, EquivalentInfiniteBus.vRe) annotation (Line(points={{103.5,111},
          {100,111},{100,106.4},{93.2,106.4}}, color={0,0,127}));
  connect(EquivalentInfiniteBus.p, B4.p) annotation (Line(points={{79.4,104},{68,
          104},{68,70},{60,70}}, color={0,0,255}));
  connect(IB.p, B4.p)
    annotation (Line(points={{100,70},{60,70}}, color={0,0,255}));
  connect(load_ExtInput.p, B5.p) annotation (Line(points={{110,-20},{110,2},{80,
          2},{80,10}}, color={0,0,255}));
  connect(whiteNoiseInjection.y, load_ExtInput.u) annotation (Line(points={{88.54,
          -24.06},{95.22,-24.06},{95.22,-24.5},{101.9,-24.5}}, color={0,0,127}));
  connect(VR2.y, EquivalentInfiniteBus1.vRe) annotation (Line(points={{-19.5,-17},
          {-19.5,-17.6},{-3.2,-17.6}}, color={0,0,127}));
  connect(VI2.y, EquivalentInfiniteBus1.vIm) annotation (Line(points={{-19.5,-33},
          {-19.5,-34},{-10,-34},{-10,-22.4},{-3.2,-22.4}}, color={0,0,127}));
  connect(EquivalentInfiniteBus1.p, B6.p)
    annotation (Line(points={{10.6,-20},{60,-20}}, color={0,0,255}));
    annotation (Placement(transformation(extent={{140,-20},{160,0}})),
                Placement(transformation(extent={{140,-40},{160,-20}})),
                Placement(transformation(extent={{140,-60},{160,-40}})),
                Placement(transformation(extent={{140,-80},{160,-60}})),
               Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-140,-120},{140,120}})),
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
      StartTime=0.1,
      StopTime=0.2,
      Interval=0.1,
      Tolerance=1e-06,
      __Dymola_Algorithm="Euler"));
end GridEquivalentConstantVoltageSource2_withNOISE_V2;
