within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM;
model GFM_GFL_IBR "Three-phase EMT inverter driven by the EPRI GFM-GFL-IBR-PWM real-code controller (IEEE/CIGRE DLL)"
  parameter Modelica.Units.SI.Capacitance c_filter=6.2783e-5 "Filter capacitance of each phase";
  parameter Modelica.Units.SI.Resistance r_damp=40.08173 "Damping resistance of each phase, in parallel with the filter capacitance";
  parameter Modelica.Units.SI.Inductance l_filter=8.965728461e-4 "Filter inductance of each phase";
  parameter Modelica.Units.SI.Resistance r_l=0.021125 "Series resistance of each filter inductance";
  parameter Records.ParameterSet dllParameters "Parameters handed to the DLL, in its ParametersInfo order"
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-60,74},{-40,94}})));
  parameter OpenIPSL.Types.ActivePower P_0=0 "Active power output at time zero; seeds the power states of the DLL model" annotation (Dialog(group="Initialization"));
  parameter OpenIPSL.Types.ReactivePower Q_0=0 "Reactive power output at time zero; seeds the power states of the DLL model" annotation (Dialog(group="Initialization"));
  final parameter Modelica.Units.SI.Time Ts=Functions.sampleTime() "Base sample time of the DLL (FixedStepBaseSampleTime), read from the library";
  final parameter Real dllParameterVector[41]={dllParameters.Vbase/1e3,dllParameters.Sbase/1e6,dllParameters.Vdcbase/1e3,
    dllParameters.KpI,dllParameters.KiI,dllParameters.Wtype,dllParameters.KpPLL,dllParameters.KiPLL,dllParameters.del_f_limit,
    dllParameters.KpP,dllParameters.KiP,dllParameters.Qflag,dllParameters.KpQ,dllParameters.KiQ,dllParameters.KpV,
    dllParameters.KiV,dllParameters.KpVq,dllParameters.KiVq,dllParameters.Imax,dllParameters.Pmax,dllParameters.Pmin,
    dllParameters.Qmax,dllParameters.Qmin,dllParameters.PQflag,dllParameters.KfDroop,dllParameters.KvDroop,
    dllParameters.K_POD,dllParameters.T_POD,dllParameters.T1_POD,dllParameters.T2_POD,dllParameters.POD_min,
    dllParameters.POD_max,dllParameters.Vdip,dllParameters.Vup,dllParameters.KpVdq,dllParameters.KiVdq,dllParameters.Tr,
    dllParameters.Rchoke,dllParameters.Lchoke,dllParameters.Cfilt,dllParameters.Rdamp} "The 41 DLL parameters in ParametersInfo order and DLL units (kV, MVA)";
  final parameter Real initialInputs[12]={0,0,0,0,0,0,0,0,0,P_0/1e6,Q_0/1e6,1} "DLL inputs at time zero: Va, Vb, Vc (kV), Ia, Ib, Ic, IaL1, IbL1, IcL1 (kA), Pref (MW), Qref (Mvar), Vref (pu)";
  final parameter Real initialOutputs[12]={0,0,0,0,0,0,0,0,0,0,P_0/1e6,Q_0/1e6} "DLL outputs at time zero: Ea, Eb, Ec (kV), Idref, Id, Iqref, Iq, Vd, Vq (pu), Freq_pll (Hz), Pout (MW), Qout (Mvar)";
  Instance dll=Instance(dllParameterVector, initialInputs, initialOutputs, 1) "DLL instance (SimTool_EMT_RMS_Mode = 1, EMT)";
  discrete Real out[12](start=initialOutputs, each fixed=true) "DLL outputs held between samples: Ea, Eb, Ec (kV), Idref, Id, Iqref, Iq, Vd, Vq (pu), Freq_pll (Hz), Pout (MW), Qout (Mvar)";
  Integer status(start=0, fixed=true) "Return code of the last DLL step: 0 ok, 1 message, 2 error, -1 no instance, -2 size mismatch";

  Modelica.Electrical.Analog.Basic.Resistor resistor(R=r_l) "Filter resistance, phase C"
    annotation (Placement(transformation(extent={{-30,4},{-18,16}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor(i(start=0, fixed=true), L=
        l_filter) "Filter inductance, phase C" annotation (Placement(transformation(extent={{-10,4},{2,16}})));
  Modelica.Electrical.Analog.Basic.Capacitor c_b(v(start=0, fixed=false), C=
        c_filter) "Filter capacitance, phase B" annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={20,-26})));
  Modelica.Electrical.Analog.Basic.Resistor r_b(R=r_damp) "Damping resistance, phase B" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={52,-26})));
  Modelica.Electrical.Analog.Basic.Capacitor c_c(v(start=0, fixed=false), C=
        c_filter) "Filter capacitance, phase C" annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={30,-26})));
  Modelica.Electrical.Analog.Basic.Resistor r_c(R=r_damp) "Damping resistance, phase C" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={62,-26})));
  Modelica.Electrical.Analog.Basic.Capacitor c_a(v(start=0, fixed=false), C=
        c_filter) "Filter capacitance, phase A" annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={10,-26})));
  Modelica.Electrical.Analog.Basic.Resistor r_a(R=r_damp) "Damping resistance, phase A" annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={42,-26})));
  Modelica.Electrical.Analog.Basic.Resistor resistor4(R=r_l) "Filter resistance, phase B"
    annotation (Placement(transformation(extent={{-26,-6},{-14,6}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor1(i(start=0, fixed=true), L
      =l_filter) "Filter inductance, phase B" annotation (Placement(transformation(extent={{-6,-6},{6,6}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor5(R=r_l) "Filter resistance, phase A"
    annotation (Placement(transformation(extent={{-24,-16},{-12,-4}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor2(i(start=0, fixed=true), L
      =l_filter) "Filter inductance, phase A"
    annotation (Placement(transformation(extent={{-2,-16},{10,-4}})));
  Components.VoltageCurrentSensor bridge_sensor_c "Bridge-side current and voltage, phase C"
    annotation (Placement(transformation(extent={{-42,8},{-38,12}})));
  Components.VoltageCurrentSensor bridge_sensor_b "Bridge-side current and voltage, phase B"
    annotation (Placement(transformation(extent={{-42,-2},{-38,2}})));
  Components.VoltageCurrentSensor bridge_sensor_a "Bridge-side current and voltage, phase A"
    annotation (Placement(transformation(extent={{-42,-12},{-38,-8}})));
  Components.VoltageCurrentSensor grid_sensor_c "Terminal current and voltage, phase C"
    annotation (Placement(transformation(extent={{68,8},{78,12}})));
  Components.VoltageCurrentSensor grid_sensor_b "Terminal current and voltage, phase B"
    annotation (Placement(transformation(extent={{68,-2},{78,2}})));
  Components.VoltageCurrentSensor grid_sensor_a "Terminal current and voltage, phase A"
    annotation (Placement(transformation(extent={{68,-12},{78,-8}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage phase_c "Bridge voltage, phase C" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-78,-22})));
  Modelica.Electrical.Analog.Sources.SignalVoltage phase_b "Bridge voltage, phase B" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-66,-22})));
  Modelica.Electrical.Analog.Sources.SignalVoltage phase_a "Bridge voltage, phase A" annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-54,-22})));
  Modelica.Electrical.Analog.Basic.Ground ground2 "Neutral of the bridge voltages"
    annotation (Placement(transformation(extent={{-72,-56},{-60,-44}})));
  Modelica.Electrical.Analog.Basic.Ground ground1 "Neutral of the filter capacitances"
    annotation (Placement(transformation(extent={{30,-62},{42,-50}})));

  Modelica.Electrical.Analog.Interfaces.NegativePin A "Phase A terminal" annotation (Placement(
        transformation(rotation=0, extent={{90,-70},{110,-50}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin B "Phase B terminal" annotation (Placement(
        transformation(rotation=0, extent={{90,-10},{110,10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin C "Phase C terminal" annotation (Placement(
        transformation(rotation=0, extent={{90,50},{110,70}})));
  Modelica.Blocks.Interfaces.RealInput P_ref_pu "Active power reference (pu on dllParameters.Sbase)"
    annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
  Modelica.Blocks.Interfaces.RealInput Q_ref_pu "Reactive power reference (pu on dllParameters.Sbase)"
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  Modelica.Blocks.Interfaces.RealInput V_ref_pu "Voltage magnitude reference (pu)"
    annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
  Modelica.Blocks.Math.Gain p_ref_mw(k=dllParameters.Sbase/1e6) "Active power reference in MW"
    annotation (Placement(transformation(extent={{-68,54},{-56,66}})));
  Modelica.Blocks.Math.Gain q_ref_mw(k=dllParameters.Sbase/1e6) "Reactive power reference in Mvar"
    annotation (Placement(transformation(extent={{-68,34},{-56,46}})));
initial algorithm
  assert(Ts > 0, "GFM_GFL_IBR: the shared library GFM_GFL_IBR returned a non-positive base sample time.");
  assert(Functions.count(0) == 12 and Functions.count(1) == 12 and Functions.count(2) == 41,
    "GFM_GFL_IBR: the shared library GFM_GFL_IBR does not have 12 inputs, 12 outputs and 41 parameters; it was built from another model version.");
equation
  when sample(0, Ts) then
    (out, status) = Functions.step(
      dll,
      time,
      {grid_sensor_a.voltage/1e3,grid_sensor_b.voltage/1e3,grid_sensor_c.voltage/1e3,
       grid_sensor_a.current/1e3,grid_sensor_b.current/1e3,grid_sensor_c.current/1e3,
       bridge_sensor_a.current/1e3,bridge_sensor_b.current/1e3,bridge_sensor_c.current/1e3,
       p_ref_mw.y,q_ref_mw.y,V_ref_pu},
      12);
  end when;
  assert(status == 0 or status == 1, "GFM_GFL_IBR: the DLL step returned status " + String(status)
    + " (2: error in the model, -1: no instance because the constructor failed, -2: signal size mismatch); the DLL wrote the reason to the standard error stream.");
  phase_a.v = out[1]*1e3;
  phase_b.v = out[2]*1e3;
  phase_c.v = out[3]*1e3;
  connect(resistor.n,inductor. p)
    annotation (Line(points={{-18,10},{-10,10}},
                                              color={0,0,255}));
  connect(resistor4.n,inductor1. p)
    annotation (Line(points={{-14,0},{-6,0}},
                                            color={0,0,255}));
  connect(resistor5.n,inductor2. p)
    annotation (Line(points={{-12,-10},{-2,-10}},
                                                color={0,0,255}));
  connect(c_a.p,inductor2. n)
    annotation (Line(points={{10,-20},{10,-10}}, color={0,0,255}));
  connect(resistor.p,bridge_sensor_c. n)
    annotation (Line(points={{-30,10},{-38,10}}, color={0,0,255}));
  connect(bridge_sensor_b.n,resistor4. p)
    annotation (Line(points={{-38,0},{-26,0}}, color={0,0,255}));
  connect(resistor5.p,bridge_sensor_a. n)
    annotation (Line(points={{-24,-10},{-38,-10}}, color={0,0,255}));
  connect(inductor.n,grid_sensor_c. p)
    annotation (Line(points={{2,10},{68,10}},  color={0,0,255}));
  connect(inductor1.n,grid_sensor_b. p)
    annotation (Line(points={{6,0},{68,0}},  color={0,0,255}));
  connect(inductor2.n,grid_sensor_a. p)
    annotation (Line(points={{10,-10},{68,-10}}, color={0,0,255}));
  connect(c_b.p,grid_sensor_b. p)
    annotation (Line(points={{20,-20},{20,0},{68,0}}, color={0,0,255}));
  connect(c_c.p,grid_sensor_c. p)
    annotation (Line(points={{30,-20},{30,10},{68,10}}, color={0,0,255}));
  connect(phase_b.n,ground2. p)
    annotation (Line(points={{-66,-28},{-66,-44}}, color={0,0,255}));
  connect(phase_c.n,ground2. p) annotation (Line(points={{-78,-28},{-78,-40},{-66,
          -40},{-66,-44}}, color={0,0,255}));
  connect(phase_a.n,ground2. p) annotation (Line(points={{-54,-28},{-54,-40},{-66,
          -40},{-66,-44}}, color={0,0,255}));
  connect(phase_a.p,bridge_sensor_a. p)
    annotation (Line(points={{-54,-16},{-54,-10},{-42,-10}}, color={0,0,255}));
  connect(phase_b.p,bridge_sensor_b. p)
    annotation (Line(points={{-66,-16},{-66,0},{-42,0}}, color={0,0,255}));
  connect(phase_c.p,bridge_sensor_c. p)
    annotation (Line(points={{-78,-16},{-78,10},{-42,10}}, color={0,0,255}));
  connect(r_c.p,grid_sensor_c. p)
    annotation (Line(points={{62,-20},{62,10},{68,10}}, color={0,0,255}));
  connect(r_b.p,grid_sensor_b. p)
    annotation (Line(points={{52,-20},{52,0},{68,0}}, color={0,0,255}));
  connect(r_a.p,grid_sensor_a. p)
    annotation (Line(points={{42,-20},{42,-10},{68,-10}}, color={0,0,255}));
  connect(c_a.n,r_c. n) annotation (Line(points={{10,-32},{10,-36},{62,-36},{62,
          -32}}, color={0,0,255}));
  connect(c_b.n,r_c. n) annotation (Line(points={{20,-32},{20,-36},{62,-36},{62,
          -32}}, color={0,0,255}));
  connect(c_c.n,r_c. n) annotation (Line(points={{30,-32},{30,-36},{62,-36},{62,
          -32}}, color={0,0,255}));
  connect(r_a.n,r_c. n) annotation (Line(points={{42,-32},{42,-36},{62,-36},{62,
          -32}}, color={0,0,255}));
  connect(r_b.n,r_c. n) annotation (Line(points={{52,-32},{52,-36},{62,-36},{62,
          -32}}, color={0,0,255}));
  connect(ground1.p,r_c. n) annotation (Line(points={{36,-50},{36,-36},{62,-36},
          {62,-32}}, color={0,0,255}));
  connect(A, grid_sensor_a.n)
    annotation (Line(points={{100,-60},{84,-60},{84,-10},{78,-10}},
                                                            color={0,0,255}));
  connect(B, grid_sensor_b.n)
    annotation (Line(points={{100,0},{78,0}}, color={0,0,255}));
  connect(C, grid_sensor_c.n) annotation (Line(points={{100,60},{84,60},{84,
          10},{78,10}}, color={0,0,255}));
  connect(P_ref_pu, p_ref_mw.u)
    annotation (Line(points={{-100,60},{-69.2,60}}, color={0,0,127}));
  connect(q_ref_mw.u, Q_ref_pu) annotation (Line(points={{-69.2,40},{-90,40},{-90,
          0},{-100,0}}, color={0,0,127}));
  annotation (Icon(graphics={
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
        Line(points={{-100,100},{100,-100}}, color={28,108,200}),
        Text(
          extent={{-30,92},{62,26}},
          textColor={28,108,200},
          textString="AC"),
        Text(
          extent={{-70,-8},{22,-74}},
          textColor={28,108,200},
          textString="DC"),
        Text(
          extent={{64,76},{92,46}},
          textColor={28,108,200},
          textString="C"),
        Text(
          extent={{64,14},{92,-16}},
          textColor={28,108,200},
          textString="B"),
        Text(
          extent={{64,-44},{92,-74}},
          textColor={28,108,200},
          textString="A")}),
    Documentation(info="<html>
<p>
Electromagnetic-transient (EMT) model of a three-phase inverter whose controller is the EPRI real-code model
<code>GFM-GFL-IBR-PWM-Model</code> (version 1.1.0.0, Deepak Ramasubramanian, EPRI), compiled into the shared library
<code>GFM_GFL_IBR</code> according to the IEEE/CIGRE DLL modelling standard. The bridge is an average-value model: three
controlled voltage sources (<code>phase_a</code>, <code>phase_b</code>, <code>phase_c</code>, grounded neutral) set to
the DLL outputs <code>Ea</code>, <code>Eb</code>, <code>Ec</code>. Each phase continues through a series R-L filter
(<code>r_l</code>, <code>l_filter</code>) and a shunt branch of the capacitance <code>c_filter</code> in parallel with
the damping resistance <code>r_damp</code> (grounded) to the terminals.
</p>
<h4>Ports</h4>
<ul>
<li><code>A</code>, <code>B</code>, <code>C</code>: phase terminals (instantaneous phase quantities, V and A).</li>
<li><code>P_ref_pu</code>, <code>Q_ref_pu</code>: power references in pu on <code>dllParameters.Sbase</code>;
the gains <code>p_ref_mw</code> and <code>q_ref_mw</code> convert them to MW and Mvar for the DLL.</li>
<li><code>V_ref_pu</code>: voltage magnitude reference in pu, passed unchanged.</li>
</ul>
<h4>Parameters</h4>
<ul>
<li><code>c_filter</code>, <code>r_damp</code>, <code>l_filter</code>, <code>r_l</code>: the electrical filter in SI
units. The defaults are those of the pull request's 6.5 kV, 10 MVA studies.</li>
<li><code>dllParameters</code>: the 41 parameters of the DLL, a
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Records.ParameterSet\">ParameterSet</a>
record (choose <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Records.PSCAD\">Records.PSCAD</a>
for EPRI's PSCAD values). Its filter entries (<code>Rchoke</code>, <code>Lchoke</code>, <code>Cfilt</code>,
<code>Rdamp</code>) are what the controller assumes; keep them consistent with the electrical filter.</li>
<li><code>P_0</code>, <code>Q_0</code>: initial power output, handed to the DLL as initial outputs (MW, Mvar) and as
initial power references; the model seeds its power-measurement and power-controller states from them. With the
default 0 the converter starts from rest.</li>
</ul>
<h4>Signals exchanged with the DLL</h4>
<p>
Inputs, in the DLL's order and units: <code>Va</code>, <code>Vb</code>, <code>Vc</code> = terminal phase-to-ground
voltages (<code>grid_sensor_*.voltage</code>) in kV; <code>Ia</code>, <code>Ib</code>, <code>Ic</code> = terminal
currents (<code>grid_sensor_*.current</code>) in kA; <code>IaL1</code>, <code>IbL1</code>, <code>IcL1</code> = bridge
currents before the filter capacitance (<code>bridge_sensor_*.current</code>) in kA; <code>Pref</code> (MW),
<code>Qref</code> (Mvar), <code>Vref</code> (pu). The division by 1000 (V to kV, A to kA) used to sit in the C glue of
the pull request and is now done here. Outputs, in the vector <code>out</code>: <code>Ea</code>, <code>Eb</code>,
<code>Ec</code> (kV), <code>Idref</code>, <code>Id</code>, <code>Iqref</code>, <code>Iq</code>, <code>Vd</code>,
<code>Vq</code> (pu), <code>Freq_pll</code> (Hz, <code>out[10]</code>), <code>Pout</code> (MW, <code>out[11]</code>),
<code>Qout</code> (Mvar, <code>out[12]</code>).
</p>
<h4>How the DLL is stepped</h4>
<p>
The DLL integrates its 36 internal states with its own fixed base sample time of 1e-5 s
(<code>FixedStepBaseSampleTime</code>, read into <code>Ts</code> by
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Functions.sampleTime\">Functions.sampleTime</a>).
The model calls <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Functions.step\">Functions.step</a>
exactly once per sample in <code>when sample(0, Ts)</code>; inputs are sampled and outputs held (zero-order hold), so the
DLL clock equals the simulation time with any solver. Fixed-step explicit Euler with a 1e-5 s step is the cheapest
setting and the one written in the experiment annotations of the tests; a variable-step solver works too, but stops at
every sample. A step status other than 0 or 1 stops the simulation with an assertion; the DLL's own message is on the
standard error stream. Every instance of this model owns an independent DLL instance; no file is written.
</p>
<h4>Provenance and references</h4>
<p>
Ported from <code>GFM.GFM_GFL_IBR</code> of
<a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a> (Hao Chang). The C source
of the controller is EPRI's <code>GFM-GFL-IBR-PWM-Model</code> as distributed by CIGRE JWG B4.82 (example code,
version DLL_V1_1), redistributed with EPRI's written permission on condition that [EPRI2023] and [Ramasubramanian2022]
are cited when using it. The source is not printed in [EPRI2023]. Its origin and every difference from the original
are listed in <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.Provenance\">IEEE_CIGRE.Provenance</a>.
</p>
<ul>
<li>[EPRI2023] EPRI, &quot;Code Based Generic Inverter Based Resource Model,&quot; Technical Update 3002028322, Palo
Alto, CA, November 2023 (CC BY 4.0),
<a href=\"https://www.epri.com/research/products/000000003002028322\">https://www.epri.com/research/products/000000003002028322</a>.</li>
<li>[Ramasubramanian2022] D. Ramasubramanian, &quot;Differentiating between plant level and inverter level voltage
control to bring about operation of 100% inverter-based resource grids,&quot; Electric Power Systems Research, vol.
205, 107739, April 2022, <a href=\"https://doi.org/10.1016/j.epsr.2021.107739\">DOI: 10.1016/j.epsr.2021.107739</a>.</li>
<li>H. Chang and L. Vanfretti, &quot;Integrating the IEEE/CIGRE DLL Modeling Standard to Use 'Real Code' Models for
Power System Analysis in Modelica Tools,&quot; Proceedings of the American Modelica Conference 2024, October 14-16,
2024, Storrs, Connecticut, USA, <a href=\"https://doi.org/10.3384/ecp20772\">DOI: 10.3384/ecp20772</a>.</li>
<li>H. Chang and L. Vanfretti, &quot;EMT Modelling and Simulation of Grid Following Converters in Modelica Integrating
the IEEE/CIGRE 'Real Code'/DLL Modelling Guidelines,&quot; CIGRE Paris Session 2026, paper C4-10724, Paris, France,
August 2026,
<a href=\"https://www.e-cigre.org/publications/detail/c4-10724-2026-emt-modelling-and-simulation-of-grid-following-converters-in-modelica-integrating-the-ieeecigre-real-codedll-modelling-guidelines.html\">e-cigre</a>.</li>
</ul>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>EPRI GFM-GFL-IBR-PWM-Model 1.1.0.0 (D. Ramasubramanian, 2022), CIGRE JWG B4.82 example code DLL_V1_1; cite EPRI report 3002028322 and Ramasubramanian, EPSR 205 (2022) 107739</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2026-10</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Hao Chang, Rensselaer Polytechnic Institute (first version, OpenIPSL PR #362); rewritten for the OpenIPSL adapter in 2026</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end GFM_GFL_IBR;
