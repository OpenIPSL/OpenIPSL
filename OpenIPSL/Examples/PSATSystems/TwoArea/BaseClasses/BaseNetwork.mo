within OpenIPSL.Examples.PSATSystems.TwoArea.BaseClasses;
partial model BaseNetwork "Base network for TwoArea test system"
  OpenIPSL.Electrical.Machines.PSAT.Order3 order3(
    Sn=991000000,
    Vn=20000,
    V_b=20000,
    v_0=1.081,
    ra=0,
    xd=2,
    x1d=0.245,
    T1d0=5,
    xq=1.91,
    M=6,
    D=0,
    angle_0=0,
    P_0=-110000000.0000006,
    Q_0=30378600.0438159) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={150,-80})));
  OpenIPSL.Electrical.Buses.Bus B1
    annotation (Placement(transformation(extent={{-88,22},{-72,38}})));
  OpenIPSL.Electrical.Buses.Bus B3
    annotation (Placement(transformation(extent={{52,-48},{68,-32}})));
  OpenIPSL.Electrical.Buses.Bus B4
    annotation (Placement(transformation(extent={{-88,-8},{-72,8}})));
  OpenIPSL.Electrical.Buses.Bus B5
    annotation (Placement(transformation(extent={{-88,-88},{-72,-72}})));
  OpenIPSL.Electrical.Branches.PwLine L410(
    R=0,
    G=0,
    B=0,
    X=0.005) annotation (Placement(transformation(extent={{-72,-2},{-66,2}})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0.15,
    X=0,
    t1=2,
    t2=2.1) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=-90,
        origin={64,-58})));
  OpenIPSL.Electrical.Buses.Bus B6
    annotation (Placement(transformation(extent={{-48,22},{-32,38}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Tr16(
    V_b=20000,
    Vn=20000,
    Sn=100000000,
    rT=0,
    xT=0.005) annotation (Placement(transformation(extent={{-66,24},{-52,36}})));
  OpenIPSL.Electrical.Buses.Bus B7
    annotation (Placement(transformation(extent={{-8,22},{8,38}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Tr67(
    V_b=20000,
    Vn=20000,
    Sn=100000000,
    rT=0,
    xT=0.005) annotation (Placement(transformation(extent={{-26,24},{-14,36}})));
  OpenIPSL.Electrical.Buses.Bus B8
    annotation (Placement(transformation(extent={{32,22},{48,38}})));
  OpenIPSL.Electrical.Buses.Bus B9
    annotation (Placement(transformation(extent={{72,22},{88,38}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Tr78(
    V_b=20000,
    Vn=20000,
    Sn=100000000,
    rT=0,
    xT=0.005) annotation (Placement(transformation(extent={{14,24},{26,36}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Tr89(
    V_b=20000,
    Vn=20000,
    Sn=100000000,
    rT=0,
    xT=0.005) annotation (Placement(transformation(extent={{54,24},{66,36}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Tr49(
    V_b=20000,
    Vn=20000,
    Sn=100000000,
    rT=0,
    xT=0.005) annotation (Placement(transformation(extent={{94,24},{106,36}})));
  OpenIPSL.Electrical.Buses.Bus B10
    annotation (Placement(transformation(extent={{-68,-8},{-52,8}})));
  OpenIPSL.Electrical.Buses.Bus B2
    annotation (Placement(transformation(extent={{112,-88},{128,-72}})));
  OpenIPSL.Electrical.Buses.Bus B11
    annotation (Placement(transformation(extent={{-48,-8},{-32,8}})));
  OpenIPSL.Electrical.Buses.Bus B12
    annotation (Placement(transformation(extent={{-28,-8},{-12,8}})));
  OpenIPSL.Electrical.Branches.PwLine L1011(
    R=0,
    G=0,
    B=0,
    X=0.005) annotation (Placement(transformation(extent={{-54,-2},{-48,2}})));
  OpenIPSL.Electrical.Branches.PwLine L1112(
    R=0,
    G=0,
    B=0,
    X=0.005) annotation (Placement(transformation(extent={{-34,-2},{-28,2}})));
  OpenIPSL.Electrical.Buses.Bus B13
    annotation (Placement(transformation(extent={{-8,-8},{8,8}})));
  OpenIPSL.Electrical.Buses.Bus B14
    annotation (Placement(transformation(extent={{12,-8},{28,8}})));
  OpenIPSL.Electrical.Buses.Bus B15
    annotation (Placement(transformation(extent={{32,-8},{48,8}})));
  OpenIPSL.Electrical.Buses.Bus B16
    annotation (Placement(transformation(extent={{52,-8},{68,8}})));
  OpenIPSL.Electrical.Buses.Bus B17
    annotation (Placement(transformation(extent={{72,-8},{88,8}})));
  OpenIPSL.Electrical.Branches.PwLine L1213(
    R=0,
    G=0,
    B=0,
    X=0.005) annotation (Placement(transformation(extent={{-14,-2},{-8,2}})));
  OpenIPSL.Electrical.Branches.PwLine L1314(
    R=0,
    G=0,
    B=0,
    X=0.005) annotation (Placement(transformation(extent={{6,-2},{12,2}})));
  OpenIPSL.Electrical.Branches.PwLine L1415(
    R=0,
    G=0,
    B=0,
    X=0.005) annotation (Placement(transformation(extent={{26,-2},{32,2}})));
  OpenIPSL.Electrical.Branches.PwLine L1516(
    R=0,
    G=0,
    B=0,
    X=0.005) annotation (Placement(transformation(extent={{46,-2},{52,2}})));
  OpenIPSL.Electrical.Branches.PwLine L1617(
    R=0,
    G=0,
    B=0,
    X=0.005) annotation (Placement(transformation(extent={{66,-2},{72,2}})));
  OpenIPSL.Electrical.Branches.PwLine L1718(
    R=0,
    G=0,
    B=0,
    X=0.005) annotation (Placement(transformation(extent={{88,-2},{94,2}})));
  OpenIPSL.Electrical.Buses.Bus B18
    annotation (Placement(transformation(extent={{92,-8},{108,8}})));
  OpenIPSL.Electrical.Branches.PwLine L318(
    R=0,
    G=0,
    B=0,
    X=0.005) annotation (Placement(transformation(
        extent={{-3,-2},{3,2}},
        rotation=180,
        origin={71,-40})));
  OpenIPSL.Electrical.Buses.Bus B19
    annotation (Placement(transformation(extent={{32,-48},{48,-32}})));
  OpenIPSL.Electrical.Buses.Bus B20
    annotation (Placement(transformation(extent={{12,-48},{28,-32}})));
  OpenIPSL.Electrical.Buses.Bus B21
    annotation (Placement(transformation(extent={{-8,-48},{8,-32}})));
  OpenIPSL.Electrical.Buses.Bus B22
    annotation (Placement(transformation(extent={{-28,-48},{-12,-32}})));
  OpenIPSL.Electrical.Buses.Bus B23
    annotation (Placement(transformation(extent={{-48,-48},{-32,-32}})));
  OpenIPSL.Electrical.Buses.Bus B24
    annotation (Placement(transformation(extent={{-68,-48},{-52,-32}})));
  OpenIPSL.Electrical.Buses.Bus B25
    annotation (Placement(transformation(extent={{-88,-48},{-72,-32}})));
  OpenIPSL.Electrical.Buses.Bus B26
    annotation (Placement(transformation(extent={{-108,-48},{-92,-32}})));
  OpenIPSL.Electrical.Buses.Bus B27
    annotation (Placement(transformation(extent={{-108,-88},{-92,-72}})));
  OpenIPSL.Electrical.Branches.PwLine L319(
    R=0,
    G=0,
    B=0,
    X=0.005) annotation (Placement(transformation(extent={{46,-42},{52,-38}})));
  OpenIPSL.Electrical.Branches.PwLine L1920(
    R=0,
    G=0,
    B=0,
    X=0.005) annotation (Placement(transformation(extent={{26,-42},{32,-38}})));
  OpenIPSL.Electrical.Branches.PwLine L2021(
    R=0,
    G=0,
    B=0,
    X=0.005) annotation (Placement(transformation(extent={{6,-42},{12,-38}})));
  OpenIPSL.Electrical.Branches.PwLine L2122(
    R=0,
    G=0,
    B=0,
    X=0.005) annotation (Placement(transformation(extent={{-14,-42},{-8,-38}})));
  OpenIPSL.Electrical.Branches.PwLine L2223(
    R=0,
    G=0,
    B=0,
    X=0.005)
    annotation (Placement(transformation(extent={{-34,-42},{-28,-38}})));
  OpenIPSL.Electrical.Branches.PwLine L2324(
    R=0,
    G=0,
    B=0,
    X=0.005)
    annotation (Placement(transformation(extent={{-54,-42},{-48,-38}})));
  OpenIPSL.Electrical.Branches.PwLine L2425(
    R=0,
    G=0,
    B=0,
    X=0.005)
    annotation (Placement(transformation(extent={{-74,-42},{-68,-38}})));
  OpenIPSL.Electrical.Branches.PwLine L2526(
    R=0,
    G=0,
    B=0,
    X=0.005)
    annotation (Placement(transformation(extent={{-94,-42},{-88,-38}})));
  OpenIPSL.Electrical.Branches.PwLine L2627(
    R=0,
    G=0,
    B=0,
    X=0.005)
    annotation (Placement(transformation(extent={{-110,-82},{-104,-78}})));
  OpenIPSL.Electrical.Branches.PwLine L527(
    R=0,
    G=0,
    B=0,
    X=0.005)
    annotation (Placement(transformation(extent={{-88,-82},{-94,-78}})));
  OpenIPSL.Electrical.Buses.Bus B28
    annotation (Placement(transformation(extent={{-48,-88},{-32,-72}})));
  OpenIPSL.Electrical.Buses.Bus B29
    annotation (Placement(transformation(extent={{-8,-88},{8,-72}})));
  OpenIPSL.Electrical.Buses.Bus B30
    annotation (Placement(transformation(extent={{32,-88},{48,-72}})));
  OpenIPSL.Electrical.Buses.Bus B31
    annotation (Placement(transformation(extent={{72,-88},{88,-72}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Tr528(
    V_b=20000,
    Vn=20000,
    rT=0,
    xT=0.005) annotation (Placement(transformation(extent={{-66,-86},{-52,-74}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Tr2829(
    V_b=20000,
    Vn=20000,
    rT=0,
    xT=0.005) annotation (Placement(transformation(extent={{-26,-86},{-12,-74}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Tr2930(
    V_b=20000,
    Vn=20000,
    rT=0,
    xT=0.005) annotation (Placement(transformation(extent={{14,-86},{28,-74}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Tr3031(
    V_b=20000,
    Vn=20000,
    rT=0,
    xT=0.005) annotation (Placement(transformation(extent={{52,-86},{66,-74}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer Tr231(
    V_b=20000,
    Vn=20000,
    rT=0,
    xT=0.005) annotation (Placement(transformation(extent={{94,-86},{108,-74}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-180,80},{-120,100}})));
equation
  connect(Tr67.n, B7.p)
    annotation (Line(points={{-13.4,30},{0,30}}, color={0,0,255}));
  connect(Tr67.p, B6.p) annotation (Line(points={{-26.6,30},{-36.3,30},{-40,30}},
        color={0,0,255}));
  connect(Tr16.n, B6.p) annotation (Line(points={{-51.3,30},{-51.3,30},{-40,30}},
        color={0,0,255}));
  connect(Tr16.p, B1.p)
    annotation (Line(points={{-66.7,30},{-80,30}}, color={0,0,255}));
  connect(L410.n, B10.p)
    annotation (Line(points={{-66.3,0},{-60,0}}, color={0,0,255}));
  connect(L1011.n, B11.p)
    annotation (Line(points={{-48.3,0},{-48.3,0},{-40,0}}, color={0,0,255}));
  connect(B11.p, L1112.p)
    annotation (Line(points={{-40,0},{-33.7,0}}, color={0,0,255}));
  connect(B14.p, L1415.p)
    annotation (Line(points={{20,0},{26.3,0}}, color={0,0,255}));
  connect(B15.p, L1516.p)
    annotation (Line(points={{40,0},{46.3,0}}, color={0,0,255}));
  connect(B16.p, L1617.p)
    annotation (Line(points={{60,0},{66.3,0}}, color={0,0,255}));
  connect(L1617.n, B17.p)
    annotation (Line(points={{71.7,0},{71.7,0},{80,0}}, color={0,0,255}));
  connect(L319.n, B3.p)
    annotation (Line(points={{51.7,-40},{60,-40}}, color={0,0,255}));
  connect(L319.p, B19.p) annotation (Line(points={{46.3,-40},{46.3,-40},{40,-40}},
        color={0,0,255}));
  connect(L1920.n, B19.p) annotation (Line(points={{31.7,-40},{31.7,-40},{40,-40}},
        color={0,0,255}));
  connect(L1920.p, B20.p) annotation (Line(points={{26.3,-40},{26.3,-40},{20,-40}},
        color={0,0,255}));
  connect(L2021.n, B20.p) annotation (Line(points={{11.7,-40},{11.7,-40},{20,-40}},
        color={0,0,255}));
  connect(L2021.p, B21.p)
    annotation (Line(points={{6.3,-40},{6.3,-40},{0,-40}}, color={0,0,255}));
  connect(L2122.n, B21.p)
    annotation (Line(points={{-8.3,-40},{-8.3,-40},{0,-40}}, color={0,0,255}));
  connect(L2122.p, B22.p) annotation (Line(points={{-13.7,-40},{-13.7,-40},{-20,-40}},
                 color={0,0,255}));
  connect(L2223.n, B22.p) annotation (Line(points={{-28.3,-40},{-28.3,-40},{-20,-40}},
                 color={0,0,255}));
  connect(L2223.p, B23.p) annotation (Line(points={{-33.7,-40},{-33.7,-40},{-40,-40}},
                 color={0,0,255}));
  connect(L2324.p, B24.p) annotation (Line(points={{-53.7,-40},{-53.7,-40},{-60,-40}},
                 color={0,0,255}));
  connect(L2526.n, B25.p) annotation (Line(points={{-88.3,-40},{-88.3,-40},{-80,-40}},
                 color={0,0,255}));
  connect(L2526.p, B26.p) annotation (Line(points={{-93.7,-40},{-93.7,-40},{-100,-40}},
                 color={0,0,255}));
  connect(B26.p, L2627.p) annotation (Line(points={{-100,-40},{-116,-40},{-116,-80},{-109.7,-80}},
                              color={0,0,255}));
  connect(L2627.n, B27.p) annotation (Line(points={{-104.3,-80},{-104.3,-80},{-100,-80}},
                 color={0,0,255}));
  connect(B27.p, L527.n)
    annotation (Line(points={{-100,-80},{-93.7,-80}}, color={0,0,255}));
  connect(L527.p, B5.p)
    annotation (Line(points={{-88.3,-80},{-80,-80}}, color={0,0,255}));
  connect(Tr231.n, B2.p) annotation (Line(points={{108.7,-80},{116,-80},{120,-80}},
        color={0,0,255}));
  connect(Tr231.p, B31.p)
    annotation (Line(points={{93.3,-80},{80,-80}}, color={0,0,255}));
  connect(Tr3031.n, B31.p)
    annotation (Line(points={{66.7,-80},{80,-80}}, color={0,0,255}));
  connect(Tr3031.p, B30.p)
    annotation (Line(points={{51.3,-80},{52,-80},{40,-80}}, color={0,0,255}));
  connect(Tr2930.n, B30.p)
    annotation (Line(points={{28.7,-80},{40,-80}}, color={0,0,255}));
  connect(Tr2930.p, B29.p) annotation (Line(points={{13.3,-80},{14.65,-80},{0,-80}},
        color={0,0,255}));
  connect(Tr2829.n, B29.p)
    annotation (Line(points={{-11.3,-80},{0,-80}}, color={0,0,255}));
  connect(Tr528.n, B28.p)
    annotation (Line(points={{-51.3,-80},{-40,-80}}, color={0,0,255}));
  connect(Tr528.p, B5.p)
    annotation (Line(points={{-66.7,-80},{-80,-80}}, color={0,0,255}));
  connect(Tr78.p, B7.p)
    annotation (Line(points={{13.4,30},{6.7,30},{0,30}}, color={0,0,255}));
  connect(Tr78.n, B8.p)
    annotation (Line(points={{26.6,30},{33.3,30},{40,30}}, color={0,0,255}));
  connect(Tr89.p, B8.p)
    annotation (Line(points={{53.4,30},{46.7,30},{40,30}}, color={0,0,255}));
  connect(Tr89.n, B9.p)
    annotation (Line(points={{66.6,30},{73.3,30},{80,30}}, color={0,0,255}));
  connect(B10.p, L1011.p)
    annotation (Line(points={{-60,0},{-53.7,0}}, color={0,0,255}));
  connect(L1112.n, B12.p)
    annotation (Line(points={{-28.3,0},{-28.3,0},{-20,0}}, color={0,0,255}));
  connect(B12.p, L1213.p)
    annotation (Line(points={{-20,0},{-13.7,0}}, color={0,0,255}));
  connect(L1213.n, B13.p)
    annotation (Line(points={{-8.3,0},{-8.3,0},{0,0}}, color={0,0,255}));
  connect(B13.p, L1314.p)
    annotation (Line(points={{0,0},{6.3,0}}, color={0,0,255}));
  connect(L1314.n, B14.p)
    annotation (Line(points={{11.7,0},{11.7,0},{20,0}}, color={0,0,255}));
  connect(L1415.n, B15.p)
    annotation (Line(points={{31.7,0},{31.7,0},{40,0}}, color={0,0,255}));
  connect(L1516.n, B16.p)
    annotation (Line(points={{51.7,0},{51.7,0},{60,0}}, color={0,0,255}));
  connect(B9.p, Tr49.p)
    annotation (Line(points={{80,30},{93.4,30}}, color={0,0,255}));
  connect(B4.p, L410.p)
    annotation (Line(points={{-80,0},{-71.7,0}}, color={0,0,255}));
  connect(Tr49.n, B4.p) annotation (Line(points={{106.6,30},{110,30},{110,14},{
          -84,14},{-84,0},{-80,0}}, color={0,0,255}));
  connect(L1718.n, B18.p)
    annotation (Line(points={{93.7,0},{93.7,0},{100,0}}, color={0,0,255}));
  connect(B17.p, L1718.p)
    annotation (Line(points={{80,0},{88.3,0}}, color={0,0,255}));
  connect(B25.p, L2425.p)
    annotation (Line(points={{-80,-40},{-73.7,-40}}, color={0,0,255}));
  connect(L2425.n, B24.p) annotation (Line(points={{-68.3,-40},{-68.3,-40},{-60,-40}},
                 color={0,0,255}));
  connect(L2324.n, B23.p) annotation (Line(points={{-48.3,-40},{-48.3,-40},{-40,-40}},
                 color={0,0,255}));
  connect(B3.p, L318.n)
    annotation (Line(points={{60,-40},{68.3,-40}}, color={0,0,255}));
  connect(L318.p, B18.p) annotation (Line(points={{73.7,-40},{110,-40},{110,0},{100,0}},
                    color={0,0,255}));
  connect(pwFault.p, L318.n) annotation (Line(points={{64,-53.3333},{64,-40},{
          68.3,-40}}, color={0,0,255}));
  connect(B28.p, Tr2829.p)
    annotation (Line(points={{-40,-80},{-26.7,-80}}, color={0,0,255}));
  connect(B2.p, order3.p) annotation (Line(points={{120,-80},{140,-80},{140,-80}},
        color={0,0,255}));
  connect(order3.pm, order3.pm0) annotation (Line(points={{162,-75},{162,-75},{162,-69},{158,-69}},
                               color={0,0,127}));
  connect(order3.vf, order3.vf0) annotation (Line(points={{162,-85},{162,-85},{162,-86},{162,-91},{158,-91}},
                                         color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-180,-100},{180,
            100}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,-100},{
            180,100}})),
    Documentation(info="<html>
<p>This base network is extended in the example systems from <strong>TwoArea</strong> subpackage. It contains a generator model connected to bus 2, represented by an order 3 machine, from PSAT.</p>
<p>The 31-bus system has a three-phase-to-ground fault event occurring on bus 3 at 2 seconds and lasting for 100ms.</p>
</html>"));
end BaseNetwork;
