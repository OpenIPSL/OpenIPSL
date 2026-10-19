within OpenIPSL.Tests.FACTS.PSAT;
model STATCOM_SimpleLagLim
  "SMIB system to test the PSAT STATCOM with its previous limiter (SimpleLagLim), compared with STATCOM_LagLimWindupGuard"
  extends OpenIPSL.Tests.BaseClasses.SMIBPSAT(
    pwLine1(t1=6, t2=8),
    GEN1(angle_0=0.0704921936685261),
    load(v_0=0.994015188619077, angle_0=-0.0100321741951427),
    FAULT(v_0=0.996995051530098, angle_0=-0.00500103175240513),
    SHUNT(v_0=1, angle_0=-0.00501610177997756),
    infiniteBus(P_0=-10016963.4299816, Q_0=-2979911.82085724));
  parameter Real refStepHeight=-0.1 "Step of the STATCOM's voltage reference [pu]";
  parameter Types.Time refStepTime=10 "Time of the step of the voltage reference";
  parameter Types.Time refStepDuration=4 "Duration of the step, after which the reference returns";
  OpenIPSL.Electrical.Machines.PSAT.Order2 machine(
    Sn=100000000,
    Vn=400000,
    V_b=400000,
    v_0=1,
    angle_0=0.0704921936685261,
    P_0=40000000,
    Q_0=4402877.00923693,
    ra=0.001,
    x1d=0.3,
    M=13,
    D=2) "Classical machine of the unit test's template"
    annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
  OpenIPSL.Electrical.FACTS.PSAT.STATCOM statcom(
    V_b=400000,
    v_0=1,
    angle_0=-0.00501610177997756,
    Q_0=6009897.1662278,
    Sn=100000000,
    Vn=400000,
    Kr=50,
    Tr=0.1,
    i_Max=0.5,
    i_Min=-0.5,
    useWindupGuard=false) "STATCOM regulating the voltage of bus SHUNT"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={40,56})));
  Modelica.Blocks.Sources.RealExpression refStep(y=if time >= refStepTime and time < refStepTime + refStepDuration then refStepHeight else 0)
    "Step of the voltage reference that drives the STATCOM's current to its lower limit and back"
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={66,56})));
equation
  connect(machine.p, GEN1.p)
    annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
  connect(machine.pm0, machine.pm) annotation (Line(points={{-84,-22},{-84,-28},{-100,-28},{-100,-10},{-92,-10}},
        color={0,0,127}));
  connect(machine.vf0, machine.vf) annotation (Line(points={{-84,22},{-84,28},{-100,28},{-100,10},{-92,10}},
        color={0,0,127}));
  connect(statcom.p, SHUNT.p)
    annotation (Line(points={{40,45},{40,30}}, color={0,0,255}));
  connect(refStep.y, statcom.v_POD)
    annotation (Line(points={{59.4,56},{52,56}}, color={0,0,127}));
  annotation (experiment(StopTime=20, Tolerance=1e-06),
    Documentation(info="<html>
<p>The PSAT STATCOM at bus <code>SHUNT</code> of
<a href=\"modelica://OpenIPSL.Tests.BaseClasses.SMIBPSAT\">SMIBPSAT</a>, with its previous limiter,
<code>SimpleLagLim</code> (<code>useWindupGuard = false</code>), a classical machine at <code>GEN1</code>. Three
disturbances drive the STATCOM's current to its limits and back: the fault at 2 s (to its upper limit, 0.14 s), the
line <code>LOAD - SHUNT</code> opened from 6 s to 8 s, and a step of the voltage reference by <code>refStepHeight</code>
from <code>refStepTime</code> for <code>refStepDuration</code> (to its lower limit, about 4 s).</p>
<p><a href=\"modelica://OpenIPSL.Tests.FACTS.PSAT.STATCOM_LagLimWindupGuard\">STATCOM_LagLimWindupGuard</a> is the same
test with the default limiter, <code>LagLimWindupGuard</code>, which reproduces PSAT's non-windup limit.</p>
<p>What to plot, from this test and its pair (the variables of the limiter in use carry its name):</p>
<ul>
<li><code>statcom.simpleLagLim.state</code> here and <code>statcom.lagLimWindupGuard.state</code> in the pair, against the
limits (&plusmn;0.5 pu): this is where the two differ. <code>SimpleLagLim</code>'s state runs past the limit and is reset
to it whenever the input turns back; <code>LagLimWindupGuard</code>'s stops at the limit.</li>
<li><code>statcom.Q</code> and <code>SHUNT.v</code>: the same in both tests. The limiters' outputs leave the limit at
the same time, so the system does not see the difference.</li>
<li>The number of state events in the simulation log: every reset of <code>SimpleLagLim</code> is an event. In
System Modeler its anti-windup relation, zero at rest, makes an event of every round-off sign change, and this test
stops there before any disturbance; with <code>LagLimWindupGuard</code> it runs.</li>
</ul>
<p>The network, the machine and the STATCOM are those of the PSAT-2-Modelica unit test <code>facts_statcom</code>, and
the step that of its reference step test (C.5) taken at 10 s for 4 s on top of the fault and the line opening, so
that the test can be compared with PSAT directly. Added with the <code>useWindupGuard</code> option of the PSAT
STATCOM and TCSC.</p>
</html>"));
end STATCOM_SimpleLagLim;
