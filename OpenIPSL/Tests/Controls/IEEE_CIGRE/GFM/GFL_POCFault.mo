within OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM;
model GFL_POCFault "Converter through the wye-delta transformer to the 230 kV grid: three-phase fault at the point of connection at 3 s"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR gFM_GFL_IBR annotation (Placement(transformation(rotation=0,
          extent={{-86,-20},{-46,20}})));
  Modelica.Blocks.Sources.Constant Qref(k=0.07)
    annotation (Placement(transformation(extent={{-132,-6},{-120,6}})));
  Modelica.Blocks.Sources.Constant Vref(k=1)
    annotation (Placement(transformation(extent={{-132,-26},{-120,-14}})));
  Modelica.Blocks.Sources.Step Pref(
    height=0.2,
    offset=0.5,
    startTime=2.000005)
    annotation (Placement(transformation(extent={{-132,14},{-120,26}})));
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.EMTPGrid
           eMTPGrid(Vbase=230000)
    annotation (Placement(transformation(extent={{88,-20},{128,20}})));
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.SmoothShortFault
             smoothShortFault(
    R=5,
    faultTime=3.000005,
    f_cut=1e3)
    annotation (Placement(transformation(extent={{70,-28},{30,20}})));
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.EMTPTransformerZeroSeq transformer(f_cut=500, Rtf_delta=0.3)
    annotation (Placement(transformation(extent={{20,-20},{-36,20}})));
equation

  connect(Qref.y,gFM_GFL_IBR. Q_ref_pu)
    annotation (Line(points={{-119.4,0},{-86,0}},color={0,0,127}));
  connect(Vref.y,gFM_GFL_IBR. V_ref_pu)
    annotation (Line(points={{-119.4,-20},{-100,-20},{-100,-12},{-86,-12}},
                                                     color={0,0,127}));
  connect(Pref.y,gFM_GFL_IBR. P_ref_pu)
    annotation (Line(points={{-119.4,20},{-100,20},{-100,12},{-86,12}},
                                                   color={0,0,127}));
  connect(smoothShortFault.C, eMTPGrid.C)
    annotation (Line(points={{70,12},{88,12}}, color={0,0,255}));
  connect(smoothShortFault.B, eMTPGrid.B)
    annotation (Line(points={{70,0},{88,0}}, color={0,0,255}));
  connect(smoothShortFault.A, eMTPGrid.A)
    annotation (Line(points={{70,-12},{88,-12}}, color={0,0,255}));
  connect(transformer.Cy, smoothShortFault.C_n)
    annotation (Line(points={{19.6,12},{30,12}}, color={0,0,255}));
  connect(transformer.By, smoothShortFault.B_n)
    annotation (Line(points={{20,0},{30,0}}, color={0,0,255}));
  connect(transformer.Ay, smoothShortFault.A_n)
    annotation (Line(points={{20,-12},{30,-12}}, color={0,0,255}));
  connect(gFM_GFL_IBR.C, transformer.Cd)
    annotation (Line(points={{-46,12},{-36,12}}, color={0,0,255}));
  connect(gFM_GFL_IBR.B, transformer.Bd)
    annotation (Line(points={{-46,0},{-36,0}}, color={0,0,255}));
  connect(gFM_GFL_IBR.A, transformer.Ad)
    annotation (Line(points={{-46,-12},{-36,-12}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
The converter <code>gFM_GFL_IBR</code> (6.5 kV) is connected to the delta side of
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.EMTPTransformerZeroSeq\">EMTPTransformerZeroSeq</a>
(230 kV/6.5 kV, 100 MVA, <code>f_cut = 500</code> Hz, <code>Rtf_delta = 0.3</code> Ohm); the point of connection on the
230 kV side carries a
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.SmoothShortFault\">SmoothShortFault</a>
and the 230 kV <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.EMTPGrid\">EMTPGrid</a>.
</p>
<ul>
<li>Events: the active power reference steps from 0.5 to 0.7 pu at 2.000005 s; a three-phase-to-ground fault through 5
Ohm at the point of connection is applied at 3.000005 s and cleared from 3.100005 s at the current zeros. Reactive
power reference 0.07 pu, voltage reference 1 pu.</li>
<li>Plot <code>gFM_GFL_IBR.grid_sensor_a.voltage</code>, <code>.grid_sensor_b.voltage</code>,
<code>.grid_sensor_c.voltage</code> (V) and the matching <code>.current</code> signals (A) at the converter terminal,
<code>gFM_GFL_IBR.out[11]</code> (P, MW) and <code>gFM_GFL_IBR.out[12]</code> (Q, Mvar).</li>
<li>Look at 2.98-3.3 s for the waveforms. This is the three-phase fault response that the CIGRE Paris 2026 paper
C4-10724 by Chang and Vanfretti compares with EMTP, shown again in their 2026 American Modelica Conference abstract.</li>
</ul>
<p>
Ported from <code>GFM.GFM_EMTPFull_Mod_TF_Test</code> of <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a> (the unused modifier
<code>line_capacitance</code> is gone); StopTime 4 s as in <code>plot_GFM_EMTPFull_Mod_TF_Test.mos</code>.
</p>
<p>
The event instants are the round times of the pull request and the paper (2 s, 3 s, 3.1 s) shifted by half a DLL
sample, 5e-6 s, with the 0.1 s fault command kept; the phases still open at their own current zeros after the command
ends. On a 1e-5 s sample instant of the DLL a disturbance and the DLL step are simultaneous events that the tools
order differently: the verification of 2026-10-25 measured that Dymola and System Modeler step the DLL after the
disturbance and OpenModelica just before it, so that OpenModelica's DLL saw the change one sample later (in GFL_Fault
0.015 MW in P after the dip at 5 s). Half a sample off the grid the order is unique; with the disturbances of
GFL_Fault moved this way, Dymola and OpenModelica agreed to 1e-4 MW in P.
</p>
<h4>How to run</h4>
<ul>
<li>Dymola: simulate as is; the experiment annotation selects fixed-step Euler with a 1e-5 s step.</li>
<li>OpenModelica: the annotation <code>__OpenModelica_simulationFlags(s=&quot;euler&quot;)</code> selects Euler, whose
step equals the output interval, so simulate with <code>method=&quot;euler&quot;</code> and
<code>numberOfIntervals = StopTime/1e-5</code> (here 400000).</li>
<li>System Modeler: choose the Euler method with a step size of 1e-5 s in the simulation settings; the library must be
trusted to evaluate external functions.</li>
</ul>
<p>
The shared library <code>GFM_GFL_IBR</code> must exist for the platform in <code>OpenIPSL/Resources/Library</code>;
see the <a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.README\">README</a> of this test package for the build and the tool details.
</p>
</html>"),
    experiment(
      StopTime=4,
      Interval=0.0001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Euler",
      __Dymola_fixedstepsize=1e-05),
    __OpenModelica_simulationFlags(s="euler"));
end GFL_POCFault;
