within OpenIPSL.Examples.MPC;
model NetworkHard
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
  OpenIPSL.Examples.MPC.GenerationUnits.PSSE.G1 G1(
    v_0=0.998855,
    angle_0=0.15699114448641,
    P_0=40000000,
    Q_0=4547321,
    V_b=24000)
    annotation (Placement(transformation(extent={{-112,60},{-92,80}})));
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
  OpenIPSL.Examples.MPC.GenerationUnits.PSSE.G2_for_PID G2(
    v_0=1.0074,
    angle_0=0.0093371449790267,
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
    v_0=0.992681,
    angle_0=-0.0049879590159821,
    P_0=50000000,
    Q_0=10000000) annotation (Placement(transformation(extent={{-12,18},{0,30}})));
  Electrical.Events.Breaker breaker(enableTrigger=false)
                                           annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={80,22})));

  Modelica.Blocks.Interfaces.RealInput INPUT1(start=0)
    "Connector of Real input signal 2" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-160,-40})));
  Modelica.Blocks.Interfaces.RealInput INPUT2(start=0)
    "Connector of Real input signal 2" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-160,-100})));
  Modelica.Blocks.Math.Add AddU1
    annotation (Placement(transformation(extent={{-52,-60},{-32,-40}})));
  Modelica.Blocks.Math.Add AddU2
    annotation (Placement(transformation(extent={{2,-104},{22,-84}})));
  Modelica.Blocks.Sources.Constant in_u1(k=0.1)
    annotation (Placement(transformation(extent={{-110,-76},{-90,-56}})));
  Modelica.Blocks.Sources.Constant in_u2(k=1.23005)
    annotation (Placement(transformation(extent={{-40,-98},{-20,-78}})));
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
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-22,-60},{-2,-40}})));
  Electrical.Machines.PSSE.GENCLS          IB(
    V_b=220000,
    v_0=1,
    angle_0=0,
    P_0=10067010,
    Q_0=12058260,
    M_b=100000000,
    X_d=0.2) annotation (Placement(transformation(extent={{112,60},{102,80}})));
  Modelica.Blocks.Continuous.Integrator integrator(k=1)
    annotation (Placement(transformation(extent={{6,-44},{16,-34}})));
  Modelica.Blocks.Math.Gain gain(k=2)
    annotation (Placement(transformation(extent={{8,-64},{16,-56}})));
  Modelica.Blocks.Math.Add AddU3
    annotation (Placement(transformation(extent={{22,-54},{30,-46}})));
  Modelica.Blocks.Math.Feedback feedback2
    annotation (Placement(transformation(extent={{32,-104},{52,-84}})));
  Modelica.Blocks.Continuous.Integrator integrator1(k=1)
    annotation (Placement(transformation(extent={{60,-88},{70,-78}})));
  Modelica.Blocks.Math.Gain gain1(k=2)
    annotation (Placement(transformation(extent={{62,-108},{70,-100}})));
  Modelica.Blocks.Math.Add AddU4
    annotation (Placement(transformation(extent={{76,-98},{84,-90}})));
  Electrical.Sensors.SoftPMU softPMU(v_0=0.997342, angle_0=-0.00014475935348966)
    annotation (Placement(transformation(extent={{26,0},{46,20}})));
equation


  connect(T1.p, B1.p)
    annotation (Line(points={{-53.4,70},{-40,70}},        color={0,0,255}));
  connect(BG1.p, T1.n)
    annotation (Line(points={{-80,70},{-66.6,70}},
                                                 color={0,0,255}));
  connect(G1.conn, BG1.p)
    annotation (Line(points={{-91,70},{-80,70}},          color={0,0,255}));
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
  connect(G2.conn, B5.p)
    annotation (Line(points={{60,-29},{60,-20}}, color={0,0,255}));
  connect(LD1.p, B2.p)
    annotation (Line(points={{-6,30},{-6,70},{0,70}},color={0,0,255}));
  connect(L3.p, B3.p) annotation (Line(points={{80,45.4},{80,70},{60,70}},
                             color={0,0,255}));
  connect(breaker.s, B4.p)
    annotation (Line(points={{80,18},{80,10}},   color={0,0,255}));
  connect(breaker.r, L3.n)
    annotation (Line(points={{80,26},{80,34.6}},color={0,0,255}));
  connect(T2.n, B5.p)
    annotation (Line(points={{60,-12.6},{60,-20}}, color={0,0,255}));
  connect(INPUT1, AddU1.u1) annotation (Line(points={{-160,-40},{-64,-40},{-64,-44},
          {-54,-44}}, color={0,0,127}));
  connect(in_u1.y, AddU1.u2)
    annotation (Line(points={{-89,-66},{-62,-66},{-62,-56},{-54,-56}},
                                                   color={0,0,127}));
  connect(in_u2.y, AddU2.u1)
    annotation (Line(points={{-19,-88},{0,-88}}, color={0,0,127}));
  connect(INPUT2, AddU2.u2) annotation (Line(points={{-160,-100},{-68,-100},{-68,
          -110},{0,-110},{0,-100}}, color={0,0,127}));
  connect(AddU1.y, feedback.u1)
    annotation (Line(points={{-31,-50},{-20,-50}}, color={0,0,127}));
  connect(G2.PELEC1, feedback.u2) annotation (Line(points={{49,-31},{34,-31},{
          34,-70},{-12,-70},{-12,-58}}, color={0,0,127}));
  connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,-8},{
          80,-8},{80,10}},      color={0,0,255}));
  connect(IB.p, B3.p)
    annotation (Line(points={{102,70},{60,70}}, color={0,0,255}));
  connect(gain.u, feedback.y)
    annotation (Line(points={{7.2,-60},{-3,-60},{-3,-50}}, color={0,0,127}));
  connect(integrator.u, feedback.y)
    annotation (Line(points={{5,-39},{-3,-39},{-3,-50}}, color={0,0,127}));
  connect(integrator.y, AddU3.u1) annotation (Line(points={{16.5,-39},{21.2,-39},
          {21.2,-47.6}}, color={0,0,127}));
  connect(gain.y, AddU3.u2) annotation (Line(points={{16.4,-60},{21.2,-60},{
          21.2,-52.4}}, color={0,0,127}));
  connect(AddU3.y, G2.Padd) annotation (Line(points={{30.4,-50},{30.4,-52},{52,
          -52}}, color={0,0,127}));
  connect(gain1.u, feedback2.y) annotation (Line(points={{61.2,-104},{58,-104},
          {58,-94},{51,-94}}, color={0,0,127}));
  connect(integrator1.u, feedback2.y) annotation (Line(points={{59,-83},{59,-88},
          {51,-88},{51,-94}}, color={0,0,127}));
  connect(integrator1.y, AddU4.u1) annotation (Line(points={{70.5,-83},{70.5,
          -86},{75.2,-86},{75.2,-91.6}}, color={0,0,127}));
  connect(gain1.y, AddU4.u2) annotation (Line(points={{70.4,-104},{72,-104},{72,
          -96.4},{75.2,-96.4}}, color={0,0,127}));
  connect(AddU2.y, feedback2.u1)
    annotation (Line(points={{23,-94},{34,-94}}, color={0,0,127}));
  connect(G2.ETERM1, feedback2.u2) annotation (Line(points={{71,-31},{96,-31},{
          96,-112},{42,-112},{42,-102}}, color={0,0,127}));
  connect(G2.EfdAdd, AddU4.y) annotation (Line(points={{68,-52},{68,-66},{90,
          -66},{90,-94},{84.4,-94}}, color={0,0,127}));
  connect(softPMU.n, B4.p)
    annotation (Line(points={{43,10},{80,10}}, color={0,0,255}));
  connect(T2.p, softPMU.p) annotation (Line(points={{60,0.6},{40,0.6},{40,0},{
          20,0},{20,10},{29,10}}, color={0,0,255}));
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
end NetworkHard;
