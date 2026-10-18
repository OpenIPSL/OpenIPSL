within OpenIPSL.Tests.Machines.PSAT;
model Order5Type2_AVR_SMIBPSAT
  "Order 5 machine type 2 with an AVR type III from PSAT on SMIBPSAT, the library twin of the PSAT-2-Modelica unit test ut_avr_type3_order5_type2"
  extends OpenIPSL.Tests.BaseClasses.SMIBPSAT(pwLine1(t1=6, t2=8));
  OpenIPSL.Electrical.Machines.PSAT.Order5_Type2 machine(
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
    x2d=0.25,
    x2q=0.25,
    T1d0=8,
    T2d0=0.03,
    T2q0=0.05,
    Taa=0.002) annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(
    vfmax=5,
    vfmin=-5,
    K0=20,
    T2=3,
    T1=1,
    Te=0.4,
    Tr=0.04) annotation (Placement(transformation(extent={{-96,54},{-72,30}})));
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
<p>The PSAT order 5 machine of type 2, <code>Electrical.Machines.PSAT.Order5_Type2</code>, with the PSAT AVR type III,
<code>Electrical.Controls.PSAT.AVR.AVRtypeIII</code>, in the loop, at <code>GEN1</code> of
<a href=\"modelica://OpenIPSL.Tests.BaseClasses.SMIBPSAT\">SMIBPSAT</a>. Two disturbances: the fault of
<code>SMIBPSAT</code> at bus <code>FAULT</code> from 2 s to 2.15 s, and the line from <code>LOAD</code> to
<code>SHUNT</code> (<code>pwLine1</code>) opened at 6 s and closed again at 8 s.</p>
<h4>Why this test exists</h4>
<p>It is the library twin of the unit test <code>ut_avr_type3_order5_type2</code> of ALSETLab/PSAT-2-Modelica, which
is verified against PSAT 2.1.11 (initial values and time response, in Dymola, OpenModelica and System Modeler): the
same network, operating point, machine, regulator and disturbances, so its trajectories can be compared with PSAT's
directly. <a href=\"modelica://OpenIPSL.Tests.Machines.PSAT.Order5Type2test2_AVR\">Order5Type2test2_AVR</a> tests the
same pair on the network of the other machine tests, whose trajectories are not compared with PSAT. Added by
OpenIPSL/OpenIPSL#NNN.</p>
<p>As in <code>Order5Type2test2_AVR</code>, the voltage input of the regulator is not fixed: the regulator
initialises itself from it, and with every state of this machine started in steady state a fixed <code>v</code> is one
initial condition too many.</p>
<h4>What to plot</h4>
<ul>
<li><code>machine.e1q</code>, <code>machine.w</code>, <code>machine.delta</code> and <code>avr.vf</code>: constant
until the fault at 2 s.</li>
<li><code>machine.v</code>, <code>machine.P</code>, <code>machine.Q</code> and <code>avr.vf</code> through the fault
and the line opening, against PSAT's results of the unit test (the first 10 s, the length of the PSAT run).</li>
</ul>
</html>"));
end Order5Type2_AVR_SMIBPSAT;
