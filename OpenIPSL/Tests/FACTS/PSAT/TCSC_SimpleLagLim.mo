within OpenIPSL.Tests.FACTS.PSAT;
model TCSC_SimpleLagLim
  "SMIB system to test the PSAT TCSC with its previous limiter (SimpleLagLim), compared with TCSC_LagLimWindupGuard"
  extends OpenIPSL.Tests.BaseClasses.SMIBPSATSeries(
    pwLine1(t1=6, t2=8),
    GEN1(angle_0=0.0328734403043844),
    load(v_0=0.985380706272986, angle_0=-0.0483139944566008),
    FAULT(v_0=0.992400735481305, angle_0=-0.0239790832666907),
    SERIES1(v_0=0.983493605997994, angle_0=-0.0625552088288088),
    SERIES2(v_0=0.989744456950008, angle_0=-0.0365267338585248),
    infiniteBus(P_0=-60031173.9662309, Q_0=-18500137.7220511));
  OpenIPSL.Electrical.Machines.PSAT.Order2 machine(
    Sn=100000000,
    Vn=400000,
    V_b=400000,
    v_0=1,
    angle_0=0.0328734403043844,
    P_0=40000000,
    Q_0=8732514.64467773,
    ra=0.001,
    x1d=0.3,
    M=13,
    D=2) "Classical machine of the unit test's template"
    annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
  OpenIPSL.Electrical.Loads.PSAT.VoltageDependent loadSeries(
    alphap=2,
    alphaq=2,
    P_0=50000000,
    Q_0=10000000,
    v_0=0.983493605997994,
    angle_0=-0.0625552088288088)
    "Load at SERIES1 that the TCSC line feeds (a constant impedance, as PSAT's PQ load after the power flow)"
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={20,52})));
  OpenIPSL.Electrical.FACTS.PSAT.TCSC tcsc(
    V_b=400000,
    ctrl=OpenIPSL.Types.Ctrl.xTCSC,
    XL=0.1,
    G=0,
    B=0,
    xTCSC0=0.03,
    xTCSC_max=0.05,
    xTCSC_min=-0.05,
    Tr=0.1,
    Kp=1,
    Ki=1,
    Kr=0,
    x_L=0.2,
    x_C=0.1,
    pref=0.36190639997462,
    useWindupGuard=false)
    "TCSC on the line SERIES2 - SERIES1, 30 % compensation, constant power flow control"
    annotation (Placement(transformation(
        extent={{6,-4},{-6,4}},
        origin={42,30})));
  Modelica.Blocks.Sources.Constant podSignal(k=0) "No power oscillation damper"
    annotation (Placement(transformation(
        extent={{-3,-3},{3,3}},
        rotation=-90,
        origin={42,46})));
equation
  connect(machine.p, GEN1.p)
    annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
  connect(machine.pm0, machine.pm) annotation (Line(points={{-84,-22},{-84,-28},{-100,-28},{-100,-10},{-92,-10}},
        color={0,0,127}));
  connect(machine.vf0, machine.vf) annotation (Line(points={{-84,22},{-84,28},{-100,28},{-100,10},{-92,10}},
        color={0,0,127}));
  connect(tcsc.p, SERIES2.p)
    annotation (Line(points={{48.6,30},{54,30}}, color={0,0,255}));
  connect(tcsc.n, SERIES1.p)
    annotation (Line(points={{35.4,30},{30,30}}, color={0,0,255}));
  connect(loadSeries.p, SERIES1.p)
    annotation (Line(points={{20,46},{20,36},{30,36},{30,30}}, color={0,0,255}));
  connect(podSignal.y, tcsc.Vs_pod)
    annotation (Line(points={{42,42.7},{42,34.8}}, color={0,0,127}));
  annotation (experiment(StopTime=20, Tolerance=1e-06),
    Documentation(info="<html>
<p>The PSAT TCSC between buses <code>SERIES2</code> and <code>SERIES1</code> of
<a href=\"modelica://OpenIPSL.Tests.BaseClasses.SMIBPSATSeries\">SMIBPSATSeries</a>, with its previous limiter,
<code>SimpleLagLim</code> (<code>useWindupGuard = false</code>), a classical machine at <code>GEN1</code> and a load at
<code>SERIES1</code> that the TCSC line feeds. The fault at 2 s drives the TCSC's reactance to its upper limit; the
line <code>LOAD - SERIES1</code> opened from 6 s to 8 s leaves the load on the TCSC line alone, its power flow above
the reference, and drives the reactance to its lower limit until about 9.4 s.</p>
<p><a href=\"modelica://OpenIPSL.Tests.FACTS.PSAT.TCSC_LagLimWindupGuard\">TCSC_LagLimWindupGuard</a> is the same test
with the default limiter, <code>LagLimWindupGuard</code>, which reproduces PSAT's non-windup limit.</p>
<p>What to plot, from this test and its pair (the variables of the limiter in use carry its name):</p>
<ul>
<li><code>tcsc.X1.state</code> here and <code>tcsc.lagLimWindupGuard.state</code> in the pair, against the limits
(&plusmn;0.05 pu): this is where the two differ.</li>
<li><code>tcsc.x1</code> and <code>tcsc.pkm</code>: the same in both tests.</li>
<li>The number of state events in the simulation log.</li>
</ul>
<p>The network, the machine, the load and the TCSC are those of the PSAT-2-Modelica unit test <code>facts_tcsc</code>,
so that the test can be compared with PSAT directly; the line runs from <code>SERIES2</code> to <code>SERIES1</code>
because PSAT's constant power flow control is stable only on a positive flow. Added with the
<code>useWindupGuard</code> option of the PSAT STATCOM and TCSC.</p>
</html>"));
end TCSC_SimpleLagLim;
