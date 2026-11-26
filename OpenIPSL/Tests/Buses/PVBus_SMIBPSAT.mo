within OpenIPSL.Tests.Buses;
model PVBus_SMIBPSAT
  "PV bus on SMIBPSAT, the library twin of the PSAT-2-Modelica unit test ut_bus_pv"
  extends OpenIPSL.Tests.Buses.Base.SMIBPSATNoFault(pwLine1(t1=6, t2=8));
  OpenIPSL.Electrical.Buses.PVBus pvBus(
    v_0=1,
    angle_0=0.070620799598685,
    P_0=40000000,
    Q_0=5416582.0366201,
    displayPF=true) "PSAT's PV generator at GEN1, without machine data"
    annotation (Placement(transformation(extent={{-72,-10},{-52,10}})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    t1=2,
    t2=2.15,
    R=0,
    X=0.001) "The fault of SMIBPSAT at bus FAULT"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={40,-60})));
equation
  connect(pvBus.p, GEN1.p)
    annotation (Line(points={{-52,0},{-30,0}}, color={0,0,255}));
  connect(pwFault.p, pwLine4.p)
    annotation (Line(points={{40,-48.3333},{40,-30},{54.6,-30}}, color={0,0,255}));
  annotation (experiment(StopTime=10, Tolerance=1e-06),
    Documentation(info="<html>
<p>The PV bus, <a href=\"modelica://OpenIPSL.Electrical.Buses.PVBus\">Electrical.Buses.PVBus</a>,
at <code>GEN1</code> of <a href=\"modelica://OpenIPSL.Tests.Buses.Base.SMIBPSATNoFault\">Base.SMIBPSATNoFault</a>,
the network of <a href=\"modelica://OpenIPSL.Tests.BaseClasses.SMIBPSAT\">SMIBPSAT</a> without its fault, in place of a
machine: PSAT's PV generator without machine data. Two disturbances: the fault of <code>SMIBPSAT</code> at bus
<code>FAULT</code> from 2 s to 2.15 s, added here as <code>pwFault</code> with the same data, and the line from <code>LOAD</code> to <code>SHUNT</code> (<code>pwLine1</code>)
opened at 6 s and closed again at 8 s.</p>
<h4>Why this test exists</h4>
<p>It is the library twin of the unit test <code>ut_bus_pv</code> of PSAT-2-Modelica, a private developer
tool of the OpenIPSL development team, which is verified against PSAT 2.1.11: the same network, operating point and
disturbances, so its trajectories can be compared with PSAT's directly. The model has no states: with an infinite bus
at <code>GEN2</code> and the PV bus at <code>GEN1</code> every variable is algebraic, as in PSAT. Added by
OpenIPSL/OpenIPSL#472.</p>
<h4>What to plot</h4>
<ul>
<li><code>GEN1.v</code>: 1 pu throughout, the fault included.</li>
<li><code>pvBus.P</code>: 0.4 pu throughout.</li>
<li><code>pvBus.Q</code>: 0.054 pu before the fault; it follows the network through the fault and the
line opening.</li>
</ul>
</html>"));
end PVBus_SMIBPSAT;
