within OpenIPSL.Examples.MPC.PSSE.EquipmentOnlyLinearization;
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
        OpenIPSL.Examples.MPC.PFData.PF04)
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
</html>"),
    experiment(
      StopTime=3,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end OptimizationModel03;
