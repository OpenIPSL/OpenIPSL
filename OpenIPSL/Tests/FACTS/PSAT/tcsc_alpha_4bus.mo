within OpenIPSL.Tests.FACTS.PSAT;
model tcsc_alpha_4bus
  "PSAT's d_tcsc corrected: a firing-angle TCSC with constant power flow control between a sixth-order machine with a bus-fed AVR type 3 and an infinite bus, a fault at the machine's bus"
  extends Modelica.Icons.Example;
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100000000, fn=60)
    annotation (Placement(transformation(extent={{-200,-100},{-160,-80}})));
  OpenIPSL.Electrical.Buses.Bus bus_1(
    V_b=24000,
    v_0=1,
    angle_0=0.411124440651728) "Bus1, the machine's terminal"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={-20,0})));
  OpenIPSL.Electrical.Buses.Bus bus_2(
    V_b=400000,
    v_0=0.944354507232767,
    angle_0=0.267678212272037) "Bus2"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={20,0})));
  OpenIPSL.Electrical.Buses.Bus bus_3(
    V_b=400000,
    v_0=0.905718789084164,
    angle_0=0.0717632536842984) "Bus3"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={20,-55})));
  OpenIPSL.Electrical.Buses.Bus bus_4(
    V_b=400000,
    v_0=0.90081,
    angle_0=0) "Bus4, the infinite bus"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={70,0})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer trafo(
    CZ=1,
    CW=1,
    R=0,
    X=0.00675675675675676,
    G=0,
    B=0,
    t1=1,
    t2=1,
    ANG1=0) "Step-up transformer Bus1-Bus2, 2220 MVA, 0.15 pu on its rating"
    annotation (Placement(transformation(extent={{-7,-5},{7,5}}, origin={0,0})));
  OpenIPSL.Electrical.Branches.PwLine line_2_4(
    R=0,
    X=0.0225225225225225,
    G=0,
    B=0) "Line Bus2-Bus4, 0.5 pu on 2220 MVA"
    annotation (Placement(transformation(extent={{-6,-4},{6,4}}, origin={45,0})));
  OpenIPSL.Electrical.Branches.PwLine line_3_4(
    R=0,
    X=0.00585585585585586,
    G=0,
    B=0) "Line Bus3-Bus4, 0.13 pu on 2220 MVA"
    annotation (Placement(transformation(extent={{-6,-4},{6,4}}, rotation=90, origin={70,-32})));
  OpenIPSL.Electrical.FACTS.PSAT.TCSC tcsc(
    V_b=400000,
    Sn=2220000000,
    Vn=400000,
    ctrl=OpenIPSL.Types.Ctrl.alpha,
    alpha_max=3.1416,
    alpha_min=-3.1416,
    alphaTol=1e-10,
    XL=0.8,
    G=0,
    B=0,
    xTCSC0=0.43,
    Tr=0.01,
    Kp=-5,
    Ki=-1,
    Kr=10,
    x_L=0.2,
    x_C=0.1,
    pref=9.99)
    "TCSC on the line Bus2-Bus3, 53.75 % compensation, firing angle model, constant power flow control at the line's power flow (999 MW); its gains negated against d_tcsc's"
    annotation (Placement(transformation(extent={{-6,-4},{6,4}}, rotation=270, origin={20,-32})));
  Modelica.Blocks.Sources.RealExpression podSignal(y=0) "No power oscillation damper"
    annotation (Placement(transformation(extent={{6,-3},{-6,3}}, origin={36,-32})));
  OpenIPSL.Electrical.Events.PwFault fault(
    R=0,
    X=0.1,
    t1=2,
    t2=2.1) "Three-phase fault at Bus1 from 2 s to 2.1 s, 0.1 pu on the system base"
    annotation (Placement(transformation(extent={{-8,-8},{8,8}}, rotation=270, origin={-20,-35})));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(
    V_b=400000,
    v_0=0.90081,
    angle_0=0,
    P_0=1998000000,
    Q_0=79302150.5556768,
    displayPF=false) "Bus4, the slack of the power flow"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}}, origin={95,0})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 machine(
    V_b=24000,
    v_0=1,
    angle_0=0.411124440651728,
    P_0=1998000000,
    Q_0=967102308.089323,
    Sn=2220000000,
    Vn=24000,
    ra=0.003,
    x1d=0.3,
    M=7,
    D=0,
    xd=1.81,
    xq=1.76,
    x1q=0.65,
    x2d=0.23,
    x2q=0.25,
    T1d0=8,
    T1q0=1,
    T2d0=0.03,
    T2q0=0.07,
    Taa=0) "Sixth-order machine of d_tcsc, 2220 MVA, without its saturation"
    annotation (Placement(transformation(extent={{-80,-20},{-40,20}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(
    vfmax=7,
    vfmin=-6.4,
    K0=200,
    T2=1,
    T1=1,
    Te=1,
    Tr=0.015,
    busFed=true) "AVR type 3 of d_tcsc, bus-fed (its Exc.con column 9 is not 0)"
    annotation (Placement(transformation(extent={{-160,20},{-120,60}})));
  Modelica.Blocks.Sources.Constant noPSS(k=0) "No stabiliser signal"
    annotation (Placement(transformation(extent={{-200,19.6667},{-180,39.6667}})));
equation
  connect(machine.p, bus_1.p)
    annotation (Line(points={{-40,0},{-20,0}}, color={0,0,255}));
  connect(bus_1.p, trafo.p)
    annotation (Line(points={{-20,0},{-7,0}}, color={0,0,255}));
  connect(trafo.n, bus_2.p)
    annotation (Line(points={{7,0},{20,0}}, color={0,0,255}));
  connect(bus_2.p, line_2_4.p)
    annotation (Line(points={{20,0},{39.6,0}}, color={0,0,255}));
  connect(line_2_4.n, bus_4.p)
    annotation (Line(points={{50.4,0},{70,0}}, color={0,0,255}));
  connect(infiniteBus.p, bus_4.p)
    annotation (Line(points={{85,0},{70,0}}, color={0,0,255}));
  connect(bus_2.p, tcsc.p)
    annotation (Line(points={{20,0},{20,-25.4}}, color={0,0,255}));
  connect(tcsc.n, bus_3.p)
    annotation (Line(points={{20,-38.6},{20,-55}}, color={0,0,255}));
  connect(podSignal.y, tcsc.Vs_pod)
    annotation (Line(points={{29.4,-32},{24.8,-32}}, color={0,0,127}));
  connect(bus_3.p, line_3_4.p)
    annotation (Line(points={{20,-55},{70,-55},{70,-37.4}}, color={0,0,255}));
  connect(line_3_4.n, bus_4.p)
    annotation (Line(points={{70,-26.6},{70,0}}, color={0,0,255}));
  connect(fault.p, bus_1.p)
    annotation (Line(points={{-20,-29.4},{-20,0}}, color={0,0,255}));
  connect(noPSS.y, avr.vs)
    annotation (Line(points={{-179,29.6667},{-160,29.6667}}, color={0,0,127}));
  connect(machine.v, avr.v)
    annotation (Line(points={{-38,6},{-30,6},{-30,80},{-172,80},{-172,48.3333},{-160,48.3333}}, color={0,0,127}));
  connect(avr.vf, machine.vf)
    annotation (Line(points={{-118.333,40},{-100,40},{-100,10},{-84,10}}, color={0,0,127}));
  connect(machine.vf0, avr.vf0)
    annotation (Line(points={{-76,22},{-76,70},{-140,70},{-140,60}}, color={0,0,127}));
  connect(machine.pm0, machine.pm)
    annotation (Line(points={{-76,-22},{-76,-28},{-92,-28},{-92,-10},{-84,-10}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-200,-100},{120,100}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    experiment(StopTime=10, Tolerance=1e-06),
    __OpenModelica_commandLineOptions="--tearingMethod=minimalTearing",
    Documentation(info="<html>
<p>PSAT's distribution example <code>d_tcsc</code> (PSAT 2.1.11, <code>tests/d_tcsc_mdl.m</code>): a sixth-order
machine of 2220 MVA with an AVR type 3 feeds an infinite bus through a step-up transformer and two paths, one of them
compensated by a TCSC of the firing angle model
(<a href=\"modelica://OpenIPSL.Electrical.FACTS.PSAT.TCSC\">TCSC</a>, <code>ctrl = alpha</code>) that holds the line's
power flow constant. Its name is that of its PSAT model in PSAT-2-Modelica, not of a test base: it is
<code>d_tcsc</code>'s own network, not <a href=\"modelica://OpenIPSL.Tests.BaseClasses.SMIBPSAT\">SMIBPSAT</a>.</p>
<p>Two corrections make it a test, each measured in PSAT alone:</p>
<ol>
<li>The TCSC's gains are negated (<code>Kp = -5</code>, <code>Ki = -1</code>; <code>d_tcsc</code> has 5 and 1). The
firing angle model's susceptance falls as the angle rises, so constant power flow control needs negative gains: with
the distributed ones PSAT's own operating point is unstable and leaves the power flow at 1.27 s with no disturbance at
all, at a 2 ms step; with the gains negated PSAT stays at rest for 10 s.</li>
<li>A fault of its own, at the machine's bus from 2 s to 2.1 s with a reactance of 0.1 pu on the system base:
<code>d_tcsc</code> has none, and a bolted fault (0.01 pu) drives the firing angle to its limit and the machine out
of step in PSAT.</li>
</ol>
<p>The machine's saturation (<code>Syn.con</code> columns 25-26 of <code>d_tcsc</code>) is left out, since no PSAT
machine of the library models it. The data are those of the PSAT model <code>tcsc_alpha_4bus_nosat_mdl.m</code> of
<a href=\"https://github.com/ALSETLab/PSAT-2-Modelica\">PSAT-2-Modelica</a> (<code>Examples/Contributed/psat/</code>,
operating point 0, its power flow), against which it is verified: this model matches PSAT's run of the fault in
Dymola, OpenModelica and System Modeler, and so do the translated PSAT model's steps of the AVR's reference and of the
mechanical power, small and large. (With the earlier form of
<a href=\"modelica://OpenIPSL.NonElectrical.Continuous.LagLimWindupGuard\">LagLimWindupGuard</a>, whose limits were
tested without events, Dymola's DASSL at a tolerance of 1e-6 held the field voltage at its ceiling about 0.07 s too long
in the large reference step; with the release as an event it matches.) The case taught that the AVR mattered as much
as the TCSC: it matches PSAT only with the bus-fed term and the non-windup field voltage of
<a href=\"modelica://OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII\">AVRtypeIII</a> (<code>busFed = true</code>,
as <code>Exc.con</code> column 9 is not 0, and the default <code>useWindupGuard = true</code>).</p>
<p>OpenModelica initialises the model only with <code>--tearingMethod=minimalTearing</code>, which the annotation
<code>__OpenModelica_commandLineOptions</code> sets: with its default tearing the nonlinear solver of the initial
system diverges (the machine's currents become NaN) from start values that are PSAT's solution. Dymola and Wolfram
System Modeler need no option.</p>
<p>What to plot:</p>
<ul>
<li><code>bus_1.v</code>, <code>bus_2.v</code> and <code>bus_3.v</code>: the fault and the recovery.</li>
<li><code>tcsc.x1</code>, the firing angle: the controller returning the line's power to its reference after the
fault.</li>
<li><code>avr.vf</code>, the field voltage: from 2.42 pu to 3.87 pu at 2.17 s after the fault, below its ceiling of
7 pu; the steps of the AVR's reference in PSAT-2-Modelica's verification of the PSAT model drive it to the ceiling.</li>
<li><code>machine.delta</code> and <code>machine.w</code>: the machine stays in step.</li>
</ul>
</html>"));
end tcsc_alpha_4bus;
