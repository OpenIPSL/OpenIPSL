within OpenIPSL.Examples.MPC.PSSE.OBSERVABLE_CONTROLLABLE_STABLE;
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
        OpenIPSL.Examples.MPC.PFData.PF01)
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
</html>"),
    experiment(
      StopTime=10,
      Tolerance=1e-09,
      __Dymola_Algorithm="Dassl"));
end Reconnection_Microgrid_PSSE_3_INPUT_WITH_CONST_V_SOURCE3;
