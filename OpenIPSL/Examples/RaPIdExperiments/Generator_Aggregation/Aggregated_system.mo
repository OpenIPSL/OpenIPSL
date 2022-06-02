within OpenIPSL.Examples.RaPIdExperiments.Generator_Aggregation;
model Aggregated_system "Test system with an aggregated machine, obtained using RaPId"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=0.001,
    G=0,
    B=0,
    X=0.2) annotation (Placement(transformation(extent={{18,-4},{38,16}})));
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
    Xpp=0.2) annotation (Placement(transformation(extent={{-44,-14},{-4,26}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-106,-8},{-86,12}})));
  Modelica.Blocks.Sources.Step step(
    startTime=2,
    offset=0,
    height=0.1)
    annotation (Placement(transformation(extent={{-136,-2},{-116,18}})));
  Modelica.Blocks.Sources.Step step1(height=-0.1, startTime=10)
    annotation (Placement(transformation(extent={{-136,-40},{-116,-20}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-76,-14},{-56,6}})));
  OpenIPSL.Electrical.Machines.PSSE.GENROE gENROE1(
    Tpd0=7.6969,
    Tppd0=0.0413,
    Tpq0=1.6732,
    Tppq0=0.0763,
    H=7.92,
    D=0,
    Xd=1.003,
    Xq=1.3005,
    Xpd=0.1638,
    Xpq=0.8517,
    Xppd=0.2,
    Xl=0.1111,
    S10=0.11,
    S12=0.39,
    v_0=1,
    angle_0=0,
    M_b=100000000,
    P_0=10017110,
    Q_0=8006544,
    Xppq=0.2,
    Xpp=0.2)
    annotation (Placement(transformation(extent={{128,-14},{88,26}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0.001,
    G=0,
    B=0,
    X=0.2) annotation (Placement(transformation(extent={{50,-4},{70,16}})));
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
             annotation (Placement(transformation(extent={{30,-48},{50,-28}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    R=0.001,
    G=0,
    B=0,
    X=0.2) annotation (Placement(transformation(extent={{50,-22},{70,-2}})));
  inner Electrical.SystemBase SysData(S_b=100000000, fn=50)
    annotation (Placement(transformation(extent={{-140,80},{-100,100}})));
equation
  connect(gENROE.p, pwLine.p)
    annotation (Line(points={{-4,6},{19,6}}, color={0,0,255}));
  connect(step.y, add.u1)
    annotation (Line(points={{-115,8},{-108,8}}, color={0,0,127}));
  connect(step1.y, add.u2) annotation (Line(points={{-115,-30},{-112,-30},{-112,
          -4},{-108,-4}},
                     color={0,0,127}));
  connect(add.y, add1.u1)
    annotation (Line(points={{-85,2},{-78,2}}, color={0,0,127}));
  connect(add1.y, gENROE.EFD)
    annotation (Line(points={{-55,-4},{-52,-4},{-52,-6},{-48,-6}},
                                                 color={0,0,127}));
  connect(add1.u2, gENROE.EFD0) annotation (Line(points={{-78,-10},{-86,-10},{-86,
          -36},{2,-36},{2,-4},{-2,-4}}, color={0,0,127}));
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-48,18},{-56,18},
          {-56,36},{14,36},{14,16},{-2,16}}, color={0,0,127}));
  connect(gENROE1.EFD0, gENROE1.EFD) annotation (Line(points={{86,-4},{82,-4},{82,
          -20},{134,-20},{134,-6},{132,-6}}, color={0,0,127}));
  connect(gENROE1.PMECH, gENROE1.PMECH0) annotation (Line(points={{132,18},{138,
          18},{138,-24},{78,-24},{78,16},{86,16}}, color={0,0,127}));
  connect(pwLine.n, pwLine1.p)
    annotation (Line(points={{37,6},{51,6}}, color={0,0,255}));
  connect(pwLine1.n, gENROE1.p)
    annotation (Line(points={{69,6},{88,6}}, color={0,0,255}));
  connect(constantLoad.p, pwLine1.p) annotation (Line(points={{40,-28},{40,6},{51,
          6}}, color={0,0,255}));
  connect(pwLine2.p, pwLine1.p) annotation (Line(points={{51,-12},{44,-12},{44,6},
          {51,6}}, color={0,0,255}));
  connect(pwLine2.n, gENROE1.p) annotation (Line(points={{69,-12},{72,-12},{72,6},
          {88,6}}, color={0,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,
            -100},{140,100}})),
            experiment(StopTime=20),
    Documentation(info="<html>
<p>This is a Two-Machine system resulting from the aggregation of both generators connected to bus GEN2.</p>
<p>Simulate the system for 20 seconds. Variables of interest are:</p>
<ul>
<li><code>gENROE.SPEED</code></li>
<li><code>gENROE1.SPEED</code></li>
</ul>
<p>In addition, also plot the following variables:</p>
<ul>
<li><code>gENROE.PELEC</code></li>
<li><code>gENROE1.PELEC</code></li>
</ul>
<p>Compare the results obtained in this simulation with the ones obtained in <strong>Reference_system</strong>.</p>
</html>"));
end Aggregated_system;
