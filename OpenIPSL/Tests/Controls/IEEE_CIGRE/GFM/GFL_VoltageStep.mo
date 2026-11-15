within OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM;
model GFL_VoltageStep "Converter through the wye-delta transformer to a 230 kV source whose voltage steps to 0.95 pu at 2 s"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR gFM_GFL_IBR annotation (Placement(transformation(rotation=0,
          extent={{-86,-20},{-46,20}})));
  Modelica.Blocks.Sources.Constant Qref(k=0.03)
    annotation (Placement(transformation(extent={{-124,-6},{-112,6}})));
  Modelica.Blocks.Sources.Constant Vref(k=1)
    annotation (Placement(transformation(extent={{-124,-26},{-112,-14}})));
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.EMTPTransformerZeroSeq transformer(f_cut=500, Rtf_delta=0.3)
    annotation (Placement(transformation(extent={{20,-20},{-36,20}})));
  Modelica.Blocks.Sources.Constant Pref(k=0.5)
    annotation (Placement(transformation(extent={{-124,12},{-112,24}})));
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.GridWithFault
    gridWithFault(
    Vbase=230000,
    FaultVoltage=0.95,
    FaultTime=2.000005,
    FaultDuration=10)
    annotation (Placement(transformation(extent={{48,-20},{88,20}})));
equation

  connect(Qref.y,gFM_GFL_IBR. Q_ref_pu)
    annotation (Line(points={{-111.4,0},{-86,0}},color={0,0,127}));
  connect(Vref.y,gFM_GFL_IBR. V_ref_pu)
    annotation (Line(points={{-111.4,-20},{-88,-20},{-88,-12},{-86,-12}},
                                                     color={0,0,127}));
  connect(gFM_GFL_IBR.C, transformer.Cd)
    annotation (Line(points={{-46,12},{-36,12}}, color={0,0,255}));
  connect(gFM_GFL_IBR.B, transformer.Bd)
    annotation (Line(points={{-46,0},{-36,0}}, color={0,0,255}));
  connect(gFM_GFL_IBR.A, transformer.Ad)
    annotation (Line(points={{-46,-12},{-36,-12}}, color={0,0,255}));
  connect(Pref.y, gFM_GFL_IBR.P_ref_pu) annotation (Line(points={{-111.4,
          18},{-96,18},{-96,12},{-86,12}}, color={0,0,127}));
  connect(transformer.Cy, gridWithFault.C)
    annotation (Line(points={{19.6,12},{48,12}}, color={0,0,255}));
  connect(transformer.By, gridWithFault.B)
    annotation (Line(points={{20,0},{48,0}}, color={0,0,255}));
  connect(transformer.Ay, gridWithFault.A)
    annotation (Line(points={{20,-12},{48,-12}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
The converter <code>gFM_GFL_IBR</code> (6.5 kV) feeds, through
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.EMTPTransformerZeroSeq\">EMTPTransformerZeroSeq</a>,
an ideal 230 kV source
(<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.GridWithFault\">GridWithFault</a>).
</p>
<ul>
<li>Events: the source voltage steps to 0.95 pu at 2.000005 s and stays there (the 10 s dip outlasts the run). Active
power reference 0.5 pu (constant <code>Pref</code>, called <code>Vref1</code> in the pull request), reactive power
reference 0.03 pu, voltage reference 1 pu.</li>
<li>Plot <code>gFM_GFL_IBR.grid_sensor_a.voltage</code>, <code>.grid_sensor_b.voltage</code>,
<code>.grid_sensor_c.voltage</code> (V) and the matching <code>.current</code> signals (A) at the converter terminal,
<code>gFM_GFL_IBR.out[11]</code> (P, MW) and <code>gFM_GFL_IBR.out[12]</code> (Q, Mvar).</li>
<li>Look at 1.98-2.3 s for the waveforms and a wider window for P and Q. This is the point-of-connection voltage step
case of the 2026 studies of Chang and Vanfretti.</li>
</ul>
<p>
Ported from <code>GFM.DYMOLA_GFL_Vstep</code> of <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a>; StopTime 3 s as in
<code>plot_DYMOLA_GFL_Vstep.mos</code>. The pull request's <code>GFM_EMTPFullPSCAD</code> was not ported: despite its
name it used the default parameters, not the PSCAD set, and combined a fault at 5 s with a permanent 0.95 pu step at
6 s, which this test and
<a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.GFL_POCFault\">GFL_POCFault</a> cover separately.
</p>
<p>
The voltage step is the round time of the pull request (2 s) shifted by half a DLL sample, 5e-6 s. On a 1e-5 s sample
instant of the DLL a disturbance and the DLL step are simultaneous events that the tools order differently: the
verification of 2026-10-25 measured that Dymola and System Modeler step the DLL after the disturbance and OpenModelica
just before it, so that OpenModelica's DLL saw the change one sample later (in GFL_Fault 0.015 MW in P after the dip
at 5 s). Half a sample off the grid the order is unique; with the disturbances of GFL_Fault moved this way, Dymola and
OpenModelica agreed to 1e-4 MW in P.
</p>
<h4>How to run</h4>
<ul>
<li>Dymola: simulate as is; the experiment annotation selects fixed-step Euler with a 1e-5 s step.</li>
<li>OpenModelica: the annotation <code>__OpenModelica_simulationFlags(s=&quot;euler&quot;)</code> selects Euler, whose
step equals the output interval, so simulate with <code>method=&quot;euler&quot;</code> and
<code>numberOfIntervals = StopTime/1e-5</code> (here 300000).</li>
<li>System Modeler: choose the Euler method with a step size of 1e-5 s in the simulation settings; the library must be
trusted to evaluate external functions.</li>
</ul>
<p>
The shared library <code>GFM_GFL_IBR</code> must exist for the platform in <code>OpenIPSL/Resources/Library</code>;
see the <a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.README\">README</a> of this test package for the build and the tool details.
</p>
</html>"),
    experiment(
      StopTime=3,
      Interval=0.0001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Euler",
      __Dymola_fixedstepsize=1e-05),
    __OpenModelica_simulationFlags(s="euler"));
end GFL_VoltageStep;
