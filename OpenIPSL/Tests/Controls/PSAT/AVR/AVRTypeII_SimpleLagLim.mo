within OpenIPSL.Tests.Controls.PSAT.AVR;
model AVRTypeII_SimpleLagLim
  "SMIB system to test AVRTypeII with its previous limiter (SimpleLagLim), compared with AVRTypeII_LagLimWindupGuard"
  extends OpenIPSL.Tests.BaseClasses.SMIBPSAT;
  parameter Real refStepHeight=0.2 "Step of the AVR voltage reference [pu]";
  parameter Types.Time refStepTime=5 "Time of the step of the AVR voltage reference";
  OpenIPSL.Electrical.Machines.PSAT.Order4 machine(
    Sn=100000000,
    Vn=400000,
    V_b=400000,
    v_0=1,
    angle_0=0.0706207995986839,
    P_0=40000000,
    Q_0=5416582.03662012,
    ra=0.001,
    x1d=0.3,
    M=13,
    D=2,
    xd=1.8,
    xq=1.7,
    x1q=0.55,
    T1d0=8,
    T1q0=0.4) annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII avr(
    vrmax=7.32,
    vrmin=-7.32,
    Ka=200,
    Ta=0.02,
    Kf=0.002,
    Tf=1,
    Ke=1,
    Te=0.2,
    Tr=0.001,
    Ae=0.0006,
    Be=0.9,
    v0=1,
    useWindupGuard=false)
    annotation (Placement(transformation(extent={{-82,30},{-58,54}})));
  Modelica.Blocks.Sources.Step refStep(height=refStepHeight, startTime=refStepTime)
    "Step of the voltage reference that drives the regulator to its limit"
    annotation (Placement(transformation(extent={{-130,50},{-114,66}})));
  Modelica.Blocks.Math.Add refSum "Voltage reference plus its step"
    annotation (Placement(transformation(extent={{-104,46},{-92,58}})));
equation
  connect(machine.p, GEN1.p)
    annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
  connect(machine.v, avr.v) annotation (Line(points={{-46,6},{-40,6},{-40,26},{-92,26},{-92,35.04},{-84.4,35.04}},
        color={0,0,127}));
  connect(avr.vf, machine.vf) annotation (Line(points={{-56.8,42},{-50,42},{-50,24},{-96,24},{-96,10},{-92,10}},
        color={0,0,127}));
  connect(machine.vf0, avr.vf0) annotation (Line(points={{-84,22},{-84,26},{-70,26},{-70,27.84}}, color={0,0,127}));
  connect(machine.pm0, machine.pm) annotation (Line(points={{-84,-22},{-84,-28},{-100,-28},{-100,-10},{-92,-10}},
        color={0,0,127}));
  connect(avr.vref0, refSum.u1) annotation (Line(points={{-70,55.2},{-70,64},{-108,64},{-108,55.6},{-105.2,55.6}},
        color={0,0,127}));
  connect(refStep.y, refSum.u2) annotation (Line(points={{-113.2,58},{-110,58},{-110,48.4},{-105.2,48.4}},
        color={0,0,127}));
  connect(refSum.y, avr.vref) annotation (Line(points={{-91.4,52},{-88,52},{-88,48.96},{-84.4,48.96}},
        color={0,0,127}));
  annotation (experiment(StopTime=20, Tolerance=1e-06),
    Documentation(info="<html>
<p>The PSAT type 2 AVR on a fourth-order machine at <code>GEN1</code> of
<a href=\"modelica://OpenIPSL.Tests.BaseClasses.SMIBPSAT\">SMIBPSAT</a>, with its previous limiter,
<code>SimpleLagLim</code> (<code>useWindupGuard = false</code>). Two disturbances drive the regulator's limiter to its
limit and back: the fault at 2 s, and a step of the voltage reference by <code>refStepHeight</code> at
<code>refStepTime</code>, which holds the regulator at its ceiling until the field voltage has risen.</p>
<p><a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.AVR.AVRTypeII_LagLimWindupGuard\">AVRTypeII_LagLimWindupGuard</a>
is the same test with the default limiter, <code>LagLimWindupGuard</code>, which reproduces PSAT's non-windup limit.
</p>
<p>What to plot, from this test and its pair (the variables of the limiter in use carry its name):</p>
<ul>
<li><code>avr.simpleLagLim.state</code> here and <code>avr.lagLimWindupGuard.state</code> in the pair, against the limits
(<code>avr.vrmax</code>, <code>avr.vrmin</code>): this is where the two differ. <code>SimpleLagLim</code>'s state runs past the limit and is reset to it whenever
the input turns back; <code>LagLimWindupGuard</code>'s stops at the limit.</li>
<li><code>avr.simpleLagLim.y</code> and <code>avr.lagLimWindupGuard.y</code>, and <code>machine.v</code>: the same in both
tests. The limiters' outputs leave the limit at the same time, so the system does not see the difference.</li>
<li>The number of state events in the simulation log: 27 and 16 with <code>SimpleLagLim</code> and <code>LagLimWindupGuard</code> in Dymola
2026x with the test's experiment settings (the count changes a little with the output interval); every reset of
<code>SimpleLagLim</code> is an event.</li>
</ul>
<p><a href=\"modelica://OpenIPSL.Tests.NonElectrical.Continuous.LagLimWindupGuard\">Tests.NonElectrical.Continuous.LagLimWindupGuard</a>
shows the two limiters side by side in one model.</p>
<p>The machine, the AVR and the network are those of the PSAT-2-Modelica unit test of the PSAT type 2 AVR.</p>
</html>"));
end AVRTypeII_SimpleLagLim;
