within OpenIPSL.Examples.MPC.PSSE.EquipmentOnlyLinearization;
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
</html>"),
    experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end OptimizationModel04;
