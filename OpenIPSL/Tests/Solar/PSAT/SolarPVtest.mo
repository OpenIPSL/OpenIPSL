within OpenIPSL.Tests.Solar.PSAT;
model SolarPVtest "Simple system to test the functionality of PV model with controlled Active Power and Terminal Voltage (P and V)"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(transformation(
        origin={-70.0,-10.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Events.PwFault pwFault1(
    R=20,
    X=1,
    t1=3,
    t2=3.1) annotation (Placement(transformation(
        origin={20.0,-57.3},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Branches.PwLine pwLinewithOpening1(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1,
    t1=8,
    t2=8.1) annotation (Placement(transformation(
        origin={-25.0,0.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(transformation(
        origin={-70.0,10.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(transformation(
        origin={-25.0,-30.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(transformation(
        origin={-25.0,15.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Loads.PSAT.PQ pwLoadPQ2(
    angle_0=0,
    P_0=80000,
    Q_0=60000,
    v_0=1) annotation (Placement(transformation(
        origin={15.0,-30.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Machines.PSAT.Order3 order31(
    angle_0=0,
    ra=0.001,
    x1d=0.302,
    M=10,
    D=0,
    xd=1.9,
    T1d0=8,
    xq=1.7,
    P_0=40125.6732154526,
    Q_0=26272.5307404601,
    Sn=20000000,
    v_0=1,
    V_b=400000,
    Vn=400000) annotation (Placement(transformation(
        origin={-110.0,10.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Buses.Bus bus1 annotation (Placement(transformation(
        origin={-87.5421,10.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Buses.Bus bus2 annotation (Placement(transformation(
        origin={-46.7243,11.8063},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Buses.Bus bus3 annotation (Placement(transformation(
        origin={5.0,12.1033},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Buses.Bus bus4 annotation (Placement(transformation(
        origin={-3.3112,-30.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Solar.PSAT.ConstantPQPV.PV1 PV11(
    Q_0=0.283430554716626,
    angle_0=-0.00000839852213846341,
    v_0=1.00002,
    vref=1.00002,
    P_0=0.4) annotation (Placement(transformation(
        origin={30.0,12.1033},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{55,50},{80,70}})));
equation
  connect(bus3.p, PV11.p) annotation (Line(
      origin={12.0,12.1033},
      points={{-7,0},{7,0}}));
  connect(pwLine2.p, pwLine1.p) annotation (Line(
      origin={-77.0,0.0},
      points={{-2,10},{-2,5},{-5,5},{-5,0},{-2,0},{-2,-10}}));
  connect(pwLine1.n, pwLine2.n) annotation (Line(
      origin={-63.0,0.0},
      points={{2,-10},{2,-5},{5,-5},{5,0},{2,0},{2,10}}));
  connect(pwLine4.p, pwLinewithOpening1.p) annotation (Line(
      origin={-32.0,7.5},
      points={{-2,7.5},{-2,5},{0,5},{0,0},{0,-7.5},{-2,-7.5}}));
  connect(pwLinewithOpening1.n, pwLine4.n) annotation (Line(
      origin={-18.0,7.5},
      points={{2,-7.5},{2,-5},{0,-5},{0,0},{0,7.5},{2,7.5}}));
  connect(bus1.p, pwLine2.p) annotation (Line(
      origin={-82.2711,10.0},
      points={{-5.271,0},{3.2711,0}}));
  connect(pwLine2.n, bus2.p) annotation (Line(
      origin={-52.1495,10.6021},
      points={{-8.8505,-0.6021},{5.4252,-0.6021},{5.4252,1.2042}}));
  connect(bus2.p, pwLine4.p) annotation (Line(
      origin={-41.8162,13.9354},
      points={{-4.9081,-2.1291},{-4.9081,1.0646},{7.8162,1.0646}}));
  connect(bus2.p, pwLine3.p) annotation (Line(
      origin={-41.8162,-16.0646},
      points={{-4.9081,27.8709},{-4.9081,-13.9354},{7.8162,-13.9354}}));
  connect(pwLine4.n, bus3.p) annotation (Line(
      origin={-7.25,13.5517},
      points={{-8.75,1.4483},{-0.75,1.4483},{-0.75,-1.4484},{12.25,-1.4484}}));
  connect(pwLine3.n, bus4.p) annotation (Line(
      origin={-10.6556,-30.0},
      points={{-5.3444,0},{7.3444,0}}));
  connect(bus4.p, pwLoadPQ2.p) annotation (Line(
      origin={0.4592,-29.3333},
      points={{-3.7704,-0.6667},{-3.7704,9.3333},{14.5408,9.3333}}));
  connect(bus4.p, pwFault1.p) annotation (Line(
      origin={2.1259,-47.5333},
      points={{-5.4371,17.5333},{-5.4371,-9.7667},{6.20743,-9.7667}}));
  connect(bus1.p, order31.p) annotation (Line(
      origin={-91.3614,9.8998},
      points={{3.8193,0.1002},{3.8193,0.1002},{-8.6386,0.1002}}));
  connect(order31.vf0, order31.vf) annotation (Line(points={{-118,21},{-118,25},{-130,25},{-130,15},{-122,15}},
                                          color={0,0,127}));
  connect(order31.pm, order31.pm0) annotation (Line(points={{-122,5},{-130,5},{-130,-5},{-118,-5},{-118,-1}},
                                         color={0,0,127}));
  annotation (Diagram(coordinateSystem(
        extent={{-148.5,-105},{148.5,105}},
        preserveAspectRatio=false,
        grid={5,5}), graphics={Text(
          origin={-70.0,29.1417},
          fillPattern=FillPattern.Solid,
          extent={{-35.0,-5.8583},{35.0,5.8583}},
          textString="SystemSbase=100 MVA",
          fontName="Arial")}));
end SolarPVtest;
