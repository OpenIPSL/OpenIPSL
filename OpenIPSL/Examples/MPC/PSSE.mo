within OpenIPSL.Examples.MPC;
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
    OpenIPSL.Examples.MPC.GenerationUnits.PSSE.G2_1INPUT_Pref G2(
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
    OpenIPSL.Examples.MPC.GenerationUnits.PSSE.G2_1INPUT_Pref G2(
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
    OpenIPSL.Examples.MPC.GenerationUnits.PSSE.G2_1INPUT_Pref G2(
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
      OpenIPSL.Examples.MPC.GenerationUnits.PSSE.G2_1INPUT_Pref_NO_TurbGov G2(
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
</html>"),
        experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
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
      OpenIPSL.Examples.MPC.GenerationUnits.PSSE.G2_1INPUT_Pref G2(
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
</html>"),
        experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
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
      OpenIPSL.Examples.MPC.GenerationUnits.PSSE.G2_1INPUT_Pref_WITH_TurbGov G2(
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
</html>"),
        experiment(
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
      OpenIPSL.Examples.MPC.GenerationUnits.PSSE.G2_1INPUT_Pref_WITH_TurbGov G2(
        v_0=1.00869, angle_0=-0.01036638309222,
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
</html>"),
        experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
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
      OpenIPSL.Examples.MPC.GenerationUnits.PSSE.G2_2INPUTS G2(
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
</html>"),
        experiment(
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
      OpenIPSL.Examples.MPC.GenerationUnits.PSSE.G2_2INPUTS G2(
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
</html>"),
        experiment(
          StopTime=10,
          Tolerance=1e-09,
          __Dymola_Algorithm="Dassl"));
    end Reconnection_Microgrid_PSSE_2_INPUT_WITH_CONST_V_SOURCE2_V2;

    model Reconnection_Microgrid_PSSE_3_INPUT_WITH_CONST_V_SOURCE3
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
      GenerationUnits.PSSE.G2_3INPUTS                       G2(
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
            origin={-160,20})));
      Electrical.Loads.PSSE.Load_variation load_variation(
        V_b=220000,
        P_0=15000000,
        Q_0=10000000,
        v_0=0.997342,
        angle_0=-0.00014475935348966,
        d_P=0.01,
        t1=2.1,
        d_t=20)
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
        annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
      Modelica.Blocks.Math.Add AddU1
        annotation (Placement(transformation(extent={{-80,4},{-60,24}})));
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
      connect(IN11.y, AddU1.u2) annotation (Line(points={{-99,0},{-82,0},{-82,8}},
                          color={0,0,127}));
      connect(IN1, AddU1.u1) annotation (Line(points={{-160,20},{-82,20}},
                     color={0,0,127}));
      connect(T2.p, B4.p) annotation (Line(points={{60,0.6},{60,2},{80,2},{80,10}},
                            color={0,0,255}));

      connect(IN22.y,AddU2. u2) annotation (Line(points={{-99,-100},{-82,-100},{-82,
              -92}}, color={0,0,127}));
      connect(IN2,AddU2. u1) annotation (Line(points={{-160,-80},{-82,-80}},
                     color={0,0,127}));
      connect(AddU2.y, G2.Efd_ref)
        annotation (Line(points={{-59,-86},{66,-86},{66,-52}}, color={0,0,127}));
      connect(AddU1.y, G2.P_ref1) annotation (Line(points={{-59,14},{-28,14},{-28,-20},
              {0,-20},{0,-74},{54,-74},{54,-52}}, color={0,0,127}));
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
        experiment(
          StopTime=10,
          Tolerance=1e-09,
          __Dymola_Algorithm="Dassl"));
    end Reconnection_Microgrid_PSSE_3_INPUT_WITH_CONST_V_SOURCE3;
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
      OpenIPSL.Examples.MPC.GenerationUnits.PSSE.G2_1INPUT_Pref_NO_TurbGov G2(
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
</html>"),
        experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
    end Reconnection_Microgrid_PSSE_1_INPUT_1_OUTPUT_WITH_CONST_V_SOURCE2_NO_TG;

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
      OpenIPSL.Examples.MPC.GenerationUnits.PSSE.G2_2INPUT_Pref_Efdref_NO_TurbGov_NO_Exci G2(
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
</html>"),
        experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
    end Reconnection_Microgrid_PSSE_2_INPUT_WITH_CONST_V_SOURCE2_NO_TG;
  end NOTCONTROLLABLE_NOTOBSERVABLE_STABLE;
end PSSE;
