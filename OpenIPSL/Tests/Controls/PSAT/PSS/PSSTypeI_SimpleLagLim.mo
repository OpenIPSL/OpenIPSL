within OpenIPSL.Tests.Controls.PSAT.PSS;
model PSSTypeI_SimpleLagLim
  "SMIB system to test PSSTypeI with its previous limiter (SimpleLagLim), compared with PSSTypeI_LagLimWindupGuard"
  extends OpenIPSL.Tests.BaseClasses.SMIBPSAT;
  parameter Real pmStepHeight=0.5 "Step of the mechanical power [pu]";
  parameter Types.Time pmStepTime=5 "Time of the step of the mechanical power";
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
    v0=1) annotation (Placement(transformation(extent={{-82,30},{-58,54}})));
  OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeI pss(
    Kw=5,
    Kp=-0.1,
    Kv=0.1,
    vsmax=0.02,
    vsmin=-0.02,
    Tw=10,
    Tc=0.001,
    useWindupGuard=false) annotation (Placement(transformation(extent={{-120,36},{-100,56}})));
  Modelica.Blocks.Sources.Step pmStep(height=pmStepHeight, startTime=pmStepTime)
    "Step of the mechanical power that drives the stabilizer to its limit"
    annotation (Placement(transformation(extent={{-136,-46},{-120,-30}})));
  Modelica.Blocks.Math.Add pmSum "Mechanical power plus its step"
    annotation (Placement(transformation(extent={{-108,-36},{-96,-24}})));
equation
  connect(machine.p, GEN1.p)
    annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
  connect(machine.v, avr.v) annotation (Line(points={{-46,6},{-40,6},{-40,26},{-92,26},{-92,35.04},{-84.4,35.04}},
        color={0,0,127}));
  connect(avr.vf, machine.vf) annotation (Line(points={{-56.8,42},{-50,42},{-50,24},{-96,24},{-96,10},{-92,10}},
        color={0,0,127}));
  connect(machine.vf0, avr.vf0) annotation (Line(points={{-84,22},{-84,26},{-70,26},{-70,27.84}}, color={0,0,127}));
  connect(pss.Vref, avr.vref) annotation (Line(points={{-99,46},{-92,46},{-92,48.96},{-84.4,48.96}}, color={0,0,127}));
  connect(avr.vref0, pss.vref0) annotation (Line(points={{-70,55.2},{-70,64},{-110,64},{-110,58}}, color={0,0,127}));
  connect(machine.w, pss.w) annotation (Line(points={{-46,18},{-36,18},{-36,72},{-128,72},{-128,52},{-122,52}},
        color={0,0,127}));
  connect(machine.P, pss.Pg) annotation (Line(points={{-46,14},{-34,14},{-34,74},{-130,74},{-130,46},{-122,46}},
        color={0,0,127}));
  connect(machine.v, pss.Vg) annotation (Line(points={{-46,6},{-32,6},{-32,76},{-132,76},{-132,40},{-122,40}},
        color={0,0,127}));
  connect(machine.pm0, pmSum.u1) annotation (Line(points={{-84,-22},{-84,-26},{-112,-26},{-112,-26.4},{-109.2,-26.4}},
        color={0,0,127}));
  connect(pmStep.y, pmSum.u2) annotation (Line(points={{-119.2,-38},{-114,-38},{-114,-33.6},{-109.2,-33.6}},
        color={0,0,127}));
  connect(pmSum.y, machine.pm) annotation (Line(points={{-95.4,-30},{-94,-30},{-94,-10},{-92,-10}},
        color={0,0,127}));
  annotation (experiment(StopTime=20, Tolerance=1e-06),
    Documentation(info="<html>
<p>The PSAT type 1 stabilizer (inputs: rotor speed, active power and terminal voltage) with a PSAT type 2 AVR on a
fourth-order machine at <code>GEN1</code> of <a href=\"modelica://OpenIPSL.Tests.BaseClasses.SMIBPSAT\">SMIBPSAT</a>,
with the stabilizer's previous limiter, <code>SimpleLagLim</code> (<code>useWindupGuard = false</code>). Two
disturbances drive the stabilizer to its output limit and back: the fault at 2 s, and a step of the mechanical power
by <code>pmStepHeight</code> at <code>pmStepTime</code>.</p>
<p><a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.PSS.PSSTypeI_LagLimWindupGuard\">PSSTypeI_LagLimWindupGuard</a>
is the same test with the default limiter, <code>LagLimWindupGuard</code>.</p>
<p>What to plot, from this test and its pair (the variables of the limiter in use carry its name):</p>
<ul>
<li><code>pss.simpleLagLim.state</code> here and <code>pss.lagLimWindupGuard.state</code> in the pair, against the limits
(<code>pss.vsmax</code>, <code>pss.vsmin</code>): this is where the two differ. <code>SimpleLagLim</code>'s state runs past the limit and is reset to it whenever
the input turns back; <code>LagLimWindupGuard</code>'s stops at the limit.</li>
<li><code>pss.simpleLagLim.y</code> and <code>pss.lagLimWindupGuard.y</code>, and <code>machine.v</code>: the same in both
tests. The limiters' outputs leave the limit at the same time, so the system does not see the difference.</li>
<li>The number of state events in the simulation log: 784 and 104 with <code>SimpleLagLim</code> and <code>LagLimWindupGuard</code> in Dymola
2026x with the test's experiment settings (the count changes a little with the output interval); every reset of
<code>SimpleLagLim</code> is an event.</li>
</ul>
<p><a href=\"modelica://OpenIPSL.Tests.NonElectrical.Continuous.LagLimWindupGuard\">Tests.NonElectrical.Continuous.LagLimWindupGuard</a>
shows the two limiters side by side in one model.</p>
<p>The machine, the AVR, the stabilizer and the network are those of the PSAT-2-Modelica unit test of the PSAT type 1
stabilizer, with the stabilizer's limits tightened from &plusmn;0.1 to &plusmn;0.02 pu so that the disturbances reach
them.</p>
</html>"));
end PSSTypeI_SimpleLagLim;
