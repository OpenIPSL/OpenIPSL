within OpenIPSL.Examples.Tutorial.Example_1.Network;
partial model Step_4 "Adding fault event"
  OpenIPSL.Electrical.Buses.Bus B1(displayPF=false)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  OpenIPSL.Electrical.Buses.Bus B2(displayPF=false)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  OpenIPSL.Electrical.Buses.Bus B3(displayPF=false)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Generator.Generator G1
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
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
    S_b=100000000) annotation (Placement(transformation(extent={{20,10},{40,30}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(v_0=0.90081, angle_0=0)
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={100,0})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0,
    t1=0.5,
    t2=0.57,
    X=0.01*100/2220)
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0,
    G=0,
    B=0,
    S_b=100000000,
    X=0.93*100/2220)
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60) annotation (
      Placement(transformation(
        origin={85.0001,-80},
        extent={{-25.0001,-20},{34.9998,20}})));
  annotation (
    Diagram(coordinateSystem(extent={{-120,-100},{120,100}},
          preserveAspectRatio=false), graphics={Text(
          extent={{-100,100},{100,80}},
          textColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="Step 3: Adding fault model"),Rectangle(
          extent={{14,-32},{44,-64}},
          lineColor={255,0,0},
          lineThickness=1),Text(
          extent={{-20,-66},{64,-76}},
          textColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=12,
          textString="Electrical.Events.PwFault")}),
    Icon(coordinateSystem(extent={{-120,-100},{120,100}})));
end Step_4;
