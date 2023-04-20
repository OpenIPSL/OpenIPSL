within OpenIPSL.Examples.MPC.PSSE.EquipmentOnlyLinearization;
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
        OpenIPSL.Examples.MPC.PFData.PF06)
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
</html>"),
    experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end OptimizationModel06;
