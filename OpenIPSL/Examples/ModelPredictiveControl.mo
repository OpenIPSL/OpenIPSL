within OpenIPSL.Examples;
package ModelPredictiveControl
  "Package containing system examples for Model Predictive Control Studies"
  extends Modelica.Icons.ExamplesPackage;
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
    OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.PSSE.G1 G1(
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
    OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.PSSE.G2_for_PID G2(
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
    OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.PSSE.G1 G1(
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
    OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.PSSE.G2_1INPUT_Pref
      G2(
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

  model NetworkHard_no_inputs
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
    OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.PSSE.G1 G1(
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
    OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.G2_no_controls3 G2(
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
    Electrical.Events.Breaker breaker        annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=90,
          origin={80,22})));
    OpenCPS.Controls.FREQ_CALC fREQ_CALC(
      T_w=0.2,
      T_f=0.2,
      fi_0=0) annotation (Placement(transformation(extent={{-92,-4},{-72,16}})));
    Modelica.Blocks.Sources.RealExpression realExpression(y=B4.angle)
      annotation (Placement(transformation(extent={{-122,-4},{-102,16}})));
    Modelica.Blocks.Math.Add Frequency
      annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
    Modelica.Blocks.Sources.Constant const(k=SysData.fn)
      annotation (Placement(transformation(extent={{-120,-30},{-100,-10}})));
    Modelica.Blocks.Interfaces.RealOutput frequency
      annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
    Electrical.Loads.PSSE.Load_variation load_variation(
      d_P=0.1,
      t1=0.5,
      d_t=2,
      V_b=220000,
      P_0=10000000,
      Q_0=10000000,
      v_0=0.9893408,
      angle_0=-0.00960250483)
      annotation (Placement(transformation(extent={{90,-40},{110,-20}})));
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
    connect(IB.p, B3.p) annotation (Line(points={{100,70},{60,70}},
                          color={0,0,255}));
    connect(breaker.s, B4.p)
      annotation (Line(points={{80,18},{80,10}},   color={0,0,255}));
    connect(breaker.r, L3.n)
      annotation (Line(points={{80,26},{80,34.6}},color={0,0,255}));
    connect(T2.n, B5.p)
      annotation (Line(points={{60,-12.6},{60,-20}}, color={0,0,255}));
    connect(realExpression.y, fREQ_CALC.ANGLE)
      annotation (Line(points={{-101,6},{-91,6}},    color={0,0,127}));
    connect(fREQ_CALC.d_FREQ, Frequency.u1)
      annotation (Line(points={{-71,10},{-66,10},{-66,6},{-62,6}},
                                                     color={0,0,127}));
    connect(const.y, Frequency.u2)
      annotation (Line(points={{-99,-20},{-62,-20},{-62,-6}},  color={0,0,127}));
    connect(Frequency.y, frequency) annotation (Line(points={{-39,0},{-10,0}},
                             color={0,0,127}));
    connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,-6},{
            68,-6},{68,6},{80,6},{80,10}}, color={0,0,255}));
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
  end NetworkHard_no_inputs;

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
    OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.PSSE.G1 G1(
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
    OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.G2_no_controls3 G2(
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

  model NetworkHard2_noInfiniteBus
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
    OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.PSSE.G1 G1(
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
    OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.G2_no_controls3 G2(
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
          origin={80,24})));
    OpenCPS.Controls.FREQ_CALC fREQ_CALC(
      T_w=2,
      T_f=1,
      fi_0=-0.00014475935348966)
              annotation (Placement(transformation(extent={{-86,-30},{-66,-10}})));
    Modelica.Blocks.Sources.RealExpression realExpression(y=B4.angle)
      annotation (Placement(transformation(extent={{-116,-30},{-96,-10}})));
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
    Electrical.Loads.PSSE.Load load(
      V_b=220000,
      v_0=0.998705,
      angle_0=9.4873305611609e-06,
      P_0=-10067010,
      Q_0=-12058260)
      annotation (Placement(transformation(extent={{100,48},{120,68}})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_FreqCalcFirstOrderY
      annotation (Placement(transformation(extent={{200,-100},{220,-80}})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_IntegratorY
      "Connector of Real output signal"
      annotation (Placement(transformation(extent={{200,-120},{220,-100}})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_FreqCalcDerivativeX
      "Connector of Real output signal"
      annotation (Placement(transformation(extent={{200,-80},{220,-60}})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_G2SexsSimpleLagState
      annotation (Placement(transformation(extent={{200,-60},{220,-40}})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_G2SexsSimpleLagLimState
      annotation (Placement(transformation(extent={{200,-40},{220,-20}})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_G2GenPSIppq
      annotation (Placement(transformation(extent={{200,-20},{220,0}})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_G2GenPSIkd
      annotation (Placement(transformation(extent={{200,0},{220,20}})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_G2GenDelta
      annotation (Placement(transformation(extent={{200,40},{220,60}})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_G2GenW
      annotation (Placement(transformation(extent={{200,60},{220,80}})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1HygovIntegratorY
      annotation (Placement(transformation(extent={{200,80},{220,100}})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1HygovGState
      annotation (Placement(transformation(extent={{200,100},{220,120}})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1HygovQY
      annotation (Placement(transformation(extent={{200,120},{220,140}})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1HygovSimpleLag1State
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={210,150})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1SexsSimpleLagState annotation (
       Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={210,170})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1SexsSimpleLagLimState
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={210,190})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1GenPSIppq annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={210,210})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1GenPSIkd annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={210,230})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_G2GenEpq annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={210,30})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1GenEpq annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={210,250})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1GenDelta annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={210,270})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_G1GenW annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={210,290})));
    Modelica.Blocks.Continuous.Integrator integrator(y_start=0.1)
      annotation (Placement(transformation(extent={{2,-46},{22,-26}})));
    Modelica.Blocks.Math.Feedback feedback
      annotation (Placement(transformation(extent={{-32,-46},{-12,-26}})));
  equation

    OUTPUT_FreqCalcDerivativeX = fREQ_CALC.derivative.x;
    OUTPUT_FreqCalcFirstOrderY = fREQ_CALC.derivative.y;
    OUTPUT_IntegratorY = integrator.y;
    OUTPUT_G2SexsSimpleLagState = G2.sEXS.simpleLag.state;
    OUTPUT_G2SexsSimpleLagLimState = G2.sEXS.simpleLagLim.state;
    OUTPUT_G2GenPSIppq = G2.gen.PSIppq;
    OUTPUT_G2GenPSIkd = G2.gen.PSIkd;
    OUTPUT_G2GenEpq = G2.gen.Epq;
    OUTPUT_G2GenDelta = G2.gen.delta;
    OUTPUT_G2GenW = G2.gen.w;
    OUTPUT_G1HygovIntegratorY = G1.hYGOV.integrator.y;
    OUTPUT_G1HygovGState = G1.hYGOV.g.state;
    OUTPUT_G1HygovQY = G1.hYGOV.q.y;
    OUTPUT_G1HygovSimpleLag1State = G1.hYGOV.SimpleLag1.state;
    OUTPUT_G1SexsSimpleLagState = G1.sEXS.simpleLag.state;
    OUTPUT_G1SexsSimpleLagLimState = G1.sEXS.simpleLagLim.state;
    OUTPUT_G1GenPSIppq = G1.gen.PSIppq;
    OUTPUT_G1GenPSIkd = G1.gen.PSIkd;
    OUTPUT_G1GenEpq = G1.gen.Epq;
    OUTPUT_G1GenDelta = G1.gen.delta;
    OUTPUT_G1GenW = G1.gen.w;

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
      annotation (Line(points={{-95,-20},{-85,-20}}, color={0,0,127}));
    connect(INPUT, AddU1.u1)
      annotation (Line(points={{-160,-78},{-54,-78}}, color={0,0,127}));
    connect(in_u1.y, AddU1.u2)
      annotation (Line(points={{-89,-100},{-62,-100},{-62,-90},{-54,-90}},
                                                     color={0,0,127}));
    connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,6},{80,
            6},{80,10}},                color={0,0,255}));
    connect(load.p, B3.p)
      annotation (Line(points={{110,68},{110,70},{60,70}}, color={0,0,255}));
    connect(feedback.y, integrator.u)
      annotation (Line(points={{-13,-36},{0,-36}}, color={0,0,127}));
    connect(G2.PELEC1, feedback.u2) annotation (Line(points={{49,-31},{40,-31},{40,
            -60},{-22,-60},{-22,-44}}, color={0,0,127}));
    connect(integrator.y, G2.Padd) annotation (Line(points={{23,-36},{26,-36},{26,
            -74},{58.8,-74},{58.8,-52}}, color={0,0,127}));
    connect(feedback.u1, AddU1.y) annotation (Line(points={{-30,-36},{-44,-36},{-44,
            -64},{-16,-64},{-16,-84},{-31,-84}}, color={0,0,127}));
    annotation ( Diagram(coordinateSystem(preserveAspectRatio=false,
            extent={{-140,-120},{200,300}})),
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
      experiment(StopTime=50, __Dymola_Algorithm="Dassl"),
      Icon(coordinateSystem(extent={{-140,-120},{200,300}})));
  end NetworkHard2_noInfiniteBus;

  model NetworkHard2_noInfiniteBus_1output
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
    OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.PSSE.G1 G1(
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
    OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.G2_no_controls3 G2(
      v_0=1.0074,
      angle_0=0.0093371449790267,
      V_b=24000,
      P_0=10010220,
      Q_0=10204330) annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
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
              annotation (Placement(transformation(extent={{-86,-30},{-66,-10}})));
    Modelica.Blocks.Sources.RealExpression realExpression(y=B4.angle)
      annotation (Placement(transformation(extent={{-116,-30},{-96,-10}})));
    Modelica.Blocks.Math.Add AddU1
      annotation (Placement(transformation(extent={{-52,-84},{-32,-64}})));
    Modelica.Blocks.Sources.Constant in_u1(k=0.1)
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
    Electrical.Loads.PSSE.Load load(
      V_b=220000,
      v_0=0.998705,
      angle_0=9.4873305611609e-06,
      P_0=-10067010,
      Q_0=-12058260)
      annotation (Placement(transformation(extent={{100,48},{120,68}})));
    Modelica.Blocks.Continuous.Integrator integrator(y_start=0.1)
      annotation (Placement(transformation(extent={{16,-84},{36,-64}})));
    Modelica.Blocks.Math.Feedback feedback
      annotation (Placement(transformation(extent={{-20,-84},{0,-64}})));
    Modelica.Blocks.Interfaces.RealInput INPUT(start = 0)
      "Connector of Real input signal 2" annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={-160,-78})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT_Dfrequency
      annotation (Placement(transformation(extent={{-56,-26},{-36,-6}})));
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
      annotation (Line(points={{-95,-20},{-85,-20}}, color={0,0,127}));
    connect(INPUT, AddU1.u1)
      annotation (Line(points={{-160,-78},{-108,-78},{-108,-68},{-54,-68}},
                                                      color={0,0,127}));
    connect(in_u1.y, AddU1.u2)
      annotation (Line(points={{-89,-100},{-62,-100},{-62,-80},{-54,-80}},
                                                     color={0,0,127}));
    connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,6},{80,
            6},{80,10}},                color={0,0,255}));
    connect(load.p, B3.p)
      annotation (Line(points={{110,68},{110,70},{60,70}}, color={0,0,255}));
    connect(feedback.y, integrator.u)
      annotation (Line(points={{-1,-74},{14,-74}}, color={0,0,127}));
    connect(G2.PELEC1, feedback.u2) annotation (Line(points={{71,-31},{80,-31},{80,
            -94},{-10,-94},{-10,-82}}, color={0,0,127}));
    connect(integrator.y, G2.Padd) annotation (Line(points={{37,-74},{61.2,-74},{61.2,
            -52}},                       color={0,0,127}));
    connect(feedback.u1, AddU1.y) annotation (Line(points={{-18,-74},{-31,-74}},
                                                 color={0,0,127}));
    connect(fREQ_CALC.d_FREQ, OUTPUT_Dfrequency)
      annotation (Line(points={{-65,-16},{-46,-16}}, color={0,0,127}));
    annotation ( Diagram(coordinateSystem(preserveAspectRatio=false,
            extent={{-140,-120},{200,300}})),
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
      experiment(StopTime=50, __Dymola_Algorithm="Dassl"),
      Icon(coordinateSystem(extent={{-140,-120},{200,300}})));
  end NetworkHard2_noInfiniteBus_1output;

  package GenerationUnits "Package containing generators for MPC studies"
    model GASTMPC_THERMAL "GAST - Gas Turbine-Governor"
      extends Icons.VerifiedModel;
      extends Electrical.Controls.PSSE.TG.BaseClasses.BaseGovernor;
      parameter Types.PerUnit R=0.05 "Speed droop gain";
      parameter Types.Time T_1=0.4 "Valve response time constant";
      parameter Types.Time T_2=0.1 "Turbine response time constant";
      parameter Types.Time T_3=3.0 "Load limit response time constant";
      parameter Types.PerUnit AT=0.9 "Ambient temperature load limit";
      parameter Types.PerUnit K_T=2.0 "Load-limited feedback path adjustment gain";
      parameter Types.PerUnit V_MAX=0.1 "Operational control high limit on fuel valve opening";
      parameter Types.PerUnit V_MIN=0.025 "Low output control limit on fuel valve opening";
      parameter Types.PerUnit D_turb=0.0 "Turbine damping";
      Modelica.Blocks.Math.Add add(k1=-1)
        annotation (Placement(transformation(extent={{-80,16},{-60,-4}})));
      Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={40,-50})));
      Modelica.Blocks.Math.Add add2(k2=+1) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-20,-56})));
      Modelica.Blocks.Math.Add add3(k1=-1)
        annotation (Placement(transformation(extent={{120,-10},{140,10}})));
      Modelica.Blocks.Math.Gain gDturb(k=D_turb)
        annotation (Placement(transformation(extent={{-40,29},{-20,50}})));
      Modelica.Blocks.Math.Gain gKt(k=K_T) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={10,-50})));
      Modelica.Blocks.Math.Gain g1_R(k=1/R) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            origin={-110,0})));
      NonElectrical.Logical.LV_GATE lV_Gate
        annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
      Modelica.Blocks.Sources.Constant const(k=AT)
        annotation (Placement(transformation(extent={{90,-80},{70,-60}})));
      NonElectrical.Continuous.SimpleLag    simpleLagLim(
        K=1,
        T=T_1,
        y_start=pm0) annotation (Placement(transformation(extent={{0,-10},{20,10}})));
      Modelica.Blocks.Interfaces.RealInput PMECHControllable annotation (Placement(
            transformation(extent={{-260,110},{-220,150}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-120})));
      Modelica.Blocks.Math.Add add4(k1=+1)
        annotation (Placement(transformation(extent={{-180,120},{-160,100}})));
      Modelica.Blocks.Interfaces.RealOutput TF2_out
        "Connector of Real output signal" annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={68,-210}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={90,110})));
      Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_MAX, uMin=V_MIN)
        annotation (Placement(transformation(extent={{32,-10},{52,10}})));
      NonElectrical.Continuous.SimpleLag simpleLag(
        K=1,
        T=T_2,
        y_start=pm0)
        annotation (Placement(transformation(extent={{70,-10},{90,10}})));
      NonElectrical.Continuous.SimpleLag simpleLag1(
        K=1,
        T=T_3,
        y_start=pm0)
        annotation (Placement(transformation(extent={{100,-42},{80,-22}})));
    protected
      parameter Types.PerUnit pm0(fixed=false);
    initial algorithm
      pm0 := PMECH0;
    equation
      connect(gDturb.y, add3.u1) annotation (Line(
          points={{-19,39.5},{100,39.5},{100,6},{118,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(g1_R.y, add.u1) annotation (Line(
          points={{-99,0},{-82,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add1.y, gKt.u) annotation (Line(
          points={{29,-50},{22,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(gKt.y, add2.u2) annotation (Line(
          points={{-1,-50},{-8,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y,lV_Gate.u1) annotation (Line(
          points={{-59,6},{-42,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(lV_Gate.u2, add2.y) annotation (Line(
          points={{-42,-6},{-48,-6},{-48,-56},{-31,-56}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(const.y, add2.u1) annotation (Line(points={{69,-70},{0,-70},{0,-62},{-8,-62}},
                          color={0,0,127}));
      connect(simpleLagLim.u,lV_Gate.y) annotation (Line(points={{-2,0},{-19,0}},
                                     color={0,0,127}));
      connect(add3.y, PMECH)
        annotation (Line(points={{141,0},{250,0}}, color={0,0,127}));
      connect(SPEED, g1_R.u) annotation (Line(points={{-240,-120},{-152,-120},{-152,0},{-122,0}},
                                color={0,0,127}));
      connect(gDturb.u, g1_R.u) annotation (Line(points={{-42,39.5},{-152,39.5},{-152,0},{-122,0}},
                           color={0,0,127}));
      connect(add1.u1, const.y) annotation (Line(points={{52,-56},{60,-56},{60,-70},{69,-70}}, color={0,0,127}));
      connect(add4.u2, PMECHControllable) annotation (Line(points={{-182,116},{-214,
              116},{-214,130},{-240,130}}, color={0,0,127}));
      connect(PMECH0, add4.u1) annotation (Line(points={{-240,80},{-190,80},{-190,
              104},{-182,104}}, color={0,0,127}));
      connect(add4.y, add.u2) annotation (Line(points={{-159,110},{-88,110},{-88,12},
              {-82,12}}, color={0,0,127}));
      connect(simpleLagLim.y, limiter.u)
        annotation (Line(points={{21,0},{30,0}}, color={0,0,127}));
      connect(simpleLag.y, add3.u2) annotation (Line(points={{91,0},{108,0},{108,-6},
              {118,-6}}, color={0,0,127}));
      connect(limiter.y, simpleLag.u)
        annotation (Line(points={{53,0},{68,0}}, color={0,0,127}));
      connect(simpleLag1.u, add3.u2) annotation (Line(points={{102,-32},{108,-32},{
              108,-6},{118,-6}}, color={0,0,127}));
      connect(simpleLag1.y, add1.u2) annotation (Line(points={{79,-32},{60,-32},{60,
              -44},{52,-44}}, color={0,0,127}));
      connect(TF2_out, add1.u2) annotation (Line(points={{68,-210},{68,-124},{134,
              -124},{134,-42},{68,-42},{68,-32},{60,-32},{60,-44},{52,-44}}, color=
              {0,0,127}));
      annotation (
        Diagram(coordinateSystem(
            extent={{-240,-200},{240,180}},
            preserveAspectRatio=false,
            grid={2,2})),
        Icon(coordinateSystem(
            extent={{-100,-100},{100,100}},
            preserveAspectRatio=false,
            grid={2,2}),
            graphics={Text(
              extent={{-100,160},{100,100}},
              lineColor={28,108,200},
              textString="GAST")}),
        Documentation(info="<html>Gas Turbine-Governor Model.</html>",
      revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Manual</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-09</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>ALSETLab, Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
    end GASTMPC_THERMAL;

    model GASTMPCforthreeentradas "GAST - Gas Turbine-Governor"
      extends Icons.VerifiedModel;
      extends Electrical.Controls.PSSE.TG.BaseClasses.BaseGovernor;
      parameter Types.PerUnit R=0.05 "Speed droop gain";
      parameter Types.Time T_1=0.4 "Valve response time constant";
      parameter Types.Time T_2=0.1 "Turbine response time constant";
      parameter Types.Time T_3=3.0 "Load limit response time constant";
      parameter Types.PerUnit AT=0.9 "Ambient temperature load limit";
      parameter Types.PerUnit K_T=2.0 "Load-limited feedback path adjustment gain";
      parameter Types.PerUnit V_MAX=1.0 "Operational control high limit on fuel valve opening";
      parameter Types.PerUnit V_MIN=-0.05 "Low output control limit on fuel valve opening";
      parameter Types.PerUnit D_turb=0.0 "Turbine damping";
      Modelica.Blocks.Math.Add add(k1=-1)
        annotation (Placement(transformation(extent={{-80,16},{-60,-4}})));
      Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={40,-50})));
      Modelica.Blocks.Math.Add add2(k2=+1) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-20,-56})));
      Modelica.Blocks.Math.Add add3(k1=-1)
        annotation (Placement(transformation(extent={{120,-10},{140,10}})));
      Modelica.Blocks.Math.Gain gDturb(k=D_turb)
        annotation (Placement(transformation(extent={{-40,29},{-20,50}})));
      Modelica.Blocks.Math.Gain gKt(k=K_T) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={10,-50})));
      Modelica.Blocks.Math.Gain g1_R(k=1/R) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            origin={-110,0})));
      NonElectrical.Logical.LV_GATE lV_Gate
        annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
      Modelica.Blocks.Continuous.TransferFunction transferFunction1(a={T_2,1},
        initType=Modelica.Blocks.Types.Init.InitialOutput,
        y_start=pm0)
        annotation (Placement(transformation(extent={{64,-10},{84,10}})));
      Modelica.Blocks.Continuous.TransferFunction transferFunction2(a={T_3,1},
        initType=Modelica.Blocks.Types.Init.InitialOutput,
        y_start=pm0)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={80,-30})));
      Modelica.Blocks.Sources.Constant const(k=AT)
        annotation (Placement(transformation(extent={{90,-80},{70,-60}})));
      NonElectrical.Continuous.SimpleLag    simpleLagLim(
        K=1,
        T=T_1,
        y_start=pm0) annotation (Placement(transformation(extent={{0,-10},{20,10}})));
      Modelica.Blocks.Interfaces.RealInput PMECHControllable1 annotation (Placement(
            transformation(extent={{-260,110},{-220,150}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-60,-120})));
      Modelica.Blocks.Math.Add3 add3_1(
                                    k1=+1)
        annotation (Placement(transformation(extent={{-180,120},{-160,100}})));
      Modelica.Blocks.Interfaces.RealOutput TF2_out
        "Connector of Real output signal" annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={68,-210}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={90,110})));
      Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_MAX, uMin=V_MIN)
        annotation (Placement(transformation(extent={{32,-10},{52,10}})));
      Modelica.Blocks.Interfaces.RealInput PMECHControllable2
        "Connector of Real input signal 3" annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-240,160}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={60,-120})));
    protected
      parameter Types.PerUnit pm0(fixed=false);
    initial algorithm
      pm0 := PMECH0;
    equation
      connect(gDturb.y, add3.u1) annotation (Line(
          points={{-19,39.5},{100,39.5},{100,6},{118,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(g1_R.y, add.u1) annotation (Line(
          points={{-99,0},{-82,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add1.y, gKt.u) annotation (Line(
          points={{29,-50},{22,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(gKt.y, add2.u2) annotation (Line(
          points={{-1,-50},{-8,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(transferFunction2.y, add1.u2) annotation (Line(
          points={{69,-30},{60,-30},{60,-44},{52,-44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(transferFunction1.y, add3.u2) annotation (Line(
          points={{85,0},{100,0},{100,-6},{118,-6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(transferFunction1.y, transferFunction2.u) annotation (Line(
          points={{85,0},{100,0},{100,-30},{92,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y,lV_Gate.u1) annotation (Line(
          points={{-59,6},{-42,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(lV_Gate.u2, add2.y) annotation (Line(
          points={{-42,-6},{-48,-6},{-48,-56},{-31,-56}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(const.y, add2.u1) annotation (Line(points={{69,-70},{0,-70},{0,-62},{-8,-62}},
                          color={0,0,127}));
      connect(simpleLagLim.u,lV_Gate.y) annotation (Line(points={{-2,0},{-19,0}},
                                     color={0,0,127}));
      connect(add3.y, PMECH)
        annotation (Line(points={{141,0},{250,0}}, color={0,0,127}));
      connect(SPEED, g1_R.u) annotation (Line(points={{-240,-120},{-152,-120},{-152,0},{-122,0}},
                                color={0,0,127}));
      connect(gDturb.u, g1_R.u) annotation (Line(points={{-42,39.5},{-152,39.5},{-152,0},{-122,0}},
                           color={0,0,127}));
      connect(add1.u1, const.y) annotation (Line(points={{52,-56},{60,-56},{60,-70},{69,-70}}, color={0,0,127}));
      connect(add3_1.u2, PMECHControllable1) annotation (Line(points={{-182,110},{
              -214,110},{-214,130},{-240,130}}, color={0,0,127}));
      connect(PMECH0, add3_1.u1) annotation (Line(points={{-240,80},{-190,80},{-190,
              102},{-182,102}}, color={0,0,127}));
      connect(add3_1.y, add.u2) annotation (Line(points={{-159,110},{-88,110},{-88,
              12},{-82,12}}, color={0,0,127}));
      connect(transferFunction2.y, TF2_out) annotation (Line(points={{69,-30},{60,
              -30},{60,-54},{96,-54},{96,-194},{68,-194},{68,-210}}, color={0,0,127}));
      connect(simpleLagLim.y, limiter.u)
        annotation (Line(points={{21,0},{30,0}}, color={0,0,127}));
      connect(limiter.y, transferFunction1.u)
        annotation (Line(points={{53,0},{62,0}}, color={0,0,127}));
      connect(add3_1.u3, PMECHControllable2) annotation (Line(points={{-182,118},{
              -210,118},{-210,160},{-240,160}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(
            extent={{-240,-200},{240,180}},
            preserveAspectRatio=false,
            grid={2,2})),
        Icon(coordinateSystem(
            extent={{-100,-100},{100,100}},
            preserveAspectRatio=false,
            grid={2,2}),
            graphics={Text(
              extent={{-100,160},{100,100}},
              lineColor={28,108,200},
              textString="GAST")}),
        Documentation(info="<html>Gas Turbine-Governor Model.</html>",
      revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Manual</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-09</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>ALSETLab, Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
    end GASTMPCforthreeentradas;

    partial model BaseExciterMPC "Base exciter model for PSSE excitation systems"
      Modelica.Blocks.Interfaces.RealInput VUEL annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-130,-200}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-40,-110})));
      Modelica.Blocks.Interfaces.RealInput VOEL annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-70,-200}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={0,-110})));
      Modelica.Blocks.Interfaces.RealOutput EFD "Excitation Voltage [pu]"
        annotation (Placement(transformation(extent={{200,-10},{220,10}}), iconTransformation(extent={{100,-10},{120,10}})));
      Modelica.Blocks.Interfaces.RealInput EFD0 annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            origin={-200,-130}), iconTransformation(extent={{-10,-10},{10,10}},
              origin={-110,-40})));
      Modelica.Blocks.Interfaces.RealInput VOTHSG annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            origin={-200,90}), iconTransformation(extent={{-10,-10},{10,10}},
              origin={-110,40})));
      Modelica.Blocks.Interfaces.RealInput ECOMP annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            origin={-200,0}), iconTransformation(extent={{-10,-10},{10,10}}, origin={-110,0})));
      Modelica.Blocks.Sources.Constant VoltageReference(k=V_REF)
        annotation (Placement(transformation(extent={{-170,40},{-150,60}})));
      Modelica.Blocks.Math.Add DiffV(k2=-1)
        annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
    protected
      parameter Real Efd0(fixed=false);
      parameter Real V_REF(fixed=false);
      parameter Real ECOMP0(fixed=false);
    public
      Modelica.Blocks.Interfaces.RealInput XADIFD annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={80,-200}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={80,-110})));
      Modelica.Blocks.Math.Add sum
        annotation (Placement(transformation(extent={{-120,40},{-100,60}})));
      Modelica.Blocks.Interfaces.RealInput EFd_input
        "Connector of Real input signal 1" annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,180}), iconTransformation(
            extent={{0,0},{20,20}},
            rotation=0,
            origin={-120,70})));
      Modelica.Blocks.Math.Gain gain annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-130,110})));
    initial equation
      Efd0 = EFD0;
      ECOMP0 = ECOMP;
    equation
      connect(sum.y, DiffV.u1) annotation (Line(points={{-99,50},{-90,50},{-90,26},
              {-130,26},{-130,6},{-122,6}}, color={0,0,127}));
      connect(VoltageReference.y, sum.u2) annotation (Line(points={{-149,50},{-132,
              50},{-132,44},{-122,44}}, color={0,0,127}));
      connect(gain.y, sum.u1)
        annotation (Line(points={{-130,99},{-130,56},{-122,56}}, color={0,0,127}));
      connect(gain.u, EFd_input) annotation (Line(points={{-130,122},{-130,154},{0,
              154},{0,180}}, color={0,0,127}));
      annotation (
        Icon(
            graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={28,108,200},
              fillColor={255,255,255}), Text(
              extent={{-56,-80},{-24,-100}},
              lineColor={28,108,200},
              textString="VUEL"),Text(
              extent={{-14,-80},{14,-100}},
              lineColor={28,108,200},
              textString="VOEL"),Text(
              extent={{-90,10},{-20,-10}},
              lineColor={28,108,200},
              textString="ECOMP"),Text(
              extent={{-90,50},{-20,28}},
              lineColor={28,108,200},
              textString="VOTHSG"),Text(
              extent={{-90,-30},{-40,-52}},
              lineColor={28,108,200},
              textString="EFD0"),Text(
              extent={{50,10},{90,-10}},
              lineColor={28,108,200},
              textString="EFD"), Text(
              extent={{60,-80},{100,-100}},
              lineColor={28,108,200},
              textString="XADIFD")}),
        Diagram(coordinateSystem(extent={{-200,-200},{200,160}})));
    end BaseExciterMPC;

    model GASTMPC "GAST - Gas Turbine-Governor"
      extends Icons.VerifiedModel;
      extends Electrical.Controls.PSSE.TG.BaseClasses.BaseGovernor;
      parameter Types.PerUnit R=0.05 "Speed droop gain";
      parameter Types.Time T_1=0.4 "Valve response time constant";
      parameter Types.Time T_2=0.1 "Turbine response time constant";
      parameter Types.Time T_3=3.0 "Load limit response time constant";
      parameter Types.PerUnit AT=0.9 "Ambient temperature load limit";
      parameter Types.PerUnit K_T=2.0 "Load-limited feedback path adjustment gain";
      parameter Types.PerUnit V_MAX=0.1 "Operational control high limit on fuel valve opening";
      parameter Types.PerUnit V_MIN=0.025 "Low output control limit on fuel valve opening";
      parameter Types.PerUnit D_turb=0.0 "Turbine damping";
      Modelica.Blocks.Math.Add add(k1=-1)
        annotation (Placement(transformation(extent={{-80,16},{-60,-4}})));
      Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={40,-50})));
      Modelica.Blocks.Math.Add add2(k2=+1) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-20,-56})));
      Modelica.Blocks.Math.Add add3(k1=-1)
        annotation (Placement(transformation(extent={{120,-10},{140,10}})));
      Modelica.Blocks.Math.Gain gDturb(k=D_turb)
        annotation (Placement(transformation(extent={{-40,29},{-20,50}})));
      Modelica.Blocks.Math.Gain gKt(k=K_T) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={10,-50})));
      Modelica.Blocks.Math.Gain g1_R(k=1/R) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            origin={-110,0})));
      NonElectrical.Logical.LV_GATE lV_Gate
        annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
      Modelica.Blocks.Sources.Constant const(k=AT)
        annotation (Placement(transformation(extent={{90,-80},{70,-60}})));
      NonElectrical.Continuous.SimpleLag    simpleLagLim(
        K=1,
        T=T_1,
        y_start=pm0) annotation (Placement(transformation(extent={{0,-10},{20,10}})));
      Modelica.Blocks.Interfaces.RealInput PMECHControllable annotation (Placement(
            transformation(extent={{-260,110},{-220,150}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-120})));
      Modelica.Blocks.Math.Add add4(k1=+1)
        annotation (Placement(transformation(extent={{-180,120},{-160,100}})));
      Modelica.Blocks.Interfaces.RealOutput TF2_out
        "Connector of Real output signal" annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={68,-210}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={90,110})));
      Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_MAX, uMin=V_MIN)
        annotation (Placement(transformation(extent={{32,-10},{52,10}})));
      NonElectrical.Continuous.SimpleLag simpleLag(
        K=1,
        T=T_2,
        y_start=pm0)
        annotation (Placement(transformation(extent={{70,-10},{90,10}})));
      NonElectrical.Continuous.SimpleLag simpleLag1(
        K=1,
        T=T_3,
        y_start=pm0)
        annotation (Placement(transformation(extent={{100,-42},{80,-22}})));
    protected
      parameter Types.PerUnit pm0(fixed=false);
    initial algorithm
      pm0 := PMECH0;
    equation
      connect(gDturb.y, add3.u1) annotation (Line(
          points={{-19,39.5},{100,39.5},{100,6},{118,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(g1_R.y, add.u1) annotation (Line(
          points={{-99,0},{-82,0}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add1.y, gKt.u) annotation (Line(
          points={{29,-50},{22,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(gKt.y, add2.u2) annotation (Line(
          points={{-1,-50},{-8,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y,lV_Gate.u1) annotation (Line(
          points={{-59,6},{-42,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(lV_Gate.u2, add2.y) annotation (Line(
          points={{-42,-6},{-48,-6},{-48,-56},{-31,-56}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(const.y, add2.u1) annotation (Line(points={{69,-70},{0,-70},{0,-62},{-8,-62}},
                          color={0,0,127}));
      connect(simpleLagLim.u,lV_Gate.y) annotation (Line(points={{-2,0},{-19,0}},
                                     color={0,0,127}));
      connect(add3.y, PMECH)
        annotation (Line(points={{141,0},{250,0}}, color={0,0,127}));
      connect(SPEED, g1_R.u) annotation (Line(points={{-240,-120},{-152,-120},{-152,0},{-122,0}},
                                color={0,0,127}));
      connect(gDturb.u, g1_R.u) annotation (Line(points={{-42,39.5},{-152,39.5},{-152,0},{-122,0}},
                           color={0,0,127}));
      connect(add1.u1, const.y) annotation (Line(points={{52,-56},{60,-56},{60,-70},{69,-70}}, color={0,0,127}));
      connect(add4.u2, PMECHControllable) annotation (Line(points={{-182,116},{-214,
              116},{-214,130},{-240,130}}, color={0,0,127}));
      connect(PMECH0, add4.u1) annotation (Line(points={{-240,80},{-190,80},{-190,
              104},{-182,104}}, color={0,0,127}));
      connect(add4.y, add.u2) annotation (Line(points={{-159,110},{-88,110},{-88,12},
              {-82,12}}, color={0,0,127}));
      connect(simpleLagLim.y, limiter.u)
        annotation (Line(points={{21,0},{30,0}}, color={0,0,127}));
      connect(simpleLag.y, add3.u2) annotation (Line(points={{91,0},{108,0},{108,-6},
              {118,-6}}, color={0,0,127}));
      connect(limiter.y, simpleLag.u)
        annotation (Line(points={{53,0},{68,0}}, color={0,0,127}));
      connect(simpleLag1.u, add3.u2) annotation (Line(points={{102,-32},{108,-32},{
              108,-6},{118,-6}}, color={0,0,127}));
      connect(simpleLag1.y, add1.u2) annotation (Line(points={{79,-32},{60,-32},{60,
              -44},{52,-44}}, color={0,0,127}));
      connect(TF2_out, add1.u2) annotation (Line(points={{68,-210},{68,-124},{134,
              -124},{134,-42},{68,-42},{68,-32},{60,-32},{60,-44},{52,-44}}, color=
              {0,0,127}));
      annotation (
        Diagram(coordinateSystem(
            extent={{-240,-200},{240,180}},
            preserveAspectRatio=false,
            grid={2,2})),
        Icon(coordinateSystem(
            extent={{-100,-100},{100,100}},
            preserveAspectRatio=false,
            grid={2,2}),
            graphics={Text(
              extent={{-100,160},{100,100}},
              lineColor={28,108,200},
              textString="GAST")}),
        Documentation(info="<html>Gas Turbine-Governor Model.</html>",
      revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Manual</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-09</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>ALSETLab, Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
    end GASTMPC;

    model G2_no_controls3 "Generation unit connected to bus B5"
      outer OpenIPSL.Electrical.SystemBase SysData;
      extends OpenIPSL.Electrical.Essentials.pfComponent;

      OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
                100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
      OpenIPSL.Electrical.Machines.PSSE.GENROE gen(
        M_b=100000000,
        Tpd0=5,
        Tppd0=0.07,
        Tppq0=0.09,
        H=4.28,
        D=0,
        Xd=1.84,
        Xq=1.75,
        Xpd=0.41,
        Xppd=0.2,
        Xl=0.12,
        S10=0.11,
        S12=0.39,
        Xppq=0.2,
        R_a=0,
        V_b=V_b,
        v_0=v_0,
        angle_0=angle_0,
        P_0=P_0,
        Q_0=Q_0,
        Xpq=0.1,
        Tpq0=2)  annotation (Placement(transformation(extent={{38,-20},{78,20}})));
      SEXS4MPC                                                sEXS(
        T_E=0.01)
                annotation (Placement(transformation(extent={{-10,-22},{10,-2}})));
      Modelica.Blocks.Sources.Constant non_active_limits(k=0)
        annotation (Placement(transformation(extent={{80,-80},{60,-60}})));
      Modelica.Blocks.Interfaces.RealInput Padd
        "Turbine mechanical power (machine base)"
        annotation (Placement(transformation(extent={{-140,-8},{-100,32}})));
      Modelica.Blocks.Interfaces.RealOutput PELEC1
                                 "Machine electrical power (machine base)"
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={90,110})));
    equation
      connect(gen.p, conn)
        annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
      connect(sEXS.EFD, gen.EFD)
        annotation (Line(points={{11,-12},{34,-12}}, color={0,0,127}));
      connect(non_active_limits.y, sEXS.VOEL)
        annotation (Line(points={{59,-70},{0,-70},{0,-23}}, color={0,0,127}));
      connect(sEXS.VUEL, sEXS.VOEL) annotation (Line(points={{-4,-23},{-4,-70},{0,
              -70},{0,-23}}, color={0,0,127}));
      connect(sEXS.VOTHSG, sEXS.VOEL) annotation (Line(points={{-11,-8},{-22,-8},{
              -22,-70},{0,-70},{0,-23}}, color={0,0,127}));
      connect(sEXS.XADIFD, gen.XADIFD) annotation (Line(points={{8,-23},{8,-28},{86,
              -28},{86,-18},{80,-18}}, color={0,0,127}));
      connect(sEXS.EFD0, gen.EFD0) annotation (Line(points={{-11,-16},{-14,-16},{
              -14,-32},{90,-32},{90,-10},{80,-10}}, color={0,0,127}));
      connect(sEXS.ECOMP, gen.ETERM) annotation (Line(points={{-11,-12},{-18,-12},{
              -18,-36},{94,-36},{94,-6},{80,-6}}, color={0,0,127}));
      connect(gen.PELEC, PELEC1)
        annotation (Line(points={{80,6},{90,6},{90,110}}, color={0,0,127}));
      connect(Padd, gen.PMECH)
        annotation (Line(points={{-120,12},{34,12}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Ellipse(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),Line(
              points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
              color={0,0,0},
              smooth=Smooth.Bezier),Text(
              extent={{-52,-18},{56,-66}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%name")}),
        Documentation(info="<html>
<p>24kV/100MVA generation unit connected to bus BG1, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENSAL, a salient pole synchronous machine from PSSE.</li>
<li><strong>Exciter</strong>: SEXS, a simplified excitation system from PSSE.</li>
<li><strong>Turbine/Governor</strong>: IEESGO, a standard turbine/governor from PSSE.</li>
</ul>
<p>This generation unit is supposed to be disconnected in all experiments and, then, to be resynchronized to the whole system.</p>
</html>"));
    end G2_no_controls3;

    model HYGOV4MPC "HYGOV - Hydro Turbine-Governor model"
      extends Icons.VerifiedModel;
      extends Electrical.Controls.PSSE.TG.BaseClasses.BaseGovernor;
      parameter Types.PerUnit R=0.05 "Permanent droop gain";
      parameter Types.PerUnit r=0.3 "Temporary droop gain";
      parameter Types.Time T_r=5 "Governor time constant";
      parameter Types.Time T_f=0.05 "Filter time constant";
      parameter Types.Time T_g=0.5 "Servo time constant";
      parameter Types.TimeAging VELM=0.2 "Gate open/close velocity limit";
      parameter Types.PerUnit G_MAX=0.9 "Maximum gate limit";
      parameter Types.PerUnit G_MIN=0 "Minimum gate limit";
      parameter Types.Time T_w=1.25 "Water time constant";
      parameter Types.PerUnit A_t=1.2 "Turbine gain";
      parameter Types.PerUnit D_turb=0.2 "Turbine damping";
      parameter Types.PerUnit q_NL=0.08 "Water flow at no load";
      parameter Types.PerUnit h0(min=0)=1 "Water head initial value > 0";
      Modelica.Blocks.Sources.Constant n_ref(k=nref) annotation (Placement(transformation(extent={{-178,14},{-166,26}})));
      OpenIPSL.NonElectrical.Continuous.SimpleLag SimpleLag1(
        K=1,
        T=T_f,
        y_start=0)
        annotation (Placement(transformation(extent={{-126,0},{-114,12}})));
      Modelica.Blocks.Math.Gain Gain3(k=R)
        annotation (Placement(transformation(extent={{-130,-22},{-142,-10}})));
      Modelica.Blocks.Math.Gain Gain4(k=D_turb)
        annotation (Placement(transformation(extent={{-62,-34},{-50,-22}})));
      Modelica.Blocks.Sources.Constant hs(k=h0)
        annotation (Placement(transformation(extent={{20,-20},{32,-8}})));
      Modelica.Blocks.Continuous.Integrator q(
        y_start=q0,
        initType=Modelica.Blocks.Types.Init.InitialOutput,
        k=1/T_w) annotation (Placement(transformation(extent={{62,-4},{74,8}})));
      Modelica.Blocks.Sources.Constant qNL(k=q_NL) annotation (Placement(transformation(extent={{92,-18},{84,-10}})));
      Modelica.Blocks.Math.Gain Gain6(k=A_t) annotation (Placement(transformation(extent={{132,-2},{144,10}})));
      OpenIPSL.NonElectrical.Continuous.SimpleLag g(
        K=1,
        T=T_g,
        y_start=g0) "servo_motor" annotation (Placement(transformation(extent={{-40,0},{-28,12}})));
      Modelica.Blocks.Nonlinear.Limiter Velocity_Limiter(uMin=-VELM, uMax=VELM) annotation (Placement(transformation(extent={{-86,0},{-74,12}})));
      Types.PerUnit G "Gate opening";
      Types.PerUnit c "Desired gate opening";
      Types.PerUnit Q "Turbine flow";
      Types.PerUnit H "Turbine head";
      Modelica.Blocks.Math.Add add(k2=-1)
        annotation (Placement(transformation(extent={{-144,0},{-132,12}})));
      Modelica.Blocks.Math.Add add1
        annotation (Placement(transformation(extent={{-168,-12},{-156,0}})));
      Modelica.Blocks.Math.Division division
        annotation (Placement(transformation(extent={{0,-4},{12,8}})));
      Modelica.Blocks.Math.Product product
        annotation (Placement(transformation(extent={{20,-4},{32,8}})));
      Modelica.Blocks.Math.Add add2(k1=-1)
        annotation (Placement(transformation(extent={{42,-4},{54,8}})));
      Modelica.Blocks.Math.Add add3(k2=-1)
        annotation (Placement(transformation(extent={{82,-4},{94,8}})));
      Modelica.Blocks.Math.Add add4(k2=-1)
        annotation (Placement(transformation(extent={{152,-6},{164,6}})));
      Modelica.Blocks.Math.Product product1
        annotation (Placement(transformation(extent={{58,-30},{70,-18}})));
      Modelica.Blocks.Math.Product product2
        annotation (Placement(transformation(extent={{108,-2},{120,10}})));
      NonElectrical.Continuous.SimpleLead simpleLead(
        K=r*T_r,
        T=T_r,
        y_start=0)
        annotation (Placement(transformation(extent={{-106,0},{-94,12}})));
      Modelica.Blocks.Continuous.Integrator integrator(k=1, y_start=c0)
        annotation (Placement(transformation(extent={{-68,0},{-56,12}})));
    protected
      parameter Real q0(fixed=false);
      //=Pm0/(A_t*h0)+q_NL "water flow initial value";
      parameter Real g0(fixed=false);
      //=q0/sqrt(h0) "the gate opening initial value";
      parameter Real c0(fixed=false);
      //=g0 "desired gate position";
      parameter Real e0=0 "initial output for the filter";
      parameter Real nref(fixed=false);
      //=R*c0 "speed reference";
      parameter Types.PerUnit P_m0(fixed=false);
    initial algorithm
      P_m0 := PMECH0;
      q0 := P_m0/(A_t*h0) + q_NL;
      g0 := q0/sqrt(h0);
      //
      //
      c0 := g0;
      //c0_calculation(g0,G_MIN,G_MAX);
      nref := R*c0;
      //
    equation
      G = g.y;
      c = g.u;
      Q = q.y;
      H = product.y;
      connect(add.y, SimpleLag1.u) annotation (Line(points={{-131.4,6},{-127.2,6}}, color={0,0,127}));
      connect(n_ref.y, add.u1) annotation (Line(points={{-165.4,20},{-152,20},{-152,9.6},{-145.2,9.6}}, color={0,0,127}));
      connect(add1.y, add.u2) annotation (Line(points={{-155.4,-6},{-150,-6},{-150,2.4},{-145.2,2.4}}, color={0,0,127}));
      connect(Gain3.y, add1.u2) annotation (Line(points={{-142.6,-16},{-178,-16},{-178,-9.6},{-169.2,-9.6}}, color={0,0,127}));
      connect(g.u, Gain3.u) annotation (Line(points={{-41.2,6},{-52,6},{-52,-16},{-128.8,-16}}, color={0,0,127}));
      connect(division.y, product.u1) annotation (Line(points={{12.6,2},{14,2},{14,5.6},{18.8,5.6}}, color={0,0,127}));
      connect(product.u2, product.u1) annotation (Line(points={{18.8,-1.6},{14,-1.6},{14,5.6},{18.8,5.6}}, color={0,0,127}));
      connect(product.y, add2.u1) annotation (Line(points={{32.6,2},{36,2},{36,5.6},{40.8,5.6}}, color={0,0,127}));
      connect(hs.y, add2.u2) annotation (Line(points={{32.6,-14},{36,-14},{36,-1.6},{40.8,-1.6}}, color={0,0,127}));
      connect(add2.y, q.u) annotation (Line(points={{54.6,2},{60.8,2}}, color={0,0,127}));
      connect(q.y, add3.u1) annotation (Line(points={{74.6,2},{76,2},{76,5.6},{80.8,5.6}}, color={0,0,127}));
      connect(qNL.y, add3.u2) annotation (Line(points={{83.6,-14},{76,-14},{76,-1.6},{80.8,-1.6}}, color={0,0,127}));
      connect(Gain4.y, product1.u2) annotation (Line(points={{-49.4,-28},{4,-28},{4,-27.6},{56.8,-27.6}}, color={0,0,127}));
      connect(product1.y, add4.u2) annotation (Line(points={{70.6,-24},{144,-24},{144,-3.6},{150.8,-3.6}}, color={0,0,127}));
      connect(product1.u1, g.y) annotation (Line(points={{56.8,-20.4},{-16,-20.4},{-16,6},{-27.4,6}}, color={0,0,127}));
      connect(division.u2, g.y) annotation (Line(points={{-1.2,-1.6},{-16,-1.6},{-16,6},{-27.4,6}}, color={0,0,127}));
      connect(division.u1, add3.u1) annotation (Line(points={{-1.2,5.6},{-6,5.6},{-6,20},{76,20},{76,5.6},{80.8,5.6}}, color={0,0,127}));
      connect(Gain6.y, add4.u1) annotation (Line(points={{144.6,4},{150.8,4},{150.8,3.6}}, color={0,0,127}));
      connect(product2.y, Gain6.u) annotation (Line(points={{120.6,4},{130.8,4},{130.8,4}}, color={0,0,127}));
      connect(add3.y, product2.u2) annotation (Line(points={{94.6,2},{100,2},{100,0.4},{106.8,0.4}}, color={0,0,127}));
      connect(product2.u1, add2.u1) annotation (Line(points={{106.8,7.6},{100,7.6},{100,16},{36,16},{36,5.6},{40.8,5.6}}, color={0,0,127}));
      connect(simpleLead.y, Velocity_Limiter.u) annotation (Line(points={{-93.4,6},{-87.2,6}}, color={0,0,127}));
      connect(simpleLead.u, SimpleLag1.y) annotation (Line(points={{-107.2,6},{-113.4,6}}, color={0,0,127}));
      connect(add4.y, PMECH)
        annotation (Line(points={{164.6,0},{250,0},{250,0}}, color={0,0,127}));
      connect(SPEED, add1.u1) annotation (Line(points={{-240,-120},{-200,-120},{
              -200,-2.4},{-169.2,-2.4}}, color={0,0,127}));
      connect(Gain4.u, add1.u1) annotation (Line(points={{-63.2,-28},{-200,-28},{
              -200,-2.4},{-169.2,-2.4}}, color={0,0,127}));
      connect(Velocity_Limiter.y, integrator.u)
        annotation (Line(points={{-73.4,6},{-69.2,6}}, color={0,0,127}));
      connect(g.u, integrator.y)
        annotation (Line(points={{-41.2,6},{-55.4,6}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-240,-140},{240,100}}),
                                                                                         graphics={Rectangle(
              extent={{-190,32},{-12,-38}},
              lineColor={255,128,0},
              pattern=LinePattern.Dash,
              lineThickness=1),Text(
              extent={{-126,40},{-82,34}},
              lineColor={255,128,0},
              textStyle={TextStyle.Bold},
              textString="Governor System"),Rectangle(
              extent={{-8,32},{166,-38}},
              lineColor={85,170,255},
              pattern=LinePattern.Dash,
              lineThickness=1),Text(
              extent={{38,42},{98,32}},
              lineColor={85,170,255},
              textStyle={TextStyle.Bold},
              textString="Hydraulic Turbine System")}),
        Icon(graphics={Text(
              extent={{-100,160},{100,100}},
              lineColor={28,108,200},
              textString="HYGOV")}),
        Documentation(info="<html> 
<p> This is a hydro turbine-governor model. </p>
<p> If compared to the original PSSE implementation one will notice that the initial water head value, <code>h0</code>, is declared as a parameter.
This allows the user to modify it, if required, in order to perform adequate studies. 
The user should leave it in its default value (<code>1</code>) if they do not have any information on water head value, or if they do not wish to modify the parameter.</p>
</html>",    revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Manual</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2022-11</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>ALSETLab, Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
    end HYGOV4MPC;

    model IEESGO4MPC "IEESGO - IEEE Standard Model for Turbine-Governor"
      extends Icons.VerifiedModel;
    extends Electrical.Controls.PSSE.TG.BaseClasses.BaseGovernor;
      parameter Types.Time T_1=0.2 "Controller lag";
      parameter Types.Time T_2=0 "Controller lead compensation";
      parameter Types.Time T_3=0.5 "Governor lag";
      parameter Types.Time T_4=0.12 "Delay due to steam inlet volumes associated with steam chest and inlet piping";
      parameter Types.Time T_5=5 "Reheater delay including hot and cold leads";
      parameter Types.Time T_6=0.5 "Delay due to IP-LP turbine, crossover pipes, and LP end hoods";
      parameter Real K_1=20 "Regulation gain [1/pu]";
      parameter Types.PerUnit K_2=0.59 "Intermediate pressure turbine fraction";
      parameter Types.PerUnit K_3=0.43 "Low pressure turbine fraction ";
      parameter Types.PerUnit P_MAX=0.98 "Upper power limit";
      parameter Types.PerUnit P_MIN=0 "Lower power limit";
      OpenIPSL.NonElectrical.Continuous.SimpleLag imSimpleLag(
        K=K_1,
        T=T_1,
        y_start=0) annotation (Placement(transformation(extent={{-180,-130},{-160,-110}})));
      NonElectrical.Continuous.SimpleLag        imLeadLag(
        K=1,
        T=T_3,
        y_start=0) annotation (Placement(transformation(extent={{-140,-130},{-120,-110}})));
      OpenIPSL.NonElectrical.Continuous.SimpleLag imSimpleLag1(
        K=1,
        T=T_4,
        y_start=p0) annotation (Placement(transformation(extent={{20,-10},{40,10}})));
      OpenIPSL.NonElectrical.Continuous.SimpleLag imSimpleLag2(
        K=K_2,
        T=T_5,
        y_start=p0*K_2) annotation (Placement(transformation(extent={{80,-80},{100,-60}})));
      OpenIPSL.NonElectrical.Continuous.SimpleLag imSimpleLag3(
        K=K_3,
        T=T_6,
        y_start=p0*K_2*K_3) annotation (Placement(transformation(extent={{120,-80},{
                140,-60}})));
      Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(transformation(extent={{-60,-10},
                {-40,10}})));
      Modelica.Blocks.Nonlinear.Limiter limiter(uMax=P_MAX, uMin=P_MIN) annotation (Placement(transformation(extent={{-20,-10},
                {0,10}})));
      Modelica.Blocks.Math.Gain gain(k=1 - K_2) annotation (Placement(transformation(extent={{120,-10},
                {140,10}})));
      Modelica.Blocks.Math.Gain gain1(k=1 - K_3) annotation (Placement(transformation(extent={{120,-40},
                {140,-20}})));
      Modelica.Blocks.Math.Add3 add3_1 annotation (Placement(transformation(extent={{160,-18},
                {180,2}})));
    protected
      parameter Types.PerUnit p0(fixed=false);
    initial algorithm
      p0 := PMECH0;

    equation
      connect(imSimpleLag.y, imLeadLag.u) annotation (Line(points={{-159,-120},{-142,
              -120}}, color={0,0,127}));
      connect(imLeadLag.y, add.u2) annotation (Line(points={{-119,-120},{-80,-120},{
              -80,-6},{-62,-6}}, color={0,0,127}));
      connect(add.y, limiter.u) annotation (Line(points={{-39,0},{-22,0}}, color={0,0,127}));
      connect(limiter.y, imSimpleLag1.u) annotation (Line(points={{1,0},{1,0},{18,0}}, color={0,0,127}));
      connect(imSimpleLag2.y, imSimpleLag3.u) annotation (Line(points={{101,-70},{118,
              -70}}, color={0,0,127}));
      connect(gain1.u, imSimpleLag3.u) annotation (Line(points={{118,-30},{110,-30},
              {110,-70},{118,-70}}, color={0,0,127}));
      connect(PMECH0, add.u1) annotation (Line(points={{-240,80},{-80,80},{-80,6},{-62,
              6}}, color={0,0,127}));
      connect(SPEED, imSimpleLag.u) annotation (Line(points={{-240,-120},{-212,-120},
              {-182,-120}}, color={0,0,127}));
      connect(imSimpleLag1.y, gain.u)
        annotation (Line(points={{41,0},{118,0}}, color={0,0,127}));
      connect(imSimpleLag2.u, gain.u) annotation (Line(points={{78,-70},{60,-70},{60,
              0},{118,0}}, color={0,0,127}));
      connect(gain.y, add3_1.u1)
        annotation (Line(points={{141,0},{141,0},{158,0}}, color={0,0,127}));
      connect(gain1.y, add3_1.u2) annotation (Line(points={{141,-30},{148,-30},{148,
              -8},{158,-8}}, color={0,0,127}));
      connect(imSimpleLag3.y, add3_1.u3) annotation (Line(points={{141,-70},{152,-70},
              {152,-16},{158,-16}}, color={0,0,127}));
      connect(add3_1.y, PMECH) annotation (Line(points={{181,-8},{188,-8},{188,0},{250,
              0}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-240,-200},{240,160}})),
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
             graphics={Text(
              extent={{-100,160},{100,100}},
              lineColor={28,108,200},
              textString="IEESGO")}),
        Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Manual</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-09</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>ALSETLab, Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
    end IEESGO4MPC;

    partial model baseMachine4MPC "Base machine for PSSE models"
      import Complex;
      import Modelica.ComplexMath.arg;
      import Modelica.ComplexMath.real;
      import Modelica.ComplexMath.imag;
      import Modelica.ComplexMath.conj;
      import Modelica.Blocks.Interfaces.*;
      extends OpenIPSL.Electrical.Essentials.pfComponent(
        final enabledisplayPF=false,
        final enablefn=false,
        final enableV_b=false,
        final enableangle_0=true,
        final enablev_0=true,
        final enableQ_0=true,
        final enableP_0=true,
        final enableS_b=true);
      //Machine parameters
      parameter Types.ApparentPower M_b "Machine base power"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.Time Tpd0 "d-axis transient open-circuit time constant"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.Time Tppd0 "d-axis sub-transient open-circuit time constant"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.Time Tppq0 "q-axis sub-transient open-circuit time constant"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.Time H "Inertia constant"
        annotation (Dialog(group="Machine parameters"));
      parameter Real D "Speed damping"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit Xd "d-axis reactance"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit Xq "q-axis reactance"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit Xpd "d-axis transient reactance"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit Xppd "d-axis sub-transient reactance"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit Xppq "q-axis sub-transient reactance"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit Xl "leakage reactance"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit S10 "Saturation factor at 1.0 pu"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit S12 "Saturation factor at 1.2 pu"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit R_a=0 "Armature resistance"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit w0(min=-1+C.eps)=0 "Initial speed deviation from nominal"
        annotation (Dialog(group="Initialization"));
      OpenIPSL.Interfaces.PwPin p(
        vr(start=vr0),
        vi(start=vi0),
        ir(start=ir0),
        ii(start=ii0))
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      RealOutput SPEED "Machine speed deviation from nominal [pu]"
        annotation (Placement(transformation(extent={{100,60},{120,80}})));
      RealInput PMECH "Turbine mechanical power (machine base)"
        annotation (Placement(transformation(extent={{-140,40},{-100,80}}), iconTransformation(extent={{-140,40},{-100,80}})));
      RealOutput PMECH0 "Initial value of machine electrical power (machine base)"
        annotation (Placement(transformation(extent={{100,40},{120,60}})));
      RealOutput ETERM(start=v_0) "Machine terminal voltage [pu]"
        annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
      RealInput EFD "Generator main field voltage [pu]"
        annotation (Placement(transformation(extent={{-140,-80},{-100,-40}}), iconTransformation(extent={{-140,-80},{-100,-40}})));
      RealOutput EFD0 "Initial generator main field voltage [pu]"
        annotation (Placement(transformation(extent={{100,-60},{120,-40}})));
      RealOutput PELEC(start=p0) "Machine electrical power (machine base)"
        annotation (Placement(transformation(extent={{100,20},{120,40}})));
      RealOutput ISORCE "Machine source current [pu]"
        annotation (Placement(transformation(extent={{100,-80},{120,-60}})));
          RealOutput ANGLE "Machine relative rotor angle"
        annotation (Placement(transformation(extent={{100,80},{120,100}})));
      RealOutput XADIFD "Machine field current [pu]" annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            origin={110,-90}), iconTransformation(
            extent={{-10,-10},{10,10}},
            origin={110,-90})));
      Types.PerUnit w(start=w0, fixed=true) "Machine speed deviation";
      Types.Angle delta "Rotor angle";
      Types.PerUnit Vt(start=v_0) "Bus voltage magnitude";
      Types.Angle anglev(start=angle_0) "Bus voltage angle";
      Types.PerUnit I(start=sqrt(ir0^2 + ii0^2)) "Terminal current magnitude";
      Types.Angle anglei(start=atan2(ii0, ir0)) "Terminal current angle";
      Types.PerUnit P(start=P_0/S_b) "Active power (system base)";
      Types.PerUnit Q(start=Q_0/S_b) "Reactive power (system base)";
      Types.PerUnit Te "Electrical torque [pu]";
      Types.PerUnit id "d-axis armature current [pu]";
      Types.PerUnit iq "q-axis armature current [pu]";
      Types.PerUnit ud "d-axis terminal voltage [pu]";
      Types.PerUnit uq "q-axis terminal voltage [pu]";
    protected
      parameter Types.AngularVelocity w_b=2*C.pi*fn "System base speed";
      parameter Real CoB=M_b/S_b;
      parameter Types.PerUnit vr0=v_0*cos(angle_0)
        "Real component of initial terminal voltage";
      parameter Types.PerUnit vi0=v_0*sin(angle_0)
        "Imaginary component of initial terminal voltage";
      parameter Types.PerUnit ir0=-CoB*(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2)
        "Real component of initial armature current (system base)";
      parameter Types.PerUnit ii0=-CoB*(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2)
        "Imaginary component of initial armature current (system base)";
      parameter Types.PerUnit p0=P_0/M_b "Initial active power generation (machine base)";
      parameter Types.PerUnit q0=Q_0/M_b
        "Initial reactive power generation (machine base)";
    equation
      //Interfacing outputs with the internal variables
      ANGLE = delta;
      SPEED = w;
      ETERM = Vt;
      PELEC = P/CoB;
      [p.ir; p.ii] = -CoB*[sin(delta), cos(delta); -cos(delta), sin(delta)]*[id; iq];
      [p.vr; p.vi] = [sin(delta), cos(delta); -cos(delta), sin(delta)]*[ud; uq];
      -P = p.vr*p.ir + p.vi*p.ii;
      -Q = p.vi*p.ir - p.vr*p.ii;
      Vt = sqrt(p.vr^2 + p.vi^2);
      anglev = atan2(p.vi, p.vr);
      I = sqrt(p.ii^2 + p.ir^2);
      anglei = atan2(p.ii, p.ir);
      der(w) = ((PMECH - D*w)/(w + 1) - Te)/(2*H);
      der(delta) = w_b*w;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
              lineColor={0,0,255}),Text(
              extent={{64,75},{92,65}},
              lineColor={0,0,255},
              lineThickness=0.5,
              textString="SPEED"),Text(
              extent={{60,-66},{92,-76}},
              lineColor={0,0,255},
              lineThickness=0.5,
              textString="ISORCE"),Text(
              extent={{64,-25},{92,-35}},
              lineColor={0,0,255},
              textString="ETERM"),Text(
              extent={{64,94},{92,84}},
              lineColor={0,0,255},
              lineThickness=0.5,
              textString="ANGLE"),Text(
              extent={{58,56},{92,46}},
              lineColor={0,0,255},
              lineThickness=0.5,
              textString="PMECH0"),Text(
              extent={{64,34},{92,24}},
              lineColor={0,0,255},
              lineThickness=0.5,
              textString="PELEC"),Text(
              extent={{72,-46},{92,-56}},
              lineColor={0,0,255},
              lineThickness=0.5,
              textString="EFD0"),Text(
              extent={{56,-86},{92,-96}},
              lineColor={0,0,255},
              lineThickness=0.5,
              textString="XADIFD0"),Text(
              extent={{-90,70},{-50,50}},
              lineColor={0,0,255},
              lineThickness=0.5,
              textString="PMECH"), Text(
              extent={{-90,-50},{-60,-70}},
              lineColor={0,0,255},
              lineThickness=0.5,
              textString="EFD")}));
    end baseMachine4MPC;

    model GENROE4MPC
      "ROUND ROTOR GENERATOR MODEL (EXPONENTIAL SATURATION)"
      extends Icons.VerifiedModel;
      //Import of dependencies
      import Complex;
      import Modelica.ComplexMath.arg;
      import Modelica.ComplexMath.real;
      import Modelica.ComplexMath.imag;
      import Modelica.ComplexMath.abs;
      import Modelica.ComplexMath.conj;
      import Modelica.ComplexMath.fromPolar;
      import OpenIPSL.NonElectrical.Functions.SE_exp;
      import Modelica.ComplexMath.j;
      extends Electrical.Machines.PSSE.BaseClasses.baseMachine(
        EFD(start=efd0),
        XADIFD(start=efd0),
        PMECH(start=pm0),
        delta(start=delta0),
        id(start=id0),
        iq(start=iq0),
        ud(start=ud0),
        uq(start=uq0),
        Te(start=pm0));
      //Machine parameters
      parameter Types.PerUnit Xpq "Sub-transient reactance"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.Time Tpq0 "q-axis transient open-circuit time constant"
        annotation (Dialog(group="Machine parameters"));
      parameter Types.PerUnit Xpp=Xppd "Sub-transient reactance"
        annotation (Dialog(group="Machine parameters"));
      Types.PerUnit Epd(start=Epd0) "d-axis voltage behind transient reactance";
      Types.PerUnit Epq(start=Epq0) "q-axis voltage behind transient reactance";
      Types.PerUnit PSIkd(start=PSIkd0) "d-axis rotor flux linkage";
      Types.PerUnit PSIkq(start=PSIkq0) "q-axis rotor flux linkage";
      //State variables
      Types.PerUnit PSId(start=PSId0) "d-axis flux linkage";
      Types.PerUnit PSIq(start=PSIq0) "q-axis flux linkage";
      Types.PerUnit PSIppd(start=PSIppd0) "d-axis subtransient flux linkage";
      Types.PerUnit PSIppq(start=PSIppq0) "q-axis subtransient flux linkage";
      Types.PerUnit PSIpp "Air-gap flux";
      Types.PerUnit XadIfd(start=efd0) "d-axis machine field current";
      Types.PerUnit XaqIlq(start=0) "q-axis Machine field current";
    protected
      parameter Complex Zs=Complex(R_a,Xpp) "Equivalent impedance";
      parameter Complex VT=Complex(v_0*cos(angle_0),v_0*sin(angle_0))
        "Complex terminal voltage";
      parameter Complex S=Complex(p0,q0) "Complex power on machine base";
      parameter Complex It=Complex(real(S/VT),-imag(S/VT))
        "Complex current, machine base";
      parameter Complex Is=Complex(real(It + VT/Zs),imag(It + VT/Zs))
        "Equivalent internal current source";
      parameter Complex PSIpp0=Complex(real(Zs*Is),imag(Zs*Is))
        "Sub-transient flux linkage in stator reference frame";
      parameter Real ang_PSIpp0=arg(PSIpp0) "flux angle";
      parameter Real ang_It=arg(It) "current angle";
      parameter Real ang_PSIpp0andIt=ang_PSIpp0 - ang_It "angle difference";
      parameter Types.PerUnit abs_PSIpp0=abs(PSIpp0)
        "magnitude of sub-transient flux linkage";
      parameter Real dsat=SE_exp(
          abs_PSIpp0,
          S10,
          S12,
          1,
          1.2) "To include saturation of during initialization";
      parameter Real a=abs_PSIpp0 + abs_PSIpp0*dsat*(Xq - Xl)/(Xd - Xl);
      parameter Real b=(It.re^2 + It.im^2)^0.5*(Xpp - Xq);
      //Initializion rotor angle position
      parameter Real delta0=atan(b*cos(ang_PSIpp0andIt)/(b*sin(ang_PSIpp0andIt) - a))
           + ang_PSIpp0 "initial rotor angle in radians";
      parameter Complex DQ_dq=Complex(cos(delta0),-sin(delta0))
        "Parks transformation, from stator to rotor reference frame";
      parameter Complex PSIpp0_dq=Complex(real(PSIpp0*DQ_dq),imag(PSIpp0*DQ_dq))
        "Flux linkage in rotor reference frame";
      parameter Complex I_dq=Complex(real(It*DQ_dq),-imag(It*DQ_dq));
      //"The terminal current in rotor reference frame"
      parameter Types.PerUnit PSIppq0=imag(PSIpp0_dq)
        "q-axis component of the sub-transient flux linkage";
      parameter Types.PerUnit PSIppd0=real(PSIpp0_dq)
        "d-axis component of the sub-transient flux linkage";
      //Initialization of current and voltage components in rotor reference frame (dq-axes).
      parameter Types.PerUnit iq0=real(I_dq) "q-axis component of initial current";
      parameter Types.PerUnit id0=imag(I_dq) "d-axis component of initial current";
      parameter Types.PerUnit ud0=(-(PSIppq0 - Xppq*iq0)) - R_a*id0
        "d-axis component of initial voltage";
      parameter Types.PerUnit uq0=PSIppd0 - Xppd*id0 - R_a*iq0
        "q-axis component of initial voltage";
      //Initialization current and voltage components in synchronous reference frame.
      parameter Types.PerUnit vr0=v_0*cos(angle_0)
        "Real component of initial terminal voltage";
      parameter Types.PerUnit vi0=v_0*sin(angle_0)
        "Imaginary component of initial terminal voltage";
      parameter Types.PerUnit ir0=-CoB*(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2)
        "Real component of initial armature current, systembase";
      parameter Types.PerUnit ii0=-CoB*(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2)
        "Imaginary component of initial armature current, systembase";
      //Initialization mechanical power and field voltage.
      parameter Types.PerUnit pm0=p0 + R_a*iq0*iq0 + R_a*id0*id0
        "Initial mechanical power, machine base";
      parameter Types.PerUnit efd0=dsat*PSIppd0 + PSIppd0 + (Xpd - Xpp)*id0 + (Xd - Xpd)*id0
        "Initial field voltage magnitude";
      parameter Types.PerUnit Epq0=PSIkd0 + (Xpd - Xl)*id0;
      parameter Types.PerUnit Epd0=PSIkq0 - (Xpq - Xl)*iq0;
      //Initialize remaining states:
      parameter Types.PerUnit PSIkd0=(PSIppd0 - (Xpd - Xl)*K3d*id0)/(K3d + K4d)
        "d-axis initial rotor flux linkage";
      parameter Types.PerUnit PSIkq0=((-PSIppq0) + (Xpq - Xl)*K3q*iq0)/(K3q + K4q)
        "q-axis initial rotor flux linkage";
      parameter Types.PerUnit PSId0=PSIppd0 - Xppd*id0;
      parameter Types.PerUnit PSIq0=PSIppq0 - Xppq*iq0;
      // Constants
      parameter Real K1d=(Xpd - Xppd)*(Xd - Xpd)/(Xpd - Xl)^2;
      parameter Real K2d=(Xpd - Xl)*(Xppd - Xl)/(Xpd - Xppd);
      parameter Real K1q=(Xpq - Xppq)*(Xq - Xpq)/(Xpq - Xl)^2;
      parameter Real K2q=(Xpq - Xl)*(Xppq - Xl)/(Xpq - Xppq);
      parameter Real K3d=(Xppd - Xl)/(Xpd - Xl);
      parameter Real K4d=(Xpd - Xppd)/(Xpd - Xl);
      parameter Real K3q=(Xppq - Xl)/(Xpq - Xl);
      parameter Real K4q=(Xpq - Xppq)/(Xpq - Xl);
      parameter Real CoB=M_b/S_b
        "Constant to change from system base to machine base";
    initial equation
      der(Epd) = 0;
      der(Epq) = 0;
      der(PSIkd) = 0;
      der(PSIkq) = 0;
    equation
      //Interfacing outputs with the internal variables
      XADIFD = XadIfd;
      ISORCE = XadIfd;
      EFD0 = efd0;
      PMECH0 = pm0;
      der(Epq) = 1/Tpd0*(EFD - XadIfd);
      der(Epd) = 1/Tpq0*(-1)*XaqIlq;
      der(PSIkd) = 1/Tppd0*(Epq - PSIkd - (Xpd - Xl)*id);
      der(PSIkq) = 1/Tppq0*(Epd - PSIkq + (Xpq - Xl)*iq);
      Te = PSId*iq - PSIq*id;
      PSId = PSIppd - Xppd*id;
      PSIq = (-PSIppq) - Xppq*iq;
      PSIppd = Epq*K3d + PSIkd*K4d;
      -PSIppq = (-Epd*K3q) - PSIkq*K4q;
      PSIpp = sqrt(PSIppd*PSIppd + PSIppq*PSIppq);
      XadIfd = K1d*(Epq - PSIkd - (Xpd - Xl)*id) + Epq + id*(Xd - Xpd) + SE_exp(
        PSIpp,
        S10,
        S12,
        1,
        1.2)*PSIppd;
      XaqIlq = K1q*(Epd - PSIkq + (Xpq - Xl)*iq) + Epd - iq*(Xq - Xpq) - SE_exp(
        PSIpp,
        S10,
        S12,
        1,
        1.2)*(-1)*PSIppq*(Xq - Xl)/(Xd - Xl);
      //change sign for PSIppq 3/3
      ud = (-PSIq) - R_a*id;
      uq = PSId - R_a*iq;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={Text(
              extent={{-54,24},{54,-26}},
              lineColor={0,0,255},
              textString="GENROE")}),
              Documentation(info="<html>Round Rotor Generator Model GENROE. It is the same as GENROU model
          except that an exponential function is used as saturation.</html>",
              revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Manual</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-09</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>ALSETLab, Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
    end GENROE4MPC;

    model SEXSMPC
      "SEXS - Simplified excitation system model (AC4 from [IEEE1981])"
      extends Icons.VerifiedModel;
      extends
        OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.BaseExciterMPC(
          gain(k=1/K));
      parameter Real T_AT_B=0.1 "Ratio between regulator numerator (lead) and denominator (lag) time constants";
      parameter Real T_B=1 "Regulator denominator (lag) time constant";
      parameter Real K=100 "Excitation power source output gain";
      parameter Real T_E=0.1 "Excitation power source output time constant";
      parameter Real E_MIN=-10 "Minimum exciter output";
      parameter Real E_MAX=10 "Maximum exciter output";
      Modelica.Blocks.Math.Add3 V_erro(
        k3=1,
        k1=1,
        k2=1) annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
      NonElectrical.Continuous.SimpleLagLim simpleLagLim(
        K=K,
        T=T_E,
        y_start=Efd0,
        outMax=E_MAX,
        outMin=E_MIN)
        annotation (Placement(transformation(extent={{120,-10},{140,10}})));
      Modelica.Blocks.Math.Add DiffV1 annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-100,-50})));
      NonElectrical.Continuous.LeadLag leadLag(
        K=1,
        T1=T_AT_B*T_B,
        T2=T_B,
        y_start=Efd0/K,
        x_start=Efd0/K)
        annotation (Placement(transformation(extent={{40,-10},{60,10}})));
    initial equation
      V_REF = Efd0/K + ECOMP0;
    equation
      connect(simpleLagLim.y, EFD)
        annotation (Line(points={{141,0},{210,0}}, color={0,0,127}));
      connect(DiffV.y, V_erro.u2)
        annotation (Line(points={{-99,0},{-42,0}}, color={0,0,127}));
      connect(V_erro.u1, VOTHSG) annotation (Line(points={{-42,8},{-52,8},{-52,90},
              {-200,90}}, color={0,0,127}));
      connect(ECOMP, DiffV.u2) annotation (Line(points={{-200,0},{-166,0},{-132,0},
              {-132,-6},{-122,-6}}, color={0,0,127}));
      connect(VUEL, DiffV1.u1) annotation (Line(points={{-130,-200},{-130,-72},{
              -106,-72},{-106,-62}}, color={0,0,127}));
      connect(VOEL, DiffV1.u2) annotation (Line(points={{-70,-200},{-70,-72},{-94,
              -72},{-94,-62}}, color={0,0,127}));
      connect(DiffV1.y, V_erro.u3) annotation (Line(points={{-100,-39},{-100,-16},{
              -42,-16},{-42,-8}}, color={0,0,127}));
      connect(V_erro.y, leadLag.u)
        annotation (Line(points={{-19,0},{38,0}}, color={0,0,127}));
      connect(leadLag.y, simpleLagLim.u)
        annotation (Line(points={{61,0},{118,0}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(extent={{-200,-200},{200,160}})),
        Icon(coordinateSystem(extent={{-100,-100},{100,100}}),
            graphics={Text(
              extent={{-100,160},{100,100}},
              lineColor={28,108,200},
              textString="SEXS")}),
        Documentation(info="<html>Simplified Excitation System Model.</html>",
        revisions = "<html><table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSS/E Manual</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-09</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
    end SEXSMPC;

    package PSSE
      model G1 "Generation unit connected to bus BG1"
        outer OpenIPSL.Electrical.SystemBase SysData;
        extends OpenIPSL.Electrical.Essentials.pfComponent;

        OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
                  100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
        OpenIPSL.Electrical.Machines.PSSE.GENROE gen(
          M_b=100000000,
          Tpd0=5,
          Tppd0=0.07,
          Tppq0=0.09,
          H=4.28,
          D=0,
          Xd=1.84,
          Xq=1.75,
          Xpd=0.41,
          Xppd=0.2,
          Xl=0.12,
          S10=0.11,
          S12=0.39,
          Xppq=0.2,
          R_a=0,
          V_b=V_b,
          v_0=v_0,
          angle_0=angle_0,
          P_0=P_0,
          Q_0=Q_0,
          Xpq=0.1,
          Tpq0=2)  annotation (Placement(transformation(extent={{32,-20},{72,20}})));
        OpenIPSL.Electrical.Controls.PSSE.ES.SEXS SEXS(T_E=0.1)
          annotation (Placement(transformation(extent={{-10,0},{10,20}})));
        OpenIPSL.Electrical.Controls.PSSE.TG.IEESGO IEESGO
          annotation (Placement(transformation(extent={{-6,-52},{14,-32}})));
        Modelica.Blocks.Sources.Constant non_active_inputs(k=0)
          annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
      equation
        connect(gen.p, conn)
          annotation (Line(points={{72,0},{110,0}}, color={0,0,255}));
        connect(SEXS.EFD0, gen.EFD0) annotation (Line(points={{-11,6},{-20,6},{-20,-24},
                {80,-24},{80,-10},{74,-10}}, color={0,0,127}));
        connect(SEXS.ECOMP, gen.ETERM) annotation (Line(points={{-11,10},{-20,10},{-20,
                28},{80,28},{80,-6},{74,-6}}, color={0,0,127}));
        connect(IEESGO.SPEED, gen.SPEED) annotation (Line(points={{-4,-36},{-24,-36},
                {-24,32},{84,32},{84,14},{74,14}}, color={0,0,127}));
        connect(IEESGO.PMECH0, gen.PMECH0) annotation (Line(points={{-4,-48},{-10,-48},
                {-10,-56},{84,-56},{84,10},{74,10}}, color={0,0,127}));
        connect(non_active_inputs.y, SEXS.VOTHSG) annotation (Line(points={{-39,-10},
                {-16,-10},{-16,14},{-11,14}}, color={0,0,127}));
        connect(IEESGO.PMECH, gen.PMECH) annotation (Line(points={{15,-42},{20,-42},{
                20,12},{28,12}}, color={0,0,127}));
        connect(SEXS.EFD, gen.EFD) annotation (Line(points={{11,10},{16,10},{16,-12},
                {28,-12}}, color={0,0,127}));
        connect(gen.XADIFD, SEXS.XADIFD) annotation (Line(points={{74,-18},{78,-18},{
                78,-22},{8,-22},{8,-1}}, color={0,0,127}));
        connect(non_active_inputs.y, SEXS.VUEL)
          annotation (Line(points={{-39,-10},{-4,-10},{-4,-1}}, color={0,0,127}));
        connect(non_active_inputs.y, SEXS.VOEL)
          annotation (Line(points={{-39,-10},{0,-10},{0,-1}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(
                points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
                color={0,0,0},
                smooth=Smooth.Bezier),Text(
                extent={{-52,-18},{56,-66}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(info="<html>
<p>24kV/100MVA generation unit connected to bus BG1, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENSAL, a salient pole synchronous machine from PSSE.</li>
<li><strong>Exciter</strong>: SEXS, a simplified excitation system from PSSE.</li>
<li><strong>Turbine/Governor</strong>: HYGOV, a hydro-turbine governor from PSSE.</li>
</ul>
</html>"));
      end G1;

      model G2_1INPUT_Pref "Generation unit connected to bus B5"
        outer OpenIPSL.Electrical.SystemBase SysData;
        extends OpenIPSL.Electrical.Essentials.pfComponent;

        OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
                  100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
        Electrical.Machines.PSSE.GENSAL          gen(
          M_b=100000000,
          Tpd0=5,
          Tppd0=0.07,
          Tppq0=0.09,
          H=4.28,
          D=0,
          Xd=1.84,
          Xq=1.75,
          Xpd=0.41,
          Xppd=0.2,
          Xl=0.12,
          S10=0.11,
          S12=0.39,
          Xppq=0.2,
          R_a=0,
          V_b=V_b,
          v_0=v_0,
          angle_0=angle_0,
          P_0=P_0,
          Q_0=Q_0) annotation (Placement(transformation(extent={{38,-20},{78,20}})));
        OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
          T_AT_B=0.2,
          K=50,
          E_MIN=0,
          E_MAX=1.26,
          T_E=0.01,
          T_B=10) annotation (Placement(transformation(extent={{-16,-22},{4,-2}})));
        Modelica.Blocks.Sources.Constant non_active_limits(k=0)
          annotation (Placement(transformation(extent={{80,-60},{60,-40}})));
        Modelica.Blocks.Interfaces.RealInput P_ref
          "Connector of Real input signal 2"
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
        Electrical.Controls.PSSE.TG.IEESGO          iEESGO(P_MAX=1.5, P_MIN=0)
          annotation (Placement(transformation(extent={{-20,20},{0,40}})));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(extent={{-72,50},{-52,30}})));
        Modelica.Blocks.Interfaces.RealOutput SPEED1
          "Machine speed deviation from nominal [pu]"
          annotation (Placement(transformation(extent={{100,50},{120,70}})));
      equation
        connect(gen.p, conn)
          annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
        connect(sEXS.EFD, gen.EFD)
          annotation (Line(points={{5,-12},{34,-12}}, color={0,0,127}));
        connect(sEXS.ECOMP, gen.ETERM) annotation (Line(points={{-17,-12},{-32,-12},{
                -32,-72},{92,-72},{92,-6},{80,-6}}, color={0,0,127}));
        connect(gen.EFD0, sEXS.EFD0) annotation (Line(points={{80,-10},{88,-10},{88,
                -68},{-28,-68},{-28,-16},{-17,-16}}, color={0,0,127}));
        connect(non_active_limits.y, sEXS.VOEL)
          annotation (Line(points={{59,-50},{-6,-50},{-6,-23}}, color={0,0,127}));
        connect(sEXS.VUEL, sEXS.VOEL) annotation (Line(points={{-10,-23},{-10,-32},{
                -6,-32},{-6,-23}}, color={0,0,127}));
        connect(gen.XADIFD, sEXS.XADIFD) annotation (Line(points={{80,-18},{84,-18},{
                84,-34},{2,-34},{2,-23}}, color={0,0,127}));
        connect(sEXS.VOTHSG, sEXS.VOEL) annotation (Line(points={{-17,-8},{-22,-8},{
                -22,-32},{-6,-32},{-6,-23}}, color={0,0,127}));
        connect(gen.SPEED, iEESGO.SPEED) annotation (Line(points={{80,14},{86,14},{
                86,54},{-28,54},{-28,36},{-18,36}}, color={0,0,127}));
        connect(iEESGO.PMECH, gen.PMECH) annotation (Line(points={{1,30},{24,30},{
                24,12},{34,12}}, color={0,0,127}));
        connect(add.u1, P_ref) annotation (Line(points={{-74,34},{-94,34},{-94,0},{
                -120,0}}, color={0,0,127}));
        connect(gen.PMECH0, add.u2) annotation (Line(points={{80,10},{90,10},{90,64},
                {-82,64},{-82,46},{-74,46}}, color={0,0,127}));
        connect(add.y, iEESGO.PMECH0) annotation (Line(points={{-51,40},{-40,40},{
                -40,24},{-18,24}}, color={0,0,127}));
        connect(gen.SPEED, SPEED1) annotation (Line(points={{80,14},{86,14},{86,66},
                {96,66},{96,60},{110,60}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(
                points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
                color={0,0,0},
                smooth=Smooth.Bezier),Text(
                extent={{-52,-18},{56,-66}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(info="<html>
<p>24kV/100MVA generation unit connected to bus BG1, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENSAL, a salient pole synchronous machine from PSSE.</li>
<li><strong>Exciter</strong>: SEXS, a simplified excitation system from PSSE.</li>
<li><strong>Turbine/Governor</strong>: IEESGO, a standard turbine/governor from PSSE.</li>
</ul>
<p>This generation unit is supposed to be disconnected in all experiments and, then, to be resynchronized to the whole system.</p>
</html>"));
      end G2_1INPUT_Pref;

      model G2_for_PID "Generation unit connected to bus B5"
        outer OpenIPSL.Electrical.SystemBase SysData;
        extends OpenIPSL.Electrical.Essentials.pfComponent;

        OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
                  100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
        OpenIPSL.Electrical.Machines.PSSE.GENROE gen(
          M_b=100000000,
          Tpd0=5,
          Tppd0=0.07,
          Tppq0=0.09,
          H=4.28,
          D=0,
          Xd=1.84,
          Xq=1.75,
          Xpd=0.41,
          Xppd=0.2,
          Xl=0.12,
          S10=0.11,
          S12=0.39,
          Xppq=0.2,
          R_a=0,
          V_b=V_b,
          v_0=v_0,
          angle_0=angle_0,
          P_0=P_0,
          Q_0=Q_0,
          Xpq=0.41,
          Tpq0=1)  annotation (Placement(transformation(extent={{38,-20},{78,20}})));
        Modelica.Blocks.Interfaces.RealInput Padd "Connector of Real input signal 2"
          annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
        Modelica.Blocks.Interfaces.RealInput EfdAdd
          "Connector of Real input signal 1"
          annotation (Placement(transformation(extent={{-140,-100},{-100,-60}})));
        Modelica.Blocks.Interfaces.RealOutput PELEC1
                                   "Machine electrical power (machine base)"
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={90,110})));
        Modelica.Blocks.Interfaces.RealOutput ETERM1
                                    "Machine terminal voltage [pu]" annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={90,-110})));
      equation
        connect(gen.p, conn)
          annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
        connect(gen.PELEC, PELEC1) annotation (Line(points={{80,6},{92,6},{92,96},{90,
                96},{90,110}}, color={0,0,127}));
        connect(gen.ETERM, ETERM1) annotation (Line(points={{80,-6},{94,-6},{94,-96},
                {90,-96},{90,-110}}, color={0,0,127}));
        connect(Padd, gen.PMECH) annotation (Line(points={{-120,80},{24,80},{24,12},{
                34,12}}, color={0,0,127}));
        connect(EfdAdd, gen.EFD) annotation (Line(points={{-120,-80},{24,-80},{24,-12},
                {34,-12}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(
                points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
                color={0,0,0},
                smooth=Smooth.Bezier),Text(
                extent={{-52,-18},{56,-66}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(info="<html>
<p>24kV/100MVA generation unit connected to bus BG1, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENSAL, a salient pole synchronous machine from PSSE.</li>
<li><strong>Exciter</strong>: SEXS, a simplified excitation system from PSSE.</li>
<li><strong>Turbine/Governor</strong>: IEESGO, a standard turbine/governor from PSSE.</li>
</ul>
<p>This generation unit is supposed to be disconnected in all experiments and, then, to be resynchronized to the whole system.</p>
</html>"));
      end G2_for_PID;

      model G2_no_controls "Generation unit connected to bus B5"
        outer OpenIPSL.Electrical.SystemBase SysData;
        extends OpenIPSL.Electrical.Essentials.pfComponent;

        OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
                  100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
        OpenIPSL.Electrical.Machines.PSSE.GENSAL gen(
          M_b=100000000,
          Tpd0=5,
          Tppd0=0.07,
          Tppq0=0.09,
          H=4.28,
          D=0,
          Xd=1.84,
          Xq=1.75,
          Xpd=0.41,
          Xppd=0.2,
          Xl=0.12,
          S10=0.11,
          S12=0.39,
          Xppq=0.2,
          R_a=0,
          V_b=V_b,
          v_0=v_0,
          angle_0=angle_0,
          P_0=P_0,
          Q_0=Q_0) annotation (Placement(transformation(extent={{38,-20},{78,20}})));
        Modelica.Blocks.Interfaces.RealInput Padd "Connector of Real input signal 2"
          annotation (Placement(transformation(extent={{-140,4},{-100,44}})));
        Modelica.Blocks.Interfaces.RealInput EfdAdd
          "Connector of Real input signal 1"
          annotation (Placement(transformation(extent={{-140,-40},{-100,0}})));
      equation
        connect(gen.p, conn)
          annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
        connect(EfdAdd, gen.EFD) annotation (Line(points={{-120,-20},{24,-20},{24,-12},
                {34,-12}}, color={0,0,127}));
        connect(Padd, gen.PMECH) annotation (Line(points={{-120,24},{24,24},{24,12},{
                34,12}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(
                points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
                color={0,0,0},
                smooth=Smooth.Bezier),Text(
                extent={{-52,-18},{56,-66}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(info="<html>
<p>24kV/100MVA generation unit connected to bus BG1, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENSAL, a salient pole synchronous machine from PSSE.</li>
<li><strong>Exciter</strong>: SEXS, a simplified excitation system from PSSE.</li>
<li><strong>Turbine/Governor</strong>: IEESGO, a standard turbine/governor from PSSE.</li>
</ul>
<p>This generation unit is supposed to be disconnected in all experiments and, then, to be resynchronized to the whole system.</p>
</html>"));
      end G2_no_controls;

      model G2_1INPUT_Pref_NO_TurbGov "Generation unit connected to bus B5"
        outer OpenIPSL.Electrical.SystemBase SysData;
        extends OpenIPSL.Electrical.Essentials.pfComponent;

        OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
                  100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
        Electrical.Machines.PSSE.GENSAL          gen(
          M_b=100000000,
          Tpd0=5,
          Tppd0=0.07,
          Tppq0=0.09,
          H=4.28,
          D=0,
          Xd=1.84,
          Xq=1.75,
          Xpd=0.41,
          Xppd=0.2,
          Xl=0.12,
          S10=0.11,
          S12=0.39,
          Xppq=0.2,
          R_a=0,
          V_b=V_b,
          v_0=v_0,
          angle_0=angle_0,
          P_0=P_0,
          Q_0=Q_0) annotation (Placement(transformation(extent={{38,-20},{78,20}})));
        OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
          T_AT_B=0.2,
          K=50,
          E_MIN=0,
          E_MAX=1.26,
          T_E=0.01,
          T_B=10) annotation (Placement(transformation(extent={{-16,-22},{4,-2}})));
        Modelica.Blocks.Sources.Constant non_active_limits(k=0)
          annotation (Placement(transformation(extent={{80,-60},{60,-40}})));
        Modelica.Blocks.Interfaces.RealInput P_ref
          "Connector of Real input signal 2"
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
        Modelica.Blocks.Interfaces.RealOutput SPEED1
          "Machine speed deviation from nominal [pu]"
          annotation (Placement(transformation(extent={{100,50},{120,70}})));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
      equation
        connect(gen.p, conn)
          annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
        connect(sEXS.EFD, gen.EFD)
          annotation (Line(points={{5,-12},{34,-12}}, color={0,0,127}));
        connect(sEXS.ECOMP, gen.ETERM) annotation (Line(points={{-17,-12},{-32,-12},{
                -32,-72},{92,-72},{92,-6},{80,-6}}, color={0,0,127}));
        connect(gen.EFD0, sEXS.EFD0) annotation (Line(points={{80,-10},{88,-10},{88,
                -68},{-28,-68},{-28,-16},{-17,-16}}, color={0,0,127}));
        connect(non_active_limits.y, sEXS.VOEL)
          annotation (Line(points={{59,-50},{-6,-50},{-6,-23}}, color={0,0,127}));
        connect(sEXS.VUEL, sEXS.VOEL) annotation (Line(points={{-10,-23},{-10,-32},{
                -6,-32},{-6,-23}}, color={0,0,127}));
        connect(gen.XADIFD, sEXS.XADIFD) annotation (Line(points={{80,-18},{84,-18},{
                84,-34},{2,-34},{2,-23}}, color={0,0,127}));
        connect(sEXS.VOTHSG, sEXS.VOEL) annotation (Line(points={{-17,-8},{-22,-8},{
                -22,-32},{-6,-32},{-6,-23}}, color={0,0,127}));
        connect(gen.SPEED, SPEED1) annotation (Line(points={{80,14},{86,14},{86,66},
                {96,66},{96,60},{110,60}}, color={0,0,127}));
        connect(P_ref, add.u2) annotation (Line(points={{-120,0},{-80,0},{-80,24},{
                -62,24}}, color={0,0,127}));
        connect(gen.PMECH0, add.u1) annotation (Line(points={{80,10},{92,10},{92,52},
                {-70,52},{-70,36},{-62,36}}, color={0,0,127}));
        connect(add.y, gen.PMECH) annotation (Line(points={{-39,30},{24,30},{24,12},
                {34,12}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(
                points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
                color={0,0,0},
                smooth=Smooth.Bezier),Text(
                extent={{-52,-18},{56,-66}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(info="<html>
<p>24kV/100MVA generation unit connected to bus BG1, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENSAL, a salient pole synchronous machine from PSSE.</li>
<li><strong>Exciter</strong>: SEXS, a simplified excitation system from PSSE.</li>
<li><strong>Turbine/Governor</strong>: IEESGO, a standard turbine/governor from PSSE.</li>
</ul>
<p>This generation unit is supposed to be disconnected in all experiments and, then, to be resynchronized to the whole system.</p>
</html>"));
      end G2_1INPUT_Pref_NO_TurbGov;

      model G2_2INPUT_Pref_Efdref_NO_TurbGov_NO_Exci
        "Generation unit connected to bus B5"
        outer OpenIPSL.Electrical.SystemBase SysData;
        extends OpenIPSL.Electrical.Essentials.pfComponent;

        OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
                  100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
        Electrical.Machines.PSSE.GENSAL          gen(
          M_b=100000000,
          Tpd0=5,
          Tppd0=0.07,
          Tppq0=0.09,
          H=2,
          D=0,
          Xd=1.84,
          Xq=1.75,
          Xpd=0.41,
          Xppd=0.2,
          Xl=0.12,
          S10=0.11,
          S12=0.39,
          Xppq=0.2,
          R_a=0,
          V_b=V_b,
          v_0=v_0,
          angle_0=angle_0,
          P_0=P_0,
          Q_0=Q_0) annotation (Placement(transformation(extent={{38,-20},{78,20}})));
        Modelica.Blocks.Interfaces.RealInput P_ref
          "Connector of Real input signal 2"
          annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(extent={{-72,56},{-52,36}})));
        Modelica.Blocks.Interfaces.RealInput Efd_ref
          "Connector of Real input signal 2"
          annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));
        Modelica.Blocks.Math.Add add1
          annotation (Placement(transformation(extent={{-72,-36},{-52,-56}})));
      equation
        connect(gen.p, conn)
          annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
        connect(add.u1, P_ref) annotation (Line(points={{-74,40},{-120,40}},
                          color={0,0,127}));
        connect(gen.PMECH0, add.u2) annotation (Line(points={{80,10},{90,10},{90,64},
                {-82,64},{-82,52},{-74,52}}, color={0,0,127}));
        connect(add.y, gen.PMECH) annotation (Line(points={{-51,46},{24,46},{24,12},
                {34,12}}, color={0,0,127}));
        connect(Efd_ref, add1.u2)
          annotation (Line(points={{-120,-40},{-74,-40}}, color={0,0,127}));
        connect(gen.EFD0, add1.u1) annotation (Line(points={{80,-10},{96,-10},{96,
                -70},{-86,-70},{-86,-52},{-74,-52}}, color={0,0,127}));
        connect(add1.y, gen.EFD) annotation (Line(points={{-51,-46},{24,-46},{24,
                -12},{34,-12}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(
                points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
                color={0,0,0},
                smooth=Smooth.Bezier),Text(
                extent={{-52,-18},{56,-66}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(info="<html>
<p>24kV/100MVA generation unit connected to bus BG1, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENSAL, a salient pole synchronous machine from PSSE.</li>
<li><strong>Exciter</strong>: SEXS, a simplified excitation system from PSSE.</li>
<li><strong>Turbine/Governor</strong>: IEESGO, a standard turbine/governor from PSSE.</li>
</ul>
<p>This generation unit is supposed to be disconnected in all experiments and, then, to be resynchronized to the whole system.</p>
</html>"));
      end G2_2INPUT_Pref_Efdref_NO_TurbGov_NO_Exci;

      model G2_1INPUT_Pref_WITH_TurbGov "Generation unit connected to bus B5"
        outer OpenIPSL.Electrical.SystemBase SysData;
        extends OpenIPSL.Electrical.Essentials.pfComponent;

        OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
                  100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
        Electrical.Machines.PSSE.GENSAL          gen(
          M_b=100000000,
          Tpd0=5,
          Tppd0=0.07,
          Tppq0=0.09,
          H=4.28,
          D=0,
          Xd=1.84,
          Xq=1.75,
          Xpd=0.41,
          Xppd=0.2,
          Xl=0.12,
          S10=0.11,
          S12=0.39,
          Xppq=0.2,
          R_a=0,
          V_b=V_b,
          v_0=v_0,
          angle_0=angle_0,
          P_0=P_0,
          Q_0=Q_0) annotation (Placement(transformation(extent={{38,-20},{78,20}})));
        OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
          T_AT_B=0.2,
          K=50,
          E_MIN=0,
          E_MAX=1.26,
          T_E=0.01,
          T_B=10) annotation (Placement(transformation(extent={{-16,-22},{4,-2}})));
        Modelica.Blocks.Sources.Constant non_active_limits(k=0)
          annotation (Placement(transformation(extent={{80,-60},{60,-40}})));
        Modelica.Blocks.Interfaces.RealInput P_ref
          "Connector of Real input signal 2"
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
        Modelica.Blocks.Interfaces.RealOutput SPEED1
          "Machine speed deviation from nominal [pu]"
          annotation (Placement(transformation(extent={{100,50},{120,70}})));
        GASTMPC gASTMPC(T_3=0.01, D_turb=0.1)
          annotation (Placement(transformation(extent={{-18,14},{2,34}})));
        Modelica.Blocks.Interfaces.RealOutput PMECH1
          annotation (Placement(transformation(extent={{100,30},{120,50}})));
        Modelica.Blocks.Interfaces.RealOutput EFD1
                                                  "Excitation Voltage [pu]"
          annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
        Modelica.Blocks.Interfaces.RealOutput ETERM1
                                    "Machine terminal voltage [pu]"
          annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
        Modelica.Blocks.Interfaces.RealOutput PELEC1
                                   "Machine electrical power (machine base)"
          annotation (Placement(transformation(extent={{100,12},{120,32}})));
        Modelica.Blocks.Interfaces.RealOutput TF2_out1
          "Connector of Real output signal"
          annotation (Placement(transformation(extent={{100,76},{120,96}})));
      equation
        connect(gen.p, conn)
          annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
        connect(sEXS.EFD, gen.EFD)
          annotation (Line(points={{5,-12},{34,-12}}, color={0,0,127}));
        connect(sEXS.ECOMP, gen.ETERM) annotation (Line(points={{-17,-12},{-32,-12},{
                -32,-72},{92,-72},{92,-6},{80,-6}}, color={0,0,127}));
        connect(gen.EFD0, sEXS.EFD0) annotation (Line(points={{80,-10},{88,-10},{88,
                -68},{-28,-68},{-28,-16},{-17,-16}}, color={0,0,127}));
        connect(non_active_limits.y, sEXS.VOEL)
          annotation (Line(points={{59,-50},{-6,-50},{-6,-23}}, color={0,0,127}));
        connect(sEXS.VUEL, sEXS.VOEL) annotation (Line(points={{-10,-23},{-10,-32},{
                -6,-32},{-6,-23}}, color={0,0,127}));
        connect(gen.XADIFD, sEXS.XADIFD) annotation (Line(points={{80,-18},{84,-18},{
                84,-34},{2,-34},{2,-23}}, color={0,0,127}));
        connect(sEXS.VOTHSG, sEXS.VOEL) annotation (Line(points={{-17,-8},{-22,-8},{
                -22,-32},{-6,-32},{-6,-23}}, color={0,0,127}));
        connect(gen.SPEED, SPEED1) annotation (Line(points={{80,14},{86,14},{86,66},
                {96,66},{96,60},{110,60}}, color={0,0,127}));
        connect(gASTMPC.SPEED, SPEED1) annotation (Line(points={{-16,30},{-32,30},{
                -32,54},{86,54},{86,66},{96,66},{96,60},{110,60}}, color={0,0,127}));
        connect(gASTMPC.PMECH0, gen.PMECH0) annotation (Line(points={{-16,18},{-28,
                18},{-28,44},{92,44},{92,10},{80,10}}, color={0,0,127}));
        connect(P_ref, gASTMPC.PMECHControllable) annotation (Line(points={{-120,0},
                {-40,0},{-40,8},{-8,8},{-8,12}}, color={0,0,127}));
        connect(gASTMPC.PMECH, gen.PMECH) annotation (Line(points={{3,24},{22,24},{
                22,12},{34,12}}, color={0,0,127}));
        connect(gASTMPC.PMECH, PMECH1) annotation (Line(points={{3,24},{52,24},{52,
                40},{110,40}}, color={0,0,127}));
        connect(sEXS.EFD, EFD1) annotation (Line(points={{5,-12},{26,-12},{26,-36},
                {94,-36},{94,-30},{110,-30}}, color={0,0,127}));
        connect(gen.ETERM, ETERM1) annotation (Line(points={{80,-6},{92,-6},{92,-60},
                {110,-60}}, color={0,0,127}));
        connect(gen.PELEC, PELEC1) annotation (Line(points={{80,6},{94,6},{94,22},{
                110,22}}, color={0,0,127}));
        connect(gASTMPC.TF2_out, TF2_out1) annotation (Line(points={{1,35},{16,35},
                {16,86},{110,86}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(
                points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
                color={0,0,0},
                smooth=Smooth.Bezier),Text(
                extent={{-52,-18},{56,-66}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(info="<html>
<p>24kV/100MVA generation unit connected to bus BG1, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENSAL, a salient pole synchronous machine from PSSE.</li>
<li><strong>Exciter</strong>: SEXS, a simplified excitation system from PSSE.</li>
<li><strong>Turbine/Governor</strong>: IEESGO, a standard turbine/governor from PSSE.</li>
</ul>
<p>This generation unit is supposed to be disconnected in all experiments and, then, to be resynchronized to the whole system.</p>
</html>"));
      end G2_1INPUT_Pref_WITH_TurbGov;

      model G2_2INPUTS "Generation unit connected to bus B5"
        outer OpenIPSL.Electrical.SystemBase SysData;
        extends OpenIPSL.Electrical.Essentials.pfComponent;

        OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
                  100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
        Electrical.Machines.PSSE.GENSAL          gen(
          M_b=100000000,
          Tpd0=5,
          Tppd0=0.07,
          Tppq0=0.09,
          H=4.28,
          D=0,
          Xd=1.84,
          Xq=1.75,
          Xpd=0.41,
          Xppd=0.2,
          Xl=0.12,
          S10=0.11,
          S12=0.39,
          Xppq=0.2,
          R_a=0,
          V_b=V_b,
          v_0=v_0,
          angle_0=angle_0,
          P_0=P_0,
          Q_0=Q_0) annotation (Placement(transformation(extent={{38,-20},{78,20}})));
        SEXSMPC                                   sEXSMPC(
          T_AT_B=0.2,
          K=50,
          E_MIN=0,
          E_MAX=10,
          T_E=0.01,
          T_B=10) annotation (Placement(transformation(extent={{-16,-22},{4,-2}})));
        Modelica.Blocks.Sources.Constant non_active_limits(k=0)
          annotation (Placement(transformation(extent={{80,-60},{60,-40}})));
        Modelica.Blocks.Interfaces.RealInput P_ref
          "Connector of Real input signal 2"
          annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
        Modelica.Blocks.Interfaces.RealOutput SPEED1
          "Machine speed deviation from nominal [pu]"
          annotation (Placement(transformation(extent={{100,50},{120,70}})));
        GASTMPC gASTMPC(T_3=0.01, D_turb=0.1)
          annotation (Placement(transformation(extent={{-18,14},{2,34}})));
        Modelica.Blocks.Interfaces.RealOutput PMECH1
          annotation (Placement(transformation(extent={{100,30},{120,50}})));
        Modelica.Blocks.Interfaces.RealOutput EFD1
                                                  "Excitation Voltage [pu]"
          annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
        Modelica.Blocks.Interfaces.RealOutput ETERM1
                                    "Machine terminal voltage [pu]"
          annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
        Modelica.Blocks.Interfaces.RealOutput PELEC1
                                   "Machine electrical power (machine base)"
          annotation (Placement(transformation(extent={{100,12},{120,32}})));
        Modelica.Blocks.Interfaces.RealOutput TF2_out1
          "Connector of Real output signal"
          annotation (Placement(transformation(extent={{100,76},{120,96}})));
        Modelica.Blocks.Interfaces.RealInput Efd_ref
          "Connector of Real input signal 1"
          annotation (Placement(transformation(extent={{-140,-40},{-100,0}})));
      equation
        connect(gen.p, conn)
          annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
        connect(sEXSMPC.EFD, gen.EFD)
          annotation (Line(points={{5,-12},{34,-12}}, color={0,0,127}));
        connect(sEXSMPC.ECOMP, gen.ETERM) annotation (Line(points={{-17,-12},{-32,-12},
                {-32,-72},{92,-72},{92,-6},{80,-6}}, color={0,0,127}));
        connect(gen.EFD0, sEXSMPC.EFD0) annotation (Line(points={{80,-10},{88,-10},
                {88,-68},{-28,-68},{-28,-16},{-17,-16}}, color={0,0,127}));
        connect(non_active_limits.y, sEXSMPC.VOEL)
          annotation (Line(points={{59,-50},{-6,-50},{-6,-23}}, color={0,0,127}));
        connect(sEXSMPC.VUEL, sEXSMPC.VOEL) annotation (Line(points={{-10,-23},{-10,
                -32},{-6,-32},{-6,-23}}, color={0,0,127}));
        connect(gen.XADIFD, sEXSMPC.XADIFD) annotation (Line(points={{80,-18},{84,-18},
                {84,-34},{2,-34},{2,-23}}, color={0,0,127}));
        connect(sEXSMPC.VOTHSG, sEXSMPC.VOEL) annotation (Line(points={{-17,-8},{-22,
                -8},{-22,-32},{-6,-32},{-6,-23}}, color={0,0,127}));
        connect(gen.SPEED, SPEED1) annotation (Line(points={{80,14},{86,14},{86,66},
                {96,66},{96,60},{110,60}}, color={0,0,127}));
        connect(gASTMPC.SPEED, SPEED1) annotation (Line(points={{-16,30},{-32,30},{
                -32,54},{86,54},{86,66},{96,66},{96,60},{110,60}}, color={0,0,127}));
        connect(gASTMPC.PMECH0, gen.PMECH0) annotation (Line(points={{-16,18},{-28,
                18},{-28,44},{92,44},{92,10},{80,10}}, color={0,0,127}));
        connect(P_ref, gASTMPC.PMECHControllable) annotation (Line(points={{-120,40},
                {-34,40},{-34,8},{-8,8},{-8,12}},color={0,0,127}));
        connect(gASTMPC.PMECH, gen.PMECH) annotation (Line(points={{3,24},{22,24},{
                22,12},{34,12}}, color={0,0,127}));
        connect(gASTMPC.PMECH, PMECH1) annotation (Line(points={{3,24},{52,24},{52,
                40},{110,40}}, color={0,0,127}));
        connect(sEXSMPC.EFD, EFD1) annotation (Line(points={{5,-12},{26,-12},{26,-36},
                {94,-36},{94,-30},{110,-30}}, color={0,0,127}));
        connect(gen.ETERM, ETERM1) annotation (Line(points={{80,-6},{92,-6},{92,-60},
                {110,-60}}, color={0,0,127}));
        connect(gen.PELEC, PELEC1) annotation (Line(points={{80,6},{94,6},{94,22},{
                110,22}}, color={0,0,127}));
        connect(gASTMPC.TF2_out, TF2_out1) annotation (Line(points={{1,35},{16,35},
                {16,86},{110,86}}, color={0,0,127}));
        connect(sEXSMPC.EFd_input, Efd_ref) annotation (Line(points={{-17,-4},{-94,
                -4},{-94,-20},{-120,-20}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(
                points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
                color={0,0,0},
                smooth=Smooth.Bezier),Text(
                extent={{-52,-18},{56,-66}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(info="<html>
<p>24kV/100MVA generation unit connected to bus BG1, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENSAL, a salient pole synchronous machine from PSSE.</li>
<li><strong>Exciter</strong>: SEXS, a simplified excitation system from PSSE.</li>
<li><strong>Turbine/Governor</strong>: IEESGO, a standard turbine/governor from PSSE.</li>
</ul>
<p>This generation unit is supposed to be disconnected in all experiments and, then, to be resynchronized to the whole system.</p>
</html>"));
      end G2_2INPUTS;

      model G2_3INPUTS "Generation unit connected to bus B5"
        outer OpenIPSL.Electrical.SystemBase SysData;
        extends OpenIPSL.Electrical.Essentials.pfComponent;

        OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
                  100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
        Electrical.Machines.PSSE.GENSAL          gen(
          M_b=100000000,
          Tpd0=5,
          Tppd0=0.07,
          Tppq0=0.09,
          H=4.28,
          D=0.1,
          Xd=1.84,
          Xq=1.75,
          Xpd=0.41,
          Xppd=0.2,
          Xl=0.12,
          S10=0.11,
          S12=0.39,
          Xppq=0.2,
          R_a=0,
          V_b=V_b,
          v_0=v_0,
          angle_0=angle_0,
          P_0=P_0,
          Q_0=Q_0) annotation (Placement(transformation(extent={{38,-20},{78,20}})));
        SEXSMPC                                   sEXSMPC(
          T_AT_B=0.2,
          K=50,
          E_MIN=0,
          E_MAX=5,
          T_E=0.01,
          T_B=10) annotation (Placement(transformation(extent={{-16,-22},{4,-2}})));
        Modelica.Blocks.Sources.Constant non_active_limits(k=0)
          annotation (Placement(transformation(extent={{80,-60},{60,-40}})));
        Modelica.Blocks.Interfaces.RealInput P_ref1
          "Connector of Real input signal 2"
          annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
        GASTMPC gASTMPC(T_3=0.01,
          V_MAX=1,                D_turb=0.1)
          annotation (Placement(transformation(extent={{-18,14},{2,34}})));
        Modelica.Blocks.Interfaces.RealInput Efd_ref
          "Connector of Real input signal 1"
          annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
      equation
        connect(gen.p, conn)
          annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
        connect(sEXSMPC.EFD, gen.EFD)
          annotation (Line(points={{5,-12},{34,-12}}, color={0,0,127}));
        connect(sEXSMPC.ECOMP, gen.ETERM) annotation (Line(points={{-17,-12},{-32,-12},
                {-32,-72},{92,-72},{92,-6},{80,-6}}, color={0,0,127}));
        connect(gen.EFD0, sEXSMPC.EFD0) annotation (Line(points={{80,-10},{88,-10},
                {88,-68},{-28,-68},{-28,-16},{-17,-16}}, color={0,0,127}));
        connect(non_active_limits.y, sEXSMPC.VOEL)
          annotation (Line(points={{59,-50},{-6,-50},{-6,-23}}, color={0,0,127}));
        connect(sEXSMPC.VUEL, sEXSMPC.VOEL) annotation (Line(points={{-10,-23},{-10,
                -32},{-6,-32},{-6,-23}}, color={0,0,127}));
        connect(gen.XADIFD, sEXSMPC.XADIFD) annotation (Line(points={{80,-18},{84,-18},
                {84,-34},{2,-34},{2,-23}}, color={0,0,127}));
        connect(sEXSMPC.VOTHSG, sEXSMPC.VOEL) annotation (Line(points={{-17,-8},{-22,
                -8},{-22,-32},{-6,-32},{-6,-23}}, color={0,0,127}));
        connect(gASTMPC.PMECH0, gen.PMECH0) annotation (Line(points={{-16,18},{-28,
                18},{-28,44},{92,44},{92,10},{80,10}}, color={0,0,127}));
        connect(gASTMPC.PMECH, gen.PMECH) annotation (Line(points={{3,24},{22,24},{
                22,12},{34,12}}, color={0,0,127}));
        connect(sEXSMPC.EFd_input, Efd_ref) annotation (Line(points={{-17,-4},{-94,
                -4},{-94,-60},{-120,-60}}, color={0,0,127}));
        connect(P_ref1, gASTMPC.PMECHControllable) annotation (Line(points={{-120,
                60},{-60,60},{-60,8},{-8,8},{-8,12}}, color={0,0,127}));
        connect(gen.SPEED, gASTMPC.SPEED) annotation (Line(points={{80,14},{84,14},
                {84,40},{-24,40},{-24,30},{-16,30}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(
                points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
                color={0,0,0},
                smooth=Smooth.Bezier),Text(
                extent={{-52,-18},{56,-66}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(info="<html>
<p>24kV/100MVA generation unit connected to bus BG1, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENSAL, a salient pole synchronous machine from PSSE.</li>
<li><strong>Exciter</strong>: SEXS, a simplified excitation system from PSSE.</li>
<li><strong>Turbine/Governor</strong>: IEESGO, a standard turbine/governor from PSSE.</li>
</ul>
<p>This generation unit is supposed to be disconnected in all experiments and, then, to be resynchronized to the whole system.</p>
</html>"));
      end G2_3INPUTS;

      model G2_16MVA "Generation unit connected to bus B5"
        outer OpenIPSL.Electrical.SystemBase SysData;
        extends OpenIPSL.Electrical.Essentials.pfComponent;

        OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
                  100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
        Electrical.Machines.PSSE.GENSAL          gen(
          M_b=16667000,
          Tpd0=4.822,
          Tppd0=0.023,
          Tppq0=0.065,
          H=8.75,
          D=2,
          Xd=1.897,
          Xq=1.78,
          Xpd=0.23,
          Xppd=0.156,
          Xl=0.123,
          S10=0.12,
          S12=0.4,
          Xppq=0.156,
          R_a=0,
          V_b=V_b,
          v_0=v_0,
          angle_0=angle_0,
          P_0=P_0,
          Q_0=Q_0) annotation (Placement(transformation(extent={{38,-20},{78,20}})));
        SEXSMPC                                   sEXSMPC(
          T_AT_B=0.2,
          K=50,
          E_MIN=0,
          E_MAX=5,
          T_E=0.01,
          T_B=10) annotation (Placement(transformation(extent={{-16,-22},{4,-2}})));
        Modelica.Blocks.Sources.Constant non_active_limits(k=0)
          annotation (Placement(transformation(extent={{80,-60},{60,-40}})));
        Modelica.Blocks.Interfaces.RealInput P_ref1
          "Connector of Real input signal 2"
          annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
        GASTMPC gASTMPC(V_MAX=1,  D_turb=0.1)
          annotation (Placement(transformation(extent={{-18,14},{2,34}})));
        Modelica.Blocks.Interfaces.RealInput Efd_ref
          "Connector of Real input signal 1"
          annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
      equation
        connect(gen.p, conn)
          annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
        connect(sEXSMPC.EFD, gen.EFD)
          annotation (Line(points={{5,-12},{34,-12}}, color={0,0,127}));
        connect(sEXSMPC.ECOMP, gen.ETERM) annotation (Line(points={{-17,-12},{-32,-12},
                {-32,-72},{92,-72},{92,-6},{80,-6}}, color={0,0,127}));
        connect(gen.EFD0, sEXSMPC.EFD0) annotation (Line(points={{80,-10},{88,-10},
                {88,-68},{-28,-68},{-28,-16},{-17,-16}}, color={0,0,127}));
        connect(non_active_limits.y, sEXSMPC.VOEL)
          annotation (Line(points={{59,-50},{-6,-50},{-6,-23}}, color={0,0,127}));
        connect(sEXSMPC.VUEL, sEXSMPC.VOEL) annotation (Line(points={{-10,-23},{-10,
                -32},{-6,-32},{-6,-23}}, color={0,0,127}));
        connect(gen.XADIFD, sEXSMPC.XADIFD) annotation (Line(points={{80,-18},{84,-18},
                {84,-34},{2,-34},{2,-23}}, color={0,0,127}));
        connect(sEXSMPC.VOTHSG, sEXSMPC.VOEL) annotation (Line(points={{-17,-8},{-22,
                -8},{-22,-32},{-6,-32},{-6,-23}}, color={0,0,127}));
        connect(gASTMPC.PMECH0, gen.PMECH0) annotation (Line(points={{-16,18},{-28,
                18},{-28,44},{92,44},{92,10},{80,10}}, color={0,0,127}));
        connect(gASTMPC.PMECH, gen.PMECH) annotation (Line(points={{3,24},{22,24},{
                22,12},{34,12}}, color={0,0,127}));
        connect(sEXSMPC.EFd_input, Efd_ref) annotation (Line(points={{-17,-4},{-94,
                -4},{-94,-60},{-120,-60}}, color={0,0,127}));
        connect(P_ref1, gASTMPC.PMECHControllable) annotation (Line(points={{-120,
                60},{-60,60},{-60,8},{-8,8},{-8,12}}, color={0,0,127}));
        connect(gen.SPEED, gASTMPC.SPEED) annotation (Line(points={{80,14},{84,14},
                {84,40},{-24,40},{-24,30},{-16,30}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(
                points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
                color={0,0,0},
                smooth=Smooth.Bezier),Text(
                extent={{-52,-18},{56,-66}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(info="<html>
<p>24kV/100MVA generation unit connected to bus BG1, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENSAL, a salient pole synchronous machine from PSSE.</li>
<li><strong>Exciter</strong>: SEXS, a simplified excitation system from PSSE.</li>
<li><strong>Turbine/Governor</strong>: IEESGO, a standard turbine/governor from PSSE.</li>
</ul>
<p>This generation unit is supposed to be disconnected in all experiments and, then, to be resynchronized to the whole system.</p>
</html>"));
      end G2_16MVA;

      model G2_GENROE "Generation unit connected to bus B5"
        outer OpenIPSL.Electrical.SystemBase SysData;
        extends OpenIPSL.Electrical.Essentials.pfComponent;

        OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
                  100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
        Electrical.Machines.PSSE.GENROU          gen(
          M_b=16667000,
          Tpd0=4.822,
          Tppd0=0.023,
          Tppq0=0.065,
          H=8.75,
          D=2,
          Xd=1.897,
          Xq=1.78,
          Xpd=0.23,
          Xppd=0.156,
          Xl=0.123,
          S10=0.12,
          S12=0.4,
          Xppq=0.156,
          R_a=0,
          V_b=V_b,
          v_0=v_0,
          angle_0=angle_0,
          P_0=P_0,
          Q_0=Q_0,
          Xpq=0.23,
          Tpq0=4.822)
                   annotation (Placement(transformation(extent={{38,-20},{78,20}})));
        SEXSMPC                                   sEXSMPC(
          T_AT_B=0.2,
          K=50,
          E_MIN=0,
          E_MAX=5,
          T_E=0.01,
          T_B=10) annotation (Placement(transformation(extent={{-16,-22},{4,-2}})));
        Modelica.Blocks.Sources.Constant non_active_limits(k=0)
          annotation (Placement(transformation(extent={{80,-60},{60,-40}})));
        Modelica.Blocks.Interfaces.RealInput P_ref1
          "Connector of Real input signal 2"
          annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
        GASTMPC gASTMPC(V_MAX=1,  D_turb=0.1)
          annotation (Placement(transformation(extent={{-18,14},{2,34}})));
        Modelica.Blocks.Interfaces.RealInput Efd_ref
          "Connector of Real input signal 1"
          annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
      equation
        connect(gen.p, conn)
          annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
        connect(sEXSMPC.EFD, gen.EFD)
          annotation (Line(points={{5,-12},{34,-12}}, color={0,0,127}));
        connect(sEXSMPC.ECOMP, gen.ETERM) annotation (Line(points={{-17,-12},{-32,-12},
                {-32,-72},{92,-72},{92,-6},{80,-6}}, color={0,0,127}));
        connect(gen.EFD0, sEXSMPC.EFD0) annotation (Line(points={{80,-10},{88,-10},
                {88,-68},{-28,-68},{-28,-16},{-17,-16}}, color={0,0,127}));
        connect(non_active_limits.y, sEXSMPC.VOEL)
          annotation (Line(points={{59,-50},{-6,-50},{-6,-23}}, color={0,0,127}));
        connect(sEXSMPC.VUEL, sEXSMPC.VOEL) annotation (Line(points={{-10,-23},{-10,
                -32},{-6,-32},{-6,-23}}, color={0,0,127}));
        connect(gen.XADIFD, sEXSMPC.XADIFD) annotation (Line(points={{80,-18},{84,-18},
                {84,-34},{2,-34},{2,-23}}, color={0,0,127}));
        connect(sEXSMPC.VOTHSG, sEXSMPC.VOEL) annotation (Line(points={{-17,-8},{-22,
                -8},{-22,-32},{-6,-32},{-6,-23}}, color={0,0,127}));
        connect(gASTMPC.PMECH0, gen.PMECH0) annotation (Line(points={{-16,18},{-28,
                18},{-28,44},{92,44},{92,10},{80,10}}, color={0,0,127}));
        connect(gASTMPC.PMECH, gen.PMECH) annotation (Line(points={{3,24},{22,24},{
                22,12},{34,12}}, color={0,0,127}));
        connect(sEXSMPC.EFd_input, Efd_ref) annotation (Line(points={{-17,-4},{-94,
                -4},{-94,-60},{-120,-60}}, color={0,0,127}));
        connect(P_ref1, gASTMPC.PMECHControllable) annotation (Line(points={{-120,
                60},{-60,60},{-60,8},{-8,8},{-8,12}}, color={0,0,127}));
        connect(gen.SPEED, gASTMPC.SPEED) annotation (Line(points={{80,14},{84,14},
                {84,40},{-24,40},{-24,30},{-16,30}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(
                points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
                color={0,0,0},
                smooth=Smooth.Bezier),Text(
                extent={{-52,-18},{56,-66}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(info="<html>
<p>24kV/100MVA generation unit connected to bus BG1, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENSAL, a salient pole synchronous machine from PSSE.</li>
<li><strong>Exciter</strong>: SEXS, a simplified excitation system from PSSE.</li>
<li><strong>Turbine/Governor</strong>: IEESGO, a standard turbine/governor from PSSE.</li>
</ul>
<p>This generation unit is supposed to be disconnected in all experiments and, then, to be resynchronized to the whole system.</p>
</html>"));
      end G2_GENROE;

      model G2_16MVA_THERMAL "Generation unit connected to bus B5"
        outer OpenIPSL.Electrical.SystemBase SysData;
        extends OpenIPSL.Electrical.Essentials.pfComponent;

        OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
                  100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
        Electrical.Machines.PSSE.GENSAL          gen(
          M_b=16667000,
          Tpd0=4.822,
          Tppd0=0.023,
          Tppq0=0.065,
          H=8.75,
          D=2,
          Xd=1.897,
          Xq=1.78,
          Xpd=0.23,
          Xppd=0.156,
          Xl=0.123,
          S10=0.12,
          S12=0.4,
          Xppq=0.156,
          R_a=0,
          V_b=V_b,
          v_0=v_0,
          angle_0=angle_0,
          P_0=P_0,
          Q_0=Q_0) annotation (Placement(transformation(extent={{38,-20},{78,20}})));
        SEXSMPC                                   sEXSMPC(
          T_AT_B=0.2,
          K=50,
          E_MIN=0,
          E_MAX=5,
          T_E=0.01,
          T_B=10) annotation (Placement(transformation(extent={{-16,-22},{4,-2}})));
        Modelica.Blocks.Sources.Constant non_active_limits(k=0)
          annotation (Placement(transformation(extent={{80,-60},{60,-40}})));
        Modelica.Blocks.Interfaces.RealInput P_ref1
          "Connector of Real input signal 2"
          annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
        GASTMPC gASTMPC(V_MAX=1,  D_turb=0.1)
          annotation (Placement(transformation(extent={{-18,14},{2,34}})));
        Modelica.Blocks.Interfaces.RealInput Efd_ref
          "Connector of Real input signal 1"
          annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
      equation
        connect(gen.p, conn)
          annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
        connect(sEXSMPC.EFD, gen.EFD)
          annotation (Line(points={{5,-12},{34,-12}}, color={0,0,127}));
        connect(sEXSMPC.ECOMP, gen.ETERM) annotation (Line(points={{-17,-12},{-32,-12},
                {-32,-72},{92,-72},{92,-6},{80,-6}}, color={0,0,127}));
        connect(gen.EFD0, sEXSMPC.EFD0) annotation (Line(points={{80,-10},{88,-10},
                {88,-68},{-28,-68},{-28,-16},{-17,-16}}, color={0,0,127}));
        connect(non_active_limits.y, sEXSMPC.VOEL)
          annotation (Line(points={{59,-50},{-6,-50},{-6,-23}}, color={0,0,127}));
        connect(sEXSMPC.VUEL, sEXSMPC.VOEL) annotation (Line(points={{-10,-23},{-10,
                -32},{-6,-32},{-6,-23}}, color={0,0,127}));
        connect(gen.XADIFD, sEXSMPC.XADIFD) annotation (Line(points={{80,-18},{84,-18},
                {84,-34},{2,-34},{2,-23}}, color={0,0,127}));
        connect(sEXSMPC.VOTHSG, sEXSMPC.VOEL) annotation (Line(points={{-17,-8},{-22,
                -8},{-22,-32},{-6,-32},{-6,-23}}, color={0,0,127}));
        connect(gASTMPC.PMECH0, gen.PMECH0) annotation (Line(points={{-16,18},{-28,
                18},{-28,44},{92,44},{92,10},{80,10}}, color={0,0,127}));
        connect(gASTMPC.PMECH, gen.PMECH) annotation (Line(points={{3,24},{22,24},{
                22,12},{34,12}}, color={0,0,127}));
        connect(sEXSMPC.EFd_input, Efd_ref) annotation (Line(points={{-17,-4},{-94,
                -4},{-94,-60},{-120,-60}}, color={0,0,127}));
        connect(P_ref1, gASTMPC.PMECHControllable) annotation (Line(points={{-120,
                60},{-60,60},{-60,8},{-8,8},{-8,12}}, color={0,0,127}));
        connect(gen.SPEED, gASTMPC.SPEED) annotation (Line(points={{80,14},{84,14},
                {84,40},{-24,40},{-24,30},{-16,30}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Ellipse(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(
                points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
                color={0,0,0},
                smooth=Smooth.Bezier),Text(
                extent={{-52,-18},{56,-66}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%name")}),
          Documentation(info="<html>
<p>24kV/100MVA generation unit connected to bus BG1, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENSAL, a salient pole synchronous machine from PSSE.</li>
<li><strong>Exciter</strong>: SEXS, a simplified excitation system from PSSE.</li>
<li><strong>Turbine/Governor</strong>: IEESGO, a standard turbine/governor from PSSE.</li>
</ul>
<p>This generation unit is supposed to be disconnected in all experiments and, then, to be resynchronized to the whole system.</p>
</html>"));
      end G2_16MVA_THERMAL;
    end PSSE;
  end GenerationUnits;

  package PSSE
    extends Modelica.Icons.ExamplesPackage;

    model Reconnection_Microgrid_PSSE_1_INPUT_WITH_INF_BUS
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
      OpenIPSL.Examples.OpenCPS.Generators.G1 G1(
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
            origin={60,-10})));
      OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.PSSE.G2_1INPUT_Pref
        G2(
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
      Electrical.Events.Breaker breaker(enableTrigger=false, t_o=1)
                                               annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=90,
            origin={80,22})));

      Modelica.Blocks.Interfaces.RealInput IN1(start=0)
        "Connector of Real input signal 2" annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-160,0})));
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
      Electrical.Machines.PSSE.GENCLS          IB(
        V_b=220000,
        v_0=1,
        angle_0=0,
        P_0=10067010,
        Q_0=12058260,
        M_b=100000000,
        X_d=0.2) annotation (Placement(transformation(extent={{112,60},{102,80}})));
      Modelica.Blocks.Interfaces.RealOutput OUT2
        annotation (Placement(transformation(extent={{140,50},{160,70}})));
      Modelica.Blocks.Sources.Constant IN11(k=0)
        annotation (Placement(transformation(extent={{-120,-40},{-100,-20}})));
      Modelica.Blocks.Math.Add AddU1
        annotation (Placement(transformation(extent={{-80,-16},{-60,4}})));
      OpenCPS.Controls.FREQ_CALC fREQ_CALC(
        T_w=2,
        T_f=1,
        fi_0=0.0093371449790267)
                annotation (Placement(transformation(extent={{-100,-80},{-80,-60}})));
      Modelica.Blocks.Sources.RealExpression realExpression(y=B5.angle)
        annotation (Placement(transformation(extent={{-130,-80},{-110,-60}})));
      Modelica.Blocks.Interfaces.RealOutput frequency
        annotation (Placement(transformation(extent={{-28,-86},{-8,-66}})));
    equation
      //OUT1 = softPMU.freq;
      OUT2 = B4.v;

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
        annotation (Line(points={{60,-16.6},{60,-20}}, color={0,0,255}));
      connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,0},
              {80,0},{80,10}},      color={0,0,255}));
      connect(IB.p, B3.p)
        annotation (Line(points={{102,70},{60,70}}, color={0,0,255}));
      connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-30},{-90,-30},{-90,
              -12},{-82,-12}},
                          color={0,0,127}));
      connect(IN1, AddU1.u1) annotation (Line(points={{-160,0},{-82,0}},
                         color={0,0,127}));
      connect(AddU1.y, G2.P_ref) annotation (Line(points={{-59,-6},{44,-6},{44,
              -62},{60,-62},{60,-52}},
                                  color={0,0,127}));
      connect(T2.p, B4.p) annotation (Line(points={{60,-3.4},{60,0},{80,0},{80,10}},
                            color={0,0,255}));
      connect(realExpression.y,fREQ_CALC. ANGLE)
        annotation (Line(points={{-109,-70},{-99,-70}},color={0,0,127}));
      connect(frequency, fREQ_CALC.d_FREQ) annotation (Line(points={{-18,-76},{
              -74,-76},{-74,-66},{-79,-66}}, color={0,0,127}));
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
    end Reconnection_Microgrid_PSSE_1_INPUT_WITH_INF_BUS;

    model Reconnection_Microgrid_PSSE_1_INPUT_WITH_INF_BUS2
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
      OpenIPSL.Examples.OpenCPS.Generators.G1 G1(
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
            origin={60,-10})));
      OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.PSSE.G2_1INPUT_Pref
        G2(
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
      Electrical.Events.Breaker breaker(enableTrigger=false, t_o=1)
                                               annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=90,
            origin={80,22})));

      Modelica.Blocks.Interfaces.RealInput IN1(start=0)
        "Connector of Real input signal 2" annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-160,0})));
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
      Electrical.Machines.PSSE.GENCLS          IB(
        V_b=220000,
        v_0=1,
        angle_0=0,
        P_0=10067010,
        Q_0=12058260,
        M_b=100000000,
        H=1000,
        X_d=0.2) annotation (Placement(transformation(extent={{112,60},{102,80}})));
      Modelica.Blocks.Interfaces.RealOutput OUT2
        annotation (Placement(transformation(extent={{140,50},{160,70}})));
      Modelica.Blocks.Sources.Constant IN11(k=0)
        annotation (Placement(transformation(extent={{-120,-40},{-100,-20}})));
      Modelica.Blocks.Math.Add AddU1
        annotation (Placement(transformation(extent={{-80,-16},{-60,4}})));
      Modelica.Blocks.Interfaces.RealOutput OUT1
        "Machine speed deviation from nominal [pu]"
        annotation (Placement(transformation(extent={{140,-90},{160,-70}})));
    equation

      OUT2 = B4.v;

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
        annotation (Line(points={{60,-16.6},{60,-20}}, color={0,0,255}));
      connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,0},{80,
              0},{80,10}},          color={0,0,255}));
      connect(IB.p, B3.p)
        annotation (Line(points={{102,70},{60,70}}, color={0,0,255}));
      connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-30},{-90,-30},{-90,-12},
              {-82,-12}}, color={0,0,127}));
      connect(IN1, AddU1.u1) annotation (Line(points={{-160,0},{-82,0}},
                         color={0,0,127}));
      connect(AddU1.y, G2.P_ref) annotation (Line(points={{-59,-6},{44,-6},{44,-62},
              {60,-62},{60,-52}}, color={0,0,127}));
      connect(T2.p, B4.p) annotation (Line(points={{60,-3.4},{60,0},{80,0},{80,10}},
                            color={0,0,255}));
      connect(G2.SPEED1, OUT1) annotation (Line(points={{54,-29},{54,-30},{42,-30},{
              42,-80},{150,-80}}, color={0,0,127}));
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
    end Reconnection_Microgrid_PSSE_1_INPUT_WITH_INF_BUS2;

    model Reconnection_Microgrid_PSSE_1_INPUT_WITH_CONST_V_SOURCE
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
      OpenIPSL.Examples.OpenCPS.Generators.G1 G1(
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
      OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.PSSE.G2_1INPUT_Pref
        G2(
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
      Electrical.Events.Breaker breaker(enableTrigger=false, t_o=1)
                                               annotation (Placement(transformation(
            extent={{-4,-4},{4,4}},
            rotation=90,
            origin={80,22})));

      Modelica.Blocks.Interfaces.RealInput IN1(start=0)
        "Connector of Real input signal 2" annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-160,0})));
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
      Electrical.Sensors.SoftPMU softPMU(v_0=0.997342, angle_0=-0.00014475935348966)
        annotation (Placement(transformation(extent={{26,0},{46,20}})));
      Modelica.Blocks.Interfaces.RealOutput OUT1
        annotation (Placement(transformation(extent={{140,-70},{160,-50}})));
      Modelica.Blocks.Interfaces.RealOutput OUT2
        annotation (Placement(transformation(extent={{140,50},{160,70}})));
      Electrical.Sources.VoltageSourceReImInput voltageSourceReImInput
        annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=180,
            origin={86,96})));
      Modelica.Blocks.Sources.Constant VR(k=0.998726)
        annotation (Placement(transformation(extent={{130,90},{110,110}})));
      Modelica.Blocks.Sources.Constant VI(k=3.7730e-5)
        annotation (Placement(transformation(extent={{132,56},{112,76}})));
      Modelica.Blocks.Sources.Constant IN11(k=0)
        annotation (Placement(transformation(extent={{-120,-60},{-100,-40}})));
      Modelica.Blocks.Math.Add AddU1
        annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
    equation
      OUT1 = softPMU.freq;
      OUT2 = B4.v;

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
      connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,-8},{
              80,-8},{80,10}},      color={0,0,255}));
      connect(softPMU.n, B4.p)
        annotation (Line(points={{43,10},{80,10}}, color={0,0,255}));
      connect(T2.p, softPMU.p) annotation (Line(points={{60,0.6},{40,0.6},{40,0},{
              20,0},{20,10},{29,10}}, color={0,0,255}));
      connect(VR.y,voltageSourceReImInput. vRe)
        annotation (Line(points={{109,100},{98,100}},  color={0,0,127}));
      connect(VI.y,voltageSourceReImInput. vIm) annotation (Line(points={{111,66},
              {106,66},{106,92},{98,92}},  color={0,0,127}));
      connect(voltageSourceReImInput.p, B3.p)
        annotation (Line(points={{75,96},{60,96},{60,70}}, color={0,0,255}));
      connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-50},{-90,-50},{-90,
              -36},{-82,-36}}, color={0,0,127}));
      connect(IN1, AddU1.u1) annotation (Line(points={{-160,0},{-92,0},{-92,-24},
              {-82,-24}}, color={0,0,127}));
      connect(AddU1.y, G2.P_ref) annotation (Line(points={{-59,-30},{44,-30},{44,
              -62},{60,-62},{60,-52}}, color={0,0,127}));
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
        experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
    end Reconnection_Microgrid_PSSE_1_INPUT_WITH_CONST_V_SOURCE;

    package OBSERVABLE_CONTROLLABLE_STABLE

      model Reconnection_Microgrid_PSSE_1_INPUT_WITH_CONST_V_SOURCE2_NO_TG
        "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
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
        OpenIPSL.Examples.OpenCPS.Generators.G1 G1(
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
        OpenIPSL.Electrical.Buses.Bus B3(v_0=0.998705, angle_0=
              9.4873305611609e-06)
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
        OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.PSSE.G2_1INPUT_Pref_NO_TurbGov
          G2(
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
        Electrical.Events.Breaker breaker(enableTrigger=false, t_o=0.25)
                                                 annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,22})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={-160,0})));
        Electrical.Loads.PSSE.Load_variation load_variation(
          V_b=220000,
          P_0=15000000,
          Q_0=10000000,
          v_0=0.997342,
          angle_0=-0.00014475935348966,
          d_P=0.05,
          t1=5,
          d_t=1)
          annotation (Placement(transformation(extent={{90,-40},{110,-20}})));
        Modelica.Blocks.Interfaces.RealOutput OUT1
          annotation (Placement(transformation(extent={{140,-70},{160,-50}})));
        Electrical.Sources.VoltageSourceReImInput voltageSourceReImInput
          annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=180,
              origin={86,96})));
        Modelica.Blocks.Sources.Constant VR(k=0.998726)
          annotation (Placement(transformation(extent={{130,90},{110,110}})));
        Modelica.Blocks.Sources.Constant VI(k=3.7730e-5)
          annotation (Placement(transformation(extent={{132,56},{112,76}})));
        Modelica.Blocks.Sources.Constant IN11(k=0)
          annotation (Placement(transformation(extent={{-120,-46},{-100,-26}})));
        Modelica.Blocks.Math.Add AddU1
          annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
        Modelica.Blocks.Interfaces.RealOutput OUT2
          annotation (Placement(transformation(extent={{140,-10},{160,10}})));
      equation
        OUT1 = G2.SPEED1;
        OUT2 = B4.v;

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
        connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,2},{80,
                2},{80,10}},          color={0,0,255}));
        connect(VR.y,voltageSourceReImInput. vRe)
          annotation (Line(points={{109,100},{98,100}},  color={0,0,127}));
        connect(VI.y,voltageSourceReImInput. vIm) annotation (Line(points={{111,66},{106,
                66},{106,92},{98,92}},       color={0,0,127}));
        connect(voltageSourceReImInput.p, B3.p)
          annotation (Line(points={{75,96},{60,96},{60,70}}, color={0,0,255}));
        connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-36},{-82,-36}},
                            color={0,0,127}));
        connect(IN1, AddU1.u1) annotation (Line(points={{-160,0},{-92,0},{-92,-24},{-82,
                -24}}, color={0,0,127}));
        connect(T2.p, B4.p) annotation (Line(points={{60,0.6},{60,2},{80,2},{80,10}},
                              color={0,0,255}));
        connect(AddU1.y, G2.P_ref) annotation (Line(points={{-59,-30},{-20,-30},{
                -20,-78},{60,-78},{60,-52}}, color={0,0,127}));
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
</html>"),experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
      end Reconnection_Microgrid_PSSE_1_INPUT_WITH_CONST_V_SOURCE2_NO_TG;

      model Reconnection_Microgrid_PSSE_1_INPUT_WITH_CONST_V_SOURCE2
        "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
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
        OpenIPSL.Examples.OpenCPS.Generators.G1 G1(
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
        OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.PSSE.G2_1INPUT_Pref
          G2(
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
        Electrical.Events.Breaker breaker(enableTrigger=false, t_o=0.1)
                                                 annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,22})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={-160,0})));
        Electrical.Loads.PSSE.Load_variation load_variation(
          V_b=220000,
          P_0=15000000,
          Q_0=15000000,
          v_0=0.997342,
          angle_0=-0.00014475935348966,
          d_P=0.1,
          t1=1000,
          d_t=2000)
          annotation (Placement(transformation(extent={{90,-40},{110,-20}})));
        Modelica.Blocks.Interfaces.RealOutput OUT1
          annotation (Placement(transformation(extent={{140,-70},{160,-50}})));
        Modelica.Blocks.Interfaces.RealOutput OUT2
          annotation (Placement(transformation(extent={{140,50},{160,70}})));
        Electrical.Sources.VoltageSourceReImInput voltageSourceReImInput
          annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=180,
              origin={86,96})));
        Modelica.Blocks.Sources.Constant VR(k=0.998726)
          annotation (Placement(transformation(extent={{130,90},{110,110}})));
        Modelica.Blocks.Sources.Constant VI(k=3.7730e-5)
          annotation (Placement(transformation(extent={{132,56},{112,76}})));
        Modelica.Blocks.Sources.Constant IN11(k=0)
          annotation (Placement(transformation(extent={{-120,-46},{-100,-26}})));
        Modelica.Blocks.Math.Add AddU1
          annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
        OpenCPS.Controls.FREQ_CALC fREQ_CALC(
          T_w=2,
          T_f=1,
          fi_0=0.0093371449790267)
                  annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
        Modelica.Blocks.Sources.RealExpression realExpression(y=B5.angle)
          annotation (Placement(transformation(extent={{-50,-80},{-30,-60}})));
        Modelica.Blocks.Sources.Constant constant_freq(k=SysData.fn)
          annotation (Placement(transformation(extent={{-20,-110},{0,-90}})));
        Modelica.Blocks.Math.Add AddU2
          annotation (Placement(transformation(extent={{20,-94},{40,-74}})));
      equation
        OUT1 = AddU2.y;
        OUT2 = B4.v;

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
        connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,2},
                {80,2},{80,10}}, color={0,0,255}));
        connect(VR.y,voltageSourceReImInput. vRe)
          annotation (Line(points={{109,100},{98,100}},  color={0,0,127}));
        connect(VI.y,voltageSourceReImInput. vIm) annotation (Line(points={{111,66},{106,
                66},{106,92},{98,92}},       color={0,0,127}));
        connect(voltageSourceReImInput.p, B3.p)
          annotation (Line(points={{75,96},{60,96},{60,70}}, color={0,0,255}));
        connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-36},{-82,-36}},
                            color={0,0,127}));
        connect(IN1, AddU1.u1) annotation (Line(points={{-160,0},{-92,0},{-92,-24},{-82,
                -24}}, color={0,0,127}));
        connect(AddU1.y, G2.P_ref) annotation (Line(points={{-59,-30},{44,-30},{44,-62},
                {60,-62},{60,-52}}, color={0,0,127}));
        connect(T2.p, B4.p) annotation (Line(points={{60,0.6},{60,2},{80,2},{80,10}},
                              color={0,0,255}));
        connect(realExpression.y,fREQ_CALC. ANGLE)
          annotation (Line(points={{-29,-70},{-19,-70}}, color={0,0,127}));
        connect(constant_freq.y, AddU2.u2) annotation (Line(points={{1,-100},{10,-100},
                {10,-90},{18,-90}}, color={0,0,127}));
        connect(fREQ_CALC.d_FREQ, AddU2.u1) annotation (Line(points={{1,-66},{10,-66},
                {10,-78},{18,-78}}, color={0,0,127}));
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
</html>"),experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
      end Reconnection_Microgrid_PSSE_1_INPUT_WITH_CONST_V_SOURCE2;

      model Reconnection_Microgrid_PSSE_1_INPUT_WITH_CONST_V_SOURCE2_WITH_TG
        "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
        extends Modelica.Icons.Example;
        OpenIPSL.Electrical.Buses.Bus BG1(v_0=0.998718, angle_0=0.15701226297036)
          annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
        OpenIPSL.Electrical.Buses.Bus B1(v_0=0.99243, angle_0=0.076256751145211)
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
        OpenIPSL.Examples.OpenCPS.Generators.G1 G1(
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
        OpenIPSL.Electrical.Buses.Bus B2(v_0=0.992672, angle_0=-0.0049916242074113)
          annotation (Placement(transformation(extent={{-10,60},{10,80}})));
        OpenIPSL.Electrical.Buses.Bus B3(v_0=0.998726, angle_0=
              3.7778175258193e-05)
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
        OpenIPSL.Electrical.Buses.Bus B4(angle_0=-0.010019446543509, v_0=0.998323)
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
        OpenIPSL.Electrical.Buses.Bus B5(v_0=1.00875, angle_0=-0.00057912293509199)
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
        OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.PSSE.G2_1INPUT_Pref_WITH_TurbGov
          G2(
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
        Electrical.Events.Breaker breaker(enableTrigger=false, t_o=5)
                                                 annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,22})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={-160,0})));
        Electrical.Loads.PSSE.Load_variation load_variation(
          V_b=220000,
          P_0=15000000,
          Q_0=10000000,
          v_0=0.997342,
          angle_0=-0.00014475935348966,
          d_P=0.05,
          t1=10000,
          d_t=1000001)
          annotation (Placement(transformation(extent={{90,-40},{110,-20}})));
        Electrical.Sources.VoltageSourceReImInput voltageSourceReImInput
          annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=180,
              origin={86,96})));
        Modelica.Blocks.Sources.Constant VR(k=0.999211)
          annotation (Placement(transformation(extent={{130,90},{110,110}})));
        Modelica.Blocks.Sources.Constant VI(k=-0.00980921)
          annotation (Placement(transformation(extent={{132,56},{112,76}})));
        Modelica.Blocks.Sources.Constant IN11(k=0)
          annotation (Placement(transformation(extent={{-120,-46},{-100,-26}})));
        Modelica.Blocks.Math.Add AddU1
          annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
        Modelica.Blocks.Interfaces.RealOutput OUT1
          annotation (Placement(transformation(extent={{140,-50},{160,-30}})));
        Modelica.Blocks.Interfaces.RealOutput OUT2
          annotation (Placement(transformation(extent={{140,-10},{160,10}})));
        Modelica.Blocks.Interfaces.RealOutput OUT3
          annotation (Placement(transformation(extent={{140,50},{160,70}})));
        Modelica.Blocks.Interfaces.RealOutput OUT4
          annotation (Placement(transformation(extent={{140,-90},{160,-70}})));
      equation
        OUT1 = G2.SPEED1;
        OUT2 = G2.PMECH1;
        OUT3 = B4.v;
        OUT4 = G2.TF2_out1;

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
        connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,2},{80,
                2},{80,10}},          color={0,0,255}));
        connect(VR.y,voltageSourceReImInput. vRe)
          annotation (Line(points={{109,100},{98,100}},  color={0,0,127}));
        connect(VI.y,voltageSourceReImInput. vIm) annotation (Line(points={{111,66},{106,
                66},{106,92},{98,92}},       color={0,0,127}));
        connect(voltageSourceReImInput.p, B3.p)
          annotation (Line(points={{75,96},{60,96},{60,70}}, color={0,0,255}));
        connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-36},{-82,-36}},
                            color={0,0,127}));
        connect(IN1, AddU1.u1) annotation (Line(points={{-160,0},{-92,0},{-92,-24},{-82,
                -24}}, color={0,0,127}));
        connect(T2.p, B4.p) annotation (Line(points={{60,0.6},{60,2},{80,2},{80,10}},
                              color={0,0,255}));
        connect(AddU1.y, G2.P_ref) annotation (Line(points={{-59,-30},{-20,-30},{
                -20,-78},{60,-78},{60,-52}}, color={0,0,127}));
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
</html>"),experiment(
            StopTime=10,
            Tolerance=1e-09,
            __Dymola_Algorithm="Dassl"));
      end Reconnection_Microgrid_PSSE_1_INPUT_WITH_CONST_V_SOURCE2_WITH_TG;

      model Reconnection_Microgrid_PSSE_1_INPUT_WITH_INF_WITH_TG
        "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
        extends Modelica.Icons.Example;
        OpenIPSL.Electrical.Buses.Bus BG1(v_0=0.997684, angle_0=0.14741399928195)
          annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
        OpenIPSL.Electrical.Buses.Bus B1(v_0=0.991863, angle_0=0.066525318834866)
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
        OpenIPSL.Examples.OpenCPS.Generators.G1 G1(
          v_0=0.997684, angle_0=0.14741399928195,
          P_0=40000000,
          Q_0=4547321,
          V_b=24000)
          annotation (Placement(transformation(extent={{-112,60},{-92,80}})));
        OpenIPSL.Electrical.Branches.PwLine L1(
          R=0.001,
          X=0.2,
          G=0,
          B=0) annotation (Placement(transformation(extent={{-26,66},{-14,74}})));
        OpenIPSL.Electrical.Buses.Bus B2(v_0=0.992584, angle_0=-0.014780076424419)
          annotation (Placement(transformation(extent={{-10,60},{10,80}})));
        OpenIPSL.Electrical.Buses.Bus B3(v_0=0.998758, angle_0=-0.0097534060056274)
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
        OpenIPSL.Electrical.Buses.Bus B4(angle_0=-0.01980931247721, v_0=0.998291)
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
        OpenIPSL.Electrical.Buses.Bus B5(v_0=1.00869, angle_0=-0.01036638309222)
                                         annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={60,-18})));
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
        OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.PSSE.G2_1INPUT_Pref_WITH_TurbGov
          G2(
          v_0=1.00869,
          angle_0=-0.01036638309222,
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
        Electrical.Events.Breaker breaker(enableTrigger=false, t_o=0.25)
                                                 annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,22})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={-160,0})));
        Electrical.Loads.PSSE.Load_variation load_variation(
          V_b=220000,
          P_0=15000000,
          Q_0=10000000,
          v_0=0.997342,
          angle_0=-0.00014475935348966,
          d_P=0.05,
          t1=10000,
          d_t=1000001)
          annotation (Placement(transformation(extent={{90,-40},{110,-20}})));
        Modelica.Blocks.Sources.Constant IN11(k=0)
          annotation (Placement(transformation(extent={{-120,-46},{-100,-26}})));
        Modelica.Blocks.Math.Add AddU1
          annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
        Modelica.Blocks.Interfaces.RealOutput OUT1
          annotation (Placement(transformation(extent={{140,-50},{160,-30}})));
        Modelica.Blocks.Interfaces.RealOutput OUT2
          annotation (Placement(transformation(extent={{140,-10},{160,10}})));
        Modelica.Blocks.Interfaces.RealOutput OUT3
          annotation (Placement(transformation(extent={{140,50},{160,70}})));
        Modelica.Blocks.Interfaces.RealOutput OUT4
          annotation (Placement(transformation(extent={{140,-90},{160,-70}})));
        Electrical.Machines.PSSE.GENCLS          IB(
          V_b=220000,
          v_0=0.998758,
          angle_0=-0.0097534060056274,
          P_0=15042100,
          Q_0=12541100,
          M_b=100000000,
          X_d=0.2) annotation (Placement(transformation(extent={{104,60},{94,80}})));
      equation
        OUT1 = G2.SPEED1;
        OUT2 = G2.PMECH1;
        OUT3 = B4.v;
        OUT4 = G2.TF2_out1;

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
          annotation (Line(points={{60,-29},{60,-18}}, color={0,0,255}));
        connect(LD1.p, B2.p)
          annotation (Line(points={{-6,30},{-6,70},{0,70}},color={0,0,255}));
        connect(L3.p, B3.p) annotation (Line(points={{80,45.4},{80,70},{60,70}},
                                   color={0,0,255}));
        connect(breaker.s, B4.p)
          annotation (Line(points={{80,18},{80,10}},   color={0,0,255}));
        connect(breaker.r, L3.n)
          annotation (Line(points={{80,26},{80,34.6}},color={0,0,255}));
        connect(T2.n, B5.p)
          annotation (Line(points={{60,-12.6},{60,-18}}, color={0,0,255}));
        connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,2},{80,
                2},{80,10}},          color={0,0,255}));
        connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-36},{-82,-36}},
                            color={0,0,127}));
        connect(IN1, AddU1.u1) annotation (Line(points={{-160,0},{-92,0},{-92,-24},{-82,
                -24}}, color={0,0,127}));
        connect(T2.p, B4.p) annotation (Line(points={{60,0.6},{60,2},{80,2},{80,10}},
                              color={0,0,255}));
        connect(AddU1.y, G2.P_ref) annotation (Line(points={{-59,-30},{-20,-30},{
                -20,-78},{60,-78},{60,-52}}, color={0,0,127}));
        connect(IB.p, B3.p)
          annotation (Line(points={{94,70},{60,70}}, color={0,0,255}));
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
</html>"),experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
      end Reconnection_Microgrid_PSSE_1_INPUT_WITH_INF_WITH_TG;

      model Reconnection_Microgrid_PSSE_2_INPUT_WITH_CONST_V_SOURCE2
        "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
        extends Modelica.Icons.Example;
        OpenIPSL.Electrical.Buses.Bus BG1(v_0=0.998718, angle_0=0.15701226297036)
          annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
        OpenIPSL.Electrical.Buses.Bus B1(v_0=0.99243, angle_0=0.076256751145211)
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
        OpenIPSL.Examples.OpenCPS.Generators.G1 G1(
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
        OpenIPSL.Electrical.Buses.Bus B2(v_0=0.992672, angle_0=-0.0049916242074113)
          annotation (Placement(transformation(extent={{-10,60},{10,80}})));
        OpenIPSL.Electrical.Buses.Bus B3(v_0=0.998726, angle_0=
              3.7778175258193e-05)
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
        OpenIPSL.Electrical.Buses.Bus B4(angle_0=-0.010019446543509, v_0=0.998323)
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
        OpenIPSL.Electrical.Buses.Bus B5(v_0=1.00875, angle_0=-0.00057912293509199)
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
        OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.PSSE.G2_2INPUTS
          G2(
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
        Electrical.Events.Breaker breaker(enableTrigger=false, t_o=0.1)
                                                 annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,22})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={-160,0})));
        Electrical.Loads.PSSE.Load_variation load_variation(
          V_b=220000,
          P_0=15000000,
          Q_0=10000000,
          v_0=0.997342,
          angle_0=-0.00014475935348966,
          d_P=0.05,
          t1=10000,
          d_t=1000001)
          annotation (Placement(transformation(extent={{90,-40},{110,-20}})));
        Electrical.Sources.VoltageSourceReImInput voltageSourceReImInput
          annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=180,
              origin={86,96})));
        Modelica.Blocks.Sources.Constant VR(k=0.999211)
          annotation (Placement(transformation(extent={{130,90},{110,110}})));
        Modelica.Blocks.Sources.Constant VI(k=-0.00980921)
          annotation (Placement(transformation(extent={{132,56},{112,76}})));
        Modelica.Blocks.Sources.Constant IN11(k=0)
          annotation (Placement(transformation(extent={{-120,-46},{-100,-26}})));
        Modelica.Blocks.Math.Add AddU1
          annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
            Modelica.Blocks.Sources.Constant IN22(k=0)
          annotation (Placement(transformation(extent={{-120,-100},{-100,-80}})));
        Modelica.Blocks.Math.Add AddU2
          annotation (Placement(transformation(extent={{-80,-94},{-60,-74}})));
        Modelica.Blocks.Interfaces.RealInput IN2(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={-160,-54})));
        Modelica.Blocks.Interfaces.RealOutput OUT1
          annotation (Placement(transformation(extent={{140,-50},{160,-30}})));
        Modelica.Blocks.Interfaces.RealOutput OUT2
          annotation (Placement(transformation(extent={{140,-10},{160,10}})));
        Modelica.Blocks.Interfaces.RealOutput OUT3
          annotation (Placement(transformation(extent={{140,50},{160,70}})));
        Modelica.Blocks.Interfaces.RealOutput OUT4
          annotation (Placement(transformation(extent={{140,-90},{160,-70}})));
           Modelica.Blocks.Interfaces.RealOutput OUT5
          annotation (Placement(transformation(extent={{124,-142},{144,-122}})));
           Modelica.Blocks.Interfaces.RealOutput OUT6
          annotation (Placement(transformation(extent={{140,-120},{160,-100}})));
               Modelica.Blocks.Interfaces.RealOutput OUT7
          annotation (Placement(transformation(extent={{124,-142},{144,-122}})));
           Modelica.Blocks.Interfaces.RealOutput OUT8
          annotation (Placement(transformation(extent={{140,-120},{160,-100}})));
               Modelica.Blocks.Interfaces.RealOutput OUT9
          annotation (Placement(transformation(extent={{124,-142},{144,-122}})));
           Modelica.Blocks.Interfaces.RealOutput OUT10
          annotation (Placement(transformation(extent={{140,-120},{160,-100}})));
           Modelica.Blocks.Interfaces.RealOutput OUT11
          annotation (Placement(transformation(extent={{140,-120},{160,-100}})));

      equation
        OUT1 = G2.SPEED1;
        OUT2 = G2.PMECH1;
        OUT3 = G2.gen.ANGLE;
        OUT4 = G2.TF2_out1;
        OUT5 = B3.angle;
        OUT6 = B3.v;
        OUT7 = B4.angle;
        OUT8 = B4.v;
        OUT9 = B4.p.vr;
        OUT10 = B4.p.vi;
        OUT11 = G2.gen.PELEC;

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
        connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,2},{80,
                2},{80,10}},          color={0,0,255}));
        connect(VR.y,voltageSourceReImInput. vRe)
          annotation (Line(points={{109,100},{98,100}},  color={0,0,127}));
        connect(VI.y,voltageSourceReImInput. vIm) annotation (Line(points={{111,66},{106,
                66},{106,92},{98,92}},       color={0,0,127}));
        connect(voltageSourceReImInput.p, B3.p)
          annotation (Line(points={{75,96},{60,96},{60,70}}, color={0,0,255}));
        connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-36},{-82,-36}},
                            color={0,0,127}));
        connect(IN1, AddU1.u1) annotation (Line(points={{-160,0},{-92,0},{-92,-24},{-82,
                -24}}, color={0,0,127}));
        connect(T2.p, B4.p) annotation (Line(points={{60,0.6},{60,2},{80,2},{80,10}},
                              color={0,0,255}));
        connect(AddU1.y, G2.P_ref) annotation (Line(points={{-59,-30},{-20,-30},{-20,-78},
                {56,-78},{56,-52}},          color={0,0,127}));
        connect(IN22.y, AddU2.u2)
          annotation (Line(points={{-99,-90},{-82,-90}}, color={0,0,127}));
        connect(IN2,AddU2. u1) annotation (Line(points={{-160,-54},{-90,-54},{-90,-78},
                {-82,-78}},
                       color={0,0,127}));
        connect(AddU2.y, G2.Efd_ref)
          annotation (Line(points={{-59,-84},{62,-84},{62,-52}}, color={0,0,127}));

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
</html>"),experiment(
            StopTime=10,
            Tolerance=1e-09,
            __Dymola_Algorithm="Dassl"));
      end Reconnection_Microgrid_PSSE_2_INPUT_WITH_CONST_V_SOURCE2;

      model Reconnection_Microgrid_PSSE_2_INPUT_WITH_CONST_V_SOURCE2_V2
        "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
        extends Modelica.Icons.Example;
        OpenIPSL.Electrical.Buses.Bus BG1(v_0=0.998718, angle_0=0.15701226297036)
          annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
        OpenIPSL.Electrical.Buses.Bus B1(v_0=0.99243, angle_0=0.076256751145211)
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
        OpenIPSL.Examples.OpenCPS.Generators.G1 G1(
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
        OpenIPSL.Electrical.Buses.Bus B2(v_0=0.992672, angle_0=-0.0049916242074113)
          annotation (Placement(transformation(extent={{-10,60},{10,80}})));
        OpenIPSL.Electrical.Buses.Bus B3(v_0=0.998726, angle_0=3.7778175258193e-05)
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
        OpenIPSL.Electrical.Buses.Bus B4(angle_0=-0.010019446543509, v_0=0.998323)
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
        OpenIPSL.Electrical.Buses.Bus B5(v_0=1.00875, angle_0=-0.00057912293509199)
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
        OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.PSSE.G2_2INPUTS
          G2(
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
        Electrical.Events.Breaker breaker(enableTrigger=false, t_o=0.1)
                                                 annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,22})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={-160,0})));
        Electrical.Loads.PSSE.Load_variation load_variation(
          V_b=220000,
          P_0=15000000,
          Q_0=10000000,
          v_0=0.997342,
          angle_0=-0.00014475935348966,
          d_P=0.05,
          t1=10000,
          d_t=1000001)
          annotation (Placement(transformation(extent={{90,-40},{110,-20}})));
        Electrical.Sources.VoltageSourceReImInput voltageSourceReImInput
          annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=180,
              origin={86,96})));
        Modelica.Blocks.Sources.Constant VR(k=0.999211)
          annotation (Placement(transformation(extent={{130,90},{110,110}})));
        Modelica.Blocks.Sources.Constant VI(k=-0.00980921)
          annotation (Placement(transformation(extent={{132,56},{112,76}})));
        Modelica.Blocks.Sources.Constant IN11(k=0)
          annotation (Placement(transformation(extent={{-120,-46},{-100,-26}})));
        Modelica.Blocks.Math.Add AddU1
          annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
            Modelica.Blocks.Sources.Constant IN22(k=0)
          annotation (Placement(transformation(extent={{-120,-100},{-100,-80}})));
        Modelica.Blocks.Math.Add AddU2
          annotation (Placement(transformation(extent={{-80,-94},{-60,-74}})));
        Modelica.Blocks.Interfaces.RealInput IN2(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={-160,-54})));
        Modelica.Blocks.Interfaces.RealOutput OUT1
          annotation (Placement(transformation(extent={{140,-50},{160,-30}})));
        Modelica.Blocks.Interfaces.RealOutput OUT2
          annotation (Placement(transformation(extent={{140,-10},{160,10}})));
        Modelica.Blocks.Interfaces.RealOutput OUT3
          annotation (Placement(transformation(extent={{140,50},{160,70}})));
        Modelica.Blocks.Interfaces.RealOutput OUT4
          annotation (Placement(transformation(extent={{140,-90},{160,-70}})));
           Modelica.Blocks.Interfaces.RealOutput OUT5
          annotation (Placement(transformation(extent={{124,-142},{144,-122}})));
           Modelica.Blocks.Interfaces.RealOutput OUT6
          annotation (Placement(transformation(extent={{140,-120},{160,-100}})));
               Modelica.Blocks.Interfaces.RealOutput OUT7
          annotation (Placement(transformation(extent={{124,-142},{144,-122}})));
           Modelica.Blocks.Interfaces.RealOutput OUT8
          annotation (Placement(transformation(extent={{140,-120},{160,-100}})));
          Modelica.Blocks.Interfaces.RealOutput OUT9
          annotation (Placement(transformation(extent={{140,-120},{160,-100}})));

      equation
        OUT1 = G2.SPEED1;
        OUT2 = G2.PMECH1;
        OUT3 = B4.v;
        OUT4 = G2.TF2_out1;
        OUT5 = B3.p.vr;
        OUT6 = B3.p.vi;
        OUT7 = B4.p.vr;
        OUT8 = B4.p.vi;
        OUT9 = G2.gen.delta;

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
        connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,2},{80,
                2},{80,10}},          color={0,0,255}));
        connect(VR.y,voltageSourceReImInput. vRe)
          annotation (Line(points={{109,100},{98,100}},  color={0,0,127}));
        connect(VI.y,voltageSourceReImInput. vIm) annotation (Line(points={{111,66},{106,
                66},{106,92},{98,92}},       color={0,0,127}));
        connect(voltageSourceReImInput.p, B3.p)
          annotation (Line(points={{75,96},{60,96},{60,70}}, color={0,0,255}));
        connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-36},{-82,-36}},
                            color={0,0,127}));
        connect(IN1, AddU1.u1) annotation (Line(points={{-160,0},{-92,0},{-92,-24},{-82,
                -24}}, color={0,0,127}));
        connect(T2.p, B4.p) annotation (Line(points={{60,0.6},{60,2},{80,2},{80,10}},
                              color={0,0,255}));
        connect(AddU1.y, G2.P_ref) annotation (Line(points={{-59,-30},{-20,-30},{-20,-78},
                {56,-78},{56,-52}},          color={0,0,127}));
        connect(IN22.y, AddU2.u2)
          annotation (Line(points={{-99,-90},{-82,-90}}, color={0,0,127}));
        connect(IN2,AddU2. u1) annotation (Line(points={{-160,-54},{-90,-54},{-90,-78},
                {-82,-78}},
                       color={0,0,127}));
        connect(AddU2.y, G2.Efd_ref)
          annotation (Line(points={{-59,-84},{62,-84},{62,-52}}, color={0,0,127}));

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
</html>"),experiment(
            StopTime=10,
            Tolerance=1e-09,
            __Dymola_Algorithm="Dassl"));
      end Reconnection_Microgrid_PSSE_2_INPUT_WITH_CONST_V_SOURCE2_V2;

      model Reconnection_Microgrid_PSSE_3_INPUT_WITH_CONST_V_SOURCE3
        "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
        extends Modelica.Icons.Example;
        OpenIPSL.Electrical.Buses.Bus B1(v_0=powerFlow.powerflow.bus.V1, angle_0=
              powerFlow.powerflow.bus.A1)
          annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
        OpenIPSL.Electrical.Buses.Bus B2(v_0=powerFlow.powerflow.bus.V2, angle_0=
              powerFlow.powerflow.bus.A1)
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
        OpenIPSL.Examples.OpenCPS.Generators.G1 G1(
          v_0=powerFlow.powerflow.bus.V1,
          angle_0=powerFlow.powerflow.bus.A1,
          P_0=powerFlow.powerflow.machines.PG1,
          Q_0=powerFlow.powerflow.machines.QG1,
          V_b=24000)
          annotation (Placement(transformation(extent={{-112,60},{-92,80}})));
        OpenIPSL.Electrical.Branches.PwLine L1(
          R=0.001,
          X=0.2,
          G=0,
          B=0) annotation (Placement(transformation(extent={{-26,66},{-14,74}})));
        OpenIPSL.Electrical.Buses.Bus B3(v_0=powerFlow.powerflow.bus.V3, angle_0=
              powerFlow.powerflow.bus.A3)
          annotation (Placement(transformation(extent={{-10,60},{10,80}})));
        OpenIPSL.Electrical.Buses.Bus B4(v_0=powerFlow.powerflow.bus.V4, angle_0=
              powerFlow.powerflow.bus.V4)
          annotation (Placement(transformation(extent={{50,60},{70,80}})));
        OpenIPSL.Electrical.Branches.PwLine L2_1(
          R=0.0005,
          X=0.1,
          G=0,
          B=0) annotation (Placement(transformation(extent={{24,76},{36,84}})));
        OpenIPSL.Electrical.Branches.PwLine L2_2(
          R=0.0005,
          X=0.1,
          G=0,
          B=0) annotation (Placement(transformation(extent={{24,56},{36,64}})));
        OpenIPSL.Electrical.Buses.Bus B5(angle_0=powerFlow.powerflow.bus.A5, v_0=
              powerFlow.powerflow.bus.V5)
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
          X=0.1) annotation (Placement(transformation(
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
          angle_0=powerFlow.powerflow.bus.A3)
          annotation (Placement(transformation(extent={{-20,20},{0,40}})));
        Electrical.Events.Breaker breaker(enableTrigger=false,
          t_o=101,
          rc_enabled=false)                      annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,22})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={-160,-40})));
        Electrical.Loads.PSSE.Load_variation Load2(
          V_b=220000,
          P_0=powerFlow.powerflow.loads.PL2,
          Q_0=powerFlow.powerflow.loads.QL2,
          v_0=powerFlow.powerflow.bus.V5,
          angle_0=powerFlow.powerflow.bus.A5,
          d_P=0,
          t1=0,
          d_t=0)
          annotation (Placement(transformation(extent={{90,-40},{110,-20}})));
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
          annotation (Placement(transformation(extent={{140,100},{160,120}})));
        Modelica.Blocks.Interfaces.RealOutput OUT2
          annotation (Placement(transformation(extent={{140,80},{160,100}})));
        Modelica.Blocks.Interfaces.RealOutput OUT3
          annotation (Placement(transformation(extent={{140,60},{160,80}})));
        Modelica.Blocks.Interfaces.RealOutput OUT4
          annotation (Placement(transformation(extent={{140,40},{160,60}})));
           Modelica.Blocks.Interfaces.RealOutput OUT5
          annotation (Placement(transformation(extent={{140,20},{160,40}})));
           Modelica.Blocks.Interfaces.RealOutput OUT6
          annotation (Placement(transformation(extent={{140,0},{160,20}})));
               Modelica.Blocks.Interfaces.RealOutput OUT7
          annotation (Placement(transformation(extent={{140,-20},{160,0}})));
           Modelica.Blocks.Interfaces.RealOutput OUT8
          annotation (Placement(transformation(extent={{140,-40},{160,-20}})));
               Modelica.Blocks.Interfaces.RealOutput OUT9
          annotation (Placement(transformation(extent={{140,-60},{160,-40}})));
           Modelica.Blocks.Interfaces.RealOutput OUT10
          annotation (Placement(transformation(extent={{140,-80},{160,-60}})));
           Modelica.Blocks.Interfaces.RealOutput OUT11
          annotation (Placement(transformation(extent={{140,-100},{160,-80}})));

        PFData.PowerFlow powerFlow(redeclare record PowerFlow =
              OpenIPSL.Examples.ModelPredictiveControl.PFData.PF01)
          annotation (Placement(transformation(extent={{-68,104},{-54,118}})));
        Electrical.Sources.VoltageSourceReImInput voltageSourceReImInput
          annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=180,
              origin={88,96})));
        Modelica.Blocks.Sources.Constant VR(k=0.999211)
          annotation (Placement(transformation(extent={{132,90},{112,110}})));
        Modelica.Blocks.Sources.Constant VI(k=-0.00980921)
          annotation (Placement(transformation(extent={{134,56},{114,76}})));
      equation
        OUT1 = G2.SPEED1;
        OUT2 = G2.PMECH1;
        OUT3 = G2.gen.ANGLE;
        OUT4 = G2.TF2_out1;
        OUT5 =B4.angle;
        OUT6 =B4.v;
        OUT7 =B5.angle;
        OUT8 =B5.v;
        OUT9 =B5.p.vr;
        OUT10 =B5.p.vi;
        OUT11 = G2.gen.PELEC;
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
        connect(Load2.p, B5.p) annotation (Line(points={{100,-20},{100,2},{80,2},
                {80,10}}, color={0,0,255}));
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
        connect(VI.y, voltageSourceReImInput.vIm) annotation (Line(points={{113,
                66},{110,66},{110,86},{108,86},{108,92},{100,92}}, color={0,0,127}));
        connect(VR.y, voltageSourceReImInput.vRe)
          annotation (Line(points={{111,100},{100,100}}, color={0,0,127}));
        connect(voltageSourceReImInput.p, B4.p) annotation (Line(points={{77,96},
                {70,96},{70,70},{60,70}}, color={0,0,255}));
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
</html>"),experiment(
            StopTime=10,
            Tolerance=1e-09,
            __Dymola_Algorithm="Dassl"));
      end Reconnection_Microgrid_PSSE_3_INPUT_WITH_CONST_V_SOURCE3;

      model Reconnection_Microgrid_PSSE_3_INPUT_WITH_INF_BUS
        "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
        extends Modelica.Icons.Example;

        OpenIPSL.Electrical.Buses.Bus B1(v_0=powerFlow.powerflow.bus.V1, angle_0=
              powerFlow.powerflow.bus.A1)
          annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
        OpenIPSL.Electrical.Buses.Bus B2(v_0=powerFlow.powerflow.bus.V2, angle_0=
              powerFlow.powerflow.bus.A1)
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
        OpenIPSL.Examples.OpenCPS.Generators.G1 G1(
          v_0=powerFlow.powerflow.bus.V1,
          angle_0=powerFlow.powerflow.bus.A1,
          P_0=powerFlow.powerflow.machines.PG1,
          Q_0=powerFlow.powerflow.machines.QG1,
          V_b=24000)
          annotation (Placement(transformation(extent={{-112,60},{-92,80}})));
        OpenIPSL.Electrical.Branches.PwLine L1(
          R=0.001,
          X=0.2,
          G=0,
          B=0) annotation (Placement(transformation(extent={{-26,66},{-14,74}})));
        OpenIPSL.Electrical.Buses.Bus B3(v_0=powerFlow.powerflow.bus.V3, angle_0=
              powerFlow.powerflow.bus.A3)
          annotation (Placement(transformation(extent={{-10,60},{10,80}})));
        OpenIPSL.Electrical.Buses.Bus B4(v_0=powerFlow.powerflow.bus.V4, angle_0=
              powerFlow.powerflow.bus.V4)
          annotation (Placement(transformation(extent={{50,60},{70,80}})));
        OpenIPSL.Electrical.Branches.PwLine L2_1(
          R=0.0005,
          X=0.1,
          G=0,
          B=0) annotation (Placement(transformation(extent={{24,76},{36,84}})));
        OpenIPSL.Electrical.Branches.PwLine L2_2(
          R=0.0005,
          X=0.1,
          G=0,
          B=0) annotation (Placement(transformation(extent={{24,56},{36,64}})));
        OpenIPSL.Electrical.Buses.Bus B5(angle_0=powerFlow.powerflow.bus.A5, v_0=
              powerFlow.powerflow.bus.V5)
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
          X=0.1) annotation (Placement(transformation(
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
          angle_0=powerFlow.powerflow.bus.A3)
          annotation (Placement(transformation(extent={{-20,20},{0,40}})));
        Electrical.Events.Breaker breaker(enableTrigger=false,
          t_o=101,
          rc_enabled=false)                      annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,22})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={-160,-40})));
        Electrical.Loads.PSSE.Load_variation Load2(
          V_b=220000,
          P_0=powerFlow.powerflow.loads.PL2,
          Q_0=powerFlow.powerflow.loads.QL2,
          v_0=powerFlow.powerflow.bus.V5,
          angle_0=powerFlow.powerflow.bus.A5,
          d_P=0,
          t1=0,
          d_t=0)
          annotation (Placement(transformation(extent={{90,-40},{110,-20}})));
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
          annotation (Placement(transformation(extent={{140,100},{160,120}})));
        Modelica.Blocks.Interfaces.RealOutput OUT2
          annotation (Placement(transformation(extent={{140,80},{160,100}})));
        Modelica.Blocks.Interfaces.RealOutput OUT3
          annotation (Placement(transformation(extent={{140,60},{160,80}})));
        Modelica.Blocks.Interfaces.RealOutput OUT4
          annotation (Placement(transformation(extent={{140,40},{160,60}})));
           Modelica.Blocks.Interfaces.RealOutput OUT5
          annotation (Placement(transformation(extent={{140,20},{160,40}})));
           Modelica.Blocks.Interfaces.RealOutput OUT6
          annotation (Placement(transformation(extent={{140,0},{160,20}})));
               Modelica.Blocks.Interfaces.RealOutput OUT7
          annotation (Placement(transformation(extent={{140,-20},{160,0}})));
           Modelica.Blocks.Interfaces.RealOutput OUT8
          annotation (Placement(transformation(extent={{140,-40},{160,-20}})));
               Modelica.Blocks.Interfaces.RealOutput OUT9
          annotation (Placement(transformation(extent={{140,-60},{160,-40}})));
           Modelica.Blocks.Interfaces.RealOutput OUT10
          annotation (Placement(transformation(extent={{140,-80},{160,-60}})));
           Modelica.Blocks.Interfaces.RealOutput OUT11
          annotation (Placement(transformation(extent={{140,-100},{160,-80}})));

        PFData.PowerFlow powerFlow(redeclare record PowerFlow =
              OpenIPSL.Examples.ModelPredictiveControl.PFData.PF01)
          annotation (Placement(transformation(extent={{-68,104},{-54,118}})));
        Electrical.Machines.PSSE.GENCLS          IB(
          V_b=220000,
          v_0=powerFlow.powerflow.bus.V4,
          angle_0=powerFlow.powerflow.bus.A4,
          P_0=powerFlow.powerflow.machines.Pinf,
          Q_0=powerFlow.powerflow.machines.Qinf,
          M_b=100000000,
          X_d=1)   annotation (Placement(transformation(extent={{110,60},{100,80}})));
      equation
        OUT1 = G2.SPEED1;
        OUT2 = G2.PMECH1;
        OUT3 = G2.gen.ANGLE;
        OUT4 = G2.TF2_out1;
        OUT5 =B4.angle;
        OUT6 =B4.v;
        OUT7 =B5.angle;
        OUT8 =B5.v;
        OUT9 =B5.p.vr;
        OUT10 =B5.p.vi;
        OUT11 = G2.gen.PELEC;
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
        connect(Load2.p, B5.p) annotation (Line(points={{100,-20},{100,2},{80,2},
                {80,10}}, color={0,0,255}));
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
        connect(IB.p, B4.p)
          annotation (Line(points={{100,70},{60,70}}, color={0,0,255}));
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
</html>"),experiment(
            StopTime=10,
            Tolerance=1e-09,
            __Dymola_Algorithm="Dassl"));
      end Reconnection_Microgrid_PSSE_3_INPUT_WITH_INF_BUS;
    end OBSERVABLE_CONTROLLABLE_STABLE;

    package NOTCONTROLLABLE_NOTOBSERVABLE_STABLE

      model
        Reconnection_Microgrid_PSSE_1_INPUT_1_OUTPUT_WITH_CONST_V_SOURCE2_NO_TG
        "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
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
        OpenIPSL.Examples.OpenCPS.Generators.G1 G1(
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
        OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.PSSE.G2_1INPUT_Pref_NO_TurbGov
          G2(
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
        Electrical.Events.Breaker breaker(enableTrigger=false, t_o=0.1)
                                                 annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,22})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={-160,0})));
        Electrical.Loads.PSSE.Load_variation load_variation(
          V_b=220000,
          P_0=15000000,
          Q_0=15000000,
          v_0=0.997342,
          angle_0=-0.00014475935348966,
          d_P=0.1,
          t1=1000,
          d_t=2000)
          annotation (Placement(transformation(extent={{90,-40},{110,-20}})));
        Modelica.Blocks.Interfaces.RealOutput OUT1
          annotation (Placement(transformation(extent={{140,-70},{160,-50}})));
        Electrical.Sources.VoltageSourceReImInput voltageSourceReImInput
          annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=180,
              origin={86,96})));
        Modelica.Blocks.Sources.Constant VR(k=0.998726)
          annotation (Placement(transformation(extent={{130,90},{110,110}})));
        Modelica.Blocks.Sources.Constant VI(k=3.7730e-5)
          annotation (Placement(transformation(extent={{132,56},{112,76}})));
        Modelica.Blocks.Sources.Constant IN11(k=0)
          annotation (Placement(transformation(extent={{-120,-46},{-100,-26}})));
        Modelica.Blocks.Math.Add AddU1
          annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
      equation
        OUT1 = G2.gen.w;

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
        connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,2},{80,
                2},{80,10}},          color={0,0,255}));
        connect(VR.y,voltageSourceReImInput. vRe)
          annotation (Line(points={{109,100},{98,100}},  color={0,0,127}));
        connect(VI.y,voltageSourceReImInput. vIm) annotation (Line(points={{111,66},{106,
                66},{106,92},{98,92}},       color={0,0,127}));
        connect(voltageSourceReImInput.p, B3.p)
          annotation (Line(points={{75,96},{60,96},{60,70}}, color={0,0,255}));
        connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-36},{-82,-36}},
                            color={0,0,127}));
        connect(IN1, AddU1.u1) annotation (Line(points={{-160,0},{-92,0},{-92,-24},{-82,
                -24}}, color={0,0,127}));
        connect(T2.p, B4.p) annotation (Line(points={{60,0.6},{60,2},{80,2},{80,10}},
                              color={0,0,255}));
        connect(AddU1.y, G2.P_ref) annotation (Line(points={{-59,-30},{-20,-30},{
                -20,-78},{60,-78},{60,-52}}, color={0,0,127}));
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
</html>"),experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
      end
        Reconnection_Microgrid_PSSE_1_INPUT_1_OUTPUT_WITH_CONST_V_SOURCE2_NO_TG;

      model Reconnection_Microgrid_PSSE_2_INPUT_WITH_CONST_V_SOURCE2_NO_TG
        "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
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
        OpenIPSL.Examples.OpenCPS.Generators.G1 G1(
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
        OpenIPSL.Examples.ModelPredictiveControl.GenerationUnits.PSSE.G2_2INPUT_Pref_Efdref_NO_TurbGov_NO_Exci
          G2(
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
        Electrical.Events.Breaker breaker(enableTrigger=false, t_o=0.1)
                                                 annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,22})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={-160,0})));
              Modelica.Blocks.Interfaces.RealInput IN2(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={-160,-84})));
        Electrical.Loads.PSSE.Load_variation load_variation(
          V_b=220000,
          P_0=15000000,
          Q_0=15000000,
          v_0=0.997342,
          angle_0=-0.00014475935348966,
          d_P=0.1,
          t1=1000,
          d_t=2000)
          annotation (Placement(transformation(extent={{90,-40},{110,-20}})));
        Modelica.Blocks.Interfaces.RealOutput OUT1
          annotation (Placement(transformation(extent={{140,-70},{160,-50}})));
        Electrical.Sources.VoltageSourceReImInput voltageSourceReImInput
          annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=180,
              origin={86,96})));
        Modelica.Blocks.Sources.Constant VR(k=0.998726)
          annotation (Placement(transformation(extent={{130,90},{110,110}})));
        Modelica.Blocks.Sources.Constant VI(k=3.7730e-5)
          annotation (Placement(transformation(extent={{132,56},{112,76}})));
        Modelica.Blocks.Sources.Constant IN11(k=0)
          annotation (Placement(transformation(extent={{-120,-30},{-100,-10}})));
        Modelica.Blocks.Math.Add AddU1
          annotation (Placement(transformation(extent={{-80,-16},{-60,4}})));
        Modelica.Blocks.Sources.Constant IN22(k=0)
          annotation (Placement(transformation(extent={{-120,-114},{-100,-94}})));
        Modelica.Blocks.Math.Add AddU3
          annotation (Placement(transformation(extent={{-80,-100},{-60,-80}})));
        Modelica.Blocks.Interfaces.RealOutput OUT2
          annotation (Placement(transformation(extent={{140,-10},{160,10}})));
      equation
        OUT1 = G2.gen.w;
        OUT2 = B4.v;

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
        connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,2},{80,
                2},{80,10}},          color={0,0,255}));
        connect(VR.y,voltageSourceReImInput. vRe)
          annotation (Line(points={{109,100},{98,100}},  color={0,0,127}));
        connect(VI.y,voltageSourceReImInput. vIm) annotation (Line(points={{111,66},{106,
                66},{106,92},{98,92}},       color={0,0,127}));
        connect(voltageSourceReImInput.p, B3.p)
          annotation (Line(points={{75,96},{60,96},{60,70}}, color={0,0,255}));
        connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-20},{-82,-20},{-82,-12}},
                            color={0,0,127}));
        connect(IN1, AddU1.u1) annotation (Line(points={{-160,0},{-82,0}},
                       color={0,0,127}));
        connect(AddU1.y, G2.P_ref) annotation (Line(points={{-59,-6},{40,-6},{40,-60},
                {56,-60},{56,-52}}, color={0,0,127}));
        connect(T2.p, B4.p) annotation (Line(points={{60,0.6},{60,2},{80,2},{80,10}},
                              color={0,0,255}));
        connect(IN2, AddU3.u1)
          annotation (Line(points={{-160,-84},{-82,-84}}, color={0,0,127}));
        connect(IN22.y, AddU3.u2) annotation (Line(points={{-99,-104},{-90,-104},{-90,
                -96},{-82,-96}}, color={0,0,127}));
        connect(AddU3.y, G2.Efd_ref)
          annotation (Line(points={{-59,-90},{64,-90},{64,-52}}, color={0,0,127}));
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
</html>"),experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
      end Reconnection_Microgrid_PSSE_2_INPUT_WITH_CONST_V_SOURCE2_NO_TG;
    end NOTCONTROLLABLE_NOTOBSERVABLE_STABLE;

    package EquipmentOnlyLinearization
      model OptimizationModel01 "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
        extends Modelica.Icons.Example;

        parameter Boolean equivalentGRID = false;
        parameter Boolean equivalentInfBUS = false;

        OpenIPSL.Electrical.Buses.Bus Bus1(v_0=powerFlow.powerflow.bus.V1, angle_0=
              powerFlow.powerflow.bus.A1) if not equivalentGRID
          annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus2(v_0=powerFlow.powerflow.bus.V2, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus3(v_0=powerFlow.powerflow.bus.V3, angle_0=
              powerFlow.powerflow.bus.A3) if not equivalentGRID
          annotation (Placement(transformation(extent={{-10,60},{10,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus4(v_0=powerFlow.powerflow.bus.V4, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus5(angle_0=powerFlow.powerflow.bus.A5, v_0=
              powerFlow.powerflow.bus.V5) if not equivalentGRID annotation (Placement(
              transformation(
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
        OpenIPSL.Electrical.Buses.Bus Bus6(v_0=powerFlow.powerflow.bus.V6, angle_0=
              powerFlow.powerflow.bus.A6) annotation (Placement(transformation(
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
        GenerationUnits.PSSE.G2_3INPUTS                       G2(
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
        Electrical.Events.Breaker breaker(
          enableTrigger=false,
          t_o=1.01,
          rc_enabled=false,
          t_rc=42.01)       if not equivalentGRID                     annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,16})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,0}), iconTransformation(extent={{-10,-10},{10,10}}, origin=
                 {-150,0})));
        Modelica.Blocks.Sources.Constant IN11(k=0)
          annotation (Placement(transformation(extent={{-120,-40},{-100,-20}})));
        Modelica.Blocks.Math.Add AddU1
          annotation (Placement(transformation(extent={{-80,-16},{-60,4}})));
        Modelica.Blocks.Sources.Constant IN22(k=0)
          annotation (Placement(transformation(extent={{-120,-100},{-100,-80}})));
        Modelica.Blocks.Math.Add AddU2
          annotation (Placement(transformation(extent={{-80,-76},{-60,-56}})));
        Modelica.Blocks.Interfaces.RealInput IN2(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,-60}), iconTransformation(extent={{-10,-10},{10,10}},
                origin={-150,-60})));
        Modelica.Blocks.Interfaces.RealOutput OUT1
          annotation (Placement(transformation(extent={{140,58},{160,78}})));
        Modelica.Blocks.Interfaces.RealOutput OUT2
          annotation (Placement(transformation(extent={{140,38},{160,58}})));
        Modelica.Blocks.Interfaces.RealOutput OUT3
          annotation (Placement(transformation(extent={{140,18},{160,38}})));
        Modelica.Blocks.Interfaces.RealOutput OUT4
          annotation (Placement(transformation(extent={{140,-2},{160,18}})));
        Modelica.Blocks.Interfaces.RealOutput OUT5
          annotation (Placement(transformation(extent={{140,-22},{160,-2}})));
        Modelica.Blocks.Interfaces.RealOutput OUT6
          annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT8
          annotation (Placement(transformation(extent={{140,-82},
                  {160,-62}})));
                  Modelica.Blocks.Interfaces.RealOutput OUT7  annotation (Placement(transformation(extent={{140,-82},
                  {160,-62}})));

        Modelica.Blocks.Interfaces.RealOutput OUT9    annotation (Placement(transformation(extent={{140,-60},
                  {160,-40}})));
        Modelica.Blocks.Interfaces.RealOutput OUT10   annotation (Placement(transformation(extent={{140,
                  -102},{160,-82}})));
        Modelica.Blocks.Interfaces.RealOutput OUT11   annotation (Placement(transformation(extent={{140,-102},{160,-82}})));
        Modelica.Blocks.Interfaces.RealOutput OUT12   annotation (Placement(transformation(extent={{140,-102},{160,-82}})));
        Modelica.Blocks.Interfaces.RealOutput OUT13   annotation (Placement(transformation(extent={{140,-102},{160,-82}})));
        Modelica.Blocks.Interfaces.RealOutput OUT14   annotation (Placement(transformation(extent={{140,-102},{160,-82}})));

        PFData.PowerFlow powerFlow(redeclare record PowerFlow =
              OpenIPSL.Examples.ModelPredictiveControl.PFData.PF01)
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
      equation
        //OUT1 = G2.gen.SPEED;
        //OUT2 = G2.gASTMPC.PMECH;
        //OUT3 = G2.gen.ANGLE;
        //OUT4 = G2.gASTMPC.TF2_out;
        //OUT5 =Bus6.angle;
        //OUT6 =Bus6.v;
        //OUT7 =Bus6.p.vr;
        //OUT8 =Bus6.p.vi;
        //OUT9 = if not equivalentGRID then Bus5.p.vr else 0;
        //OUT10 = if not equivalentGRID then Bus5.p.vi else 0;
        //OUT11 = G2.gen.PELEC;

        OUT1 = G2.gen.w;
        OUT2 = G2.gen.delta;
        OUT3 = G2.gen.Epq;
        OUT4 = G2.gen.PSIkd;
        OUT5 = G2.gen.PSIppq;
        OUT6 = G2.sEXSMPC.simpleLagLim.state;
        OUT7 = G2.sEXSMPC.leadLag.TF.x[1];
        OUT8 = G2.gASTMPC.simpleLagLim.state;
        OUT9 = G2.gASTMPC.simpleLag.state;
        OUT10 = G2.gASTMPC.simpleLag1.state;
        OUT11 = G2.gASTMPC.PMECH;
        OUT12 = G2.sEXSMPC.EFD;
        OUT13 = Bus6.v;
        OUT14 = Bus6.angle;

        connect(T1.p, Bus2.p)
          annotation (Line(points={{-51.2,70},{-40,70}}, color={0,0,255}));
        connect(Bus1.p, T1.n)
          annotation (Line(points={{-80,70},{-68.8,70}}, color={0,0,255}));
        connect(G1.conn, Bus1.p)
          annotation (Line(points={{-91,70},{-80,70}}, color={0,0,255}));
        connect(L1.n, Bus3.p)
          annotation (Line(points={{-14.6,70},{0,70}}, color={0,0,255}));
        connect(L1.p, Bus2.p)
          annotation (Line(points={{-25.4,70},{-40,70}}, color={0,0,255}));
        connect(L2_2.n, Bus4.p) annotation (Line(points={{35.4,60},{44,60},{44,70},{60,
                70}}, color={0,0,255}));
        connect(L2_1.n, Bus4.p) annotation (Line(points={{35.4,80},{44,80},{44,70},{60,
                70}}, color={0,0,255}));
        connect(L2_1.p, Bus3.p) annotation (Line(points={{24.6,80},{16,80},{16,70},{0,
                70}}, color={0,0,255}));
        connect(L2_2.p, Bus3.p) annotation (Line(points={{24.6,60},{16,60},{16,70},{0,
                70}}, color={0,0,255}));
        connect(G2.conn, Bus6.p)
          annotation (Line(points={{21,-36},{34,-36}}, color={0,0,255}));
        connect(Load1.p, Bus3.p)
          annotation (Line(points={{-10,56},{-10,70},{0,70}}, color={0,0,255}));
        connect(L3.p, Bus4.p)
          annotation (Line(points={{80,55.4},{80,70},{60,70}}, color={0,0,255}));
        connect(breaker.s, Bus5.p)
          annotation (Line(points={{80,12},{80,6}}, color={0,0,255}));
        connect(breaker.r, L3.n)
          annotation (Line(points={{80,20},{80,44.6}},color={0,0,255}));
        connect(T2.n, Bus6.p)
          annotation (Line(points={{50,-24.8},{50,-36},{34,-36}}, color={0,0,255}));
        connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-30},{-90,-30},{-90,-12},
                {-82,-12}}, color={0,0,127}));
        connect(IN1, AddU1.u1) annotation (Line(points={{-150,0},{-82,0}},
                       color={0,0,127}));
        connect(T2.p, Bus5.p) annotation (Line(points={{50,-7.2},{50,0},{80,0},{80,6}},
              color={0,0,255}));

        connect(IN22.y,AddU2. u2) annotation (Line(points={{-99,-90},{-90,-90},{-90,-72},
                {-82,-72}},
                       color={0,0,127}));
        connect(IN2,AddU2. u1) annotation (Line(points={{-150,-60},{-82,-60}},
                       color={0,0,127}));
        connect(AddU2.y, G2.Efd_ref)
          annotation (Line(points={{-59,-66},{-10,-66},{-10,-42},{-2,-42}},
                                                                 color={0,0,127}));
        connect(AddU1.y, G2.P_ref1) annotation (Line(points={{-59,-6},{-10,-6},{-10,-30},
                {-2,-30}},                          color={0,0,127}));
        connect(IB.p, Bus4.p)
          annotation (Line(points={{100,70},{60,70}}, color={0,0,255}));
        connect(Load2.p, Bus5.p) annotation (Line(points={{110,-20},{110,0},{80,0},{80,
                6}}, color={0,0,255}));
        connect(Load_for_Lin.p, Bus6.p)
          annotation (Line(points={{42,-60},{42,-36},{34,-36}}, color={0,0,255}));
        connect(sine.y, add.u2) annotation (Line(points={{82.5,-39},{82.5,-34},{85.2,-34},
                {85.2,-28.4}}, color={0,0,127}));
        connect(whiteNoiseInjection.y, add.u1) annotation (Line(points={{82.54,-22.06},
                {82.54,-23.6},{85.2,-23.6}}, color={0,0,127}));
        connect(add.y, Load2.u) annotation (Line(points={{94.4,-26},{94.4,-24.5},{101.9,
                -24.5}}, color={0,0,127}));
          annotation (Placement(transformation(extent={{140,-20},{160,0}})),
                      Placement(transformation(extent={{140,-40},{160,-20}})),
                      Placement(transformation(extent={{140,-60},{160,-40}})),
                      Placement(transformation(extent={{140,-80},{160,-60}})),
                     Diagram(coordinateSystem(preserveAspectRatio=false,
                extent={{-140,-120},{140,120}}), graphics={
              Rectangle(
                extent={{130,88},{166,-112}},
                lineColor={0,140,72},
                lineThickness=0.5),
              Rectangle(
                extent={{-158,20},{-134,-80}},
                lineColor={0,140,72},
                lineThickness=0.5),
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
                textString="Linearization Unit"),
              Text(
                extent={{-164,40},{-132,20}},
                textColor={0,140,72},
                textString="Inputs"),
              Text(
                extent={{128,108},{168,88}},
                textColor={0,140,72},
                textString="Outputs")}),
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
</html>"),experiment(
            StopTime=10,
            __Dymola_NumberOfIntervals=5000,
            __Dymola_Algorithm="Dassl"));
      end OptimizationModel01;

      model OptimizationModel02 "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
        extends Modelica.Icons.Example;

        parameter Boolean equivalentGRID = false;
        parameter Boolean equivalentInfBUS = false;

        OpenIPSL.Electrical.Buses.Bus Bus1(v_0=powerFlow.powerflow.bus.V1, angle_0=
              powerFlow.powerflow.bus.A1) if not equivalentGRID
          annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus2(v_0=powerFlow.powerflow.bus.V2, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus3(v_0=powerFlow.powerflow.bus.V3, angle_0=
              powerFlow.powerflow.bus.A3) if not equivalentGRID
          annotation (Placement(transformation(extent={{-10,60},{10,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus4(v_0=powerFlow.powerflow.bus.V4, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus5(angle_0=powerFlow.powerflow.bus.A5, v_0=
              powerFlow.powerflow.bus.V5)  annotation (Placement(
              transformation(
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
        OpenIPSL.Electrical.Buses.Bus Bus6(v_0=powerFlow.powerflow.bus.V6, angle_0=
              powerFlow.powerflow.bus.A6) annotation (Placement(transformation(
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
          X=0.1)  annotation (Placement(transformation(
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
          annotation (Placement(transformation(extent={{-20,38},{0,58}})));
        Electrical.Events.Breaker breaker(enableTrigger=false,
          t_o=5.01,
          rc_enabled=true,
          t_rc=80.01)       if not equivalentGRID                     annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,16})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,0}), iconTransformation(extent={{-10,-10},{10,10}}, origin=
                 {-150,0})));
        Modelica.Blocks.Sources.Constant IN11(k=0)
          annotation (Placement(transformation(extent={{-120,-40},{-100,-20}})));
        Modelica.Blocks.Math.Add AddU1
          annotation (Placement(transformation(extent={{-80,-16},{-60,4}})));
        Modelica.Blocks.Sources.Constant IN22(k=0)
          annotation (Placement(transformation(extent={{-120,-100},{-100,-80}})));
        Modelica.Blocks.Math.Add AddU2
          annotation (Placement(transformation(extent={{-80,-76},{-60,-56}})));
        Modelica.Blocks.Interfaces.RealInput IN2(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,-60}), iconTransformation(extent={{-10,-10},{10,10}},
                origin={-150,-60})));
        Modelica.Blocks.Interfaces.RealOutput OUT1
          annotation (Placement(transformation(extent={{140,58},{160,78}})));
        Modelica.Blocks.Interfaces.RealOutput OUT2
          annotation (Placement(transformation(extent={{140,38},{160,58}})));
        Modelica.Blocks.Interfaces.RealOutput OUT3
          annotation (Placement(transformation(extent={{140,18},{160,38}})));
        Modelica.Blocks.Interfaces.RealOutput OUT4
          annotation (Placement(transformation(extent={{140,-2},{160,18}})));
        Modelica.Blocks.Interfaces.RealOutput OUT5
          annotation (Placement(transformation(extent={{140,-22},{160,-2}})));
        Modelica.Blocks.Interfaces.RealOutput OUT6
          annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT7
          annotation (Placement(transformation(extent={{140,-62},
                  {160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT8
          annotation (Placement(transformation(extent={{140,-82},
                  {160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT9    annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT10   annotation (Placement(transformation(extent={{140,-62},{160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT11  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT12    annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT13   annotation (Placement(transformation(extent={{140,-62},{160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT14  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT15  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));

        PFData.PowerFlow powerFlow(redeclare record PowerFlow =
              OpenIPSL.Examples.ModelPredictiveControl.PFData.PF04)
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
          d_t=1000)
          annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
        Electrical.Loads.NoiseInjections.WhiteNoiseInjection whiteNoiseInjection(
            active_sigma=0.0002,  samplePeriod=0.02)
          annotation (Placement(transformation(extent={{70,-28},{82,-16}})));

        inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false,
            fixedSeed=10000)
          annotation (Placement(transformation(extent={{-42,92},{-22,112}})));
        Modelica.Blocks.Sources.Sine sine(
          amplitude=0.01,
          f=1/260,
          phase=3.1415926535898,
          startTime=3)
          annotation (Placement(transformation(extent={{72,-44},{82,-34}})));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(extent={{86,-30},{94,-22}})));

      equation

        OUT1 = G2.gen.w;
        OUT2 = G2.gen.delta;
        OUT3 = G2.gen.Epq;
        OUT4 = G2.gen.PSIkd;
        OUT5 = G2.gen.PSIppq;
        OUT6 = G2.sEXSMPC.simpleLagLim.state;
        OUT7 = G2.sEXSMPC.leadLag.TF.x[1];
        OUT8 = G2.gASTMPC.simpleLagLim.state;
        OUT9 = G2.gASTMPC.simpleLag.state;
        OUT10 = G2.gASTMPC.simpleLag1.state;
        OUT11 = G2.gASTMPC.PMECH;
        OUT12 = G2.sEXSMPC.EFD;
        OUT13 = Bus5.v;
        OUT14 = Bus5.angle;
        OUT15 = G2.gen.P;

        connect(T1.p, Bus2.p)
          annotation (Line(points={{-51.2,70},{-40,70}}, color={0,0,255}));
        connect(Bus1.p, T1.n)
          annotation (Line(points={{-80,70},{-68.8,70}}, color={0,0,255}));
        connect(G1.conn, Bus1.p)
          annotation (Line(points={{-91,70},{-80,70}}, color={0,0,255}));
        connect(L1.n, Bus3.p)
          annotation (Line(points={{-14.6,70},{0,70}}, color={0,0,255}));
        connect(L1.p, Bus2.p)
          annotation (Line(points={{-25.4,70},{-40,70}}, color={0,0,255}));
        connect(L2_2.n, Bus4.p) annotation (Line(points={{35.4,60},{44,60},{44,70},{
                60,70}},
                      color={0,0,255}));
        connect(L2_1.n, Bus4.p) annotation (Line(points={{35.4,80},{44,80},{44,70},{
                60,70}},
                      color={0,0,255}));
        connect(L2_1.p, Bus3.p) annotation (Line(points={{24.6,80},{16,80},{16,70},{0,
                70}}, color={0,0,255}));
        connect(L2_2.p, Bus3.p) annotation (Line(points={{24.6,60},{16,60},{16,70},{0,
                70}}, color={0,0,255}));
        connect(G2.conn, Bus6.p)
          annotation (Line(points={{21,-36},{34,-36}}, color={0,0,255}));
        connect(Load1.p, Bus3.p)
          annotation (Line(points={{-10,58},{-10,70},{0,70}}, color={0,0,255}));
        connect(L3.p, Bus4.p)
          annotation (Line(points={{80,55.4},{80,70},{60,70}}, color={0,0,255}));
        connect(breaker.s, Bus5.p)
          annotation (Line(points={{80,12},{80,6}}, color={0,0,255}));
        connect(breaker.r, L3.n)
          annotation (Line(points={{80,20},{80,44.6}},color={0,0,255}));
        connect(T2.n, Bus6.p)
          annotation (Line(points={{50,-24.8},{50,-36},{34,-36}}, color={0,0,255}));
        connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-30},{-90,-30},{-90,-12},
                {-82,-12}}, color={0,0,127}));
        connect(IN1, AddU1.u1) annotation (Line(points={{-150,0},{-82,0}},
                       color={0,0,127}));
        connect(T2.p, Bus5.p) annotation (Line(points={{50,-7.2},{50,0},{80,0},{80,6}},
              color={0,0,255}));

        connect(IN22.y,AddU2. u2) annotation (Line(points={{-99,-90},{-90,-90},{-90,-72},
                {-82,-72}},
                       color={0,0,127}));
        connect(IN2,AddU2. u1) annotation (Line(points={{-150,-60},{-82,-60}},
                       color={0,0,127}));
        connect(AddU2.y, G2.Efd_ref)
          annotation (Line(points={{-59,-66},{-10,-66},{-10,-42},{-2,-42}},
                                                                 color={0,0,127}));
        connect(AddU1.y, G2.P_ref1) annotation (Line(points={{-59,-6},{-10,-6},{-10,-30},
                {-2,-30}},                          color={0,0,127}));
        connect(IB.p, Bus4.p)
          annotation (Line(points={{100,70},{60,70}}, color={0,0,255}));
        connect(Load2.p, Bus5.p) annotation (Line(points={{110,-20},{110,0},{80,0},{80,
                6}}, color={0,0,255}));
        connect(sine.y, add.u2) annotation (Line(points={{82.5,-39},{82.5,-34},{85.2,-34},
                {85.2,-28.4}}, color={0,0,127}));
        connect(whiteNoiseInjection.y, add.u1) annotation (Line(points={{82.54,-22.06},
                {82.54,-23.6},{85.2,-23.6}}, color={0,0,127}));
        connect(add.y, Load2.u) annotation (Line(points={{94.4,-26},{94.4,-24.5},{101.9,
                -24.5}}, color={0,0,127}));
          annotation (Placement(transformation(extent={{140,-20},{160,0}})),
                      Placement(transformation(extent={{140,-40},{160,-20}})),
                      Placement(transformation(extent={{140,-60},{160,-40}})),
                      Placement(transformation(extent={{140,-80},{160,-60}})),
                     Diagram(coordinateSystem(preserveAspectRatio=false,
                extent={{-140,-120},{140,120}}), graphics={
              Rectangle(
                extent={{130,88},{166,-112}},
                lineColor={0,140,72},
                lineThickness=0.5),
              Rectangle(
                extent={{-158,20},{-134,-80}},
                lineColor={0,140,72},
                lineThickness=0.5),
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
                textString="Linearization Unit"),
              Text(
                extent={{-164,40},{-132,20}},
                textColor={0,140,72},
                textString="Inputs"),
              Text(
                extent={{128,108},{168,88}},
                textColor={0,140,72},
                textString="Outputs")}),
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
</html>"),experiment(
            StopTime=100,
            __Dymola_NumberOfIntervals=5000,
            __Dymola_Algorithm="Dassl"));
      end OptimizationModel02;

      model OptimizationModel03 "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
        extends Modelica.Icons.Example;

        parameter Boolean equivalentGRID = false;
        parameter Boolean equivalentInfBUS = false;
        parameter Real T = 5;

        OpenIPSL.Electrical.Buses.Bus Bus1(v_0=powerFlow.powerflow.bus.V1, angle_0=
              powerFlow.powerflow.bus.A1) if not equivalentGRID
          annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus2(v_0=powerFlow.powerflow.bus.V2, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus3(v_0=powerFlow.powerflow.bus.V3, angle_0=
              powerFlow.powerflow.bus.A3) if not equivalentGRID
          annotation (Placement(transformation(extent={{-10,60},{10,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus4(v_0=powerFlow.powerflow.bus.V4, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus5(angle_0=powerFlow.powerflow.bus.A5, v_0=
              powerFlow.powerflow.bus.V5)  annotation (Placement(
              transformation(
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
        OpenIPSL.Electrical.Buses.Bus Bus6(v_0=powerFlow.powerflow.bus.V6, angle_0=
              powerFlow.powerflow.bus.A6) annotation (Placement(transformation(
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
          X=0.1)  annotation (Placement(transformation(
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
          annotation (Placement(transformation(extent={{-20,38},{0,58}})));
        Electrical.Events.Breaker breaker(enableTrigger=false,
          t_o=0.001,
          rc_enabled=false,
          t_rc=30.01)       if not equivalentGRID                     annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,16})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,0}), iconTransformation(extent={{-10,-10},{10,10}}, origin=
                 {-150,0})));
        Modelica.Blocks.Math.Add AddU1
          annotation (Placement(transformation(extent={{-80,-16},{-60,4}})));
        Modelica.Blocks.Math.Add AddU2
          annotation (Placement(transformation(extent={{-80,-76},{-60,-56}})));
        Modelica.Blocks.Interfaces.RealInput IN2(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,-60}), iconTransformation(extent={{-10,-10},{10,10}},
                origin={-150,-60})));
        Modelica.Blocks.Interfaces.RealOutput OUT1
          annotation (Placement(transformation(extent={{140,58},{160,78}})));
        Modelica.Blocks.Interfaces.RealOutput OUT2
          annotation (Placement(transformation(extent={{140,38},{160,58}})));
        Modelica.Blocks.Interfaces.RealOutput OUT3
          annotation (Placement(transformation(extent={{140,18},{160,38}})));
        Modelica.Blocks.Interfaces.RealOutput OUT4
          annotation (Placement(transformation(extent={{140,-2},{160,18}})));
        Modelica.Blocks.Interfaces.RealOutput OUT5
          annotation (Placement(transformation(extent={{140,-22},{160,-2}})));
        Modelica.Blocks.Interfaces.RealOutput OUT6
          annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT7
          annotation (Placement(transformation(extent={{140,-62},
                  {160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT8
          annotation (Placement(transformation(extent={{140,-82},
                  {160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT9    annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT10   annotation (Placement(transformation(extent={{140,-62},{160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT11  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));

        PFData.PowerFlow powerFlow(redeclare record PowerFlow =
              OpenIPSL.Examples.ModelPredictiveControl.PFData.PF04)
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
          d_t=1000)
          annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
        Electrical.Loads.NoiseInjections.WhiteNoiseInjection whiteNoiseInjection(
            active_sigma=0.00000002,
                                  samplePeriod=0.02)
          annotation (Placement(transformation(extent={{70,-28},{82,-16}})));

        inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false,
            fixedSeed=10000)
          annotation (Placement(transformation(extent={{-42,92},{-22,112}})));
        Modelica.Blocks.Sources.Sine sine(
          amplitude=0,
          f=1/200,
          phase=3.1415926535898,
          startTime=3)
          annotation (Placement(transformation(extent={{72,-44},{82,-34}})));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(extent={{86,-30},{94,-22}})));

        Modelica.Blocks.Continuous.StateSpace stateSpace(
          A=[-0.0350467319011269,-0.390562612800037,-0.0220982102141145,-0.0580078018245206,
              0.381444455935434,0,0,0,0.116822429908667,0; 376.991118430775,0,0,0,0,0,
              0,0,0,0; 0,-0.0454184390776668,-0.986678228156109,0.523762754571772,-0.00438192488056084,
              0.199999999965295,0,0,0,0; 0,-2.38492178606947,10.4772483822384,-24.2829372788823,
              -0.230094818710897,0,0,0,0,0; 0,56.5367251635352,0.263868804467372,
              0.692655615925671,-68.5025764464478,0,0,0,0,0; 0,-4.10404377522038,-91.0705533888705,
              -239.060202328028,-48.6994875566102,-99.9999999826474,4000.00000016301,
              0,0,0; 0,-0.000410404377522038,-0.00910705533888706,-0.0239060202328028,
              -0.00486994875566103,0,-0.0999999999912857,0,0,0; -49.9999999736822,0,0,
              0,0,0,0,-2.50000000005815,0,0; 0,0,0,0,0,0,0,10.0000000002326,-10.0000000002326,
              0; 0,0,0,0,0,0,0,0,100.000000002326,-100.000000002326],
          B=[0,0; 0,0; 0,0; 0,0; 0,0; 0,20.0000016548074; 0,0.00200000016548074;
              2.49999999868411,0; 0,0; 0,0],
          C=[1,0,0,0,0,0,0,0,0,0; 0,1.00000000011134,0,0,0,0,0,0,0,0; 0,0,
              0.99999999999927,0,0,0,0,0,0,0; 0,0,0,1.00000000006264,0,0,0,0,0,0; 0,0,
              0,0,1.00000000004757,0,0,0,0,0; 0,0,0,0,0,0.999999999826474,0,0,0,0; 0,
              0,0,0,0,0,0.999999999912857,0,0,0; 0,0,0,0,0,0,0,1.00000000002326,0,0;
              0,0,0,0,0,0,0,0,1.00000000002326,0; 0,0,0,0,0,0,0,0,0,1.00000000002326;
              -0.100000008274037,0,0,0,0,0,0,0,1.00000000002326,0; 0,0,0,0,0,
              0.999999999826474,0,0,0,0; 0,0.00410404377522038,0.0910705533888705,
              0.239060202328028,0.0486994875566102,0,0,0,0,0; 0,0.334312313394889,
              0.0134167311163422,0.0352189191907436,-0.329697998696702,0,0,0,0,0],
          D=[0,0; 0,0; 0,0; 0,0; 0,0; 0,0; 0,0; 0,0; 0,0; 0,0; 0,0; 0,0; 0,0; 0,0],
          initType=Modelica.Blocks.Types.Init.InitialState,
          x_start={0.00253744713495376,3.965136266559,1.00531875113478,
              0.999279443199617,0.0750069322894724,1.03445704234505,
              0.0207763178888415,0.0501355939918311,0.0504208497418196,
              0.0504500114912884})
          annotation (Placement(transformation(extent={{34,-84},{54,-64}})));
        Modelica.Blocks.Routing.Multiplex2     multiplex2_1
          annotation (Placement(transformation(extent={{-2,-84},{18,-64}})));
        Modelica.Blocks.Sources.Pulse pulse4(
          amplitude=-0.01,
          period=T,
          offset=0,
          startTime=0.001)
          annotation (Placement(transformation(extent={{-114,-20},{-104,-10}})));
        Modelica.Blocks.Sources.Constant IN22(k=0)
          annotation (Placement(transformation(extent={{-118,-88},{-98,-68}})));
      equation
        OUT1 = G2.gen.SPEED;
        OUT2 = G2.gASTMPC.PMECH;
        OUT3 = G2.gen.ANGLE;
        OUT4 = G2.gASTMPC.TF2_out;
        OUT5 =Bus6.angle;
        OUT6 =Bus6.v;
        OUT7 =Bus6.p.vr;
        OUT8 =Bus6.p.vi;
        OUT9 = Bus5.v;
        OUT10 = Bus5.angle;
        OUT11 = G2.gen.PELEC;
        connect(T1.p, Bus2.p)
          annotation (Line(points={{-51.2,70},{-40,70}}, color={0,0,255}));
        connect(Bus1.p, T1.n)
          annotation (Line(points={{-80,70},{-68.8,70}}, color={0,0,255}));
        connect(G1.conn, Bus1.p)
          annotation (Line(points={{-91,70},{-80,70}}, color={0,0,255}));
        connect(L1.n, Bus3.p)
          annotation (Line(points={{-14.6,70},{0,70}}, color={0,0,255}));
        connect(L1.p, Bus2.p)
          annotation (Line(points={{-25.4,70},{-40,70}}, color={0,0,255}));
        connect(L2_2.n, Bus4.p) annotation (Line(points={{35.4,60},{44,60},{44,70},{
                60,70}},
                      color={0,0,255}));
        connect(L2_1.n, Bus4.p) annotation (Line(points={{35.4,80},{44,80},{44,70},{
                60,70}},
                      color={0,0,255}));
        connect(L2_1.p, Bus3.p) annotation (Line(points={{24.6,80},{16,80},{16,70},{0,
                70}}, color={0,0,255}));
        connect(L2_2.p, Bus3.p) annotation (Line(points={{24.6,60},{16,60},{16,70},{0,
                70}}, color={0,0,255}));
        connect(G2.conn, Bus6.p)
          annotation (Line(points={{21,-36},{34,-36}}, color={0,0,255}));
        connect(Load1.p, Bus3.p)
          annotation (Line(points={{-10,58},{-10,70},{0,70}}, color={0,0,255}));
        connect(L3.p, Bus4.p)
          annotation (Line(points={{80,55.4},{80,70},{60,70}}, color={0,0,255}));
        connect(breaker.s, Bus5.p)
          annotation (Line(points={{80,12},{80,6}}, color={0,0,255}));
        connect(breaker.r, L3.n)
          annotation (Line(points={{80,20},{80,44.6}},color={0,0,255}));
        connect(T2.n, Bus6.p)
          annotation (Line(points={{50,-24.8},{50,-36},{34,-36}}, color={0,0,255}));
        connect(IN1, AddU1.u1) annotation (Line(points={{-150,0},{-82,0}},
                       color={0,0,127}));
        connect(T2.p, Bus5.p) annotation (Line(points={{50,-7.2},{50,0},{80,0},{80,6}},
              color={0,0,255}));

        connect(IN2,AddU2. u1) annotation (Line(points={{-150,-60},{-82,-60}},
                       color={0,0,127}));
        connect(AddU2.y, G2.Efd_ref)
          annotation (Line(points={{-59,-66},{-10,-66},{-10,-42},{-2,-42}},
                                                                 color={0,0,127}));
        connect(AddU1.y, G2.P_ref1) annotation (Line(points={{-59,-6},{-10,-6},{-10,-30},
                {-2,-30}},                          color={0,0,127}));
        connect(IB.p, Bus4.p)
          annotation (Line(points={{100,70},{60,70}}, color={0,0,255}));
        connect(Load2.p, Bus5.p) annotation (Line(points={{110,-20},{110,0},{80,0},{80,
                6}}, color={0,0,255}));
        connect(sine.y, add.u2) annotation (Line(points={{82.5,-39},{82.5,-34},{85.2,-34},
                {85.2,-28.4}}, color={0,0,127}));
        connect(whiteNoiseInjection.y, add.u1) annotation (Line(points={{82.54,-22.06},
                {82.54,-23.6},{85.2,-23.6}}, color={0,0,127}));
        connect(add.y, Load2.u) annotation (Line(points={{94.4,-26},{94.4,-24.5},{101.9,
                -24.5}}, color={0,0,127}));
        connect(multiplex2_1.y, stateSpace.u)
          annotation (Line(points={{19,-74},{32,-74}}, color={0,0,127}));
        connect(pulse4.y, AddU1.u2) annotation (Line(points={{-103.5,-15},{-88,-15},{-88,
                -12},{-82,-12}}, color={0,0,127}));
        connect(multiplex2_1.u1[1], pulse4.y) annotation (Line(points={{-4,-68},{-50,-68},
                {-50,-30},{-94,-30},{-94,-16},{-98,-16},{-98,-15},{-103.5,-15}},
              color={0,0,127}));
        connect(IN22.y, AddU2.u2) annotation (Line(points={{-97,-78},{-90,-78},{-90,-72},
                {-82,-72}}, color={0,0,127}));
        connect(multiplex2_1.u2[1], IN22.y) annotation (Line(points={{-4,-80},{-90,-80},
                {-90,-78},{-97,-78}}, color={0,0,127}));
          annotation (Placement(transformation(extent={{140,-20},{160,0}})),
                      Placement(transformation(extent={{140,-40},{160,-20}})),
                      Placement(transformation(extent={{140,-60},{160,-40}})),
                      Placement(transformation(extent={{140,-80},{160,-60}})),
                     Diagram(coordinateSystem(preserveAspectRatio=false,
                extent={{-140,-120},{140,120}}), graphics={
              Rectangle(
                extent={{130,88},{166,-112}},
                lineColor={0,140,72},
                lineThickness=0.5),
              Rectangle(
                extent={{-158,20},{-134,-80}},
                lineColor={0,140,72},
                lineThickness=0.5),
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
                textString="Linearization Unit"),
              Text(
                extent={{-164,40},{-132,20}},
                textColor={0,140,72},
                textString="Inputs"),
              Text(
                extent={{128,108},{168,88}},
                textColor={0,140,72},
                textString="Outputs")}),
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
</html>"),experiment(
            StopTime=3,
            __Dymola_NumberOfIntervals=5000,
            __Dymola_Algorithm="Dassl"));
      end OptimizationModel03;

      model OptimizationModel04
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
              origin={52,-16})));
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
          t_o=1.01,
          rc_enabled=false) if not equivalentGRID                     annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,16})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,0}), iconTransformation(extent={{-10,-10},{10,10}}, origin=
                 {-150,0})));
        Modelica.Blocks.Sources.Constant IN11(k=0)
          annotation (Placement(transformation(extent={{-120,-40},{-100,-20}})));
        Modelica.Blocks.Math.Add AddU1
          annotation (Placement(transformation(extent={{-80,-16},{-60,4}})));
        Modelica.Blocks.Sources.Constant IN22(k=0)
          annotation (Placement(transformation(extent={{-120,-100},{-100,-80}})));
        Modelica.Blocks.Math.Add AddU2
          annotation (Placement(transformation(extent={{-80,-76},{-60,-56}})));
        Modelica.Blocks.Interfaces.RealInput IN2(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,-60}), iconTransformation(extent={{-10,-10},{10,10}},
                origin={-150,-60})));
      Modelica.Blocks.Interfaces.RealOutput OUT1
          annotation (Placement(transformation(extent={{140,58},{160,78}})));
        Modelica.Blocks.Interfaces.RealOutput OUT2
          annotation (Placement(transformation(extent={{140,38},{160,58}})));
        Modelica.Blocks.Interfaces.RealOutput OUT3
          annotation (Placement(transformation(extent={{140,18},{160,38}})));
        Modelica.Blocks.Interfaces.RealOutput OUT4 annotation (Placement(transformation(extent={{140,-2},{160,18}})));
           Modelica.Blocks.Interfaces.RealOutput OUT5 annotation (Placement(transformation(extent={{140,-22},{160,-2}})));
           Modelica.Blocks.Interfaces.RealOutput OUT6 annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
           Modelica.Blocks.Interfaces.RealOutput OUT7 annotation (Placement(transformation(extent={{140,-60},
                  {160,-40}})));
           Modelica.Blocks.Interfaces.RealOutput OUT8 annotation (Placement(transformation(extent={{140,-80},
                  {160,-60}})));
           Modelica.Blocks.Interfaces.RealOutput OUT9 annotation (Placement(transformation(extent={{140,
                  -100},{160,-80}})));

        PFData.PowerFlow powerFlow(redeclare record PowerFlow =
              OpenIPSL.Examples.ModelPredictiveControl.PFData.PF04)
          annotation (Placement(transformation(extent={{-68,94},{-48,114}})));
        Electrical.Machines.PSSE.GENCLS IB(
          V_b=220000,
          v_0=powerFlow.powerflow.bus.V4,
          angle_0=powerFlow.powerflow.bus.A4,
          P_0=powerFlow.powerflow.machines.Pinf,
          Q_0=powerFlow.powerflow.machines.Qinf,
          M_b=100000000,
          X_d=1) if not equivalentGRID annotation (Placement(transformation(extent={{110,60},{100,80}})));
        Electrical.Loads.PSSE.Load          Load2(
          P_0=powerFlow.powerflow.loads.PL2,
          Q_0=powerFlow.powerflow.loads.QL2,
          v_0=powerFlow.powerflow.bus.V5,
          angle_0=powerFlow.powerflow.bus.A5)
                    if not equivalentGRID
          annotation (Placement(transformation(extent={{98,-40},{118,-20}})));
        inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false,
            fixedSeed=10000)
          annotation (Placement(transformation(extent={{-42,92},{-22,112}})));
      equation
        OUT1 = G2.gen.SPEED;
        OUT2 = G2.gASTMPC.PMECH;
        OUT3 = G2.gen.ANGLE;
        OUT4 = G2.gASTMPC.TF2_out;
        OUT5 = B6.angle;
        OUT6 = B6.v;
        OUT7 = B6.p.vr;
        OUT8 = B6.p.vi;
        OUT9 = G2.gen.PELEC;
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
          annotation (Line(points={{52,-24.8},{52,-36},{34,-36}},
                                                         color={0,0,255}));
        connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-30},{-90,-30},{-90,-12},
                {-82,-12}}, color={0,0,127}));
        connect(IN1, AddU1.u1) annotation (Line(points={{-150,0},{-82,0}},
                       color={0,0,127}));
        connect(T2.p,B5. p) annotation (Line(points={{52,-7.2},{52,0},{80,0},{80,6}},
                              color={0,0,255}));

        connect(IN22.y,AddU2. u2) annotation (Line(points={{-99,-90},{-90,-90},{-90,-72},
                {-82,-72}},
                       color={0,0,127}));
        connect(IN2,AddU2. u1) annotation (Line(points={{-150,-60},{-82,-60}},
                       color={0,0,127}));
        connect(AddU2.y, G2.Efd_ref)
          annotation (Line(points={{-59,-66},{-10,-66},{-10,-42},{-2,-42}},
                                                                 color={0,0,127}));
        connect(AddU1.y, G2.P_ref1) annotation (Line(points={{-59,-6},{-10,-6},{-10,-30},
                {-2,-30}},                          color={0,0,127}));
        connect(IB.p, B4.p)
          annotation (Line(points={{100,70},{60,70}}, color={0,0,255}));
        connect(Load2.p, B5.p) annotation (Line(points={{108,-20},{108,0},{80,0},{80,
                6}},
              color={0,0,255}));
          annotation (Placement(transformation(extent={{140,-20},{160,0}})),
                      Placement(transformation(extent={{140,-40},{160,-20}})),
                      Placement(transformation(extent={{140,-60},{160,-40}})),
                      Placement(transformation(extent={{140,-80},{160,-60}})),
                     Diagram(coordinateSystem(preserveAspectRatio=false,
                extent={{-140,-120},{140,120}}), graphics={
              Rectangle(
                extent={{130,88},{166,-112}},
                lineColor={0,140,72},
                lineThickness=0.5),
              Rectangle(
                extent={{-158,20},{-134,-80}},
                lineColor={0,140,72},
                lineThickness=0.5),
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
                extent={{12,-84},{68,-112}},
                textColor={0,140,72},
                textString="DER Plant"),
              Text(
                extent={{-164,40},{-132,20}},
                textColor={0,140,72},
                textString="Inputs"),
              Text(
                extent={{128,108},{168,88}},
                textColor={0,140,72},
                textString="Outputs")}),
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
</html>"),experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
      end OptimizationModel04;

      model OptimizationModel05
        "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
        extends Modelica.Icons.Example;

        parameter Boolean equivalentGRID = false;
        parameter Boolean equivalentsystem = false;

        OpenIPSL.Electrical.Buses.Bus Bus1(v_0=powerFlow.powerflow.bus.V1, angle_0=
              powerFlow.powerflow.bus.A1) if not equivalentGRID
          annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus2(v_0=powerFlow.powerflow.bus.V2, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus3(v_0=powerFlow.powerflow.bus.V3, angle_0=
              powerFlow.powerflow.bus.A3) if not equivalentGRID
          annotation (Placement(transformation(extent={{-10,60},{10,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus4(v_0=powerFlow.powerflow.bus.V4, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus5(angle_0=powerFlow.powerflow.bus.A5, v_0=
              powerFlow.powerflow.bus.V5)  annotation (Placement(
              transformation(
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
        OpenIPSL.Electrical.Buses.Bus Bus6(v_0=powerFlow.powerflow.bus.V6, angle_0=
              powerFlow.powerflow.bus.A6) annotation (Placement(transformation(
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
          X=0.1)  annotation (Placement(transformation(
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
          annotation (Placement(transformation(extent={{-20,38},{0,58}})));
        Electrical.Events.Breaker breaker(enableTrigger=false,
          t_o=100.01,
          rc_enabled=true,
          t_rc=800.01)      if not equivalentGRID                     annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,16})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,0}), iconTransformation(extent={{-10,-10},{10,10}}, origin=
                 {-150,0})));
        Modelica.Blocks.Sources.Constant IN11(k=0)
          annotation (Placement(transformation(extent={{-120,-40},{-100,-20}})));
        Modelica.Blocks.Math.Add AddU1
          annotation (Placement(transformation(extent={{-80,-16},{-60,4}})));
        Modelica.Blocks.Sources.Constant IN22(k=0)
          annotation (Placement(transformation(extent={{-120,-100},{-100,-80}})));
        Modelica.Blocks.Math.Add AddU2
          annotation (Placement(transformation(extent={{-80,-76},{-60,-56}})));
        Modelica.Blocks.Interfaces.RealInput IN2(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,-60}), iconTransformation(extent={{-10,-10},{10,10}},
                origin={-150,-60})));
        Modelica.Blocks.Interfaces.RealOutput OUT1
          annotation (Placement(transformation(extent={{140,58},{160,78}})));
       Modelica.Blocks.Interfaces.RealOutput OUT2
          annotation (Placement(transformation(extent={{140,38},{160,58}})));
        Modelica.Blocks.Interfaces.RealOutput OUT3
          annotation (Placement(transformation(extent={{140,18},{160,38}})));
        Modelica.Blocks.Interfaces.RealOutput OUT4
          annotation (Placement(transformation(extent={{140,-2},{160,18}})));
        Modelica.Blocks.Interfaces.RealOutput OUT5
          annotation (Placement(transformation(extent={{140,-22},{160,-2}})));
        Modelica.Blocks.Interfaces.RealOutput OUT6
          annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT7
          annotation (Placement(transformation(extent={{140,-62},
                  {160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT8
          annotation (Placement(transformation(extent={{140,-82},
                  {160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT9    annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT10   annotation (Placement(transformation(extent={{140,-62},{160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT11  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT12    annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT13   annotation (Placement(transformation(extent={{140,-62},{160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT14  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT15  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));

        PFData.PowerFlow powerFlow(redeclare record PowerFlow =
              OpenIPSL.Examples.ModelPredictiveControl.PFData.PF02)
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
          d_t=1000)
          annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
        Electrical.Loads.NoiseInjections.WhiteNoiseInjection whiteNoiseInjection(
            active_sigma=0.0000000005,
                                  samplePeriod=0.02)
          annotation (Placement(transformation(extent={{70,-30},{82,-18}})));

        inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false,
            fixedSeed=10000)
          annotation (Placement(transformation(extent={{-42,92},{-22,112}})));
        Modelica.Blocks.Sources.Sine sine(
          amplitude=0,
          f=1/260,
          phase=3.1415926535898,
          startTime=5.5)
          annotation (Placement(transformation(extent={{72,-44},{82,-34}})));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(extent={{86,-30},{94,-22}})));

      equation

        OUT1 = G2.gen.w;
        OUT2 = G2.gen.delta;
        OUT3 = G2.gen.Epq;
        OUT4 = G2.gen.PSIkd;
        OUT5 = G2.gen.PSIppq;
        OUT6 = G2.sEXSMPC.simpleLagLim.state;
        OUT7 = G2.sEXSMPC.leadLag.TF.x[1];
        OUT8 = G2.gASTMPC.simpleLagLim.state;
        OUT9 = G2.gASTMPC.simpleLag.state;
        OUT10 = G2.gASTMPC.simpleLag1.state;
        OUT11 = G2.gASTMPC.PMECH;
        OUT12 = G2.sEXSMPC.EFD;
        OUT13 = Bus5.v;
        OUT14 = Bus5.angle;
        OUT15 = G2.gen.P;

        connect(T1.p, Bus2.p)
          annotation (Line(points={{-51.2,70},{-40,70}}, color={0,0,255}));
        connect(Bus1.p, T1.n)
          annotation (Line(points={{-80,70},{-68.8,70}}, color={0,0,255}));
        connect(G1.conn, Bus1.p)
          annotation (Line(points={{-91,70},{-80,70}}, color={0,0,255}));
        connect(L1.n, Bus3.p)
          annotation (Line(points={{-14.6,70},{0,70}}, color={0,0,255}));
        connect(L1.p, Bus2.p)
          annotation (Line(points={{-25.4,70},{-40,70}}, color={0,0,255}));
        connect(L2_2.n, Bus4.p) annotation (Line(points={{35.4,60},{44,60},{44,70},{
                60,70}},
                      color={0,0,255}));
        connect(L2_1.n, Bus4.p) annotation (Line(points={{35.4,80},{44,80},{44,70},{
                60,70}},
                      color={0,0,255}));
        connect(L2_1.p, Bus3.p) annotation (Line(points={{24.6,80},{16,80},{16,70},{0,
                70}}, color={0,0,255}));
        connect(L2_2.p, Bus3.p) annotation (Line(points={{24.6,60},{16,60},{16,70},{0,
                70}}, color={0,0,255}));
        connect(G2.conn, Bus6.p)
          annotation (Line(points={{21,-36},{34,-36}}, color={0,0,255}));
        connect(Load1.p, Bus3.p)
          annotation (Line(points={{-10,58},{-10,70},{0,70}}, color={0,0,255}));
        connect(L3.p, Bus4.p)
          annotation (Line(points={{80,55.4},{80,70},{60,70}}, color={0,0,255}));
        connect(breaker.s, Bus5.p)
          annotation (Line(points={{80,12},{80,6}}, color={0,0,255}));
        connect(breaker.r, L3.n)
          annotation (Line(points={{80,20},{80,44.6}},color={0,0,255}));
        connect(T2.n, Bus6.p)
          annotation (Line(points={{50,-24.8},{50,-36},{34,-36}}, color={0,0,255}));
        connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-30},{-90,-30},{-90,-12},
                {-82,-12}}, color={0,0,127}));
        connect(IN1, AddU1.u1) annotation (Line(points={{-150,0},{-82,0}},
                       color={0,0,127}));
        connect(T2.p, Bus5.p) annotation (Line(points={{50,-7.2},{50,0},{80,0},{80,6}},
              color={0,0,255}));

        connect(IN22.y,AddU2. u2) annotation (Line(points={{-99,-90},{-90,-90},{-90,-72},
                {-82,-72}},
                       color={0,0,127}));
        connect(IN2,AddU2. u1) annotation (Line(points={{-150,-60},{-82,-60}},
                       color={0,0,127}));
        connect(AddU2.y, G2.Efd_ref)
          annotation (Line(points={{-59,-66},{-10,-66},{-10,-42},{-2,-42}},
                                                                 color={0,0,127}));
        connect(AddU1.y, G2.P_ref1) annotation (Line(points={{-59,-6},{-10,-6},{-10,-30},
                {-2,-30}},                          color={0,0,127}));
        connect(IB.p, Bus4.p)
          annotation (Line(points={{100,70},{60,70}}, color={0,0,255}));
        connect(Load2.p, Bus5.p) annotation (Line(points={{110,-20},{110,0},{80,0},{80,
                6}}, color={0,0,255}));
        connect(sine.y, add.u2) annotation (Line(points={{82.5,-39},{82.5,-34},{85.2,-34},
                {85.2,-28.4}}, color={0,0,127}));
        connect(whiteNoiseInjection.y, add.u1) annotation (Line(points={{82.54,-24.06},
                {82.54,-23.6},{85.2,-23.6}}, color={0,0,127}));
        connect(add.y, Load2.u) annotation (Line(points={{94.4,-26},{94.4,-24.5},{101.9,
                -24.5}}, color={0,0,127}));
          annotation (Placement(transformation(extent={{140,-20},{160,0}})),
                      Placement(transformation(extent={{140,-40},{160,-20}})),
                      Placement(transformation(extent={{140,-60},{160,-40}})),
                      Placement(transformation(extent={{140,-80},{160,-60}})),
                     Diagram(coordinateSystem(preserveAspectRatio=false,
                extent={{-140,-120},{140,120}}), graphics={
              Rectangle(
                extent={{130,88},{166,-112}},
                lineColor={0,140,72},
                lineThickness=0.5),
              Rectangle(
                extent={{-158,20},{-134,-80}},
                lineColor={0,140,72},
                lineThickness=0.5),
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
                textString="Linearization Unit"),
              Text(
                extent={{-164,40},{-132,20}},
                textColor={0,140,72},
                textString="Inputs"),
              Text(
                extent={{128,108},{168,88}},
                textColor={0,140,72},
                textString="Outputs")}),
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
</html>"),experiment(Interval=0.5, __Dymola_Algorithm="Dassl"));
      end OptimizationModel05;

      model OptimizationModel06
        "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
        extends Modelica.Icons.Example;

        parameter Boolean equivalentGRID = false;
        parameter Boolean equivalentsystem = false;

        OpenIPSL.Electrical.Buses.Bus Bus1(v_0=powerFlow.powerflow.bus.V1, angle_0=
              powerFlow.powerflow.bus.A1) if not equivalentGRID
          annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus2(v_0=powerFlow.powerflow.bus.V2, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus3(v_0=powerFlow.powerflow.bus.V3, angle_0=
              powerFlow.powerflow.bus.A3) if not equivalentGRID
          annotation (Placement(transformation(extent={{-10,60},{10,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus4(v_0=powerFlow.powerflow.bus.V4, angle_0=
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
        inner OpenIPSL.Electrical.SystemBase SysData(S_b=100000000, fn=60)
          annotation (Placement(transformation(extent={{-128,94},{-74,114}})));
        OpenIPSL.Electrical.Loads.PSSE.Load Load1(
          V_b=220000,
          P_0=powerFlow.powerflow.loads.PL1,
          Q_0=powerFlow.powerflow.loads.QL1,
          v_0=powerFlow.powerflow.bus.V3,
          angle_0=powerFlow.powerflow.bus.A3) if not equivalentGRID
          annotation (Placement(transformation(extent={{-20,38},{0,58}})));

        PFData.PowerFlow powerFlow(redeclare record PowerFlow =
              OpenIPSL.Examples.ModelPredictiveControl.PFData.PF06)
          annotation (Placement(transformation(extent={{-68,94},{-48,114}})));
        Electrical.Machines.PSSE.GENCLS IB(
          V_b=220000,
          v_0=powerFlow.powerflow.bus.V4,
          angle_0=powerFlow.powerflow.bus.A4,
          P_0=powerFlow.powerflow.machines.Pinf,
          Q_0=powerFlow.powerflow.machines.Qinf,
          M_b=100000000,
          X_d=1) if not equivalentGRID annotation (Placement(transformation(extent={{110,60},{100,80}})));

        inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false,
            fixedSeed=10000)
          annotation (Placement(transformation(extent={{-42,92},{-22,112}})));

      equation

        connect(T1.p, Bus2.p)
          annotation (Line(points={{-51.2,70},{-40,70}}, color={0,0,255}));
        connect(Bus1.p, T1.n)
          annotation (Line(points={{-80,70},{-68.8,70}}, color={0,0,255}));
        connect(G1.conn, Bus1.p)
          annotation (Line(points={{-91,70},{-80,70}}, color={0,0,255}));
        connect(L1.n, Bus3.p)
          annotation (Line(points={{-14.6,70},{0,70}}, color={0,0,255}));
        connect(L1.p, Bus2.p)
          annotation (Line(points={{-25.4,70},{-40,70}}, color={0,0,255}));
        connect(L2_2.n, Bus4.p) annotation (Line(points={{35.4,60},{44,60},{44,70},{
                60,70}},
                      color={0,0,255}));
        connect(L2_1.n, Bus4.p) annotation (Line(points={{35.4,80},{44,80},{44,70},{
                60,70}},
                      color={0,0,255}));
        connect(L2_1.p, Bus3.p) annotation (Line(points={{24.6,80},{16,80},{16,70},{0,
                70}}, color={0,0,255}));
        connect(L2_2.p, Bus3.p) annotation (Line(points={{24.6,60},{16,60},{16,70},{0,
                70}}, color={0,0,255}));
        connect(Load1.p, Bus3.p)
          annotation (Line(points={{-10,58},{-10,70},{0,70}}, color={0,0,255}));

        connect(IB.p, Bus4.p)
          annotation (Line(points={{100,70},{60,70}}, color={0,0,255}));
          annotation (Placement(transformation(extent={{140,-20},{160,0}})),
                      Placement(transformation(extent={{140,-40},{160,-20}})),
                      Placement(transformation(extent={{140,-60},{160,-40}})),
                      Placement(transformation(extent={{140,-80},{160,-60}})),
                     Diagram(coordinateSystem(preserveAspectRatio=false,
                extent={{-140,-120},{140,120}}), graphics={
              Rectangle(
                extent={{130,88},{166,-112}},
                lineColor={0,140,72},
                lineThickness=0.5),
              Rectangle(
                extent={{-158,20},{-134,-80}},
                lineColor={0,140,72},
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
                textString="Linearization Unit"),
              Text(
                extent={{-164,40},{-132,20}},
                textColor={0,140,72},
                textString="Inputs"),
              Text(
                extent={{128,108},{168,88}},
                textColor={0,140,72},
                textString="Outputs")}),
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
</html>"),experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
      end OptimizationModel06;

      model OptimizationModel07
        "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
        extends Modelica.Icons.Example;

        parameter Boolean equivalentGRID = true;
        parameter Boolean equivalentsystem = false;

        OpenIPSL.Electrical.Buses.Bus Bus1(v_0=powerFlow.powerflow.bus.V1, angle_0=
              powerFlow.powerflow.bus.A1) if not equivalentGRID
          annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus2(v_0=powerFlow.powerflow.bus.V2, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus3(v_0=powerFlow.powerflow.bus.V3, angle_0=
              powerFlow.powerflow.bus.A3) if not equivalentGRID
          annotation (Placement(transformation(extent={{-10,60},{10,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus4(v_0=powerFlow.powerflow.bus.V4, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus5(angle_0=powerFlow.powerflow.bus.A5, v_0=
              powerFlow.powerflow.bus.V5)  annotation (Placement(
              transformation(
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
        OpenIPSL.Electrical.Buses.Bus Bus6(v_0=powerFlow.powerflow.bus.V6, angle_0=
              powerFlow.powerflow.bus.A6) annotation (Placement(transformation(
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
          X=0.1)  annotation (Placement(transformation(
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
          annotation (Placement(transformation(extent={{-20,38},{0,58}})));
        Electrical.Events.Breaker breaker(enableTrigger=false,
          t_o=5.01,
          rc_enabled=true,
          t_rc=80.01)       if not equivalentGRID                     annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,16})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,0}), iconTransformation(extent={{-10,-10},{10,10}}, origin=
                 {-150,0})));
        Modelica.Blocks.Sources.Constant IN11(k=0)
          annotation (Placement(transformation(extent={{-120,-40},{-100,-20}})));
        Modelica.Blocks.Math.Add AddU1
          annotation (Placement(transformation(extent={{-80,-16},{-60,4}})));
        Modelica.Blocks.Sources.Constant IN22(k=0)
          annotation (Placement(transformation(extent={{-120,-100},{-100,-80}})));
        Modelica.Blocks.Math.Add AddU2
          annotation (Placement(transformation(extent={{-80,-76},{-60,-56}})));
        Modelica.Blocks.Interfaces.RealInput IN2(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,-60}), iconTransformation(extent={{-10,-10},{10,10}},
                origin={-150,-60})));
        Modelica.Blocks.Interfaces.RealOutput OUT1
          annotation (Placement(transformation(extent={{140,58},{160,78}})));
       Modelica.Blocks.Interfaces.RealOutput OUT2
          annotation (Placement(transformation(extent={{140,38},{160,58}})));
        Modelica.Blocks.Interfaces.RealOutput OUT3
          annotation (Placement(transformation(extent={{140,18},{160,38}})));
        Modelica.Blocks.Interfaces.RealOutput OUT4
          annotation (Placement(transformation(extent={{140,-2},{160,18}})));
        Modelica.Blocks.Interfaces.RealOutput OUT5
          annotation (Placement(transformation(extent={{140,-22},{160,-2}})));
        Modelica.Blocks.Interfaces.RealOutput OUT6
          annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT7
          annotation (Placement(transformation(extent={{140,-62},
                  {160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT8
          annotation (Placement(transformation(extent={{140,-82},{160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT9    annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT10   annotation (Placement(transformation(extent={{140,-62},{160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT11  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT12    annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT13   annotation (Placement(transformation(extent={{140,-62},{160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT14  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT15  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));

        PFData.PowerFlow powerFlow(redeclare record PowerFlow =
              OpenIPSL.Examples.ModelPredictiveControl.PFData.PF01)
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
          d_t=1000)
          annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
        Electrical.Loads.NoiseInjections.WhiteNoiseInjection whiteNoiseInjection(
            active_sigma=0.0005,  samplePeriod=0.02)
          annotation (Placement(transformation(extent={{70,-30},{82,-18}})));

        inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false,
            fixedSeed=10000)
          annotation (Placement(transformation(extent={{-42,92},{-22,112}})));
        Modelica.Blocks.Sources.Sine sine(
          amplitude=0.01,
          f=1/260,
          phase=3.1415926535898,
          startTime=5.5)
          annotation (Placement(transformation(extent={{72,-44},{82,-34}})));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(extent={{86,-30},{94,-22}})));

        Modelica.Blocks.Continuous.Filter filter(order=2, f_cut=0.1)
          annotation (Placement(transformation(extent={{-116,-150},{-96,-130}})));
        Modelica.Blocks.Sources.RealExpression realExpression(y=G2.gen.w)
          annotation (Placement(transformation(extent={{-152,-150},{-132,-130}})));
        Modelica.Blocks.Continuous.Filter filter1(order=2, f_cut=0.1)
          annotation (Placement(transformation(extent={{-116,-184},{-96,-164}})));
        Modelica.Blocks.Sources.RealExpression realExpression1(y=G2.sEXSMPC.leadLag.TF.x[
              1])
          annotation (Placement(transformation(extent={{-152,-184},{-132,-164}})));
        Modelica.Blocks.Continuous.Filter filter2(order=2, f_cut=0.1)
          annotation (Placement(transformation(extent={{-40,-150},{-20,-130}})));
        Modelica.Blocks.Sources.RealExpression realExpression2(y=G2.gASTMPC.simpleLag1.state)
          annotation (Placement(transformation(extent={{-76,-148},{-56,-128}})));
        Modelica.Blocks.Continuous.Filter filter3(order=2, f_cut=0.1)
          annotation (Placement(transformation(extent={{-40,-184},{-20,-164}})));
        Modelica.Blocks.Sources.RealExpression realExpression3(y=G2.gASTMPC.PMECH)
          annotation (Placement(transformation(extent={{-76,-184},{-56,-164}})));
        Modelica.Blocks.Continuous.Filter filter4(order=2, f_cut=0.1)
          annotation (Placement(transformation(extent={{36,-150},{56,-130}})));
        Modelica.Blocks.Sources.RealExpression realExpression4(y=G2.sEXSMPC.EFD)
          annotation (Placement(transformation(extent={{0,-150},{20,-130}})));
        Modelica.Blocks.Continuous.Filter filter5(order=2, f_cut=0.1)
          annotation (Placement(transformation(extent={{38,-184},{58,-164}})));
        Modelica.Blocks.Sources.RealExpression realExpression5(y=Bus5.v)
          annotation (Placement(transformation(extent={{0,-184},{20,-164}})));
        Modelica.Blocks.Continuous.Filter filter6(order=2, f_cut=0.1)
          annotation (Placement(transformation(extent={{108,-150},{128,-130}})));
        Modelica.Blocks.Sources.RealExpression realExpression6(y=Bus5.angle)
          annotation (Placement(transformation(extent={{70,-150},{90,-130}})));
        Modelica.Blocks.Continuous.Filter filter7(order=2, f_cut=0.1)
          annotation (Placement(transformation(extent={{110,-184},{130,-164}})));
        Modelica.Blocks.Sources.RealExpression realExpression7(y=G2.gen.P)
          annotation (Placement(transformation(extent={{72,-184},{92,-164}})));
          Modelica.Blocks.Continuous.Filter filter8(order=2, f_cut=0.1)
          annotation (Placement(transformation(extent={{38,-222},{58,-202}})));
        Modelica.Blocks.Sources.RealExpression realExpression8(y=G2.gen.P)
          annotation (Placement(transformation(extent={{2,-222},{22,-202}})));
          Modelica.Blocks.Continuous.Filter filter9(order=2, f_cut=0.1)
          annotation (Placement(transformation(extent={{114,-222},{134,-202}})));
        Modelica.Blocks.Sources.RealExpression realExpression9(y=G2.gen.P)
          annotation (Placement(transformation(extent={{70,-222},{90,-202}})));
      equation

        OUT1 = G2.gen.w;
        OUT2 = G2.gen.delta;
        OUT3 = G2.gen.Epq;
        OUT4 = G2.gen.PSIkd;
        OUT5 = G2.gen.PSIppq;
        OUT6 = G2.sEXSMPC.simpleLagLim.state;
        OUT7 = G2.sEXSMPC.leadLag.TF.x[1];
        OUT8 = G2.gASTMPC.simpleLagLim.state;
        OUT9 = G2.gASTMPC.simpleLag.state;
        OUT10 = G2.gASTMPC.simpleLag1.state;
        OUT11 = G2.gASTMPC.PMECH;
        OUT12 = G2.sEXSMPC.EFD;
        OUT13 = Bus5.v;
        OUT14 = Bus5.angle;
        OUT15 = G2.gen.P;

        connect(T1.p, Bus2.p)
          annotation (Line(points={{-51.2,70},{-40,70}}, color={0,0,255}));
        connect(Bus1.p, T1.n)
          annotation (Line(points={{-80,70},{-68.8,70}}, color={0,0,255}));
        connect(G1.conn, Bus1.p)
          annotation (Line(points={{-91,70},{-80,70}}, color={0,0,255}));
        connect(L1.n, Bus3.p)
          annotation (Line(points={{-14.6,70},{0,70}}, color={0,0,255}));
        connect(L1.p, Bus2.p)
          annotation (Line(points={{-25.4,70},{-40,70}}, color={0,0,255}));
        connect(L2_2.n, Bus4.p) annotation (Line(points={{35.4,60},{44,60},{44,70},{
                60,70}},
                      color={0,0,255}));
        connect(L2_1.n, Bus4.p) annotation (Line(points={{35.4,80},{44,80},{44,70},{
                60,70}},
                      color={0,0,255}));
        connect(L2_1.p, Bus3.p) annotation (Line(points={{24.6,80},{16,80},{16,70},{0,
                70}}, color={0,0,255}));
        connect(L2_2.p, Bus3.p) annotation (Line(points={{24.6,60},{16,60},{16,70},{0,
                70}}, color={0,0,255}));
        connect(G2.conn, Bus6.p)
          annotation (Line(points={{21,-36},{34,-36}}, color={0,0,255}));
        connect(Load1.p, Bus3.p)
          annotation (Line(points={{-10,58},{-10,70},{0,70}}, color={0,0,255}));
        connect(L3.p, Bus4.p)
          annotation (Line(points={{80,55.4},{80,70},{60,70}}, color={0,0,255}));
        connect(breaker.s, Bus5.p)
          annotation (Line(points={{80,12},{80,6}}, color={0,0,255}));
        connect(breaker.r, L3.n)
          annotation (Line(points={{80,20},{80,44.6}},color={0,0,255}));
        connect(T2.n, Bus6.p)
          annotation (Line(points={{50,-24.8},{50,-36},{34,-36}}, color={0,0,255}));
        connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-30},{-90,-30},{-90,-12},
                {-82,-12}}, color={0,0,127}));
        connect(IN1, AddU1.u1) annotation (Line(points={{-150,0},{-82,0}},
                       color={0,0,127}));
        connect(T2.p, Bus5.p) annotation (Line(points={{50,-7.2},{50,0},{80,0},{80,6}},
              color={0,0,255}));

        connect(IN22.y,AddU2. u2) annotation (Line(points={{-99,-90},{-90,-90},{-90,-72},
                {-82,-72}},
                       color={0,0,127}));
        connect(IN2,AddU2. u1) annotation (Line(points={{-150,-60},{-82,-60}},
                       color={0,0,127}));
        connect(AddU2.y, G2.Efd_ref)
          annotation (Line(points={{-59,-66},{-10,-66},{-10,-42},{-2,-42}},
                                                                 color={0,0,127}));
        connect(AddU1.y, G2.P_ref1) annotation (Line(points={{-59,-6},{-10,-6},{-10,-30},
                {-2,-30}},                          color={0,0,127}));
        connect(IB.p, Bus4.p)
          annotation (Line(points={{100,70},{60,70}}, color={0,0,255}));
        connect(Load2.p, Bus5.p) annotation (Line(points={{110,-20},{110,0},{80,0},{80,
                6}}, color={0,0,255}));
        connect(sine.y, add.u2) annotation (Line(points={{82.5,-39},{82.5,-34},{85.2,-34},
                {85.2,-28.4}}, color={0,0,127}));
        connect(whiteNoiseInjection.y, add.u1) annotation (Line(points={{82.54,-24.06},
                {82.54,-23.6},{85.2,-23.6}}, color={0,0,127}));
        connect(add.y, Load2.u) annotation (Line(points={{94.4,-26},{94.4,-24.5},{101.9,
                -24.5}}, color={0,0,127}));
        connect(realExpression.y, filter.u)
          annotation (Line(points={{-131,-140},{-118,-140}}, color={0,0,127}));
        connect(realExpression1.y, filter1.u)
          annotation (Line(points={{-131,-174},{-118,-174}}, color={0,0,127}));
        connect(realExpression2.y, filter2.u)
          annotation (Line(points={{-55,-138},{-48,-138},{-48,-140},{-42,-140}},
                                                           color={0,0,127}));
        connect(realExpression3.y, filter3.u)
          annotation (Line(points={{-55,-174},{-42,-174}}, color={0,0,127}));
        connect(realExpression4.y, filter4.u)
          annotation (Line(points={{21,-140},{34,-140}}, color={0,0,127}));
        connect(realExpression5.y, filter5.u)
          annotation (Line(points={{21,-174},{36,-174}}, color={0,0,127}));
        connect(realExpression6.y, filter6.u)
          annotation (Line(points={{91,-140},{106,-140}}, color={0,0,127}));
        connect(realExpression7.y, filter7.u)
          annotation (Line(points={{93,-174},{108,-174}}, color={0,0,127}));
        connect(realExpression9.y, filter9.u)
          annotation (Line(points={{91,-212},{112,-212}}, color={0,0,127}));
        connect(realExpression8.y, filter8.u)
          annotation (Line(points={{23,-212},{36,-212}}, color={0,0,127}));
          annotation (Placement(transformation(extent={{140,-20},{160,0}})),
                      Placement(transformation(extent={{140,-40},{160,-20}})),
                      Placement(transformation(extent={{140,-60},{160,-40}})),
                      Placement(transformation(extent={{140,-80},{160,-60}})),
                     Diagram(coordinateSystem(preserveAspectRatio=false,
                extent={{-140,-160},{140,120}}), graphics={
              Rectangle(
                extent={{130,88},{166,-112}},
                lineColor={0,140,72},
                lineThickness=0.5),
              Rectangle(
                extent={{-158,20},{-134,-80}},
                lineColor={0,140,72},
                lineThickness=0.5),
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
                textString="Linearization Unit"),
              Text(
                extent={{-164,40},{-132,20}},
                textColor={0,140,72},
                textString="Inputs"),
              Text(
                extent={{128,108},{168,88}},
                textColor={0,140,72},
                textString="Outputs")}),
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
</html>"),experiment(
            StopTime=10,
            __Dymola_NumberOfIntervals=100,
            __Dymola_Algorithm="Dassl"),
          Icon(coordinateSystem(extent={{-140,-160},{140,120}})));
      end OptimizationModel07;

      model OptimizationModel08
        "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
        extends Modelica.Icons.Example;

        parameter Boolean equivalentGRID = false;
        parameter Boolean equivalentsystem = false;

        OpenIPSL.Electrical.Buses.Bus Bus1(v_0=powerFlow.powerflow.bus.V1, angle_0=
              powerFlow.powerflow.bus.A1) if not equivalentGRID
          annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus2(v_0=powerFlow.powerflow.bus.V2, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus3(v_0=powerFlow.powerflow.bus.V3, angle_0=
              powerFlow.powerflow.bus.A3) if not equivalentGRID
          annotation (Placement(transformation(extent={{-10,60},{10,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus4(v_0=powerFlow.powerflow.bus.V4, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus5(angle_0=powerFlow.powerflow.bus.A5, v_0=
              powerFlow.powerflow.bus.V5)  annotation (Placement(
              transformation(
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
        OpenIPSL.Electrical.Buses.Bus Bus6(v_0=powerFlow.powerflow.bus.V6, angle_0=
              powerFlow.powerflow.bus.A6) annotation (Placement(transformation(
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
          X=0.1)  annotation (Placement(transformation(
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
          annotation (Placement(transformation(extent={{-20,38},{0,58}})));
        Electrical.Events.Breaker breaker(enableTrigger=false,
          t_o=5.01,
          rc_enabled=true,
          t_rc=80.01)       if not equivalentGRID                     annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,16})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,0}), iconTransformation(extent={{-10,-10},{10,10}}, origin=
                 {-150,0})));
        Modelica.Blocks.Sources.Constant IN11(k=0)
          annotation (Placement(transformation(extent={{-120,-40},{-100,-20}})));
        Modelica.Blocks.Math.Add AddU1
          annotation (Placement(transformation(extent={{-80,-16},{-60,4}})));
        Modelica.Blocks.Sources.Constant IN22(k=0)
          annotation (Placement(transformation(extent={{-120,-100},{-100,-80}})));
        Modelica.Blocks.Math.Add AddU2
          annotation (Placement(transformation(extent={{-80,-76},{-60,-56}})));
        Modelica.Blocks.Interfaces.RealInput IN2(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,-60}), iconTransformation(extent={{-10,-10},{10,10}},
                origin={-150,-60})));
        Modelica.Blocks.Interfaces.RealOutput OUT1
          annotation (Placement(transformation(extent={{140,58},{160,78}})));
       //Modelica.Blocks.Interfaces.RealOutput OUT2
       //   annotation (Placement(transformation(extent={{140,38},{160,58}})));
       // Modelica.Blocks.Interfaces.RealOutput OUT3
        //  annotation (Placement(transformation(extent={{140,18},{160,38}})));
        //Modelica.Blocks.Interfaces.RealOutput OUT4
         // annotation (Placement(transformation(extent={{140,-2},{160,18}})));
        //Modelica.Blocks.Interfaces.RealOutput OUT5
         // annotation (Placement(transformation(extent={{140,-22},{160,-2}})));
       // Modelica.Blocks.Interfaces.RealOutput OUT6
        //  annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT7
          annotation (Placement(transformation(extent={{140,-62},
                  {160,-42}})));
       // Modelica.Blocks.Interfaces.RealOutput OUT8
       //   annotation (Placement(transformation(extent={{140,-82},
              //    {160,-62}})));
        //Modelica.Blocks.Interfaces.RealOutput OUT9    annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT10   annotation (Placement(transformation(extent={{140,-62},{160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT11  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT12    annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT13   annotation (Placement(transformation(extent={{140,-62},{160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT14  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT15  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));

        PFData.PowerFlow powerFlow(redeclare record PowerFlow =
              OpenIPSL.Examples.ModelPredictiveControl.PFData.PF01)
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
          d_t=1000)
          annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
        Electrical.Loads.NoiseInjections.WhiteNoiseInjection whiteNoiseInjection(
            active_sigma=0.0005,  samplePeriod=0.02)
          annotation (Placement(transformation(extent={{70,-30},{82,-18}})));

        inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false,
            fixedSeed=10000)
          annotation (Placement(transformation(extent={{-42,92},{-22,112}})));
        Modelica.Blocks.Sources.Sine sine(
          amplitude=0.01,
          f=1/260,
          phase=3.1415926535898,
          startTime=5.5)
          annotation (Placement(transformation(extent={{72,-44},{82,-34}})));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(extent={{86,-30},{94,-22}})));

      equation

        OUT1 = G2.gen.w;
        OUT2 = G2.gen.delta;
        OUT3 = G2.gen.Epq;
        OUT4 = G2.gen.PSIkd;
        OUT5 = G2.gen.PSIppq;
        OUT6 = G2.sEXSMPC.simpleLagLim.state;
        OUT7 = G2.sEXSMPC.leadLag.TF.x[1];
        OUT8 = G2.gASTMPC.simpleLagLim.state;
        OUT9 = G2.gASTMPC.simpleLag.state;
        OUT10 = G2.gASTMPC.simpleLag1.state;
        OUT11 = G2.gASTMPC.PMECH;
        OUT12 = G2.sEXSMPC.EFD;
        OUT13 = Bus5.v;
        OUT14 = Bus5.angle;
        OUT15 = G2.gen.P;

        connect(T1.p, Bus2.p)
          annotation (Line(points={{-51.2,70},{-40,70}}, color={0,0,255}));
        connect(Bus1.p, T1.n)
          annotation (Line(points={{-80,70},{-68.8,70}}, color={0,0,255}));
        connect(G1.conn, Bus1.p)
          annotation (Line(points={{-91,70},{-80,70}}, color={0,0,255}));
        connect(L1.n, Bus3.p)
          annotation (Line(points={{-14.6,70},{0,70}}, color={0,0,255}));
        connect(L1.p, Bus2.p)
          annotation (Line(points={{-25.4,70},{-40,70}}, color={0,0,255}));
        connect(L2_2.n, Bus4.p) annotation (Line(points={{35.4,60},{44,60},{44,70},{
                60,70}},
                      color={0,0,255}));
        connect(L2_1.n, Bus4.p) annotation (Line(points={{35.4,80},{44,80},{44,70},{
                60,70}},
                      color={0,0,255}));
        connect(L2_1.p, Bus3.p) annotation (Line(points={{24.6,80},{16,80},{16,70},{0,
                70}}, color={0,0,255}));
        connect(L2_2.p, Bus3.p) annotation (Line(points={{24.6,60},{16,60},{16,70},{0,
                70}}, color={0,0,255}));
        connect(G2.conn, Bus6.p)
          annotation (Line(points={{21,-36},{34,-36}}, color={0,0,255}));
        connect(Load1.p, Bus3.p)
          annotation (Line(points={{-10,58},{-10,70},{0,70}}, color={0,0,255}));
        connect(L3.p, Bus4.p)
          annotation (Line(points={{80,55.4},{80,70},{60,70}}, color={0,0,255}));
        connect(breaker.s, Bus5.p)
          annotation (Line(points={{80,12},{80,6}}, color={0,0,255}));
        connect(breaker.r, L3.n)
          annotation (Line(points={{80,20},{80,44.6}},color={0,0,255}));
        connect(T2.n, Bus6.p)
          annotation (Line(points={{50,-24.8},{50,-36},{34,-36}}, color={0,0,255}));
        connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-30},{-90,-30},{-90,-12},
                {-82,-12}}, color={0,0,127}));
        connect(IN1, AddU1.u1) annotation (Line(points={{-150,0},{-82,0}},
                       color={0,0,127}));
        connect(T2.p, Bus5.p) annotation (Line(points={{50,-7.2},{50,0},{80,0},{80,6}},
              color={0,0,255}));

        connect(IN22.y,AddU2. u2) annotation (Line(points={{-99,-90},{-90,-90},{-90,-72},
                {-82,-72}},
                       color={0,0,127}));
        connect(IN2,AddU2. u1) annotation (Line(points={{-150,-60},{-82,-60}},
                       color={0,0,127}));
        connect(AddU2.y, G2.Efd_ref)
          annotation (Line(points={{-59,-66},{-10,-66},{-10,-42},{-2,-42}},
                                                                 color={0,0,127}));
        connect(AddU1.y, G2.P_ref1) annotation (Line(points={{-59,-6},{-10,-6},{-10,-30},
                {-2,-30}},                          color={0,0,127}));
        connect(IB.p, Bus4.p)
          annotation (Line(points={{100,70},{60,70}}, color={0,0,255}));
        connect(Load2.p, Bus5.p) annotation (Line(points={{110,-20},{110,0},{80,0},{80,
                6}}, color={0,0,255}));
        connect(sine.y, add.u2) annotation (Line(points={{82.5,-39},{82.5,-34},{85.2,-34},
                {85.2,-28.4}}, color={0,0,127}));
        connect(whiteNoiseInjection.y, add.u1) annotation (Line(points={{82.54,-24.06},
                {82.54,-23.6},{85.2,-23.6}}, color={0,0,127}));
        connect(add.y, Load2.u) annotation (Line(points={{94.4,-26},{94.4,-24.5},{101.9,
                -24.5}}, color={0,0,127}));
          annotation (Placement(transformation(extent={{140,-20},{160,0}})),
                      Placement(transformation(extent={{140,-40},{160,-20}})),
                      Placement(transformation(extent={{140,-60},{160,-40}})),
                      Placement(transformation(extent={{140,-80},{160,-60}})),
                     Diagram(coordinateSystem(preserveAspectRatio=false,
                extent={{-140,-120},{140,120}}), graphics={
              Rectangle(
                extent={{130,88},{166,-112}},
                lineColor={0,140,72},
                lineThickness=0.5),
              Rectangle(
                extent={{-158,20},{-134,-80}},
                lineColor={0,140,72},
                lineThickness=0.5),
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
                textString="Linearization Unit"),
              Text(
                extent={{-164,40},{-132,20}},
                textColor={0,140,72},
                textString="Inputs"),
              Text(
                extent={{128,108},{168,88}},
                textColor={0,140,72},
                textString="Outputs")}),
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
</html>"),experiment(
            StopTime=10,
            __Dymola_NumberOfIntervals=100,
            __Dymola_Algorithm="Dassl"));
      end OptimizationModel08;

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
              OpenIPSL.Examples.ModelPredictiveControl.PFData.PF03)
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
</html>"),experiment(
            StopTime=25,
            __Dymola_NumberOfIntervals=1000,
            __Dymola_Algorithm="Dassl"));
      end OptimizationCheck;

      model OptimizationModel10 "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
        extends Modelica.Icons.Example;

        parameter Boolean equivalentGRID = false;
        parameter Boolean equivalentsystem = false;

        OpenIPSL.Electrical.Buses.Bus Bus1(v_0=powerFlow.powerflow.bus.V1, angle_0=
              powerFlow.powerflow.bus.A1) if not equivalentGRID
          annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus2(v_0=powerFlow.powerflow.bus.V2, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus3(v_0=powerFlow.powerflow.bus.V3, angle_0=
              powerFlow.powerflow.bus.A3) if not equivalentGRID
          annotation (Placement(transformation(extent={{-10,60},{10,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus4(v_0=powerFlow.powerflow.bus.V4, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus5(angle_0=powerFlow.powerflow.bus.A5, v_0=
              powerFlow.powerflow.bus.V5)  annotation (Placement(
              transformation(
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
        OpenIPSL.Electrical.Buses.Bus Bus6(v_0=powerFlow.powerflow.bus.V6, angle_0=
              powerFlow.powerflow.bus.A6) annotation (Placement(transformation(
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
          X=0.1)  annotation (Placement(transformation(
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
          annotation (Placement(transformation(extent={{-20,38},{0,58}})));
        Electrical.Events.Breaker breaker(enableTrigger=false,
          t_o=5.01,
          rc_enabled=true,
          t_rc=80.01)       if not equivalentGRID                     annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,16})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,0}), iconTransformation(extent={{-10,-10},{10,10}}, origin=
                 {-150,0})));
        Modelica.Blocks.Sources.Constant IN11(k=0)
          annotation (Placement(transformation(extent={{-120,-40},{-100,-20}})));
        Modelica.Blocks.Math.Add AddU1
          annotation (Placement(transformation(extent={{-80,-16},{-60,4}})));
        Modelica.Blocks.Sources.Constant IN22(k=0)
          annotation (Placement(transformation(extent={{-120,-100},{-100,-80}})));
        Modelica.Blocks.Math.Add AddU2
          annotation (Placement(transformation(extent={{-80,-76},{-60,-56}})));
        Modelica.Blocks.Interfaces.RealInput IN2(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,-60}), iconTransformation(extent={{-10,-10},{10,10}},
                origin={-150,-60})));
        Modelica.Blocks.Interfaces.RealOutput OUT1
          annotation (Placement(transformation(extent={{140,58},{160,78}})));
       Modelica.Blocks.Interfaces.RealOutput OUT2
          annotation (Placement(transformation(extent={{140,38},{160,58}})));
        Modelica.Blocks.Interfaces.RealOutput OUT3
          annotation (Placement(transformation(extent={{140,18},{160,38}})));
        Modelica.Blocks.Interfaces.RealOutput OUT4
          annotation (Placement(transformation(extent={{140,-2},{160,18}})));
        Modelica.Blocks.Interfaces.RealOutput OUT5
          annotation (Placement(transformation(extent={{140,-22},{160,-2}})));
        Modelica.Blocks.Interfaces.RealOutput OUT6
          annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT7
          annotation (Placement(transformation(extent={{140,-62},
                  {160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT8
          annotation (Placement(transformation(extent={{140,-82},
                  {160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT9    annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT10   annotation (Placement(transformation(extent={{140,-62},{160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT11  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT12    annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT13   annotation (Placement(transformation(extent={{140,-62},{160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT14  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT15  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));

        PFData.PowerFlow powerFlow(redeclare record PowerFlow =
              OpenIPSL.Examples.ModelPredictiveControl.PFData.PF01)
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
          d_t=1000)
          annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
        Electrical.Loads.NoiseInjections.WhiteNoiseInjection whiteNoiseInjection(
            active_sigma=0.0005,  samplePeriod=0.02)
          annotation (Placement(transformation(extent={{70,-30},{82,-18}})));

        inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false,
            fixedSeed=10000)
          annotation (Placement(transformation(extent={{-42,92},{-22,112}})));
        Modelica.Blocks.Sources.Sine sine(
          amplitude=0.01,
          f=1/260,
          phase=3.1415926535898,
          startTime=5.5)
          annotation (Placement(transformation(extent={{72,-44},{82,-34}})));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(extent={{86,-30},{94,-22}})));

      equation

        OUT1 = G2.gen.w;
        OUT2 = G2.gen.delta;
        OUT3 = G2.gen.Epq;
        OUT4 = G2.gen.PSIkd;
        OUT5 = G2.gen.PSIppq;
        OUT6 = G2.sEXSMPC.simpleLagLim.state;
        OUT7 = G2.sEXSMPC.leadLag.TF.x[1];
        OUT8 = G2.gASTMPC.simpleLagLim.state;
        OUT9 = G2.gASTMPC.simpleLag.state;
        OUT10 = G2.gASTMPC.simpleLag1.state;
        OUT11 = G2.gASTMPC.PMECH;
        OUT12 = G2.sEXSMPC.EFD;
        OUT13 = Bus5.v;
        OUT14 = Bus5.angle;
        OUT15 = G2.gen.P;

        connect(T1.p, Bus2.p)
          annotation (Line(points={{-51.2,70},{-40,70}}, color={0,0,255}));
        connect(Bus1.p, T1.n)
          annotation (Line(points={{-80,70},{-68.8,70}}, color={0,0,255}));
        connect(G1.conn, Bus1.p)
          annotation (Line(points={{-91,70},{-80,70}}, color={0,0,255}));
        connect(L1.n, Bus3.p)
          annotation (Line(points={{-14.6,70},{0,70}}, color={0,0,255}));
        connect(L1.p, Bus2.p)
          annotation (Line(points={{-25.4,70},{-40,70}}, color={0,0,255}));
        connect(L2_2.n, Bus4.p) annotation (Line(points={{35.4,60},{44,60},{44,70},{
                60,70}},
                      color={0,0,255}));
        connect(L2_1.n, Bus4.p) annotation (Line(points={{35.4,80},{44,80},{44,70},{
                60,70}},
                      color={0,0,255}));
        connect(L2_1.p, Bus3.p) annotation (Line(points={{24.6,80},{16,80},{16,70},{0,
                70}}, color={0,0,255}));
        connect(L2_2.p, Bus3.p) annotation (Line(points={{24.6,60},{16,60},{16,70},{0,
                70}}, color={0,0,255}));
        connect(G2.conn, Bus6.p)
          annotation (Line(points={{21,-36},{34,-36}}, color={0,0,255}));
        connect(Load1.p, Bus3.p)
          annotation (Line(points={{-10,58},{-10,70},{0,70}}, color={0,0,255}));
        connect(L3.p, Bus4.p)
          annotation (Line(points={{80,55.4},{80,70},{60,70}}, color={0,0,255}));
        connect(breaker.s, Bus5.p)
          annotation (Line(points={{80,12},{80,6}}, color={0,0,255}));
        connect(breaker.r, L3.n)
          annotation (Line(points={{80,20},{80,44.6}},color={0,0,255}));
        connect(T2.n, Bus6.p)
          annotation (Line(points={{50,-24.8},{50,-36},{34,-36}}, color={0,0,255}));
        connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-30},{-90,-30},{-90,-12},
                {-82,-12}}, color={0,0,127}));
        connect(IN1, AddU1.u1) annotation (Line(points={{-150,0},{-82,0}},
                       color={0,0,127}));
        connect(T2.p, Bus5.p) annotation (Line(points={{50,-7.2},{50,0},{80,0},{80,6}},
              color={0,0,255}));

        connect(IN22.y,AddU2. u2) annotation (Line(points={{-99,-90},{-90,-90},{-90,-72},
                {-82,-72}},
                       color={0,0,127}));
        connect(IN2,AddU2. u1) annotation (Line(points={{-150,-60},{-82,-60}},
                       color={0,0,127}));
        connect(AddU2.y, G2.Efd_ref)
          annotation (Line(points={{-59,-66},{-10,-66},{-10,-42},{-2,-42}},
                                                                 color={0,0,127}));
        connect(AddU1.y, G2.P_ref1) annotation (Line(points={{-59,-6},{-10,-6},{-10,-30},
                {-2,-30}},                          color={0,0,127}));
        connect(IB.p, Bus4.p)
          annotation (Line(points={{100,70},{60,70}}, color={0,0,255}));
        connect(Load2.p, Bus5.p) annotation (Line(points={{110,-20},{110,0},{80,0},{80,
                6}}, color={0,0,255}));
        connect(sine.y, add.u2) annotation (Line(points={{82.5,-39},{82.5,-34},{85.2,-34},
                {85.2,-28.4}}, color={0,0,127}));
        connect(whiteNoiseInjection.y, add.u1) annotation (Line(points={{82.54,-24.06},
                {82.54,-23.6},{85.2,-23.6}}, color={0,0,127}));
        connect(add.y, Load2.u) annotation (Line(points={{94.4,-26},{94.4,-24.5},{101.9,
                -24.5}}, color={0,0,127}));
          annotation (Placement(transformation(extent={{140,-20},{160,0}})),
                      Placement(transformation(extent={{140,-40},{160,-20}})),
                      Placement(transformation(extent={{140,-60},{160,-40}})),
                      Placement(transformation(extent={{140,-80},{160,-60}})),
                     Diagram(coordinateSystem(preserveAspectRatio=false,
                extent={{-140,-120},{140,120}}), graphics={
              Rectangle(
                extent={{130,88},{166,-112}},
                lineColor={0,140,72},
                lineThickness=0.5),
              Rectangle(
                extent={{-158,20},{-134,-80}},
                lineColor={0,140,72},
                lineThickness=0.5),
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
                textString="Linearization Unit"),
              Text(
                extent={{-164,40},{-132,20}},
                textColor={0,140,72},
                textString="Inputs"),
              Text(
                extent={{128,108},{168,88}},
                textColor={0,140,72},
                textString="Outputs")}),
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
</html>"),experiment(
            StopTime=10,
            __Dymola_NumberOfIntervals=100,
            __Dymola_Algorithm="Dassl"));
      end OptimizationModel10;

      model OptimizationModel05_lessoutputs
        "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
        extends Modelica.Icons.Example;

        parameter Boolean equivalentGRID = true;
        parameter Boolean equivalentsystem = false;

        OpenIPSL.Electrical.Buses.Bus Bus1(v_0=powerFlow.powerflow.bus.V1, angle_0=
              powerFlow.powerflow.bus.A1) if not equivalentGRID
          annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus2(v_0=powerFlow.powerflow.bus.V2, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus3(v_0=powerFlow.powerflow.bus.V3, angle_0=
              powerFlow.powerflow.bus.A3) if not equivalentGRID
          annotation (Placement(transformation(extent={{-10,60},{10,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus4(v_0=powerFlow.powerflow.bus.V4, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus5(angle_0=powerFlow.powerflow.bus.A5, v_0=
              powerFlow.powerflow.bus.V5)  annotation (Placement(
              transformation(
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
        OpenIPSL.Electrical.Buses.Bus Bus6(v_0=powerFlow.powerflow.bus.V6, angle_0=
              powerFlow.powerflow.bus.A6) annotation (Placement(transformation(
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
          X=0.1)  annotation (Placement(transformation(
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
          annotation (Placement(transformation(extent={{-20,38},{0,58}})));
        Electrical.Events.Breaker breaker(enableTrigger=false,
          t_o=100.01,
          rc_enabled=true,
          t_rc=800.01)      if not equivalentGRID                     annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,16})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,0}), iconTransformation(extent={{-10,-10},{10,10}}, origin=
                 {-150,0})));
        Modelica.Blocks.Sources.Constant IN11(k=0)
          annotation (Placement(transformation(extent={{-120,-40},{-100,-20}})));
        Modelica.Blocks.Math.Add AddU1
          annotation (Placement(transformation(extent={{-80,-16},{-60,4}})));
        Modelica.Blocks.Sources.Constant IN22(k=0)
          annotation (Placement(transformation(extent={{-120,-100},{-100,-80}})));
        Modelica.Blocks.Math.Add AddU2
          annotation (Placement(transformation(extent={{-80,-76},{-60,-56}})));
        Modelica.Blocks.Interfaces.RealInput IN2(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,-60}), iconTransformation(extent={{-10,-10},{10,10}},
                origin={-150,-60})));
        Modelica.Blocks.Interfaces.RealOutput OUT1
          annotation (Placement(transformation(extent={{140,58},{160,78}})));
        Modelica.Blocks.Interfaces.RealOutput OUT3
          annotation (Placement(transformation(extent={{140,18},{160,38}})));

        PFData.PowerFlow powerFlow(redeclare record PowerFlow =
              OpenIPSL.Examples.ModelPredictiveControl.PFData.PF02)
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
          d_t=1000)
          annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
        Electrical.Loads.NoiseInjections.WhiteNoiseInjection whiteNoiseInjection(
            active_sigma=0.0000000005,
                                  samplePeriod=0.02)
          annotation (Placement(transformation(extent={{70,-30},{82,-18}})));

        inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false,
            fixedSeed=10000)
          annotation (Placement(transformation(extent={{-42,92},{-22,112}})));
        Modelica.Blocks.Sources.Sine sine(
          amplitude=0,
          f=1/260,
          phase=3.1415926535898,
          startTime=5.5)
          annotation (Placement(transformation(extent={{72,-44},{82,-34}})));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(extent={{86,-30},{94,-22}})));

        Modelica.Blocks.Interfaces.RealOutput OUT4
          annotation (Placement(transformation(extent={{140,0},{160,20}})));
      equation

        OUT1 = G2.gen.SPEED;
        //OUT2 = G2.gASTMPC.PMECH;
        OUT3 = G2.sEXSMPC.EFD;
        OUT4 = G2.gASTMPC.simpleLag1.state;



        connect(T1.p, Bus2.p)
          annotation (Line(points={{-51.2,70},{-40,70}}, color={0,0,255}));
        connect(Bus1.p, T1.n)
          annotation (Line(points={{-80,70},{-68.8,70}}, color={0,0,255}));
        connect(G1.conn, Bus1.p)
          annotation (Line(points={{-91,70},{-80,70}}, color={0,0,255}));
        connect(L1.n, Bus3.p)
          annotation (Line(points={{-14.6,70},{0,70}}, color={0,0,255}));
        connect(L1.p, Bus2.p)
          annotation (Line(points={{-25.4,70},{-40,70}}, color={0,0,255}));
        connect(L2_2.n, Bus4.p) annotation (Line(points={{35.4,60},{44,60},{44,70},{
                60,70}},
                      color={0,0,255}));
        connect(L2_1.n, Bus4.p) annotation (Line(points={{35.4,80},{44,80},{44,70},{
                60,70}},
                      color={0,0,255}));
        connect(L2_1.p, Bus3.p) annotation (Line(points={{24.6,80},{16,80},{16,70},{0,
                70}}, color={0,0,255}));
        connect(L2_2.p, Bus3.p) annotation (Line(points={{24.6,60},{16,60},{16,70},{0,
                70}}, color={0,0,255}));
        connect(G2.conn, Bus6.p)
          annotation (Line(points={{21,-36},{34,-36}}, color={0,0,255}));
        connect(Load1.p, Bus3.p)
          annotation (Line(points={{-10,58},{-10,70},{0,70}}, color={0,0,255}));
        connect(L3.p, Bus4.p)
          annotation (Line(points={{80,55.4},{80,70},{60,70}}, color={0,0,255}));
        connect(breaker.s, Bus5.p)
          annotation (Line(points={{80,12},{80,6}}, color={0,0,255}));
        connect(breaker.r, L3.n)
          annotation (Line(points={{80,20},{80,44.6}},color={0,0,255}));
        connect(T2.n, Bus6.p)
          annotation (Line(points={{50,-24.8},{50,-36},{34,-36}}, color={0,0,255}));
        connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-30},{-90,-30},{-90,-12},
                {-82,-12}}, color={0,0,127}));
        connect(IN1, AddU1.u1) annotation (Line(points={{-150,0},{-82,0}},
                       color={0,0,127}));
        connect(T2.p, Bus5.p) annotation (Line(points={{50,-7.2},{50,0},{80,0},{80,6}},
              color={0,0,255}));

        connect(IN22.y,AddU2. u2) annotation (Line(points={{-99,-90},{-90,-90},{-90,-72},
                {-82,-72}},
                       color={0,0,127}));
        connect(IN2,AddU2. u1) annotation (Line(points={{-150,-60},{-82,-60}},
                       color={0,0,127}));
        connect(AddU2.y, G2.Efd_ref)
          annotation (Line(points={{-59,-66},{-10,-66},{-10,-42},{-2,-42}},
                                                                 color={0,0,127}));
        connect(AddU1.y, G2.P_ref1) annotation (Line(points={{-59,-6},{-10,-6},{-10,-30},
                {-2,-30}},                          color={0,0,127}));
        connect(IB.p, Bus4.p)
          annotation (Line(points={{100,70},{60,70}}, color={0,0,255}));
        connect(Load2.p, Bus5.p) annotation (Line(points={{110,-20},{110,0},{80,0},{80,
                6}}, color={0,0,255}));
        connect(sine.y, add.u2) annotation (Line(points={{82.5,-39},{82.5,-34},{85.2,-34},
                {85.2,-28.4}}, color={0,0,127}));
        connect(whiteNoiseInjection.y, add.u1) annotation (Line(points={{82.54,-24.06},
                {82.54,-23.6},{85.2,-23.6}}, color={0,0,127}));
        connect(add.y, Load2.u) annotation (Line(points={{94.4,-26},{94.4,-24.5},{101.9,
                -24.5}}, color={0,0,127}));
          annotation (Placement(transformation(extent={{140,-20},{160,0}})),
                      Placement(transformation(extent={{140,-40},{160,-20}})),
                      Placement(transformation(extent={{140,-60},{160,-40}})),
                      Placement(transformation(extent={{140,-80},{160,-60}})),
                     Diagram(coordinateSystem(preserveAspectRatio=false,
                extent={{-140,-120},{140,120}}), graphics={
              Rectangle(
                extent={{130,88},{166,-112}},
                lineColor={0,140,72},
                lineThickness=0.5),
              Rectangle(
                extent={{-158,20},{-134,-80}},
                lineColor={0,140,72},
                lineThickness=0.5),
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
                textString="Linearization Unit"),
              Text(
                extent={{-164,40},{-132,20}},
                textColor={0,140,72},
                textString="Inputs"),
              Text(
                extent={{128,108},{168,88}},
                textColor={0,140,72},
                textString="Outputs")}),
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
</html>"),experiment(Interval=0.5, __Dymola_Algorithm="Dassl"));
      end OptimizationModel05_lessoutputs;

      model OptimizationModel05_withRenewables
        "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
        extends Modelica.Icons.Example;

        parameter Boolean equivalentGRID = false;
        parameter Boolean equivalentsystem = false;

        OpenIPSL.Electrical.Buses.Bus Bus1(v_0=powerFlow.powerflow.bus.V1, angle_0=
              powerFlow.powerflow.bus.A1) if not equivalentGRID
          annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus2(v_0=powerFlow.powerflow.bus.V2, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus3(v_0=powerFlow.powerflow.bus.V3, angle_0=
              powerFlow.powerflow.bus.A3) if not equivalentGRID
          annotation (Placement(transformation(extent={{-10,60},{10,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus4(v_0=powerFlow.powerflow.bus.V4, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus5(angle_0=powerFlow.powerflow.bus.A5, v_0=
              powerFlow.powerflow.bus.V5)  annotation (Placement(
              transformation(
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
        OpenIPSL.Electrical.Buses.Bus Bus6(v_0=powerFlow.powerflow.bus.V6, angle_0=
              powerFlow.powerflow.bus.A6) annotation (Placement(transformation(
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
          X=0.1)  annotation (Placement(transformation(
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
          annotation (Placement(transformation(extent={{-20,38},{0,58}})));
        Electrical.Events.Breaker breaker(enableTrigger=false,
          t_o=100.01,
          rc_enabled=true,
          t_rc=800.01)      if not equivalentGRID                     annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,16})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,0}), iconTransformation(extent={{-10,-10},{10,10}}, origin=
                 {-150,0})));
        Modelica.Blocks.Sources.Constant IN11(k=0)
          annotation (Placement(transformation(extent={{-120,-40},{-100,-20}})));
        Modelica.Blocks.Math.Add AddU1
          annotation (Placement(transformation(extent={{-80,-16},{-60,4}})));
        Modelica.Blocks.Sources.Constant IN22(k=0)
          annotation (Placement(transformation(extent={{-120,-100},{-100,-80}})));
        Modelica.Blocks.Math.Add AddU2
          annotation (Placement(transformation(extent={{-80,-76},{-60,-56}})));
        Modelica.Blocks.Interfaces.RealInput IN2(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,-60}), iconTransformation(extent={{-10,-10},{10,10}},
                origin={-150,-60})));
        Modelica.Blocks.Interfaces.RealOutput OUT1
          annotation (Placement(transformation(extent={{140,58},{160,78}})));
       Modelica.Blocks.Interfaces.RealOutput OUT2
          annotation (Placement(transformation(extent={{140,38},{160,58}})));
        Modelica.Blocks.Interfaces.RealOutput OUT3
          annotation (Placement(transformation(extent={{140,18},{160,38}})));
        Modelica.Blocks.Interfaces.RealOutput OUT4
          annotation (Placement(transformation(extent={{140,-2},{160,18}})));
        Modelica.Blocks.Interfaces.RealOutput OUT5
          annotation (Placement(transformation(extent={{140,-22},{160,-2}})));
        Modelica.Blocks.Interfaces.RealOutput OUT6
          annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT7
          annotation (Placement(transformation(extent={{140,-62},
                  {160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT8
          annotation (Placement(transformation(extent={{140,-82},
                  {160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT9    annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT10   annotation (Placement(transformation(extent={{140,-62},{160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT11  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT12    annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT13   annotation (Placement(transformation(extent={{140,-62},{160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT14  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT15  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));

        PFData.PowerFlow powerFlow(redeclare record PowerFlow =
              OpenIPSL.Examples.ModelPredictiveControl.PFData.PF02)
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
          d_t=1000)
          annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
        Electrical.Loads.NoiseInjections.WhiteNoiseInjection whiteNoiseInjection(
            active_sigma=0.0000000005,
                                  samplePeriod=0.02)
          annotation (Placement(transformation(extent={{70,-30},{82,-18}})));

        inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false,
            fixedSeed=10000)
          annotation (Placement(transformation(extent={{-42,92},{-22,112}})));
        Modelica.Blocks.Sources.Sine sine(
          amplitude=0,
          f=1/260,
          phase=3.1415926535898,
          startTime=5.5)
          annotation (Placement(transformation(extent={{72,-44},{82,-34}})));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(extent={{86,-30},{94,-22}})));

      equation

        OUT1 = G2.gen.w;
        OUT2 = G2.gen.delta;
        OUT3 = G2.gen.Epq;
        OUT4 = G2.gen.PSIkd;
        OUT5 = G2.gen.PSIppq;
        OUT6 = G2.sEXSMPC.simpleLagLim.state;
        OUT7 = G2.sEXSMPC.leadLag.TF.x[1];
        OUT8 = G2.gASTMPC.simpleLagLim.state;
        OUT9 = G2.gASTMPC.simpleLag.state;
        OUT10 = G2.gASTMPC.simpleLag1.state;
        OUT11 = G2.gASTMPC.PMECH;
        OUT12 = G2.sEXSMPC.EFD;
        OUT13 = Bus5.v;
        OUT14 = Bus5.angle;
        OUT15 = G2.gen.P;

        connect(T1.p, Bus2.p)
          annotation (Line(points={{-51.2,70},{-40,70}}, color={0,0,255}));
        connect(Bus1.p, T1.n)
          annotation (Line(points={{-80,70},{-68.8,70}}, color={0,0,255}));
        connect(G1.conn, Bus1.p)
          annotation (Line(points={{-91,70},{-80,70}}, color={0,0,255}));
        connect(L1.n, Bus3.p)
          annotation (Line(points={{-14.6,70},{0,70}}, color={0,0,255}));
        connect(L1.p, Bus2.p)
          annotation (Line(points={{-25.4,70},{-40,70}}, color={0,0,255}));
        connect(L2_2.n, Bus4.p) annotation (Line(points={{35.4,60},{44,60},{44,70},{
                60,70}},
                      color={0,0,255}));
        connect(L2_1.n, Bus4.p) annotation (Line(points={{35.4,80},{44,80},{44,70},{
                60,70}},
                      color={0,0,255}));
        connect(L2_1.p, Bus3.p) annotation (Line(points={{24.6,80},{16,80},{16,70},{0,
                70}}, color={0,0,255}));
        connect(L2_2.p, Bus3.p) annotation (Line(points={{24.6,60},{16,60},{16,70},{0,
                70}}, color={0,0,255}));
        connect(G2.conn, Bus6.p)
          annotation (Line(points={{21,-36},{34,-36}}, color={0,0,255}));
        connect(Load1.p, Bus3.p)
          annotation (Line(points={{-10,58},{-10,70},{0,70}}, color={0,0,255}));
        connect(L3.p, Bus4.p)
          annotation (Line(points={{80,55.4},{80,70},{60,70}}, color={0,0,255}));
        connect(breaker.s, Bus5.p)
          annotation (Line(points={{80,12},{80,6}}, color={0,0,255}));
        connect(breaker.r, L3.n)
          annotation (Line(points={{80,20},{80,44.6}},color={0,0,255}));
        connect(T2.n, Bus6.p)
          annotation (Line(points={{50,-24.8},{50,-36},{34,-36}}, color={0,0,255}));
        connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-30},{-90,-30},{-90,-12},
                {-82,-12}}, color={0,0,127}));
        connect(IN1, AddU1.u1) annotation (Line(points={{-150,0},{-82,0}},
                       color={0,0,127}));
        connect(T2.p, Bus5.p) annotation (Line(points={{50,-7.2},{50,0},{80,0},{80,6}},
              color={0,0,255}));

        connect(IN22.y,AddU2. u2) annotation (Line(points={{-99,-90},{-90,-90},{-90,-72},
                {-82,-72}},
                       color={0,0,127}));
        connect(IN2,AddU2. u1) annotation (Line(points={{-150,-60},{-82,-60}},
                       color={0,0,127}));
        connect(AddU2.y, G2.Efd_ref)
          annotation (Line(points={{-59,-66},{-10,-66},{-10,-42},{-2,-42}},
                                                                 color={0,0,127}));
        connect(AddU1.y, G2.P_ref1) annotation (Line(points={{-59,-6},{-10,-6},{-10,-30},
                {-2,-30}},                          color={0,0,127}));
        connect(IB.p, Bus4.p)
          annotation (Line(points={{100,70},{60,70}}, color={0,0,255}));
        connect(Load2.p, Bus5.p) annotation (Line(points={{110,-20},{110,0},{80,0},{80,
                6}}, color={0,0,255}));
        connect(sine.y, add.u2) annotation (Line(points={{82.5,-39},{82.5,-34},{85.2,-34},
                {85.2,-28.4}}, color={0,0,127}));
        connect(whiteNoiseInjection.y, add.u1) annotation (Line(points={{82.54,-24.06},
                {82.54,-23.6},{85.2,-23.6}}, color={0,0,127}));
        connect(add.y, Load2.u) annotation (Line(points={{94.4,-26},{94.4,-24.5},{101.9,
                -24.5}}, color={0,0,127}));
          annotation (Placement(transformation(extent={{140,-20},{160,0}})),
                      Placement(transformation(extent={{140,-40},{160,-20}})),
                      Placement(transformation(extent={{140,-60},{160,-40}})),
                      Placement(transformation(extent={{140,-80},{160,-60}})),
                     Diagram(coordinateSystem(preserveAspectRatio=false,
                extent={{-140,-120},{140,120}}), graphics={
              Rectangle(
                extent={{130,88},{166,-112}},
                lineColor={0,140,72},
                lineThickness=0.5),
              Rectangle(
                extent={{-158,20},{-134,-80}},
                lineColor={0,140,72},
                lineThickness=0.5),
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
                textString="Linearization Unit"),
              Text(
                extent={{-164,40},{-132,20}},
                textColor={0,140,72},
                textString="Inputs"),
              Text(
                extent={{128,108},{168,88}},
                textColor={0,140,72},
                textString="Outputs")}),
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
</html>"),experiment(Interval=0.5, __Dymola_Algorithm="Dassl"));
      end OptimizationModel05_withRenewables;
    end EquipmentOnlyLinearization;

    package MicrogridWithDistrictHeating
      "Microgrid Model with District Heating System and Load"
      model OptimizationModel_with_DistrictHeating
        "THIS ONE IS STABLE, CONTROLLABLE, OBSERVABLE!!!!!!!"
        extends Modelica.Icons.Example;

        parameter Boolean equivalentGRID = false;
        parameter Boolean equivalentsystem = false;

        OpenIPSL.Electrical.Buses.Bus Bus1(v_0=powerFlow.powerflow.bus.V1, angle_0=
              powerFlow.powerflow.bus.A1) if not equivalentGRID
          annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus2(v_0=powerFlow.powerflow.bus.V2, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus3(v_0=powerFlow.powerflow.bus.V3, angle_0=
              powerFlow.powerflow.bus.A3) if not equivalentGRID
          annotation (Placement(transformation(extent={{-10,60},{10,80}})));
        OpenIPSL.Electrical.Buses.Bus Bus4(v_0=powerFlow.powerflow.bus.V4, angle_0=
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
        OpenIPSL.Electrical.Buses.Bus Bus5(angle_0=powerFlow.powerflow.bus.A5, v_0=
              powerFlow.powerflow.bus.V5)  annotation (Placement(
              transformation(
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
        OpenIPSL.Electrical.Buses.Bus Bus6(v_0=powerFlow.powerflow.bus.V6, angle_0=
              powerFlow.powerflow.bus.A6) annotation (Placement(transformation(
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
          X=0.1)  annotation (Placement(transformation(
              extent={{-8,-8},{8,8}},
              rotation=270,
              origin={50,-16})));
        GenerationUnits.PSSE.G2_16MVA_THERMAL                 G2(
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
          annotation (Placement(transformation(extent={{-20,38},{0,58}})));
        Electrical.Events.Breaker breaker(enableTrigger=false,
          t_o=1.01,
          rc_enabled=true,
          t_rc=80.01)       if not equivalentGRID                     annotation (Placement(transformation(
              extent={{-4,-4},{4,4}},
              rotation=90,
              origin={80,16})));

        Modelica.Blocks.Interfaces.RealInput IN1(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,0}), iconTransformation(extent={{-10,-10},{10,10}}, origin=
                 {-150,0})));
        Modelica.Blocks.Sources.Constant IN11(k=0)
          annotation (Placement(transformation(extent={{-120,-40},{-100,-20}})));
        Modelica.Blocks.Math.Add AddU1
          annotation (Placement(transformation(extent={{-80,-16},{-60,4}})));
        Modelica.Blocks.Sources.Constant IN22(k=0)
          annotation (Placement(transformation(extent={{-120,-100},{-100,-80}})));
        Modelica.Blocks.Math.Add AddU2
          annotation (Placement(transformation(extent={{-80,-76},{-60,-56}})));
        Modelica.Blocks.Interfaces.RealInput IN2(start=0)
          "Connector of Real input signal 2" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-150,-60}), iconTransformation(extent={{-10,-10},{10,10}},
                origin={-150,-60})));
        Modelica.Blocks.Interfaces.RealOutput OUT1
          annotation (Placement(transformation(extent={{140,58},{160,78}})));
       Modelica.Blocks.Interfaces.RealOutput OUT2
          annotation (Placement(transformation(extent={{140,38},{160,58}})));
        Modelica.Blocks.Interfaces.RealOutput OUT3
          annotation (Placement(transformation(extent={{140,18},{160,38}})));
        Modelica.Blocks.Interfaces.RealOutput OUT4
          annotation (Placement(transformation(extent={{140,-2},{160,18}})));
        Modelica.Blocks.Interfaces.RealOutput OUT5
          annotation (Placement(transformation(extent={{140,-22},{160,-2}})));
        Modelica.Blocks.Interfaces.RealOutput OUT6
          annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT7
          annotation (Placement(transformation(extent={{140,-62},
                  {160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT8
          annotation (Placement(transformation(extent={{140,-82},
                  {160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT9    annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT10   annotation (Placement(transformation(extent={{140,-62},{160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT11  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT12    annotation (Placement(transformation(extent={{140,-42},{160,-22}})));
        Modelica.Blocks.Interfaces.RealOutput OUT13   annotation (Placement(transformation(extent={{140,-62},{160,-42}})));
        Modelica.Blocks.Interfaces.RealOutput OUT14  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));
        Modelica.Blocks.Interfaces.RealOutput OUT15  annotation (Placement(transformation(extent={{140,-82},{160,-62}})));

        PFData.PowerFlow powerFlow(redeclare record PowerFlow =
              OpenIPSL.Examples.ModelPredictiveControl.PFData.PF02)
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
          d_t=1000)
          annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
        Electrical.Loads.NoiseInjections.WhiteNoiseInjection whiteNoiseInjection(
            active_sigma=0.0000000005,
                                  samplePeriod=0.02)
          annotation (Placement(transformation(extent={{70,-30},{82,-18}})));

        inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false,
            fixedSeed=10000)
          annotation (Placement(transformation(extent={{-42,92},{-22,112}})));
        Modelica.Blocks.Sources.Sine sine(
          amplitude=0,
          f=1/260,
          phase=3.1415926535898,
          startTime=5.5)
          annotation (Placement(transformation(extent={{72,-44},{82,-34}})));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(extent={{86,-30},{94,-22}})));

        ThermalPower.DistrictHeating.Consumers.IdealHeatConsumer
          idealHeatConsumer(use_heatDemand_in=false)
          annotation (Placement(transformation(extent={{88,-78},{108,-58}})));
        ThermalPower.TwoPhase.FlowChannels.DualPipe_dynamicDelay
          dualPipe_dynamicDelay(N_B_supply=1, N_B_return=1)
          annotation (Placement(transformation(extent={{56,-84},{76,-64}})));
        Modelon.ThermoFluid.Sources.PressureBoundary pressureBoundary(N=1)
          annotation (Placement(transformation(extent={{16,-82},{36,-62}})));
      equation

        OUT1 = G2.gen.w;
        OUT2 = G2.gen.delta;
        OUT3 = G2.gen.Epq;
        OUT4 = G2.gen.PSIkd;
        OUT5 = G2.gen.PSIppq;
        OUT6 = G2.sEXSMPC.simpleLagLim.state;
        OUT7 = G2.sEXSMPC.leadLag.TF.x[1];
        OUT8 = G2.gASTMPC.simpleLagLim.state;
        OUT9 = G2.gASTMPC.simpleLag.state;
        OUT10 = G2.gASTMPC.simpleLag1.state;
        OUT11 = G2.gASTMPC.PMECH;
        OUT12 = G2.sEXSMPC.EFD;
        OUT13 = Bus5.v;
        OUT14 = Bus5.angle;
        OUT15 = G2.gen.P;

        connect(T1.p, Bus2.p)
          annotation (Line(points={{-51.2,70},{-40,70}}, color={0,0,255}));
        connect(Bus1.p, T1.n)
          annotation (Line(points={{-80,70},{-68.8,70}}, color={0,0,255}));
        connect(G1.conn, Bus1.p)
          annotation (Line(points={{-91,70},{-80,70}}, color={0,0,255}));
        connect(L1.n, Bus3.p)
          annotation (Line(points={{-14.6,70},{0,70}}, color={0,0,255}));
        connect(L1.p, Bus2.p)
          annotation (Line(points={{-25.4,70},{-40,70}}, color={0,0,255}));
        connect(L2_2.n, Bus4.p) annotation (Line(points={{35.4,60},{44,60},{44,70},{
                60,70}},
                      color={0,0,255}));
        connect(L2_1.n, Bus4.p) annotation (Line(points={{35.4,80},{44,80},{44,70},{
                60,70}},
                      color={0,0,255}));
        connect(L2_1.p, Bus3.p) annotation (Line(points={{24.6,80},{16,80},{16,70},{0,
                70}}, color={0,0,255}));
        connect(L2_2.p, Bus3.p) annotation (Line(points={{24.6,60},{16,60},{16,70},{0,
                70}}, color={0,0,255}));
        connect(G2.conn, Bus6.p)
          annotation (Line(points={{21,-36},{34,-36}}, color={0,0,255}));
        connect(Load1.p, Bus3.p)
          annotation (Line(points={{-10,58},{-10,70},{0,70}}, color={0,0,255}));
        connect(L3.p, Bus4.p)
          annotation (Line(points={{80,55.4},{80,70},{60,70}}, color={0,0,255}));
        connect(breaker.s, Bus5.p)
          annotation (Line(points={{80,12},{80,6}}, color={0,0,255}));
        connect(breaker.r, L3.n)
          annotation (Line(points={{80,20},{80,44.6}},color={0,0,255}));
        connect(T2.n, Bus6.p)
          annotation (Line(points={{50,-24.8},{50,-36},{34,-36}}, color={0,0,255}));
        connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,-30},{-90,-30},{-90,-12},
                {-82,-12}}, color={0,0,127}));
        connect(IN1, AddU1.u1) annotation (Line(points={{-150,0},{-82,0}},
                       color={0,0,127}));
        connect(T2.p, Bus5.p) annotation (Line(points={{50,-7.2},{50,0},{80,0},{80,6}},
              color={0,0,255}));

        connect(IN22.y,AddU2. u2) annotation (Line(points={{-99,-90},{-90,-90},{-90,-72},
                {-82,-72}},
                       color={0,0,127}));
        connect(IN2,AddU2. u1) annotation (Line(points={{-150,-60},{-82,-60}},
                       color={0,0,127}));
        connect(AddU2.y, G2.Efd_ref)
          annotation (Line(points={{-59,-66},{-10,-66},{-10,-42},{-2,-42}},
                                                                 color={0,0,127}));
        connect(AddU1.y, G2.P_ref1) annotation (Line(points={{-59,-6},{-10,-6},{-10,-30},
                {-2,-30}},                          color={0,0,127}));
        connect(IB.p, Bus4.p)
          annotation (Line(points={{100,70},{60,70}}, color={0,0,255}));
        connect(Load2.p, Bus5.p) annotation (Line(points={{110,-20},{110,0},{80,0},{80,
                6}}, color={0,0,255}));
        connect(sine.y, add.u2) annotation (Line(points={{82.5,-39},{82.5,-34},{85.2,-34},
                {85.2,-28.4}}, color={0,0,127}));
        connect(whiteNoiseInjection.y, add.u1) annotation (Line(points={{82.54,-24.06},
                {82.54,-23.6},{85.2,-23.6}}, color={0,0,127}));
        connect(add.y, Load2.u) annotation (Line(points={{94.4,-26},{94.4,-24.5},{101.9,
                -24.5}}, color={0,0,127}));
        connect(dualPipe_dynamicDelay.portB_supply[1], idealHeatConsumer.portA)
          annotation (Line(points={{76.2,-72},{88,-72}}, color={0,0,255}));
        connect(dualPipe_dynamicDelay.portB_return[1], idealHeatConsumer.portB)
          annotation (Line(points={{76,-76},{88,-76}}, color={0,0,255}));
        connect(pressureBoundary.fluidPort[1], dualPipe_dynamicDelay.portA_supply)
          annotation (Line(points={{35,-72},{56,-72}}, color={255,128,0}));
          annotation (Placement(transformation(extent={{140,-20},{160,0}})),
                      Placement(transformation(extent={{140,-40},{160,-20}})),
                      Placement(transformation(extent={{140,-60},{160,-40}})),
                      Placement(transformation(extent={{140,-80},{160,-60}})),
                     Diagram(coordinateSystem(preserveAspectRatio=false,
                extent={{-140,-120},{140,120}}), graphics={
              Text(
                extent={{76,48},{128,24}},
                textColor={28,108,200},
                textString="Utility Grid"),
              Text(
                extent={{-164,40},{-132,20}},
                textColor={0,140,72},
                textString="Inputs"),
              Text(
                extent={{128,108},{168,88}},
                textColor={0,140,72},
                textString="Outputs")}),
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
</html>"),experiment(
            StopTime=10,
            __Dymola_NumberOfIntervals=100,
            __Dymola_Algorithm="Dassl"));
      end OptimizationModel_with_DistrictHeating;

      model LearningThermalPower

        parameter Modelica.Units.SI.Temperature T0=70 "Supply temperature";


        ThermalPower.DistrictHeating.Consumers.IdealHeatConsumer idealHeatConsumer(
            redeclare package Medium =
              Modelon.Media.PreDefined.TwoPhase.WaterIF97,
            use_heatDemand_in=true)
          annotation (Placement(transformation(extent={{32,-4},{52,16}})));
        ThermalPower.TwoPhase.FlowChannels.DualPipe_dynamicDelay
          dualPipe_dynamicDelay(N_B_supply=1, N_B_return=1)
          annotation (Placement(transformation(extent={{0,-10},{20,10}})));
        Modelon.ThermoFluid.Sources.PressureBoundary pressureBoundary(
          redeclare package Medium =
              Modelon.Media.PreDefined.TwoPhase.WaterIF97,
          energyDefinition=Modelon.ThermoFluid.Choices.EnergyDefinition.T,
          p=500000,
          T=298.15,
          pressureUnit=Modelon.ThermoFluid.Choices.RealPressureUnit.Pa,
          temperatureUnit=Modelon.ThermoFluid.Choices.RealTemperatureUnit.degC,
          use_p_in=false,
          use_Th_in=false,
          N=1) annotation (Placement(transformation(extent={{-60,-30},{-40,-10}})));

        Modelica.Blocks.Sources.Ramp           ThermalLoad(
          height=500,
          duration=100,
          offset=100,
          startTime=10)
          annotation (Placement(transformation(extent={{90,0},{70,20}})));
        Modelon.ThermoFluid.Sources.PressureBoundary pressureBoundary_supply(
          redeclare package Medium =
              Modelon.Media.PreDefined.TwoPhase.WaterIF97,
          pressureUnit=Modelon.ThermoFluid.Choices.RealPressureUnit.bar,
          temperatureUnit=Modelon.ThermoFluid.Choices.RealTemperatureUnit.degC,
          use_p_in=true,
          use_Th_in=true,
          N=1) annotation (Placement(transformation(extent={{-60,10},{-40,30}})));
        Modelica.Blocks.Sources.RealExpression SourcePressure(y=8)
          annotation (Placement(transformation(extent={{-92,26},{-72,46}})));
        Modelica.Blocks.Sources.RealExpression SourceTemperature(y=100)
          annotation (Placement(transformation(extent={{-92,50},{-72,70}})));
      equation
        connect(dualPipe_dynamicDelay.portB_supply[1], idealHeatConsumer.portA)
          annotation (Line(points={{20.2,2},{32,2}}, color={0,0,255}));
        connect(dualPipe_dynamicDelay.portB_return[1], idealHeatConsumer.portB)
          annotation (Line(points={{20,-2},{32,-2}}, color={0,0,255}));
        connect(idealHeatConsumer.heatDemand, ThermalLoad.y)
          annotation (Line(points={{53,10},{69,10}}, color={0,0,127}));
        connect(pressureBoundary.fluidPort[1], dualPipe_dynamicDelay.portA_return)
          annotation (Line(points={{-41,-20},{-20,-20},{-20,-2},{0,-2}}, color={255,128,
                0}));
        connect(pressureBoundary_supply.fluidPort[1], dualPipe_dynamicDelay.portA_supply)
          annotation (Line(points={{-41,20},{-20,20},{-20,2},{0,2}}, color={255,128,0}));
        connect(SourcePressure.y, pressureBoundary_supply.p_in)
          annotation (Line(points={{-71,36},{-56,36},{-56,30}}, color={0,0,127}));
        connect(SourceTemperature.y, pressureBoundary_supply.T_in) annotation (
            Line(points={{-71,60},{-49,60},{-49,30}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end LearningThermalPower;
    end MicrogridWithDistrictHeating;
  end PSSE;

  package PFData
    record PowerFlowTemplate "Template Record for Power Flow Results"
      extends Modelica.Icons.Record;

      annotation (Documentation(info="<html>
<p>Template Record for Power Flow Results.</p>
</html>"));
    end PowerFlowTemplate;

    record PowerFlow "Record containing replaceable record with power flow results"
      extends Modelica.Icons.Record;

      replaceable record PowerFlow =
          PowerFlowTemplate constrainedby PowerFlowTemplate "Replaceable power flow record"
                                                      annotation (
          choicesAllMatching);

      PowerFlow powerflow;

      annotation (Documentation(info="<html>
<p>Instantiable record containing the replaceable record with power flow results.</p>
</html>"));
    end PowerFlow;

    extends Modelica.Icons.RecordsPackage;

    package BusData
      extends Modelica.Icons.RecordsPackage;

      partial record BusTemplate "Record template for power flow solutions in buses"

        parameter OpenIPSL.Types.PerUnit V1 "Voltage magnitude at G1"
          annotation (Dialog(enable=false));
        parameter OpenIPSL.Types.Angle A1 "Voltage angle at G1" annotation (Dialog(enable=false));

        parameter OpenIPSL.Types.PerUnit V2 "Voltage magnitude at bus 2"
          annotation (Dialog(enable=false));
        parameter OpenIPSL.Types.Angle A2 "Voltage angle at bus 2" annotation (Dialog(enable=false));

        parameter OpenIPSL.Types.PerUnit V3 "Voltage magnitude at bus 3"
          annotation (Dialog(enable=false));
        parameter OpenIPSL.Types.Angle A3 "Voltage angle at bus 3" annotation (Dialog(enable=false));

        parameter OpenIPSL.Types.PerUnit V4 "Voltage magnitude at bus 4"
          annotation (Dialog(enable=false));
        parameter OpenIPSL.Types.Angle A4 "Voltage angle at bus 4" annotation (Dialog(enable=false));

        parameter OpenIPSL.Types.PerUnit V5 "Voltage magnitude at bus 5"
          annotation (Dialog(enable=false));
        parameter OpenIPSL.Types.Angle A5 "Voltage angle at bus 5" annotation (Dialog(enable=false));
       parameter OpenIPSL.Types.PerUnit V6 "Voltage magnitude at G2"
          annotation (Dialog(enable=false));
        parameter OpenIPSL.Types.Angle A6 "Voltage angle at G2" annotation (Dialog(enable=false));

      end BusTemplate;

      record PFBus01
        "Record for power flow solutions in buses - Microgrid Load = 5 MW"
        import Modelica.Constants.pi;
        extends BusTemplate(
        V1 = 1.0000,
        V2 = 0.9903815,
        V3 = 0.9927449,
        V4 = 1.0000,
        V5 = 0.9978245,
        V6 = 1.0000,
        A1 = 12.69018*pi/180,
        A2 = 6.426857*pi/180,
        A3 = 0.117574*pi/180,
        A4 = 0*pi/180,
        A5 = -0.4589332*pi/180,
        A6 = -0.1773913*pi/180);

          // Voltage Magnitudes

        // Angle

        // Bus: 'B01' (PV bus)

        // Bus: 'B02' (slack bus)

        // Bus: 'B03' (PQ bus)

        // Bus: 'B04' (PQ bus)

        // Bus: 'B05' (PQ bus)

      end PFBus01;

      record PFBus02
        "Record for power flow solutions in buses - Microgrid Load = 10 MW"
        import Modelica.Constants.pi;
        extends BusTemplate(
        V1 = 1.0000,
        V2 = 0.9910569,
        V3 = 0.9929926,
        V4 = 1.0000,
        V5 = 0.997748,
        V6 = 0.9999999,
        A1 = 12.02401*pi/180,
        A2 = 6.055835*pi/180,
        A3 = 0.04538411*pi/180,
        A4 = 0*pi/180,
        A5 = -0.1719799*pi/180,
        A6 = 0.2532443*pi/180);

          // Voltage Magnitudes

        // Angle

        // Bus: 'B01' (PV bus)

        // Bus: 'B02' (slack bus)

        // Bus: 'B03' (PQ bus)

        // Bus: 'B04' (PQ bus)

        // Bus: 'B05' (PQ bus)

      end PFBus02;

      record PFBus03
        "Record for power flow solutions in buses - Microgrid Load = 10 MW"
        import Modelica.Constants.pi;
        extends BusTemplate(
        V1 = 1.0000,
        V2 = 0.9916971,
        V3 = 0.9932263,
        V4 = 1.0000,
        V5 = 0.9976591,
        V6 = 1.0000,
        A1 = 11.35992*pi/180,
        A2 = 5.686001*pi/180,
        A3 = -0.02673999*pi/180,
        A4 = 0*pi/180,
        A5 = 0.1149386*pi/180,
        A6 = 0.6838229*pi/180);

          // Voltage Magnitudes

        // Angle

        // Bus: 'B01' (PV bus)

        // Bus: 'B02' (slack bus)

        // Bus: 'B03' (PQ bus)

        // Bus: 'B04' (PQ bus)

        // Bus: 'B05' (PQ bus)

      end PFBus03;

      record PFBus04
        "Record for power flow solutions in buses - Microgrid Load = 10 MW"
        import Modelica.Constants.pi;
        extends BusTemplate(
        V1 = 1.0000,
        V2 = 0.9926503,
        V3 = 0.9935721,
        V4 = 1.0000,
        V5 = 0.9985361,
        V6 = 1.0000,
        A1 = 10.30002*pi/180,
        A2 = 5.095809*pi/180,
        A3 = -0.1421618*pi/180,
        A4 = 0*pi/180,
        A5 = 0.5736473*pi/180,
        A6 = 1.144547*pi/180);

          // Voltage Magnitudes

        // Angle

        // Bus: 'B01' (PV bus)

        // Bus: 'B02' (slack bus)

        // Bus: 'B03' (PQ bus)

        // Bus: 'B04' (PQ bus)

        // Bus: 'B05' (PQ bus)

      end PFBus04;

      record PFBus05
        "Record for power flow solutions in buses - Microgrid Load = 10 MW"
        import Modelica.Constants.pi;
        extends BusTemplate(
        V1 = 1.0000,
        V2 = 0.9920654,
        V3 = 0.9933603,
        V4 = 1.0000,
        V5 = 0.9986383,
        V6 = 1.0000,
        A1 = 10.96133*pi/180,
        A2 = 5.464046*pi/180,
        A3 = -0.07010145*pi/180,
        A4 = 0*pi/180,
        A5 = 0.2869359*pi/180,
        A6 = 0.714334*pi/180);

          // Voltage Magnitudes

        // Angle

        // Bus: 'B01' (PV bus)

        // Bus: 'B02' (slack bus)

        // Bus: 'B03' (PQ bus)

        // Bus: 'B04' (PQ bus)

        // Bus: 'B05' (PQ bus)

      end PFBus05;

      record PFBus06
        "Record for power flow solutions in buses - Microgrid Load = 10 MW"
        import Modelica.Constants.pi;
        extends BusTemplate(
        V1 = 0.9999999,
        V2 = 0.9914459,
        V3 = 0.9931347,
        V4 = 1.0000,
        V5 = 0.998728,
        V6 = 1.0000,
        A1 = 11.62454*pi/180,
        A2 = 5.833365*pi/180,
        A3 = 0.002017891*pi/180,
        A4 = 0*pi/180,
        A5 = 0.0002148477*pi/180,
        A6 = 0.2840931*pi/180);

          // Voltage Magnitudes

        // Angle

        // Bus: 'B01' (PV bus)

        // Bus: 'B02' (slack bus)

        // Bus: 'B03' (PQ bus)

        // Bus: 'B04' (PQ bus)

        // Bus: 'B05' (PQ bus)

      end PFBus06;

      record PFBus07
        "Record for power flow solutions in buses - Microgrid Load = 10 MW"
        import Modelica.Constants.pi;
        extends BusTemplate(
        V1 = 1.0000000,
        V2 = 0.9914461,
        V3 = 0.9931349,
        V4 = 1.0000,
        V5 = 0.9993664,
        V6 = 0.9999999,
        A1 = 11.62429*pi/180,
        A2 = 5.833227*pi/180,
        A3 = 0.001990927*pi/180,
        A4 = 0*pi/180,
        A5 = 0.0001441713*pi/180,
        A6 = 0.142008*pi/180);

      end PFBus07;

      record PFBus08
        "Record for power flow solutions in buses - Microgrid Load = 10 MW"
        import Modelica.Constants.pi;
        extends BusTemplate(
        V1 = 1.0000000,
        V2 = 0.9914461,
        V3 = 0.9931349,
        V4 = 1.0000,
        V5 = 0.9993664,
        V6 = 0.9999999,
        A1 = 11.62453*pi/180,
        A2 = 5.83336*pi/180,
        A3 = 0.00201686*pi/180,
        A4 = 0*pi/180,
        A5 = 0.0002148475*pi/180,
        A6 = 0.2840931*pi/180);

      end PFBus08;

      record PFBus09
        "Record for power flow solutions in buses - Microgrid Load = 10 MW"
        import Modelica.Constants.pi;
        extends BusTemplate(
        V1 = 1.0000000,
        V2 = 0.9914455,
        V3 = 0.9931346,
        V4 = 1.0000,
        V5 = 0.9980846,
        V6 = 1.0000,
        A1 = 11.62498*pi/180,
        A2 = 5.833611*pi/180,
        A3 = 0.002065807*pi/180,
        A4 = 0*pi/180,
        A5 = 0.0002116913*pi/180,
        A6 = 0.4262582*pi/180);

      end PFBus09;

      record PFBus10
        "Record for power flow solutions in buses - Microgrid Load = 10 MW"
        import Modelica.Constants.pi;
        extends BusTemplate(
        V1 = 1.0000000,
        V2 = 0.9914451,
        V3 = 0.9931345,
        V4 = 1.0000,
        V5 = 0.9976962,
        V6 = 1.0000,
        A1 = 11.62533*pi/180,
        A2 = 5.833803*pi/180,
        A3 = 0.002103247*pi/180,
        A4 = 0*pi/180,
        A5 = 0.0001742224*pi/180,
        A6 = 0.5115968*pi/180);

      end PFBus10;

      record PFBus11
        "Record for power flow solutions in buses - Microgrid Load = 1 MW"
        import Modelica.Constants.pi;
        extends BusTemplate(
        V1 = 1.0000000,
        V2 = 0.9903815,
        V3 = 0.9927449,
        V4 = 1.0000,
        V5 = 0.9978246,
        V6 = 1.0000,
        A1 = 12.69018*pi/180,
        A2 = 6.426857*pi/180,
        A3 = 0.117574*pi/180,
        A4 = 0*pi/180,
        A5 = -0.4589332*pi/180,
        A6 = -0.177391*pi/180);

      end PFBus11;

      record PFBus12
        "Record for power flow solutions in buses - Microgrid Load = 1 MW"
        import Modelica.Constants.pi;
        extends BusTemplate(
        V1 = 1.0000000,
        V2 = 0.9903815,
        V3 = 0.9927449,
        V4 = 1.0000,
        V5 = 0.9978246,
        V6 = 1.0000,
        A1 = 12.69018*pi/180,
        A2 = 6.426857*pi/180,
        A3 = 0.117574*pi/180,
        A4 = 0*pi/180,
        A5 = -0.4589332*pi/180,
        A6 = -0.177391*pi/180);

      end PFBus12;
      annotation (Documentation(info="<html>
<p>Records with power flow solutions for buses.</p>
</html>"));

    end BusData;

    package LoadData "Records with power flow solutions for loads"
      extends Modelica.Icons.RecordsPackage;

      partial record LoadTemplate
        "Record template for power flow solutions in loads"

        parameter OpenIPSL.Types.ActivePower PL1 "Load: constantLoad"
          annotation (Dialog(enable=false));
        parameter OpenIPSL.Types.ReactivePower QL1 "Load: constantLoad"
          annotation (Dialog(enable=false));
        parameter OpenIPSL.Types.ActivePower PL2 "Load: constantLoad"
          annotation (Dialog(enable=false));
        parameter OpenIPSL.Types.ReactivePower QL2 "Load: constantLoad"
          annotation (Dialog(enable=false));

      end LoadTemplate;

      record PFLoad01
        "{PL1  = 50MW, QL1 = 10MVar, PL2 = 9MW, QL2 = 2.9582 MVar}"
        extends LoadTemplate(
         PL1=50e6,
         QL1=10e6,
         PL2=9e6,
         QL2=2.9582e6);
        // Load 1

        // Load 2

        // Load: '3_1'

      end PFLoad01;

      record PFLoad02
        "{PL1  = 50MW, QL1 = 10MVar, PL2 = 9MW, QL2 = 2.9582 MVar}"
        extends LoadTemplate(
         PL1=50e6,
         QL1=10e6,
         PL2=9e6,
         QL2=2.9582e6);
        // Load 1

        // Load 2

        // Load: '3_1'

      end PFLoad02;

      record PFLoad03 "{PL1  = 50MW, QL1 = 10MVar, PL2 = 9MW, QL2 = 2.9582 MVar}"
        extends LoadTemplate(
         PL1=50e6,
         QL1=10e6,
         PL2=9e6,
         QL2=2.9582e6);
        // Load 1

        // Load 2

        // Load: '3_1'

      end PFLoad03;

      record PFLoad04
        "{PL1  = 50MW, QL1 = 10MVar, PL2 = 5MW, QL2 = 1.6434 MVar}"
        extends LoadTemplate(
         PL1=50e6,
         QL1=10e6,
         PL2=5e6,
         QL2=1.643421e6);
        // Load 1

        // Load 2

        // Load: '3_1'

      end PFLoad04;

      record PFLoad05 "{PL1  = 50MW, QL1 = 10MVar, PL2 = 5MW, QL2 = 1.6434 MVar}"
        extends LoadTemplate(
         PL1=50e6,
         QL1=10e6,
         PL2=5e6,
         QL2=1.643421e6);
        // Load 1

        // Load 2

        // Load: '3_1'

      end PFLoad05;

      record PFLoad06 "{PL1  = 50MW, QL1 = 10MVar, PL2 = 5MW, QL2 = 1.6434 MVar}"
        extends LoadTemplate(
         PL1=50e6,
         QL1=10e6,
         PL2=5e6,
         QL2=1.643421e6);
        // Load 1

        // Load 2

        // Load: '3_1'

      end PFLoad06;

      record PFLoad07
        "{PL1  = 50MW, QL1 = 10MVar, PL2 = 2.5MW, QL2 = 0.8217 MVar}"
        extends LoadTemplate(
         PL1=50e6,
         QL1=10e6,
         PL2=2.5e6,
         QL2=0.82171e6);
        // Load 1

        // Load 2

        // Load: '3_1'

      end PFLoad07;

      record PFLoad08
        "{PL1  = 50MW, QL1 = 10MVar, PL2 = 5MW, QL2 = 1.6434 MVar}"
        extends LoadTemplate(
         PL1=50e6,
         QL1=10e6,
         PL2=5e6,
         QL2=1.64342e6);
        // Load 1

        // Load 2

        // Load: '3_1'

      end PFLoad08;

      record PFLoad09
        "{PL1  = 50MW, QL1 = 10MVar, PL2 = 7.5MW, QL2 = 2.4651 MVar}"
        extends LoadTemplate(
         PL1=50e6,
         QL1=10e6,
         PL2=7.5e6,
         QL2=2.46513e6);
        // Load 1

        // Load 2

        // Load: '3_1'

      end PFLoad09;

      record PFLoad10
        "Record for power flow solutions in loads - Pload = 10 MW"
        extends LoadTemplate(
         PL1=50e6,
         QL1=10e6,
         PL2=9e6,
         QL2=2.9582e6);
        // Load 1

        // Load 2

        // Load: '3_1'

      end PFLoad10;

      record PFLoad11
        "{PL1  = 50MW, QL1 = 10MVar, PL2 = 9MW, QL2 = 2.9582 MVar}"
        extends LoadTemplate(
         PL1=50e6,
         QL1=10e6,
         PL2=9e6,
         QL2=2.9582e6);

      end PFLoad11;

      record PFLoad12 "{PL1  = 50MW, QL1 = 10MVar, PL2 = 9MW, QL2 = 2.9582 MVar}"
        extends LoadTemplate(
         PL1=50e6,
         QL1=10e6,
         PL2=9e6,
         QL2=2.9582e6);

      end PFLoad12;
      annotation (Documentation(info="<html>
<p>Records with power flow solutions for loads.</p>
</html>"));
    end LoadData;

    package MachineData "Records with power flow solutions for machines"
      extends Modelica.Icons.RecordsPackage;

      partial record MachineTemplate
        "Record template for power flow solutions in machines"

        parameter OpenIPSL.Types.ActivePower PG1 "machine: generator1"
          annotation (Dialog(enable=false));
        parameter OpenIPSL.Types.ReactivePower QG1 "machine: generator1"
          annotation (Dialog(enable=false));

        parameter OpenIPSL.Types.ActivePower PG2 "machine: generator2"
          annotation (Dialog(enable=false));
        parameter OpenIPSL.Types.ReactivePower QG2 "machine: generator2"
           annotation (Dialog(enable=false));
           parameter OpenIPSL.Types.ActivePower Pinf "machine: infinite bus"
          annotation (Dialog(enable=false));
        parameter OpenIPSL.Types.ReactivePower Qinf "machine: infinite bus"
          annotation (Dialog(enable=false));

      end MachineTemplate;

      record PFMachine01
        "Machine Record - [L2 10MW/3.28684MVar]; [G2 5MW/2.1669MVar]"
        extends MachineTemplate(
         PG1=54.0618e6,
         QG1=7.494723e6,
         PG2=5.00000e6,
         QG2=1.93757e6,
         Pinf=-4.524317e-05,
         Qinf=15.61806e6);
          // Machine G1

        // Machine G2

        // Machine Inf

      end PFMachine01;

      record PFMachine02
        "Record for power flow solutions in machines - Pload = 10 MW"
        extends MachineTemplate(
         PG1=51.5576e6,
         QG1=6.899646e6,
         PG2=7.5e6,
         QG2=1.904409e6,
         Pinf=4.163468e-05,
         Qinf=15.14367e6);
          // Machine G1

        // Machine G2

        // Machine Inf

      end PFMachine02;

      record PFMachine03
        "Record for power flow solutions in machines - Pload = 10 MW"
        extends MachineTemplate(
         PG1=49.0546e6,
         QG1=6.335524e6,
         PG2=10e6,
         QG2=1.890087e6,
         Pinf=-5.40828e-06,
         Qinf=14.71908e6);
          // Machine G1

        // Machine G2

        // Machine Inf

      end PFMachine03;

      record PFMachine04
        "Record for power flow solutions in machines - Pload = 10 MW"
        extends MachineTemplate(
         PG1=45.047e6,
         QG1=5.495558e6,
         PG2=10e6,
         QG2=1.013569e6,
         Pinf=-3.016484e-05,
         Qinf=13.61904e6);
          // Machine G1

        // Machine G2

        // Machine Inf

      end PFMachine04;

      record PFMachine05
        "Record for power flow solutions in machines - Pload = 10 MW"
        extends MachineTemplate(
         PG1=47.5493e6,
         QG1=6.010928e6,
         PG2=7.5e6,
         QG2=1.01453e6,
         Pinf=2.667061e-05,
         Qinf=13.96811e6);
          // Machine G1

        // Machine G2

        // Machine Inf

      end PFMachine05;

      record PFMachine06
        "Record for power flow solutions in machines - Pload = 10 MW"
        extends MachineTemplate(
         PG1=50.05274e6,
         QG1=6.556822e6,
         PG2=5e6,
         QG2=1.03429e6,
         Pinf=6.032772e-06,
         Qinf=14.36652e6);
          // Machine G1

        // Machine G2

        // Machine Inf

      end PFMachine06;

      record PFMachine07
        "Record for power flow solutions in machines - Pload = 10 MW"
        extends MachineTemplate(
         PG1=50.0518e6,
         QG1=6.556613e6,
         PG2=2.5000e6,
         QG2=0.5116372e6,
         Pinf=-4.105587e-05,
         Qinf=14.04712e6);
          // Machine G1

        // Machine G2

        // Machine Inf

      end PFMachine07;

      record PFMachine08
        "Record for power flow solutions in machines - Pload = 10 MW"
        extends MachineTemplate(
         PG1=50.0527e6,
         QG1=6.556815e6,
         PG2=5e6,
         QG2=1.03429e6,
         Pinf=4.172131e-05,
         Qinf=14.36652e6);
          // Machine G1

        // Machine G2

        // Machine Inf

      end PFMachine08;

      record PFMachine09
        "Record for power flow solutions in machines - Pload = 10 MW"
        extends MachineTemplate(
         PG1=50.0544e6,
         QG1=6.557196e6,
         PG2=7.5e6,
         QG2=1.56799e6,
         Pinf=-1.641935e-05,
         Qinf=14.68852e6);
          // Machine G1

        // Machine G2

        // Machine Inf

      end PFMachine09;

      record PFMachine10
        "Record for power flow solutions in machines - Pload = 10 MW"
        extends MachineTemplate(
         PG1=50.0557e6,
         QG1=6.557487e6,
         PG2=9e6,
         QG2=1.893555e6,
         Pinf=-1.516062e-05,
         Qinf=14.88296e6);
          // Machine G1

        // Machine G2

        // Machine Inf

      end PFMachine10;

      record PFMachine11
        "Record for power flow solutions in machines - Pload = 1 MW"
        extends MachineTemplate(
         PG1=54.0618e6,
         QG1=7.494723e6,
         PG2=5e6,
         QG2=1.937436e6,
         Pinf=-4.527057e-05,
         Qinf=15.618e6);
          // Machine G1

        // Machine G2

        // Machine Inf

      end PFMachine11;

      record PFMachine12
        "Record for power flow solutions in machines - Pload = 1 MW"
        extends MachineTemplate(
         PG1=54.0618e6,
         QG1=7.494723e6,
         PG2=5e6,
         QG2=1.937436e6,
         Pinf=-4.527057e-05,
         Qinf=15.618e6);
          // Machine G1

        // Machine G2

        // Machine Inf

      end PFMachine12;
      annotation (Documentation(info="<html>
<p>Records with power flow solutions for machines.</p>
</html>"));
    end MachineData;

    record PF01 "Microgrid Load Scenario: [L2 10MW/3.28684MVar]; [G2 5MW/2.1669MVar]"
      extends PowerFlowTemplate;

      replaceable record Bus =
          BusData.PFBus01   constrainedby BusData.BusTemplate
        "Power flow results for buses";
      Bus bus;

      replaceable record Loads =
          LoadData.PFLoad01    constrainedby LoadData.LoadTemplate
        "Power flow results for loads";
      Loads loads;

      replaceable record Machines =
          MachineData.PFMachine01    constrainedby MachineData.MachineTemplate
        "Power flow results for machines";
      Machines machines;

    end PF01;

    record PF02 "Microgrid Load Scenario: [L2 10MW/3.28684MVar]; [G2 7.5MW/2.1304MVar]"
      extends PowerFlowTemplate;

      replaceable record Bus =
          BusData.PFBus02   constrainedby BusData.BusTemplate
        "Power flow results for buses";
      Bus bus;

      replaceable record Loads =
          LoadData.PFLoad02    constrainedby LoadData.LoadTemplate
        "Power flow results for loads";
      Loads loads;

      replaceable record Machines =
          MachineData.PFMachine02    constrainedby MachineData.MachineTemplate
        "Power flow results for machines";
      Machines machines;

    end PF02;

    record PF03
      "Microgrid Load Scenario: [L2 10MW/3.28684MVar]; [G2 10MW/2.1127MVar]"
      extends PowerFlowTemplate;

      replaceable record Bus =
          BusData.PFBus03   constrainedby BusData.BusTemplate
        "Power flow results for buses";
      Bus bus;

      replaceable record Loads =
          LoadData.PFLoad03    constrainedby LoadData.LoadTemplate
        "Power flow results for loads";
      Loads loads;

      replaceable record Machines =
          MachineData.PFMachine03    constrainedby MachineData.MachineTemplate
        "Power flow results for machines";
      Machines machines;

    end PF03;

    record PF04
      "Microgrid Load Scenario: [L2 5MW/1.6434MVar]; [G2 10MW/1.0135MVar]"
      extends PowerFlowTemplate;

      replaceable record Bus =
          BusData.PFBus04   constrainedby BusData.BusTemplate
        "Power flow results for buses";
      Bus bus;

      replaceable record Loads =
          LoadData.PFLoad04    constrainedby LoadData.LoadTemplate
        "Power flow results for loads";
      Loads loads;

      replaceable record Machines =
          MachineData.PFMachine04    constrainedby MachineData.MachineTemplate
        "Power flow results for machines";
      Machines machines;

    end PF04;

    record PF05
      "Microgrid Load Scenario: [L2 5MW/1.6434MVar]; [G2 7.5MW/1.0145MVar]"
      extends PowerFlowTemplate;

      replaceable record Bus =
          BusData.PFBus05   constrainedby BusData.BusTemplate
        "Power flow results for buses";
      Bus bus;

      replaceable record Loads =
          LoadData.PFLoad05    constrainedby LoadData.LoadTemplate
        "Power flow results for loads";
      Loads loads;

      replaceable record Machines =
          MachineData.PFMachine05    constrainedby MachineData.MachineTemplate
        "Power flow results for machines";
      Machines machines;

    end PF05;

    record PF06
      "Microgrid Load Scenario: [L2 5MW/1.6434MVar]; [G2 5MW/1.0342MVar]"
      extends PowerFlowTemplate;

      replaceable record Bus =
          BusData.PFBus06   constrainedby BusData.BusTemplate
        "Power flow results for buses";
      Bus bus;

      replaceable record Loads =
          LoadData.PFLoad06    constrainedby LoadData.LoadTemplate
        "Power flow results for loads";
      Loads loads;

      replaceable record Machines =
          MachineData.PFMachine06    constrainedby MachineData.MachineTemplate
        "Power flow results for machines";
      Machines machines;

    end PF06;

    record PF07
      "Microgrid Load Scenario: [L2 2.5MW/0.8217MVar]; [G2 2.5MW/6.6782MVar]"
      extends PowerFlowTemplate;

      replaceable record Bus =
          BusData.PFBus07   constrainedby BusData.BusTemplate
        "Power flow results for buses";
      Bus bus;

      replaceable record Loads =
          LoadData.PFLoad07    constrainedby LoadData.LoadTemplate
        "Power flow results for loads";
      Loads loads;

      replaceable record Machines =
          MachineData.PFMachine07    constrainedby MachineData.MachineTemplate
        "Power flow results for machines";
      Machines machines;

    end PF07;

    record PF08
      "Microgrid Load Scenario: [L2 2.5MW/0.8217MVar]; [G2 2.5MW/6.6782MVar]"
      extends PowerFlowTemplate;

      replaceable record Bus =
          BusData.PFBus08   constrainedby BusData.BusTemplate
        "Power flow results for buses";
      Bus bus;

      replaceable record Loads =
          LoadData.PFLoad08    constrainedby LoadData.LoadTemplate
        "Power flow results for loads";
      Loads loads;

      replaceable record Machines =
          MachineData.PFMachine08    constrainedby MachineData.MachineTemplate
        "Power flow results for machines";
      Machines machines;

    end PF08;

    record PF09
      "Microgrid Load Scenario: [L2 2.5MW/0.8217MVar]; [G2 2.5MW/6.6782MVar]"
      extends PowerFlowTemplate;

      replaceable record Bus =
          BusData.PFBus09   constrainedby BusData.BusTemplate
        "Power flow results for buses";
      Bus bus;

      replaceable record Loads =
          LoadData.PFLoad09    constrainedby LoadData.LoadTemplate
        "Power flow results for loads";
      Loads loads;

      replaceable record Machines =
          MachineData.PFMachine09    constrainedby MachineData.MachineTemplate
        "Power flow results for machines";
      Machines machines;

    end PF09;

    record PF10
      "Microgrid Load Scenario: [L2 2.5MW/0.8217MVar]; [G2 2.5MW/6.6782MVar]"
      extends PowerFlowTemplate;

      replaceable record Bus =
          BusData.PFBus10   constrainedby BusData.BusTemplate
        "Power flow results for buses";
      Bus bus;

      replaceable record Loads =
          LoadData.PFLoad10    constrainedby LoadData.LoadTemplate
        "Power flow results for loads";
      Loads loads;

      replaceable record Machines =
          MachineData.PFMachine10    constrainedby MachineData.MachineTemplate
        "Power flow results for machines";
      Machines machines;

    end PF10;

    record PF11
      "Microgrid Load Scenario: [L2 1MW/0.328MVar]; [G2 10MW/0.1599MVar]"
      extends PowerFlowTemplate;

      replaceable record Bus =
          BusData.PFBus11   constrainedby BusData.BusTemplate
        "Power flow results for buses";
      Bus bus;

      replaceable record Loads =
          LoadData.PFLoad11    constrainedby LoadData.LoadTemplate
        "Power flow results for loads";
      Loads loads;

      replaceable record Machines =
          MachineData.PFMachine11    constrainedby MachineData.MachineTemplate
        "Power flow results for machines";
      Machines machines;

    end PF11;
  end PFData;

end ModelPredictiveControl;
