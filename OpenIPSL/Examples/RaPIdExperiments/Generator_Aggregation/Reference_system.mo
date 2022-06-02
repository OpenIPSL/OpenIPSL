within OpenIPSL.Examples.RaPIdExperiments.Generator_Aggregation;
model Reference_system "Original test system for machine aggregation using RaPId"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=0.001,
    G=0,
    B=0,
    X=0.2,
    S_b=100) annotation (Placement(transformation(extent={{22,-10},{42,10}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0.001,
    X=0.2,
    G=0,
    B=0,
    S_b=100) annotation (Placement(transformation(extent={{82,10},{102,30}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    t2=100,
    G=0,
    B=0,
    t1=100,
    R=0.001,
    X=0.2,
    S_b=100,
    opening=1)
    annotation (Placement(transformation(extent={{82,-30},{102,-10}})));
  OpenIPSL.Electrical.Loads.PSSE.Load_variation constantLoad(
    PQBRAK=0.7,
    characteristic=2,
    d_t=0,
    d_P=0,
    t1=0,
    v_0=0.9919935,
    angle_0=-0.5762684,
    P_0=50000000,
    Q_0=10000000) annotation (Placement(transformation(extent={{56,-60},{76,-40}})));
  OpenIPSL.Electrical.Machines.PSSE.GENROE gENROE(
    M_b=100000000,
    Tpd0=5,
    Tppd0=0.07,
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
    annotation (Placement(transformation(extent={{-58,-20},{-18,20}})));
  OpenIPSL.Electrical.Machines.PSSE.GENROE gENROE1(
    Tpd0=5,
    Tppd0=0.07,
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
    angle_0=0,
    P_0=1000000*(10.017110/2),
    Q_0=1000000*(8.006544/2),
    M_b=100000000,
    Xppq=0.2,
    Xpp=0.2,
    XaqIlq(fixed=false))
              annotation (Placement(transformation(extent={{184,20},{144,60}})));
  OpenIPSL.Electrical.Machines.PSSE.GENROE gENROE2(
    Tpd0=5,
    Tppd0=0.07,
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
    angle_0=0,
    P_0=1000000*(10.017110/2),
    Q_0=1000000*(8.006544/2),
    M_b=100000000,
    Xppq=0.2,
    Xpp=0.2)
    annotation (Placement(transformation(extent={{184,-60},{144,-20}})));
  OpenIPSL.Electrical.Buses.Bus LOAD
    annotation (Placement(transformation(extent={{52,-10},{72,10}})));
  OpenIPSL.Electrical.Buses.Bus GEN1
    annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
  OpenIPSL.Electrical.Buses.Bus GEN2
    annotation (Placement(transformation(extent={{112,-10},{132,10}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-150,-14},{-130,6}})));
  Modelica.Blocks.Sources.Step step(
    startTime=2,
    offset=0,
    height=0.1)
    annotation (Placement(transformation(extent={{-190,6},{-170,26}})));
  Modelica.Blocks.Sources.Step step1(height=-0.1, startTime=10)
    annotation (Placement(transformation(extent={{-190,-34},{-170,-14}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-110,-20},{-90,0}})));
  inner Electrical.SystemBase SysData(S_b=100000000, fn=50)
    annotation (Placement(transformation(extent={{-200,80},{-160,100}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-62,12},{-68,
          12},{-68,26},{-6,26},{-6,10},{-16,10}}, color={0,0,127}));
  connect(gENROE.p, GEN1.p)
    annotation (Line(points={{-18,0},{2,0}}, color={0,0,255}));
  connect(GEN1.p, pwLine.p)
    annotation (Line(points={{2,0},{14,0},{14,0},{23,0}}, color={0,0,255}));
  connect(pwLine.n, LOAD.p)
    annotation (Line(points={{41,0},{62,0},{62,0}}, color={0,0,255}));
  connect(LOAD.p, pwLine1.p)
    annotation (Line(points={{62,0},{70,0},{70,20},{83,20}}, color={0,0,255}));
  connect(pwLine3.p, pwLine1.p) annotation (Line(points={{83,-20},{70,-20},{70,
          20},{83,20}}, color={0,0,255}));
  connect(pwLine1.n, GEN2.p) annotation (Line(points={{101,20},{114,20},{114,0},
          {122,0}},color={0,0,255}));
  connect(pwLine3.n, GEN2.p) annotation (Line(points={{101,-20},{114,-20},{114,
          0},{122,0}}, color={0,0,255}));
  connect(gENROE1.p, GEN2.p) annotation (Line(points={{144,40},{130,40},{130,0},
          {122,0}}, color={0,0,255}));
  connect(gENROE2.p, GEN2.p) annotation (Line(points={{144,-40},{130,-40},{130,
          0},{122,0}}, color={0,0,255}));
  connect(constantLoad.p, pwLine1.p) annotation (Line(points={{66,-40},{66,0},{70,
          0},{70,20},{83,20}}, color={0,0,255}));
  connect(gENROE1.EFD0, gENROE1.EFD) annotation (Line(points={{142,30},{138,30},
          {138,14},{190,14},{190,28},{188,28}},color={0,0,127}));
  connect(gENROE2.EFD0, gENROE2.EFD) annotation (Line(points={{142,-50},{136,-50},
          {136,-66},{190,-66},{190,-52},{188,-52}}, color={0,0,127}));
  connect(gENROE2.PMECH, gENROE2.PMECH0) annotation (Line(points={{188,-28},{194,
          -28},{194,-70},{132,-70},{132,-30},{142,-30}}, color={0,0,127}));
  connect(gENROE1.PMECH, gENROE1.PMECH0) annotation (Line(points={{188,52},{194,
          52},{194,10},{134,10},{134,50},{142,50}}, color={0,0,127}));
  connect(add.y, add1.u1)
    annotation (Line(points={{-129,-4},{-112,-4}}, color={0,0,127}));
  connect(step1.y, add.u2) annotation (Line(points={{-169,-24},{-160,-24},{-160,
          -10},{-152,-10}}, color={0,0,127}));
  connect(step.y, add.u1) annotation (Line(points={{-169,16},{-160,16},{-160,2},
          {-152,2}}, color={0,0,127}));
  connect(add1.y, gENROE.EFD)
    annotation (Line(points={{-89,-10},{-76,-10},{-76,-12},{-62,-12}},
                                                   color={0,0,127}));
  connect(gENROE.EFD0, add1.u2) annotation (Line(points={{-16,-10},{-6,-10},{-6,
          -40},{-122,-40},{-122,-16},{-112,-16}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}})),
    experiment(StopTime=20),
    Documentation(info="<html>
<p>This is a Three-Machine system containing disturbances on the excitation system of the generator connected to bus GEN1.
These disturbances allow the user to observe dominant dynamics that need to be preserved when the generators conncted at bus GEN2 are aggregated into one machine.</p>
<p>Simulate the system for 20 seconds. Variables of interest are:</p>
<ul>
<li><code>gENROE.SPEED</code></li>
<li><code>gENROE1.SPEED</code></li>
<li><code>gENROE2.SPEED</code></li>
</ul>
<p>In addition, also plot the following variables:</p>
<ul>
<li><code>gENROE.PELEC</code></li>
<li><code>gENROE1.PELEC</code></li>
<li><code>gENROE2.PELEC</code></li>
</ul>
<p>Compare the results obtained in this simulation with the ones obtained in <strong>Aggregated_system</strong>.</p>
</html>"));
end Reference_system;
