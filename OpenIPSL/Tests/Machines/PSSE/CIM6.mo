within OpenIPSL.Tests.Machines.PSSE;
model CIM6 "PSSE CIM6 induction motor at bus SHUNT of the SMIB test system, started in steady state, through the fault"
  extends OpenIPSL.Tests.BaseClasses.SMIB(
    gENCLS(P_0=17902671.9580135, Q_0=11559899.8696452),
    constantLoad(v_0=0.990570718561679, angle_0=-0.0140416319339916),
    SHUNT(v_0=0.993173764485367, angle_0=-0.0109655580125794),
    FAULT(v_0=0.995260830200301, angle_0=-0.00698755799892328));
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Tpd0=5,
    Tppd0=0.07,
    Tppq0=0.09,
    H=4.28,
    D=0,
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xppd=0.2,
    Xl=0.12,
    S10=0.11,
    S12=0.39,
    Xppq=0.2,
    R_a=0,
    M_b=100000000,
    P_0=40000000,
    Q_0=6130031.10280319,
    v_0=1,
    angle_0=0.0667458568774647) annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
  OpenIPSL.Electrical.Machines.PSSE.CIM6 motor(
    M_b=10000000,
    Sup=false,
    Ctrl=false,
    T_nom=0.8,
    A=1,
    B=0,
    C0=0,
    D=0,
    P_0=7884675.16560625,
    Q_0=4090572.49098807,
    v_0=0.993173764485367,
    angle_0=-0.0109655580125794,
    s(start=0.00723396729)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,70})));
equation
  connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{-92,10},{-100,10},{-100,26},{-42,26},{-42,10},{-46,10}},
        color={0,0,127}));
  connect(gENSAL.EFD, gENSAL.EFD0) annotation (Line(points={{-92,-10},{-100,-10},{-100,-30},{-42,-30},{-42,-10},{-46,-10}},
        color={0,0,127}));
  connect(gENSAL.p, GEN1.p) annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
  connect(motor.p, SHUNT.p) annotation (Line(points={{40,60},{40,30}}, color={0,0,255}));
  annotation (
    experiment(
      StopTime=10,
      Interval=0.001,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>The PSS/E induction motor model <code>Electrical.Machines.PSSE.CIM6</code> at bus <code>SHUNT</code> of
<a href=\"modelica://OpenIPSL.Tests.BaseClasses.SMIB\">SMIB</a>, the network of the library's PSS/E tests, with
the <code>GENSAL</code> of <a href=\"modelica://OpenIPSL.Tests.Machines.PSSE.GENSAL\">Tests.Machines.PSSE.GENSAL</a>
at <code>GEN1</code> (constant field voltage and mechanical power), as in the shunt test
<a href=\"modelica://OpenIPSL.Tests.Banks.PSSE.CSVGN1\">Tests.Banks.PSSE.CSVGN1</a>. The motor has the model's
default single-cage data (<code>R2 = X2 = 0</code>, <code>Mtype = 1</code>), a 10 MVA base, no speed control
(<code>Ctrl = false</code>) and a quadratic load torque (<code>A = 1</code>, <code>B = C0 = D = 0</code>) of 0.8 pu at
synchronous speed. It is started in steady state (<code>Sup = false</code>) and disturbed by the fault of
<code>SMIB</code> at bus <code>FAULT</code> from 2 s to 2.15 s. The slip's start value is its steady-state value,
0.00723: the torque balance of the quadratic load has a second root at negative speed (slip 1.48, the motor driven
backwards), and without the start value a tool may initialise there (System Modeler 15 did; Dymola and OpenModelica
found the running equilibrium from their default start of zero).</p>
<h4>Why this test exists</h4>
<p>Until OpenIPSL/OpenIPSL#456 no example or test instantiated <code>CIM6</code>, so the OpenModelica library
report never compiled it and a Real equality in its <code>Lpp</code>, <code>Tp0</code> and <code>Tpp0</code>
equations (not allowed outside functions by the Modelica Language Specification 3.6, section 3.5; OpenModelica 1.27.1
reports it as a deprecation warning) went unnoticed; the test covers the model
at compile time and at run time. Its PSS/E counterpart is the case <code>ut_cim6</code> of ALSETLab/PSSE-2-Modelica
(the SMIB template with the motor as the load at bus SHUNT, <code>CIM6BL</code> with the same data): against PSS/E
36.2.1 (step 0.25 ms) through the fault, Dymola, OpenModelica and System Modeler differ from PSS/E, on a 1 ms grid
with 5 ms around each switching instant left out, by at most 7.6e-4 pu in the <code>SHUNT</code> voltage, 2.7e-4 in
the slip and 6.3e-4 pu in the motor's Q, the size of PSS/E's own difference between its 1 ms and 0.25 ms steps. PSS/E's equilibrium of the same circuit differs slightly: slip 0.0072476
against 0.0072340 here, and 1.2e-4 pu more reactive power, which PSS/E balances with a hidden bus admittance.</p>
<p>The power flow data is the solution of this network with the motor at its equilibrium, in double precision
(Newton on the five buses; the motor's P, Q and slip at the <code>SHUNT</code> voltage from the model's own
steady-state initialisation in OpenModelica), so the test starts at rest: the slack's power
(<code>gENCLS</code>), the load bus voltage (<code>constantLoad</code>) and the machine's reactive power and angle
(<code>gENSAL</code>) differ from <code>SMIB</code>'s, which are for the network without the motor.</p>
<h4>What to plot</h4>
<ul>
<li><code>motor.s</code>, <code>motor.P</code>, <code>motor.Q</code> and <code>gENSAL.SPEED</code>: constant until the
fault at 2 s.</li>
<li><code>motor.s</code>, <code>motor.Te_motor</code>, <code>motor.P</code>, <code>motor.Q</code> and
<code>SHUNT.v</code> through the fault: the motor slows down while the voltage is depressed and reaccelerates
after the fault is cleared.</li>
</ul>
</html>"));
end CIM6;
