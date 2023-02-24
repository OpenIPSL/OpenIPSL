within OpenIPSL.Examples.MPC;
model Network2
  "Base network for testing MPC control over the islanded generator"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Buses.Bus BG1
    annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
  OpenIPSL.Electrical.Buses.Bus B1
    annotation (Placement(transformation(extent={{-50,60},{-30,80}})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T1(
    R=0.001,
    X=0.2,
    G=0,
    B=0,
    VNOM1=220000,
    VB1=220000,
    VNOM2=24000,
    VB2=24000) annotation (Placement(transformation(
        extent={{-6,-4},{6,4}},
        rotation=180,
        origin={-60,70})));
  OpenIPSL.Examples.MPC.GenerationUnits.PSSE.G1 G1(
    v_0=1,
    angle_0=0.15656662805,
    P_0=40000000,
    Q_0=4547321,
    V_b=24000)
    annotation (Placement(transformation(extent={{-110,60},{-90,80}})));
  OpenIPSL.Electrical.Branches.PwLine L1(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-26,66},{-14,74}})));
  OpenIPSL.Electrical.Buses.Bus B2
    annotation (Placement(transformation(extent={{-10,60},{10,80}})));
  OpenIPSL.Electrical.Buses.Bus B3
    annotation (Placement(transformation(extent={{50,60},{70,80}})));
  OpenIPSL.Electrical.Branches.PwLine L2_1(
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{24,86},{36,94}})));
  OpenIPSL.Electrical.Branches.PwLine L2_2(
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{24,46},{36,54}})));
  OpenIPSL.Electrical.Machines.PSSE.GENCLS IB(
    V_b=220000,
    v_0=1,
    angle_0=0,
    P_0=10067010.00,
    Q_0=12058260.00,
    M_b=100000000,
    X_d=0.2) annotation (Placement(transformation(extent={{110,60},{100,80}})));
  OpenIPSL.Electrical.Buses.Bus B4(angle_0=-0.1075140447, v_0=0.9291416)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,10})));
  OpenIPSL.Electrical.Branches.PwLine L3(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-6,-4},{6,4}},
        rotation=-90,
        origin={80,40})));
  OpenIPSL.Electrical.Buses.Bus B5 annotation (Placement(transformation(
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
    X=0.1) annotation (Placement(transformation(
        extent={{-6,-4},{6,4}},
        rotation=270,
        origin={60,-6})));
  OpenIPSL.Electrical.Loads.PSSE.Load LD2(
    V_b=220000,
    P_0=10000000,
    v_0=0.9893408,
    angle_0=-0.00960250483,
    Q_0=10000000) annotation (Placement(transformation(extent={{94,-32},{106,
            -20}})));
  OpenIPSL.Examples.MPC.GenerationUnits.PSSE.G2_1INPUT_Pref G2(
    v_0=1,
    angle_0=0,
    V_b=24000,
    P_0=10010220,
    Q_0=10204330) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,-40})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100000000,
                                                        fn=50)
    annotation (Placement(transformation(extent={{-140,100},{-80,120}})));
  OpenIPSL.Electrical.Loads.PSSE.Load LD1(
    V_b=220000,
    v_0=0.9939582,
    angle_0=-0.00501670109,
    P_0=50000000,
    Q_0=10000000) annotation (Placement(transformation(extent={{-12,18},{0,30}})));
  Electrical.Events.Breaker breaker(t_o=2) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={80,22})));
  Modelica.Blocks.Interfaces.RealInput INPUT1
    "Connector of Real input signal 2" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-160,-40})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT
                             "Machine electrical power (machine base)"
    annotation (Placement(transformation(extent={{140,-70},{160,-50}})));
  Electrical.Sensors.SoftPMU softPMU(v_0=1, angle_0=0)
    annotation (Placement(transformation(extent={{22,-2},{42,18}})));
equation
  OUTPUT = softPMU.freq;

  connect(T1.p, B1.p)
    annotation (Line(points={{-53.4,70},{-40,70}},        color={0,0,255}));
  connect(BG1.p, T1.n)
    annotation (Line(points={{-80,70},{-66.6,70}},
                                                 color={0,0,255}));
  connect(G1.conn, BG1.p)
    annotation (Line(points={{-89,70},{-80,70}},          color={0,0,255}));
  connect(L1.n, B2.p)
    annotation (Line(points={{-14.6,70},{0,70}},            color={0,0,255}));
  connect(L1.p, B1.p) annotation (Line(points={{-25.4,70},{-40,70}},
        color={0,0,255}));
  connect(L2_2.n, B3.p) annotation (Line(points={{35.4,50},{56,50},{56,70},{60,
          70}}, color={0,0,255}));
  connect(L2_1.n, B3.p) annotation (Line(points={{35.4,90},{56,90},{56,70},{60,
          70}}, color={0,0,255}));
  connect(L2_1.p, B2.p) annotation (Line(points={{24.6,90},{4,90},{4,70},{0,70}},
                       color={0,0,255}));
  connect(L2_2.p, B2.p) annotation (Line(points={{24.6,50},{4,50},{4,70},{0,70}},
        color={0,0,255}));
  connect(LD2.p, B4.p) annotation (Line(points={{100,-20},{100,6},{80,6},{80,10}},
                 color={0,0,255}));
  connect(G2.conn, B5.p)
    annotation (Line(points={{60,-29},{60,-20}}, color={0,0,255}));
  connect(LD1.p, B2.p)
    annotation (Line(points={{-6,30},{-6,70},{0,70}},color={0,0,255}));
  connect(L3.p, B3.p) annotation (Line(points={{80,45.4},{80,70},{60,70}},
                             color={0,0,255}));
  connect(IB.p, B3.p) annotation (Line(points={{100,70},{60,70}},
                        color={0,0,255}));
  connect(breaker.s, B4.p)
    annotation (Line(points={{80,18},{80,10}},   color={0,0,255}));
  connect(breaker.r, L3.n)
    annotation (Line(points={{80,26},{80,34.6}},color={0,0,255}));
  connect(T2.n, B5.p)
    annotation (Line(points={{60,-12.6},{60,-20}}, color={0,0,255}));
  connect(INPUT1, G2.P_ref) annotation (Line(points={{-160,-40},{40,-40},{40,-60},
          {57.6,-60},{57.6,-52}}, color={0,0,127}));
  connect(softPMU.n, B4.p)
    annotation (Line(points={{39,8},{80,8},{80,10}}, color={0,0,255}));
  connect(T2.p, softPMU.p) annotation (Line(points={{60,0.6},{40,0.6},{40,-2},{18,
          -2},{18,8},{25,8}}, color={0,0,255}));
  annotation ( Diagram(coordinateSystem(preserveAspectRatio=false,
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
    experiment(StopTime=50, __Dymola_Algorithm="Dassl"));
end Network2;
