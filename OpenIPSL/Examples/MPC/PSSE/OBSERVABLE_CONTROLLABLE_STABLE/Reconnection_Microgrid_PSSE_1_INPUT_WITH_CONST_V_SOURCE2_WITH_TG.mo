within OpenIPSL.Examples.MPC.PSSE.OBSERVABLE_CONTROLLABLE_STABLE;
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
