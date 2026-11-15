within OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM;
model GFL_Fault "Converter on an ideal 6.5 kV source: active power step at 2 s, 0.8 pu voltage dip at 5 s"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant Qref(k=0)
    annotation (Placement(transformation(extent={{-92,-6},{-80,6}})));
  Modelica.Blocks.Sources.Constant Vref(k=1)
    annotation (Placement(transformation(extent={{-94,-46},{-82,-34}})));
  Modelica.Blocks.Sources.Step Pref(
    height=0.2,
    offset=0.5,
    startTime=2.000005)
    annotation (Placement(transformation(extent={{-92,34},{-80,46}})));
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.GridWithFault gridWithFault(
      FaultVoltage=0.8,
      FaultTime=5.000005) annotation (Placement(
        transformation(rotation=0, extent={{32,-28},{90,30}})));
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR gFM_GFL_IBR
    annotation (Placement(transformation(extent={{-42,-24},{8,26}})));
equation

  connect(gFM_GFL_IBR.C, gridWithFault.C) annotation (Line(points={{8,16},{
          24,16},{24,18.4},{32,18.4}}, color={0,0,255}));
  connect(gFM_GFL_IBR.B, gridWithFault.B)
    annotation (Line(points={{8,1},{32,1}}, color={0,0,255}));
  connect(gFM_GFL_IBR.A, gridWithFault.A) annotation (Line(points={{8,-14},
          {24,-14},{24,-16.4},{32,-16.4}}, color={0,0,255}));
  connect(Pref.y, gFM_GFL_IBR.P_ref_pu) annotation (Line(points={{-79.4,40},
          {-52,40},{-52,16},{-42,16}}, color={0,0,127}));
  connect(Qref.y, gFM_GFL_IBR.Q_ref_pu) annotation (Line(points={{-79.4,0},
          {-50,0},{-50,1},{-42,1}}, color={0,0,127}));
  connect(Vref.y, gFM_GFL_IBR.V_ref_pu) annotation (Line(points={{-81.4,-40},
          {-52,-40},{-52,-14},{-42,-14}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
The converter <code>gFM_GFL_IBR</code> (default parameters, 6.5 kV, 10 MVA) feeds an ideal three-phase source
(<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.GridWithFault\">GridWithFault</a>,
6.5 kV) directly at its terminals. This is the smallest test of the DLL with a disturbance.
</p>
<ul>
<li>Events: the active power reference steps from 0.5 to 0.7 pu at 2.000005 s; the source voltage dips to 0.8 pu at
5.000005 s and recovers at 5.100005 s. Reactive power reference 0, voltage reference 1 pu.</li>
<li>Plot <code>gFM_GFL_IBR.grid_sensor_a.voltage</code>, <code>.grid_sensor_b.voltage</code>,
<code>.grid_sensor_c.voltage</code> (V) and the matching <code>.current</code> signals (A) at the converter terminal,
<code>gFM_GFL_IBR.out[11]</code> (P, MW) and <code>gFM_GFL_IBR.out[12]</code> (Q, Mvar).</li>
<li>Look at 4.98-5.2 s for the waveforms and 4.95-5.6 s for P and Q (the windows of the pull request's plot script).
No figure of the papers uses this case.</li>
</ul>
<p>
Ported from <code>GFM.GFM_Test</code> of <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a>; StopTime 5.8 s as in its plot script
<code>plot_GFM_Test.mos</code> (the model annotation said 10 s).
</p>
<p>
The event instants are the round times of the pull request (2 s, 5 s, 5.1 s) shifted by half a DLL sample, 5e-6 s,
with the 0.1 s dip duration kept. On a 1e-5 s sample instant of the DLL a disturbance and the DLL step are
simultaneous events that the tools order differently: the verification of 2026-10-25 measured that Dymola and System
Modeler step the DLL after the disturbance and OpenModelica just before it, so that OpenModelica's DLL saw the change
one sample later (0.015 MW in P after the dip at 5 s in this test). Half a sample off the grid the order is unique;
with the disturbances of GFL_Fault moved this way, Dymola and OpenModelica agreed to 1e-4 MW in P.
</p>
<h4>How to run</h4>
<ul>
<li>Dymola: simulate as is; the experiment annotation selects fixed-step Euler with a 1e-5 s step.</li>
<li>OpenModelica: the annotation <code>__OpenModelica_simulationFlags(s=&quot;euler&quot;)</code> selects Euler, whose
step equals the output interval, so simulate with <code>method=&quot;euler&quot;</code> and
<code>numberOfIntervals = StopTime/1e-5</code> (here 580000).</li>
<li>System Modeler: choose the Euler method with a step size of 1e-5 s in the simulation settings; the library must be
trusted to evaluate external functions.</li>
</ul>
<p>
The shared library <code>GFM_GFL_IBR</code> must exist for the platform in <code>OpenIPSL/Resources/Library</code>;
see the <a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.README\">README</a> of this test package for the build and the tool details.
</p>
</html>"),
    experiment(
      StopTime=5.8,
      Interval=0.0001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Euler",
      __Dymola_fixedstepsize=1e-05),
    __OpenModelica_simulationFlags(s="euler"));
end GFL_Fault;
