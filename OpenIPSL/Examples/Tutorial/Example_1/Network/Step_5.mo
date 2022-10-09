within OpenIPSL.Examples.Tutorial.Example_1.Network;
model Step_5 "Connecting models"
  OpenIPSL.Electrical.Buses.Bus B1(displayPF=false) annotation (Placement(
        transformation(extent={{-80,-10},{-60,10}})));
  OpenIPSL.Electrical.Buses.Bus B2(displayPF=false) annotation (Placement(
        transformation(extent={{-20,-10},{0,10}})));
  OpenIPSL.Electrical.Buses.Bus B3(displayPF=false) annotation (Placement(
        transformation(extent={{60,-10},{80,10}})));
  Generator.Generator G1(
    v_0=1,
    angle_0=0.4946,
    P_0=1997999000,
    Q_0=967920000) annotation (Placement(transformation(extent={{-110,
            -10},{-90,10}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(
    Sn=2220000000,
    V_b=400000,
    Vn=400000,
    rT=0,
    xT=0.15) annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=0,
    G=0,
    B=0,
    X=0.5*100/2220,
    S_b=100000000) annotation (Placement(transformation(extent={{20,10},
            {40,30}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(
    v_0=0.90081,
    angle_0=0,
    P_0=-1998000000,
    Q_0=87066000) annotation (Placement(transformation(
        origin={100,0},
        extent={{-10,10},{10,-10}},
        rotation=180)));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0,
    t1=0.5,
    t2=0.57,
    X=0.01*100/2220) annotation (Placement(transformation(extent=
            {{20,-60},{40,-40}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0,
    G=0,
    B=0,
    S_b=100000000,
    X=0.93*100/2220) annotation (Placement(transformation(extent=
            {{20,-30},{40,-10}})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60) annotation (
      Placement(transformation(
        origin={85.0001,-80},
        extent={{-25.0001,-20},{34.9999,20}})));
equation
  connect(pwLine1.n, B3.p) annotation (Line(points={{39,-20},{52,-20},{52,0},{
          70,0}}, color={0,0,255}));
  connect(B3.p, infiniteBus.p)
    annotation (Line(points={{70,0},{76,0},{90,0}}, color={0,0,255}));
  connect(pwLine.n, B3.p)
    annotation (Line(points={{39,20},{52,20},{52,0},{70,0}}, color={0,0,255}));
  connect(B2.p, pwLine.p) annotation (Line(points={{-10,0},{-10,0},{0,0},{0,20},
          {21,20}}, color={0,0,255}));
  connect(twoWindingTransformer.n, B2.p)
    annotation (Line(points={{-29,0},{-20,0},{-10,0}}, color={0,0,255}));
  connect(B1.p, twoWindingTransformer.p)
    annotation (Line(points={{-70,0},{-70,0},{-51,0}}, color={0,0,255}));
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-89,0},{-89,0},{-70,0}}, color={0,0,255}));
  connect(pwLine1.p, B2.p) annotation (Line(points={{21,-20},{0,-20},{0,0},{-10,
          0}}, color={0,0,255}));
  connect(pwFault.p, B2.p) annotation (Line(points={{18.3333,-50},{0,-50},{0,0},
          {-10,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-120,-100},{120,100}},
          preserveAspectRatio=false), graphics={Text(
          extent={{-100,100},{100,80}},
          textColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="Step 5: Connecting network components")}),
    Icon(coordinateSystem(extent={{-120,-100},{120,100}})));
end Step_5;
