within OpenIPSL.Examples.RaPIdExperiments.Line_Aggregation;
model Reference_system "Reference power system model for line aggregation using RaPId"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Machines.PSSE.GENROE gENROE(
    M_b=100000000,
    Tpd0=5,
    Tppd0=0.07,
    w0=0,
    Tpq0=0.9,
    Tppq0=0.09,
    H=4.28,
    D=0,
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xpq=0.6,
    Xppd=0.2,
    Xl=0.12,
    S10=0.11,
    S12=0.39,
    v_0=1,
    angle_0=0.070492225331847,
    P_0=40000000,
    Q_0=5416582,
    Xppq=0.2,
    Xpp=0.2)
    annotation (Placement(transformation(extent={{-78,-10},{-38,30}})));
  OpenIPSL.Electrical.Machines.PSSE.GENROE gENROE1(
    D=0,
    S10=0.11,
    S12=0.39,
    v_0=1,
    angle_0=0,
    Tpd0=7.6969,
    Tppd0=0.0413,
    w0=0,
    Tpq0=1.6732,
    Tppq0=0.0763,
    H=7.9284,
    Xd=1.0003,
    Xq=1.3005,
    Xpd=0.1638,
    Xpq=0.8517,
    Xppd=0.2,
    Xl=0.1111,
    P_0=10017110,
    Q_0=8006544,
    M_b=100000000,
    R_a=0.0,
    Xppq=0.2,
    Xpp=0.2)
    annotation (Placement(transformation(extent={{170,-10},{130,30}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=0.001,
    G=0,
    B=0,
    X=0.2) annotation (Placement(transformation(extent={{6,0},{26,20}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{62,20},{82,40}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    t2=100,
    G=0,
    B=0,
    t1=100,
    R=0.001,
    X=0.2,
    opening=1) annotation (Placement(transformation(extent={{62,-20},{82,0}})));
  OpenIPSL.Electrical.Loads.PSSE.Load_variation constantLoad(
    PQBRAK=0.7,
    characteristic=1,
    d_t=0,
    d_P=0,
    t1=0,
    v_0=0.9919935,
    angle_0=-0.5762684,
    P_0=50000000,
    Q_0=10000000)
                 annotation (Placement(transformation(extent={{36,-40},{56,-20}})));
  OpenIPSL.Electrical.Buses.Bus LOAD
    annotation (Placement(transformation(extent={{32,0},{52,20}})));
  OpenIPSL.Electrical.Buses.Bus GEN1
    annotation (Placement(transformation(extent={{-24,0},{-4,20}})));
  OpenIPSL.Electrical.Buses.Bus GEN2
    annotation (Placement(transformation(extent={{92,0},{112,20}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-120,10},{-100,30}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-158,4},{-138,24}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=0.01,
    duration=3,
    offset=0,
    startTime=2)
    annotation (Placement(transformation(extent={{-192,14},{-172,34}})));
  Modelica.Blocks.Sources.Ramp ramp1(
    height=-0.01,
    duration=5,
    startTime=10)
    annotation (Placement(transformation(extent={{-192,-16},{-172,4}})));
  inner Electrical.SystemBase SysData(S_b=100000000, fn=50)
    annotation (Placement(transformation(extent={{-200,-60},{-160,-40}})));
equation
  connect(gENROE1.EFD0, gENROE1.EFD) annotation (Line(points={{128,0},{124,0},{124,
          -16},{176,-16},{176,-2},{174,-2}}, color={0,0,127}));
  connect(gENROE1.PMECH, gENROE1.PMECH0) annotation (Line(points={{174,22},{180,
          22},{180,-20},{120,-20},{120,20},{128,20}}, color={0,0,127}));
  connect(pwLine.n, LOAD.p)
    annotation (Line(points={{25,10},{25,10},{42,10}}, color={0,0,255}));
  connect(LOAD.p, pwLine1.p) annotation (Line(points={{42,10},{50,10},{50,30},{
          63,30}}, color={0,0,255}));
  connect(pwLine3.p, pwLine1.p) annotation (Line(points={{63,-10},{50,-10},{50,
          30},{63,30}}, color={0,0,255}));
  connect(pwLine1.n, GEN2.p) annotation (Line(points={{81,30},{94,30},{94,10},{
          102,10}}, color={0,0,255}));
  connect(pwLine3.n, GEN2.p) annotation (Line(points={{81,-10},{94,-10},{94,10},
          {102,10}}, color={0,0,255}));
  connect(gENROE1.p, GEN2.p)
    annotation (Line(points={{130,10},{130,10},{102,10}}, color={0,0,255}));
  connect(constantLoad.p, pwLine1.p) annotation (Line(points={{46,-20},{46,10},{
          50,10},{50,30},{63,30}}, color={0,0,255}));
  connect(pwLine.p, GEN1.p)
    annotation (Line(points={{7,10},{7,10},{-14,10}}, color={0,0,255}));
  connect(gENROE.p, GEN1.p)
    annotation (Line(points={{-38,10},{-38,10},{-14,10}}, color={0,0,255}));
  connect(gENROE.EFD, gENROE.EFD0) annotation (Line(points={{-82,-2},{-90,-2},{-90,
          -20},{-34,-20},{-34,0},{-36,0}}, color={0,0,127}));
  connect(add.y, gENROE.PMECH)
    annotation (Line(points={{-99,20},{-90,20},{-90,22},{-82,22}},
                                                 color={0,0,127}));
  connect(add.u1, gENROE.PMECH0) annotation (Line(points={{-122,26},{-138,26},{
          -138,46},{-28,46},{-28,20},{-36,20}}, color={0,0,127}));
  connect(add.u2, add1.y)
    annotation (Line(points={{-122,14},{-130,14},{-137,14}}, color={0,0,127}));
  connect(add1.u1, ramp.y) annotation (Line(points={{-160,20},{-168,20},{-168,
          24},{-171,24}}, color={0,0,127}));
  connect(add1.u2, ramp1.y) annotation (Line(points={{-160,8},{-166,8},{-166,-6},
          {-171,-6}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -60},{200,60}})),
    Documentation(info="<html>
<p>This is a Two-Machine system containing disturbances on the mechanical power supply of the generator connected to bus GEN1.
These disturbances allow the user to observe dominant dynamics that need to be preserved when system is simplified.</p>
<p>Simulate the system for 20 seconds. Variables of interest are:</p>
<ul>
<li><code>gENROE.SPEED</code></li>
<li><code>add1.y</code></li>
</ul>
</html>"),
    experiment(
      StopTime=20,
      Tolerance=1e-06));
end Reference_system;
