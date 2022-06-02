within OpenIPSL.Tests.BaseClasses;
partial model MachineTestBase "Base class for tests involving machines."
  Electrical.Branches.PwLine pwLine1(
    X=0.1,
    R=0.01,
    G=0,
    B=0.0005) annotation (Placement(transformation(
        origin={20,-12},
        extent={{-6,-6},{6,6}})));
  Electrical.Branches.PwLine pwLinewithOpening1(
    G=0,
    R=0.01,
    X=0.1,
    opening=1,
    B=0.0005,
    t1=2,
    t2=2.15) annotation (Placement(transformation(
        origin={60,12},
        extent={{-6,-6},{6,6}})));
  Electrical.Branches.PwLine pwLine2(
    G=0,
    R=0.01,
    X=0.1,
    B=0.0005) annotation (Placement(transformation(
        origin={20,12},
        extent={{-6,-6},{6,6}})));
  Electrical.Branches.PwLine pwLine3(
    G=0,
    R=0.01,
    X=0.1,
    B=0.0005) annotation (Placement(transformation(
        origin={62,-14},
        extent={{-6,-6},{6,6}})));
  Electrical.Branches.PwLine pwLine4(
    G=0,
    R=0.01,
    X=0.1,
    B=0.0005) annotation (Placement(transformation(
        origin={60,36},
        extent={{-5.99999,-5.99998},{5.99999,6}})));
  Electrical.Loads.PSAT.PQ pwLoadPQ1(P_0=8000000, Q_0=6000000) annotation (Placement(transformation(
        origin={94,24},
        extent={{-6,-6},{6,6}},
        rotation=90)));
  Electrical.Loads.PSAT.PQvar pwLoadPQ2(P_0=8000000, Q_0=6000000) annotation (Placement(transformation(
        origin={94.0335,-14.2889},
        extent={{-6.2889,-6.0335},{6.2889,6.0335}},
        rotation=90)));
  inner Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-100,80},{-60,100}})));
  Electrical.Buses.Bus bus1 annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Electrical.Buses.Bus bus2
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Electrical.Buses.Bus bus3
    annotation (Placement(transformation(extent={{70,14},{90,34}})));
  Electrical.Buses.Bus bus4
    annotation (Placement(transformation(extent={{70,-24},{90,-4}})));
equation
  connect(pwLine2.p, pwLine1.p) annotation (Line(points={{14.6,12},{6,12},{6,-12},
          {14.6,-12}}, color={0,0,255}));
  connect(pwLine2.n, pwLine1.n) annotation (Line(points={{25.4,12},{34,12},{34,
          -12},{25.4,-12}}, color={0,0,255}));
  connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(points={{54.6,36},{48,36},{48,12},{54.6,12}},
                                     color={0,0,255}));
  connect(pwLine4.n, pwLinewithOpening1.n) annotation (Line(points={{65.4,36},{72,36},{72,12},{65.4,12}},
                                     color={0,0,255}));
  connect(bus1.p, pwLine1.p) annotation (Line(points={{0,0},{6,0},{6,-12},{14.6,-12}}, color={0,0,255}));
  connect(bus2.p, pwLine1.n) annotation (Line(points={{40,0},{34,0},{34,-12},{
          25.4,-12}}, color={0,0,255}));
  connect(bus2.p, pwLinewithOpening1.p) annotation (Line(points={{40,0},{44,0},
          {44,20},{48,20},{48,12},{54.6,12}}, color={0,0,255}));
  connect(pwLine3.p, pwLinewithOpening1.p) annotation (Line(points={{56.6,-14},
          {44,-14},{44,20},{48,20},{48,12},{54.6,12}}, color={0,0,255}));
  connect(bus3.p, pwLoadPQ1.p)
    annotation (Line(points={{80,24},{88,24},{88,24}}, color={0,0,255}));
  connect(bus3.p, pwLinewithOpening1.n) annotation (Line(points={{80,24},{72,24},
          {72,12},{65.4,12}}, color={0,0,255}));
  connect(bus4.p, pwLoadPQ2.p) annotation (Line(points={{80,-14},{88,-14},{88,-14.2889}},
                               color={0,0,255}));
  connect(pwLine3.n,bus4. p) annotation (Line(points={{67.4,-14},{67.4,-14},{80,
          -14}}, color={0,0,255}));
end MachineTestBase;
