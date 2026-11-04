within OpenIPSL.Tests.Controls.PSAT.AVR;
model AVRTypeIII_BusFed_on
  "SMIB system to test AVRtypeIII bus-fed (busFed = true) through a long fault, the library twin of the PSAT-2-Modelica unit test ut_avr_type3_busfed_on"
  extends OpenIPSL.Tests.BaseClasses.SMIBPSAT(pwLine1(t1=6, t2=8), pwFault(t2=2.45));
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
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(
    vfmax=3.0,
    vfmin=-3.0,
    K0=20,
    T2=3,
    T1=1,
    Te=0.4,
    Tr=0.04,
    busFed=true) "Bus-fed; its ceiling 3.0 pu, above what the bus-fed field voltage reaches in the fault"
    annotation (Placement(transformation(extent={{-96,54},{-72,30}})));
  Modelica.Blocks.Sources.Constant noPSS(k=0) "No stabiliser signal"
    annotation (Placement(transformation(extent={{-120,42},{-108,54}})));
equation
  connect(machine.p, GEN1.p)
    annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
  connect(machine.v, avr.v) annotation (Line(points={{-46,6},{-40,6},{-40,-34},{-104,-34},{-104,36},{-95,36}},
        color={0,0,127}));
  connect(avr.vf, machine.vf) annotation (Line(points={{-71,42},{-60,42},{-60,72},{-124,72},{-124,10},{-92,10}},
        color={0,0,127}));
  connect(machine.vf0, avr.vf0) annotation (Line(points={{-84,22},{-84,31}},
        color={0,0,127}));
  connect(noPSS.y, avr.vs)
    annotation (Line(points={{-107.4,48},{-95,48}}, color={0,0,127}));
  connect(machine.pm0, machine.pm) annotation (Line(points={{-84,-22},{-84,-28},{-100,-28},{-100,-10},{-92,-10}},
        color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-140,-100},{100,100}})),
    experiment(StopTime=20, Tolerance=1e-06),
    Documentation(info="<html>
<p>The PSAT AVR type III, <a href=\"modelica://OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII\">AVRtypeIII</a>,
bus-fed (<code>busFed = true</code>), on a fourth-order machine at <code>GEN1</code> of
<a href=\"modelica://OpenIPSL.Tests.BaseClasses.SMIBPSAT\">SMIBPSAT</a>.
<a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.AVR.AVRTypeIII_BusFed_off\">AVRTypeIII_BusFed_off</a> is the same
test with <code>busFed = false</code>; the two side by side show what the bus-fed term does.</p>
<p>Two disturbances: a fault at bus <code>FAULT</code> from 2 s to 2.45 s, longer than the 0.15 s of
<code>SMIBPSAT</code>, and the line from <code>LOAD</code> to <code>SHUNT</code> (<code>pwLine1</code>) opened at 6 s
and closed again at 8 s. A bus-fed exciter draws its power from the generator's terminals, so its output falls with
the terminal voltage: in the fault <code>machine.v</code> is near 0.57 pu, and the regulator's command is scaled by
<code>v/v0</code>. The ceiling, <code>vfmax</code> = 3.0 pu against an initial field voltage of 1.31 pu, is high
enough that the scaled command stays below it, so the scaling shows in <code>avr.vf</code> instead of being cut off
by the limit: bus-fed, the field voltage peaks near 2.3 pu; not bus-fed it rises to the ceiling, where the non-windup
limit (<code>useWindupGuard = true</code>, the default) holds it.</p>
<h4>Why this test exists</h4>
<p>It is the library twin of the unit test <code>ut_avr_type3_busfed_on</code> of ALSETLab/PSAT-2-Modelica, which
is verified against PSAT 2.1.11: the same network, operating point, machine, regulator and disturbances. The unit
test sets column 9 of PSAT's <code>Exc.con</code>, so that PSAT scales the input of the field circuit by
<code>v/v0</code>; <code>ut_avr_type3_busfed_off</code>, the twin of
<a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.AVR.AVRTypeIII_BusFed_off\">AVRTypeIII_BusFed_off</a>, leaves it
at 0.</p>
<h4>What to plot</h4>
<ul>
<li><code>avr.vf</code> of this test and of <code>AVRTypeIII_BusFed_off</code>, from 1.5 s to 10 s: from the fault on
the bus-fed field voltage is the lower one, by up to 1 pu, until the swings after the fault have died out.</li>
<li><code>machine.delta</code> of both: the weaker field of the bus-fed exciter in the fault changes the first swings.</li>
<li><code>machine.v</code>, <code>machine.P</code>, <code>machine.Q</code> and <code>avr.vf</code> through the fault
and the line opening, against PSAT's results of the unit test (the first 10 s, the length of the PSAT run).</li>
</ul>
</html>"));
end AVRTypeIII_BusFed_on;
