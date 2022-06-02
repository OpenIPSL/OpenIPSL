within OpenIPSL.Examples.PSATSystems.TwoAreaOld.BaseClasses;
partial model BaseNetwork "Base network for TwoAreaOld test system"
  OpenIPSL.Electrical.Buses.Bus bus1
    annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
  OpenIPSL.Electrical.Buses.Bus bus2
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  OpenIPSL.Electrical.Buses.Bus bus3
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  OpenIPSL.Electrical.Buses.Bus bus4
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  OpenIPSL.Electrical.Buses.Bus bus5
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  OpenIPSL.Electrical.Branches.PwLine line_1_4(
    R=0,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-66,-4},{-54,4}})));
  OpenIPSL.Electrical.Branches.PwLine line_4_3(
    R=0,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-26,-4},{-14,4}})));
  OpenIPSL.Electrical.Branches.PwLine line_3_5(
    R=0,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(extent={{14,-4},{26,4}})));
  OpenIPSL.Electrical.Branches.PwLine line_5_2(
    R=0,
    X=0.05,
    G=0,
    B=0) annotation (Placement(transformation(extent={{54,-4},{66,4}})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0.15,
    X=0,
    t1=2,
    t2=2.1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=-90,
        origin={5,-25})));
  OpenIPSL.Electrical.Machines.PSAT.Order2 order2(
    Sn=991000000,
    v_0=1.081,
    ra=0,
    x1d=0.01,
    M=6,
    V_b=20000,
    Vn=20000,
    D=0,
    angle_0=0,
    P_0=-90000000.0000001,
    Q_0=23937189.4974117)
    annotation (Placement(transformation(extent={{120,-10},{100,10}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-160,60},{-100,80}})));
equation
  connect(bus1.p, line_1_4.p) annotation (Line(
      points={{-80,0},{-65.4,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_1_4.n, bus4.p) annotation (Line(
      points={{-54.6,0},{-40,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus4.p, line_4_3.p) annotation (Line(
      points={{-40,0},{-25.4,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus3.p, line_4_3.n) annotation (Line(
      points={{0,0},{-14.6,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus3.p, line_3_5.p) annotation (Line(
      points={{0,0},{14.6,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_3_5.n, bus5.p) annotation (Line(
      points={{25.4,0},{40,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus5.p, line_5_2.p) annotation (Line(
      points={{40,0},{54.6,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_5_2.n, bus2.p) annotation (Line(
      points={{65.4,0},{80,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwFault.p, line_3_5.p)
    annotation (Line(points={{5,-19.1667},{5,0},{14.6,0}},
                                                         color={0,0,255}));
  connect(order2.p, bus2.p) annotation (Line(points={{100,0},{89.5,0},{89.5,0},{
          80,0}}, color={0,0,255}));
  connect(order2.vf, order2.vf0) annotation (Line(points={{122,5},{122,5},{122,14},
          {118,14},{118,11}}, color={0,0,127}));
  connect(order2.pm, order2.pm0) annotation (Line(points={{122,-5},{122,-5},{122,
          -6},{122,-14},{118,-14},{118,-11}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-160,-80},{160,80}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,-80},{160,
            80}})),
    Documentation(info="<html>
<p>This base network is extended in the example systems from <strong>TwoAreaOld</strong> subpackage. It contains a generator model connected to bus 2, represented by an order 2 machine, from PSAT.</p>
<p>The 5-bus system has a three-phase-to-ground fault event occurring on bus 3 at 2 seconds and lasting for 100ms.</p>
</html>"));
end BaseNetwork;
