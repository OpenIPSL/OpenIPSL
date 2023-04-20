within OpenIPSL.Examples.MPC.PSSE.EquipmentOnlyLinearization;
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
        OpenIPSL.Examples.MPC.PFData.PF01)
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
</html>"),
    experiment(
      StopTime=10,
      __Dymola_NumberOfIntervals=100,
      __Dymola_Algorithm="Dassl"),
    Icon(coordinateSystem(extent={{-140,-160},{140,120}})));
end OptimizationModel07;
