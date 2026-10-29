within OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM;
model GFM_EMTPFault "Converter on the 6.5 kV Thevenin grid: active power step at 2 s, three-phase fault at 5 s"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.EMTPGrid
           eMTPGrid
    annotation (Placement(transformation(extent={{60,-20},{100,20}})));
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.ShortFault
             shortFault(faultTime=5.000005)
    annotation (Placement(transformation(extent={{0,-28},{40,20}})));
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR gFM_GFL_IBR annotation (Placement(transformation(rotation=0,
          extent={{-56,-20},{-16,20}})));
  Modelica.Blocks.Sources.Constant Qref(k=0)
    annotation (Placement(transformation(extent={{-100,-6},{-88,6}})));
  Modelica.Blocks.Sources.Constant Vref(k=1)
    annotation (Placement(transformation(extent={{-82,-18},{-70,-6}})));
  Modelica.Blocks.Sources.Step Pref(
    height=0.2,
    offset=0.5,
    startTime=2.000005)
    annotation (Placement(transformation(extent={{-82,6},{-70,18}})));
equation

  connect(shortFault.C_n,eMTPGrid. C)
    annotation (Line(points={{40,12},{60,12}}, color={0,0,255}));
  connect(shortFault.B_n,eMTPGrid. B)
    annotation (Line(points={{40,0},{60,0}}, color={0,0,255}));
  connect(shortFault.A_n,eMTPGrid. A)
    annotation (Line(points={{40,-12},{60,-12}}, color={0,0,255}));
  connect(Qref.y,gFM_GFL_IBR. Q_ref_pu)
    annotation (Line(points={{-87.4,0},{-56,0}}, color={0,0,127}));
  connect(Vref.y,gFM_GFL_IBR. V_ref_pu)
    annotation (Line(points={{-69.4,-12},{-56,-12}}, color={0,0,127}));
  connect(Pref.y,gFM_GFL_IBR. P_ref_pu)
    annotation (Line(points={{-69.4,12},{-56,12}}, color={0,0,127}));
  connect(gFM_GFL_IBR.A, shortFault.A)
    annotation (Line(points={{-16,-12},{0,-12}}, color={0,0,255}));
  connect(gFM_GFL_IBR.B, shortFault.B)
    annotation (Line(points={{-16,0},{0,0}}, color={0,0,255}));
  connect(gFM_GFL_IBR.C, shortFault.C)
    annotation (Line(points={{-16,12},{0,12}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
The converter <code>gFM_GFL_IBR</code> feeds the 6.5 kV Thevenin grid
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.EMTPGrid\">EMTPGrid</a> through a
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.ShortFault\">ShortFault</a> at its
terminals (no transformer).
</p>
<ul>
<li>Events: the active power reference steps from 0.5 to 0.7 pu at 2.000005 s; a three-phase-to-ground fault through 5
Ohm is applied at 5.000005 s and cleared from 5.100005 s at the current zeros (ideal switches). Reactive power
reference 0, voltage reference 1 pu.</li>
<li>Plot <code>gFM_GFL_IBR.grid_sensor_a.voltage</code>, <code>.grid_sensor_b.voltage</code>,
<code>.grid_sensor_c.voltage</code> (V) and the matching <code>.current</code> signals (A) at the converter terminal,
<code>gFM_GFL_IBR.out[11]</code> (P, MW) and <code>gFM_GFL_IBR.out[12]</code> (Q, Mvar).</li>
<li>Look at 4.98-5.25 s for the waveforms and 4.95-5.7 s for P and Q. No figure of the papers uses this case.</li>
</ul>
<p>
Ported from <code>GFM.GFM_EMTPFault_Test</code> of <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a> (the unused modifier
<code>line_capacitance</code> is gone); StopTime 5.9 s as in <code>plot_GFM_EMTPFault_Test.mos</code>.
</p>
<p>
The event instants are the round times of the pull request (2 s, 5 s, 5.1 s) shifted by half a DLL sample, 5e-6 s,
with the 0.1 s fault command kept; the phases still open at their own current zeros after the command ends. On a 1e-5
s sample instant of the DLL a disturbance and the DLL step are simultaneous events that the tools order differently:
the verification of 2026-10-25 measured that Dymola and System Modeler step the DLL after the disturbance and
OpenModelica just before it, so that OpenModelica's DLL saw the change one sample later (in GFL_Fault 0.015 MW in P
after the dip at 5 s). Half a sample off the grid the order is unique; with the disturbances of GFL_Fault moved this
way, Dymola and OpenModelica agreed to 1e-4 MW in P.
</p>
<h4>How to run</h4>
<ul>
<li>Dymola: simulate as is; the experiment annotation selects fixed-step Euler with a 1e-5 s step.</li>
<li>OpenModelica: the annotation <code>__OpenModelica_simulationFlags(s=&quot;euler&quot;)</code> selects Euler, whose
step equals the output interval, so simulate with <code>method=&quot;euler&quot;</code> and
<code>numberOfIntervals = StopTime/1e-5</code> (here 590000).</li>
<li>System Modeler: choose the Euler method with a step size of 1e-5 s in the simulation settings; the library must be
trusted to evaluate external functions.</li>
</ul>
<p>
The shared library <code>GFM_GFL_IBR</code> must exist for the platform in <code>OpenIPSL/Resources/Library</code>;
see the <a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.README\">README</a> of this test package for the build and the tool details.
</p>
</html>"),
    experiment(
      StopTime=5.9,
      Interval=0.0001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Euler",
      __Dymola_fixedstepsize=1e-05),
    __OpenModelica_simulationFlags(s="euler"));
end GFM_EMTPFault;
