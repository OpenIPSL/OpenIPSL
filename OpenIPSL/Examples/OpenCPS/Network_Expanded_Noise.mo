within OpenIPSL.Examples.OpenCPS;
model Network_Expanded_Noise "Extended network for testing resynchronization of a generation unit to a weak grid under the presence of noise"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Buses.Bus BG1
    annotation (Placement(transformation(extent={{-90,30},{-70,50}})));
  OpenIPSL.Electrical.Buses.Bus B1
    annotation (Placement(transformation(extent={{-50,30},{-30,50}})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T1(
    R=0.001,
    X=0.2,
    G=0,
    B=0,
    VNOM1=220000,
    VB1=220000,
    VNOM2=24000,
    VB2=2400) annotation (Placement(transformation(
        extent={{-6,-4},{6,4}},
        rotation=180,
        origin={-60,40})));
  Generators.G1 G1(
    v_0=1,
    P_0=40000000,
    V_b=24000,
    Q_0=11957300,
    angle_0=0.11174784695)
    annotation (Placement(transformation(extent={{-110,30},{-90,50}})));
  OpenIPSL.Electrical.Branches.PwLine L1(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-26,36},{-14,44}})));
  OpenIPSL.Electrical.Buses.Bus B2
    annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  OpenIPSL.Electrical.Buses.Bus B3
    annotation (Placement(transformation(extent={{50,30},{70,50}})));
  OpenIPSL.Electrical.Branches.PwLine L2_1(
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{24,56},{36,64}})));
  OpenIPSL.Electrical.Branches.PwLine L2_2(
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{24,16},{36,24}})));
  OpenIPSL.Electrical.Machines.PSSE.GENCLS IB(
    V_b=220000,
    v_0=1,
    angle_0=0,
    M_b=100000000,
    X_d=0.2,
    P_0=10102800,
    Q_0=5758300)
    annotation (Placement(transformation(extent={{130,30},{120,50}})));
  OpenIPSL.Electrical.Buses.Bus B4(angle_0=-0.1075140447, v_0=0.9291416)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,-20})));
  OpenIPSL.Electrical.Branches.PwLine L3(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-6,-4},{6,4}},
        rotation=-90,
        origin={80,10})));
  OpenIPSL.Electrical.Buses.Bus B5 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,-60})));
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
        origin={60,-40})));
  OpenIPSL.Electrical.Loads.PSSE.Load LD2(
    V_b=220000,
    P_0=10000000,
    v_0=0.9893408,
    angle_0=-0.00960250483,
    Q_0=10000000) annotation (Placement(transformation(extent={{94,-72},{106,-60}})));
  Generators.G2 G2(
    v_0=1,
    angle_0=0,
    V_b=24000,
    P_0=10010220,
    Q_0=10204330) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,-80})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100000000,
                                                        fn=50)
    annotation (Placement(transformation(extent={{-140,100},{-80,120}})));
  OpenIPSL.Electrical.Loads.PSSE.Load LD1(
    V_b=220000,
    P_0=50000000,
    Q_0=10000000,
    v_0=0.9647,
    angle_0=-0.0546268857)
    annotation (Placement(transformation(extent={{-12,-12},{0,0}})));
  Breakers.Breaker breaker1 annotation (Placement(transformation(
        extent={{-4,4},{4,-4}},
        rotation=90,
        origin={80,-10})));
protected
  Modelica.Blocks.Interfaces.RealOutput V_IB annotation (Placement(
        transformation(
        extent={{-3,-3},{3,3}},
        rotation=90,
        origin={55,-97})));
  Modelica.Blocks.Interfaces.RealOutput V_DN annotation (Placement(
        transformation(
        extent={{-3,-3},{3,3}},
        rotation=90,
        origin={65,-97})));
  Modelica.Blocks.Interfaces.RealOutput fi_IB annotation (Placement(
        transformation(
        extent={{-3,-3},{3,3}},
        origin={43,-85})));
  Modelica.Blocks.Interfaces.RealOutput fi_DN annotation (Placement(
        transformation(
        extent={{-3,-3},{3,3}},
        origin={43,-75})));
public
  OpenIPSL.Electrical.Branches.PwLine L2(
    G=0,
    B=0,
    X=0.5,
    R=0.05) annotation (Placement(transformation(
        extent={{-6,-4},{6,4}},
        origin={100,40})));
  NoiseInjections.WhiteNoiseInjection whiteNoiseInjection(active_sigma=0.0001)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-6,60})));
  Breakers.Breaker breaker2 annotation (Placement(transformation(
        extent={{-4,4},{4,-4}},
        rotation=90,
        origin={80,28})));
equation
  V_IB = B3.v;
  fi_IB = B3.angle;
  V_DN = B4.v;
  fi_DN = B4.angle;

  connect(T1.p, B1.p)
    annotation (Line(points={{-53.4,40},{-53.4,40},{-40,40}},
                                                          color={0,0,255}));
  connect(BG1.p, T1.n)
    annotation (Line(points={{-80,40},{-66.6,40}},
                                                 color={0,0,255}));
  connect(G1.conn, BG1.p)
    annotation (Line(points={{-89,40},{-89,40},{-80,40}}, color={0,0,255}));
  connect(L1.n, B2.p)
    annotation (Line(points={{-14.6,40},{-14.6,40},{0,40}}, color={0,0,255}));
  connect(L1.p, B1.p) annotation (Line(points={{-25.4,40},{-25.4,40},{-40,40}},
        color={0,0,255}));
  connect(L2_2.n, B3.p) annotation (Line(points={{35.4,20},{56,20},{56,40},{60,
          40}}, color={0,0,255}));
  connect(L2_1.n, B3.p) annotation (Line(points={{35.4,60},{56,60},{56,40},{60,
          40}}, color={0,0,255}));
  connect(L2_1.p, B2.p) annotation (Line(points={{24.6,60},{24.6,60},{4,60},{4,
          40},{0,40}}, color={0,0,255}));
  connect(L2_2.p, B2.p) annotation (Line(points={{24.6,20},{4,20},{4,40},{0,40}},
        color={0,0,255}));
  connect(T2.p, B4.p) annotation (Line(points={{60,-33.4},{60,-24},{80,-24},{80,
          -20}},
        color={0,0,255}));
  connect(T2.n, B5.p)
    annotation (Line(points={{60,-46.6},{60,-46.6},{60,-60}},
                                                            color={0,0,255}));
  connect(LD2.p, B4.p) annotation (Line(points={{100,-60},{100,-24},{80,-24},{80,
          -20}}, color={0,0,255}));
  connect(G2.conn, B5.p)
    annotation (Line(points={{60,-69},{60,-60}}, color={0,0,255}));
  connect(LD1.p, B2.p)
    annotation (Line(points={{-6,0},{-6,40},{0,40}}, color={0,0,255}));
  connect(L3.n, breaker1.n)
    annotation (Line(points={{80,4.6},{80,-5.5}},
                                                color={0,0,255}));
  connect(B4.p, breaker1.p)
    annotation (Line(points={{80,-20},{80,-14.5}}, color={0,0,255}));
  connect(V_IB, G2.V_IB)
    annotation (Line(points={{55,-97},{55,-96},{55,-89.8}}, color={0,0,127}));
  connect(breaker1.TRIGGER, G2.TRIGGER) annotation (Line(points={{84.5,-10},{
          116,-10},{116,-80},{71,-80}}, color={255,0,255}));
  connect(L2.p, B3.p) annotation (Line(points={{94.6,40},{80,40},{69.5,40},{
          69.5,40},{60,40}}, color={0,0,255}));
  connect(L2.n, IB.p)
    annotation (Line(points={{105.4,40},{120,40},{120,40}}, color={0,0,255}));
  connect(fi_IB, G2.fi_IB)
    annotation (Line(points={{43,-85},{46.5,-85},{50,-85}}, color={0,0,127}));
  connect(fi_DN, G2.fi_DN)
    annotation (Line(points={{43,-75},{46.5,-75},{50,-75}}, color={0,0,127}));
  connect(V_DN, G2.V_DN) annotation (Line(points={{65,-97},{65,-93.5},{65,-89.8}},
        color={0,0,127}));
  connect(whiteNoiseInjection.pin, B2.p) annotation (Line(points={{-6,55.6},{-6,
          55.6},{-6,40},{0,40}}, color={0,0,255}));
  connect(breaker2.n, B3.p) annotation (Line(points={{80,32.5},{80,40},{69.5,
          39.8496},{69.5,40},{60,40}}, color={0,0,255}));
  connect(breaker2.p, L3.p)
    annotation (Line(points={{80,23.5},{80,15.4},{80,15.4}},
                                                         color={0,0,255}));
  connect(breaker2.TRIGGER, G2.TRIGGER) annotation (Line(points={{84.5,28},{116,
          28},{116,-80},{71,-80}}, color={255,0,255}));
  annotation ( Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-140,-120},{140,120}})),
    Documentation(info="<html>
<p>This example system shows how the resynchronization controller is used to connect Generator 2 back to the grid even under the presence of noise. Note that at 2 seconds, a signal is triggered to equalize voltage magnitudes on buses 3 and 4.</p>
<p>Simulate the system for 50 seconds. Variables of interest are:</p>
<ul>
<li><code>BG1.v</code></li>
<li><code>B4.v</code></li>
<li><code>G1.gen.SPEED</code></li>
<li><code>G2.gen.SPEED</code></li>
</ul>
<p>Note the behavior of those variables before and after the connection of generator G2 to the main grid.</p>
</html>"),experiment(StopTime=50));
end Network_Expanded_Noise;
