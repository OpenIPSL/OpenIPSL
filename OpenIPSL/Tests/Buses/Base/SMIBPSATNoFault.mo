within OpenIPSL.Tests.Buses.Base;
partial model SMIBPSATNoFault
  "SMIBPSAT without its fault: each test that extends it adds the fault it needs"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-20,-4},{-8,4}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{14,-34},{26,-26}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine4(
    R=0.0005,
    X=0.1,
    G=0,
    B=0) annotation (Placement(transformation(extent={{54,-34},{66,-26}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(
    angle_0=0,
    P_0=-10017115.6303746,
    Q_0=-8006544.03828744,
    v_0=1) "Infinite bus (PSAT slack bus without a machine)"
    annotation (Placement(transformation(extent={{100,-10},{90,10}})));
  OpenIPSL.Electrical.Loads.PSAT.VoltageDependent load(
    alphap=2,
    alphaq=2,
    P_0=50000000,
    Q_0=10000000,
    v_0=0.991993544450413,
    angle_0=-0.0100577782786794)
    "PSAT turns its PQ loads into constant impedances after the power flow"
    annotation (Placement(transformation(extent={{-10,-72},{10,-52}})));
  OpenIPSL.Electrical.Buses.Bus GEN1(v_0=1, angle_0=0.0706207995986839)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100e6, fn=50)
    annotation (Placement(transformation(extent={{-100,80},{-60,100}})));
  OpenIPSL.Electrical.Buses.Bus LOAD(v_0=load.v_0, angle_0=load.angle_0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  OpenIPSL.Electrical.Buses.Bus GEN2(v_0=1, angle_0=0)
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  OpenIPSL.Electrical.Buses.Bus FAULT(v_0=0.995984178212487, angle_0=-0.00500867626420951)
    annotation (Placement(transformation(extent={{30,-40},{50,-20}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=0.0005,
    G=0,
    B=0,
    X=0.1) annotation (Placement(transformation(extent={{14,26},{26,34}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    R=0.0005,
    G=0,
    B=0,
    X=0.1) annotation (Placement(transformation(extent={{54,26},{66,34}})));
  OpenIPSL.Electrical.Buses.Bus SHUNT(v_0=0.995984178212487, angle_0=-0.00500867626420951)
    annotation (Placement(transformation(extent={{30,20},{50,40}})));
equation
  connect(GEN1.p, pwLine.p)
    annotation (Line(points={{-30,0},{-19.4,0}}, color={0,0,255}));
  connect(pwLine.n, LOAD.p)
    annotation (Line(points={{-8.6,0},{0,0}}, color={0,0,255}));
  connect(pwLine3.p, LOAD.p) annotation (Line(points={{14.6,-30},{10,-30},{10,0},{0,0}},
                 color={0,0,255}));
  connect(load.p, LOAD.p)
    annotation (Line(points={{0,-52},{0,0}}, color={0,0,255}));
  connect(GEN2.p, infiniteBus.p)
    annotation (Line(points={{80,0},{90,0}}, color={0,0,255}));
  connect(pwLine4.n, GEN2.p) annotation (Line(points={{65.4,-30},{70,-30},{70,0},{80,0}},
                   color={0,0,255}));
  connect(FAULT.p, pwLine4.p)
    annotation (Line(points={{40,-30},{54.6,-30}}, color={0,0,255}));
  connect(FAULT.p, pwLine3.n)
    annotation (Line(points={{40,-30},{25.4,-30}}, color={0,0,255}));
  connect(pwLine1.p, LOAD.p)
    annotation (Line(points={{14.6,30},{10,30},{10,0},{0,0}},
                                                            color={0,0,255}));
  connect(pwLine1.n, SHUNT.p)
    annotation (Line(points={{25.4,30},{40,30}}, color={0,0,255}));
  connect(pwLine2.p, SHUNT.p)
    annotation (Line(points={{54.6,30},{40,30}}, color={0,0,255}));
  connect(pwLine2.n, GEN2.p) annotation (Line(points={{65.4,30},{70,30},{70,0},{80,0}},
                   color={0,0,255}));
  annotation (Documentation(info="<html>
<p>The network of <a href=\"modelica://OpenIPSL.Tests.BaseClasses.SMIBPSAT\">Tests.BaseClasses.SMIBPSAT</a>, with the
same components, data and power flow solution, but without its fault at bus <code>FAULT</code>. A model cannot
remove a component it inherits, so the tests of <a href=\"modelica://OpenIPSL.Tests.Buses\">Tests.Buses</a> extend
this one and each adds its own fault: <a href=\"modelica://OpenIPSL.Electrical.Events.PwFault\">PwFault</a> in
<a href=\"modelica://OpenIPSL.Tests.Buses.PVBus_SMIBPSAT\">PVBus_SMIBPSAT</a>,
<a href=\"modelica://OpenIPSL.Electrical.Events.PwFaultSmooth\">PwFaultSmooth</a> in
<a href=\"modelica://OpenIPSL.Tests.Buses.PVBus_SMIBPSAT_SmoothFault\">PVBus_SMIBPSAT_SmoothFault</a>, at the same
place and with the same data as in <code>SMIBPSAT</code>.</p>
<ul>
<li><code>GEN1</code> takes the generating unit, here the PV bus, which delivers 40 MW and 5.4166 Mvar at 1 pu.</li>
<li><code>GEN2</code> is an infinite bus, PSAT's slack bus without a machine.</li>
<li>The load is a constant impedance (<code>VoltageDependent</code> with exponents 2): PSAT turns its PQ loads into
constant impedances after the power flow.</li>
</ul>
<p>The buses start on the power flow solution of this operating point (PSAT 2.1.11).</p>
</html>"));
end SMIBPSATNoFault;
