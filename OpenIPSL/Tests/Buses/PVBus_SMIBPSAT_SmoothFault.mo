within OpenIPSL.Tests.Buses;
model PVBus_SMIBPSAT_SmoothFault
  "PVBus_SMIBPSAT with its fault cleared by PwFaultSmooth instead of PwFault"
  extends OpenIPSL.Tests.Buses.Base.SMIBPSATNoFault(pwLine1(t1=6, t2=8));
  OpenIPSL.Electrical.Buses.PVBus pvBus(
    v_0=1,
    angle_0=0.070620799598685,
    P_0=40000000,
    Q_0=5416582.0366201,
    displayPF=true) "PSAT's PV generator at GEN1, without machine data"
    annotation (Placement(transformation(extent={{-72,-10},{-52,10}})));
  OpenIPSL.Electrical.Events.PwFaultSmooth pwFaultSmooth(
    R=0,
    X=0.001,
    t1=2,
    t2=2.15) "The fault of SMIBPSAT at bus FAULT, cleared with time constant Tc"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={40,-60})));
equation
  connect(pvBus.p, GEN1.p)
    annotation (Line(points={{-52,0},{-30,0}}, color={0,0,255}));
  connect(pwFaultSmooth.p, pwLine4.p)
    annotation (Line(points={{40,-48.3333},{40,-30},{54.6,-30}}, color={0,0,255}));
  annotation (experiment(
      StopTime=10,
      __Dymola_NumberOfIntervals=5000,
      Tolerance=1e-12,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p><a href=\"modelica://OpenIPSL.Tests.Buses.PVBus_SMIBPSAT\">PVBus_SMIBPSAT</a> with the fault at bus
<code>FAULT</code> (2 s to 2.15 s, <code>X = 0.001</code> pu) applied by
<a href=\"modelica://OpenIPSL.Electrical.Events.PwFaultSmooth\">Electrical.Events.PwFaultSmooth</a>
instead of <code>PwFault</code>: from 2.15 s its admittance decays with the time constant <code>Tc</code>
(0.1 ms) instead of dropping to zero. Both tests extend
<a href=\"modelica://OpenIPSL.Tests.Buses.Base.SMIBPSATNoFault\">Base.SMIBPSATNoFault</a>, the network of
<code>SMIBPSAT</code> without its fault, so this one has no <code>PwFault</code> at all. The line from
<code>LOAD</code> to <code>SHUNT</code> is opened at 6 s and closed at 8 s, as in
<code>PVBus_SMIBPSAT</code>.</p>
<h4>Why this test exists</h4>
<p>It shows that the smooth clearing gives the response of the abrupt one where both return to the same
operating point after the clearing, as here: the trajectories are those of PSAT's run of the unit test
<code>ut_bus_pv</code>, cleared abruptly, except within a few <code>Tc</code> after 2.15 s. This network has
another solution after the clearing as well (with <code>GEN1</code> at an angle of about 3.0 rad), which the
runs with the start values given here do not reach. Where the network after the clearing has many solutions
(PV buses and a STATCOM around an infinite bus, as in PSAT's <code>d_014_statcom</code> with a fault added at
bus 14), the abrupt clearing leaves Dymola and System Modeler at a solution with bus 14 at 0 pu, and OpenModelica
stops at the clearing; in those cases this clearing reached PSAT's solution in the three tools. OpenModelica ran
those cases with <code>--tearingMethod=minimalTearing</code>; with its default tearing they stop at initialization.
This test needs no such option. Added by
OpenIPSL/OpenIPSL#472.</p>
<h4>What to plot</h4>
<ul>
<li><code>pwFaultSmooth.k</code>: 0 before 2 s, 1 in the fault, back to 0 within about 2 ms after 2.15 s. To see
the decay, store the results at an output interval of 0.1 ms or finer, or at every solver step: at the default
output interval a value interpolated between two stored points (0.60 at 2.152 s in System Modeler, where
<code>k</code> is 2e-9) or no point at all falls inside those 2 ms.</li>
<li><code>FAULT.v</code> and <code>GEN1.v</code>: the same as in <code>PVBus_SMIBPSAT</code>, except in the
first milliseconds after 2.15 s, where <code>FAULT.v</code> rises continuously instead of jumping.</li>
<li><code>pvBus.Q</code>: 0.054 pu before the fault and 2.53 pu in it, as in <code>PVBus_SMIBPSAT</code>.</li>
</ul>
</html>"));
end PVBus_SMIBPSAT_SmoothFault;
