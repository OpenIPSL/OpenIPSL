within OpenIPSL.Examples.MPC;
model NetworkHard2
  "Base network for testing MPC control over the islanded generator"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Buses.Bus BG1(v_0=0.998855, angle_0=0.15699114448641)
    annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
  OpenIPSL.Electrical.Buses.Bus B1(v_0=0.992504, angle_0=0.076251672237088)
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
  OpenIPSL.Examples.MPC.GenerationUnits.G1 G1(
    v_0=0.998855,
    angle_0=0.15699114448641,
    P_0=40000000,
    Q_0=4547321,
    V_b=24000)
    annotation (Placement(transformation(extent={{-110,60},{-90,80}})));
  OpenIPSL.Electrical.Branches.PwLine L1(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-26,66},{-14,74}})));
  OpenIPSL.Electrical.Buses.Bus B2(v_0=0.992681, angle_0=-0.0049879590159821)
    annotation (Placement(transformation(extent={{-10,60},{10,80}})));
  OpenIPSL.Electrical.Buses.Bus B3(v_0=0.998705, angle_0=9.4873305611609e-06)
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
  OpenIPSL.Electrical.Buses.Bus B4(angle_0=-0.00014475935348966,
                                                          v_0=0.997342)
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
  OpenIPSL.Electrical.Buses.Bus B5(v_0=1.0074, angle_0=0.0093371449790267)
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
    X=0.1) annotation (Placement(transformation(
        extent={{-6,-4},{6,4}},
        rotation=270,
        origin={60,-6})));
  OpenIPSL.Examples.MPC.GenerationUnits.G2_no_controls3 G2(
    v_0=1.0074,
    angle_0=0.0093371449790267,
    V_b=24000,
    P_0=10010220,
    Q_0=10204330)    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,-40})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100000000,
                                                        fn=50)
    annotation (Placement(transformation(extent={{-140,100},{-80,120}})));
  OpenIPSL.Electrical.Loads.PSSE.Load LD1(
    V_b=220000,
    v_0=0.992681,
    angle_0=-0.0049879590159821,
    P_0=50000000,
    Q_0=10000000) annotation (Placement(transformation(extent={{-12,18},{0,30}})));
  Electrical.Events.Breaker breaker(enableTrigger=false)
                                           annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={80,24})));
  OpenCPS.Controls.FREQ_CALC fREQ_CALC(
    T_w=2,
    T_f=1,
    fi_0=-0.00014475935348966)
            annotation (Placement(transformation(extent={{-86,-34},{-66,-14}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=B4.angle)
    annotation (Placement(transformation(extent={{-116,-34},{-96,-14}})));
  Modelica.Blocks.Interfaces.RealInput INPUT(start=0)
    "Connector of Real input signal 2" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-160,-78})));
  Modelica.Blocks.Math.Add AddU1
    annotation (Placement(transformation(extent={{-52,-94},{-32,-74}})));
  Modelica.Blocks.Sources.Constant in_u1(k=0)
    annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
  Electrical.Loads.PSSE.Load_variation load_variation(
    V_b=220000,
    P_0=10000000,
    Q_0=10000000,
    v_0=0.997342,
    angle_0=-0.00014475935348966,
    d_P=0.1,
    t1=1000,
    d_t=2000)
    annotation (Placement(transformation(extent={{90,-40},{110,-20}})));
  NonElectrical.Continuous.SimpleLag U1Lag(
    K=1,
    T=5,
    y_start=0)
    annotation (Placement(transformation(extent={{-18,-94},{2,-74}})));
  Modelica.Blocks.Interfaces.RealOutput OUTPUT
    annotation (Placement(transformation(extent={{-52,-34},{-32,-14}})));
  Electrical.Loads.PSSE.Load load(
    V_b=220000,
    v_0=0.998705,
    angle_0=9.4873305611609e-06,
    P_0=-10067010,
    Q_0=-12058260)
    annotation (Placement(transformation(extent={{98,40},{118,60}})));
equation

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
  connect(T2.p, B4.p) annotation (Line(points={{60,0.6},{60,6},{80,6},{80,10}},
        color={0,0,255}));
  connect(G2.conn, B5.p)
    annotation (Line(points={{60,-29},{60,-20}}, color={0,0,255}));
  connect(LD1.p, B2.p)
    annotation (Line(points={{-6,30},{-6,70},{0,70}},color={0,0,255}));
  connect(L3.p, B3.p) annotation (Line(points={{80,45.4},{80,70},{60,70}},
                             color={0,0,255}));
  connect(breaker.s, B4.p)
    annotation (Line(points={{80,20},{80,10}},   color={0,0,255}));
  connect(breaker.r, L3.n)
    annotation (Line(points={{80,28},{80,34.6}},color={0,0,255}));
  connect(T2.n, B5.p)
    annotation (Line(points={{60,-12.6},{60,-20}}, color={0,0,255}));
  connect(realExpression.y, fREQ_CALC.ANGLE)
    annotation (Line(points={{-95,-24},{-85,-24}}, color={0,0,127}));
  connect(INPUT, AddU1.u1)
    annotation (Line(points={{-160,-78},{-54,-78}}, color={0,0,127}));
  connect(in_u1.y, AddU1.u2)
    annotation (Line(points={{-89,-100},{-62,-100},{-62,-90},{-54,-90}},
                                                   color={0,0,127}));
  connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,6},{80,
          6},{80,10}},                color={0,0,255}));
  connect(AddU1.y, U1Lag.u)
    annotation (Line(points={{-31,-84},{-20,-84}}, color={0,0,127}));
  connect(U1Lag.y, G2.Padd) annotation (Line(points={{3,-84},{58.8,-84},{58.8,
          -52}},                 color={0,0,127}));
  connect(fREQ_CALC.d_FREQ, OUTPUT)
    annotation (Line(points={{-65,-20},{-54,-20},{-54,-24},{-42,-24}},
                                                   color={0,0,127}));
  connect(load.p, B3.p)
    annotation (Line(points={{108,60},{108,70},{60,70}}, color={0,0,255}));
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
    experiment(StopTime=50000, __Dymola_Algorithm="Dassl"));
end NetworkHard2;
