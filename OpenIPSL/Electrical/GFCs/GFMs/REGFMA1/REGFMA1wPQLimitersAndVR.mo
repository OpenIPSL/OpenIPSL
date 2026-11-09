within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1;
model REGFMA1wPQLimitersAndVR
  "Grid forming converter with droop control REGFM_A1, including the P and Q limiters and the virtual-resistor current limiter as components"
  import Modelica;
  outer OpenIPSL.Electrical.SystemBase SysData;

  VoltageSources.VSIOwVReInput VS(
    S_b=S_b,
    P_0=P_0,
    Q_0=Q_0,
    v_0=v_0,
    angle_0=angle_0,
    M_b=M_b,
    R_a=R_a,
    X_d=X_d,
    Imax=Imax) "The voltage source with the virtual resistance as an input"
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  CurrentLimiters.VRe virtualRe(
    R_a=R_a,
    X_d=X_d,
    Imax=Imax) "The virtual resistance that limits the current to Imax, from the droop command and the terminal voltage"
    annotation (Placement(transformation(extent={{-18,-18},{18,18}},
        rotation=90,
        origin={50,-38})));
  Modelica.Blocks.Sources.RealExpression sig_Edroop(y=q_v_droop_scheme.Edroop) "Droop command magnitude, for the virtual resistance"
    annotation (Placement(transformation(extent={{-10,-3},{10,3}},
        rotation=90,
        origin={35.6,-69})));
  Modelica.Blocks.Sources.RealExpression sig_delta_droop(y=pfdroopcntrl.delta_droop) "Droop command angle, for the virtual resistance"
    annotation (Placement(transformation(extent={{-10,-3},{10,3}},
        rotation=90,
        origin={42.8,-69})));
  Modelica.Blocks.Sources.RealExpression sig_Vt(y=VS.V) "Terminal voltage magnitude, for the virtual resistance"
    annotation (Placement(transformation(extent={{-10,-3},{10,3}},
        rotation=90,
        origin={57.2,-69})));
  Modelica.Blocks.Sources.RealExpression sig_anglev(y=VS.anglev) "Terminal voltage angle, for the virtual resistance"
    annotation (Placement(transformation(extent={{-10,-3},{10,3}},
        rotation=90,
        origin={64.4,-69})));
  Modelica.Blocks.Sources.RealExpression sig_delta0(y=VS.delta0) "Initial internal voltage angle"
    annotation (Placement(transformation(extent={{30,-76},{14,-64}})));
  Modelica.Blocks.Sources.RealExpression sig_p0(y=P_0) "Initial active power (W)"
    annotation (Placement(transformation(extent={{36,-92},{24,-80}})));
  PQLimitersAndCntrlSchemes.PfdrpControlSchemePLim pfdroopcntrl(
    f0=f0,
    mp=mp,
    Tr=Tr,
    Pmax=Pmax,
    Pmin=Pmin,
    kppmax=kppmax,
    kipmax=kipmax)
    annotation (Placement(transformation(extent={{-40,-60},{0,-20}})));
  Modelica.Blocks.Math.Gain gain2P0pu(k=1/M_b) "Initial active power, pu on the machine base"
                                              annotation (Placement(
        transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={12,-86})));
  PQLimitersAndCntrlSchemes.QVdrpCntrlSchemeQLim q_v_droop_scheme(
    Tr=qTr,
    Tvf=Tvf,
    EMax=EMax,
    EMin=EMin,
    QVFlag_val_k=QVFlag_val_k,
    VFlag_val_k=VFlag_val_k,
    kpv=kpv,
    kiv=kiv,
    mq=mq,
    Qmax=Qmax,
    Qmin=Qmin,
    kpqmax=kpqmax,
    kiqmax=kiqmax)
    annotation (Placement(transformation(extent={{-40,40},{0,76}})));
  Modelica.Blocks.Sources.RealExpression sig_Pmeas(y=VS.P*S_b/M_b) "Active power, pu on the machine base"
    annotation (Placement(transformation(extent={{-82,-58},{-62,-38}})));
  Modelica.Blocks.Sources.RealExpression sig_q0(y=Q_0)
    annotation (Placement(transformation(extent={{-84,-10},{-64,10}})));
  Modelica.Blocks.Math.Gain gain2Q0pu(k=1/M_b) "Initial reactive power, pu on the machine base"
                                               annotation (Placement(
        transformation(
        extent={{-8,-8},{8,8}},
        origin={-50,0})));
  Modelica.Blocks.Sources.RealExpression sig_E0(y=VS.E0) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-12,6})));
  Modelica.Blocks.Sources.RealExpression sig_Qmeas(y=VS.Q*S_b/M_b) "Reactive power, pu on the machine base"
    annotation (Placement(transformation(extent={{-84,20},{-64,40}})));
  Modelica.Blocks.Sources.RealExpression sig_Vmeas(y=VS.V) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={-70,80})));
  Modelica.Blocks.Sources.RealExpression sig_V0(y=v_0) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-4,92})));
  Interfaces.PwPin p annotation (Placement(transformation(extent={{
            99,-9},{118,10}}), iconTransformation(extent={{200,-20},{240,20}})));
  Modelica.Blocks.Interfaces.RealInput Pref "Active power reference"
                                            annotation (Placement(
        transformation(extent={{-131,-75},{-101,-45}}), iconTransformation(
          extent={{-240,-140},{-200,-100}})));
  Modelica.Blocks.Interfaces.RealInput Vref "Reference voltage input"
                                            annotation (Placement(
        transformation(extent={{-131,45},{-101,75}}), iconTransformation(
          extent={{-240,100},{-200,140}})));

  parameter Types.ApparentPower M_b=SysData.S_b "Voltage source base power rating (VA); the control parameters are in pu on this base"
    annotation (Dialog(tab="Voltage Source parameters"));
  parameter Types.PerUnit R_a=1e-3 "Internal source resistance, pu, machine base"
    annotation (Dialog(tab="Voltage Source parameters"));
  parameter Types.PerUnit X_d=0.2 "Internal source d-axis reactance, pu, machine base"
    annotation (Dialog(tab="Voltage Source parameters"));
  parameter Real f0=SysData.fn "System frequency, f0 = 60 (Hz)" annotation (Dialog(
        tab="P-f Droop", group="P-f droop controller parameters"));
  parameter Real mp=0.01 "P-f droop gain. Normal range: 0.005 - 0.05 pu."
    annotation (Dialog(tab="P-f Droop", group="P-f droop controller parameters"));
  parameter Real Tr=0.1
    "Filter time constant, sec. Normal Range: [0.01 - 0.1 sec.]" annotation (
      Dialog(tab="P-f Droop", group="P-f droop controller parameters"));
  parameter Real qTr=0.01 "Reactive power measurement filter time constant (Tqf). Range: [0.01 - 0.1 sec.]"
    annotation (Dialog(tab="Q-v Droop", group="Filter Parameters"));
  parameter Real Tvf=qTr "Voltage measurement filter time constant (Tvf). Range: [0.01 - 0.1 sec.]"
    annotation (Dialog(tab="Q-v Droop", group="Filter Parameters"));
  parameter Real EMax=1.15 "Max. Edroop"
    annotation (Dialog(tab="Q-v Droop", group="E Limiters"));
  parameter Real EMin=0 "Min. Edroop"
    annotation (Dialog(tab="Q-v Droop", group="E Limiters"));
  parameter Real kpv=0.01 "Proportional gain of the voltage controller"
    annotation (Dialog(tab="Q-v Droop", group="PI Voltage Controller Params."));
  parameter Real kiv=5.86 "Integral grain of the voltage controller"
    annotation (Dialog(tab="Q-v Droop", group="PI Voltage Controller Params."));
  parameter Real mq=0.01 "Q-V droop gain. Range: [0-0.20] pu"
    annotation (Dialog(tab="Q-v Droop", group="Droop Gain"));
  Modelica.Blocks.Sources.RealExpression sigPmeas(y=VS.P) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={70,90})));
  Modelica.Blocks.Sources.RealExpression sigQmeas(y=VS.Q) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={70,70})));
  Modelica.Blocks.Sources.RealExpression sigVmeas(y=VS.V) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={80,-20})));
  Modelica.Blocks.Sources.RealExpression siganglevmeas(y=VS.anglev)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={80,-40})));
  Modelica.Blocks.Sources.RealExpression sigaEmag(y=VS.Emag) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={80,-60})));
  Modelica.Blocks.Sources.RealExpression sigaEdelta(y=VS.Edelta) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={80,-80})));
  Modelica.Blocks.Interfaces.RealOutput P_meas "VS P measurement" annotation
    (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={110,90}), iconTransformation(extent={{200,170},{220,190}})));
  Modelica.Blocks.Interfaces.RealOutput Q_meas "VS Q meas"
                                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={110,70}), iconTransformation(extent={{200,130},{220,150}})));
  Modelica.Blocks.Interfaces.RealOutput V "VS terminal voltage" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={110,-20}), iconTransformation(extent={{200,-70},{220,-50}})));
  Modelica.Blocks.Interfaces.RealOutput anglev "VS terminal angle"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={110,-40}), iconTransformation(extent={{200,-110},{220,-90}})));
  Modelica.Blocks.Interfaces.RealOutput Emag
    "Internal voltage source voltage magnitude E"
                                      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={110,-60}), iconTransformation(extent={{200,-150},{220,-130}})));
  Modelica.Blocks.Interfaces.RealOutput Edelta
    "Internal voltage source angle delta"
                                      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={110,-80}), iconTransformation(extent={{200,-190},{220,-170}})));
  Modelica.Blocks.Interfaces.RealOutput Vref0
    "Voltage reference of the initial operating point, to be fed back to Vref"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,-110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,-210})));
  Modelica.Blocks.Interfaces.RealOutput Pref0
    "Active power reference of the initial operating point (pu, machine base), to be fed back to Pref"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,-110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,-210})));
  Modelica.Blocks.Interfaces.RealOutput omega_dev
    "Speed deviation from the P-f droop controller, pu (the SPD channel of PSS/E)"
    annotation (Placement(transformation(extent={{100,40},{120,60}}),
        iconTransformation(extent={{200,90},{220,110}})));
  Modelica.Blocks.Interfaces.RealOutput omega_droop
    "Speed output from the P-f droop controller"
    annotation (Placement(transformation(extent={{100,20},{120,40}}),
        iconTransformation(extent={{200,50},{220,70}})));
  Modelica.Blocks.Sources.RealExpression sigOmega_dev(y=pfdroopcntrl.omega_dev)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={70,
            50})));
  Modelica.Blocks.Sources.RealExpression sigOmega_droop(y=pfdroopcntrl.omega_droop)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={70,
            30})));
  parameter Real Pmax=0.9
    "Upper limit of the inverter active power output. Normal Range: [0.1 - 1] pu"
    annotation (Dialog(tab="Pmin/Pmax Limiters", group="Overlad controller parameters"));
  parameter Real Pmin=0
    "Lower limit of the inverter active power output. The value should be negative when representing energy storage systems."
    annotation (Dialog(tab="Pmin/Pmax Limiters", group="Overlad controller parameters"));
  parameter Real kppmax=0.01
    "Proportional gain of the overload mitigation controller. Normal Range: [0.005 - 0.05] pu."
    annotation (Dialog(tab="Pmin/Pmax Limiters", group="Overlad controller parameters"));
  parameter Real kipmax=0.1
    "Integral gain of theoverload mitigation controller. Nomral Range: [0.05-0.2] pu/s"
    annotation (Dialog(tab="Pmin/Pmax Limiters", group="Overlad controller parameters"));
  parameter Real Qmax=0.44
    "Upper limit of the inverter reactive power output. Normal Range: [0.44-1.0] pu"
    annotation (Dialog(tab="Qmin/Qmax Limiters", group="Reactive Power Overload Controller Parameters"));
  parameter Real Qmin=-0.44
    "Lower limit of the inverter reactive power output. Normal Range: [-0.44 - -1.0] pu"
    annotation (Dialog(tab="Qmin/Qmax Limiters", group="Reactive Power Overload Controller Parameters"));
  parameter Real kpqmax=1.0
    "Proportional gain of the Qmax and Qmin controller. Range when VFLAG=1 is [1-5] pu. Range when VFLAG = 0, [0-0.5] pu."
    annotation (Dialog(tab="Qmin/Qmax Limiters", group="Reactive Power Overload Controller Parameters"));
  parameter Real kiqmax=20.0 "Integral gain of the Qmax and Qmin Controller. Range when VFLAG=1 is [3-20] pu. Range when VFLAG = 0, [3-30] pu"
    annotation (Dialog(tab="Qmin/Qmax Limiters", group="Reactive Power Overload Controller Parameters"));

  parameter Types.ApparentPower S_b=SysData.S_b "System base power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ActivePower P_0=40e6 "Initial active power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ReactivePower Q_0=5.416582e6 "Initial reactive power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit v_0=1.0 "Initial voltage magnitude"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Angle angle_0=0.070620799598684 "Initial voltage angle (rad)"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Frequency fn=SysData.fn "System frequency (Hz)"
    annotation (Dialog(group="Power flow data"));
  parameter Boolean QVFlag_val_k=true
    "QVFlag = false (0): Qref = Q0, the initial Qinv; true (1): Qref = 0. It only selects the reference a plant controller would change; with no Qref input both give the same response (see Documentation)"
    annotation (Dialog(group="Control Mode Setting (VFLAG and QVFLAG)"));
  parameter Boolean VFlag_val_k=true
    "VFlag = true/false switches the voltage control mode. VFlag = 0 = false, E limited. VFlag = 1 = true, PI with E limited."
    annotation (Dialog(group="Control Mode Setting (VFLAG and QVFLAG)"));
  parameter Types.PerUnit Imax=2.0
    "Maximum transient current magnitude (pu, machine base)"
    annotation (Dialog(tab="Fault Current Limiter"));
equation
  connect(sig_delta0.y, pfdroopcntrl.Edelta0) annotation (Line(points={{13.2,-70},
          {-12,-70},{-12,-62}}, color={0,0,127}));
  connect(sig_p0.y,gain2P0pu. u) annotation (Line(points={{23.4,-86},{21.6,-86}},
                        color={0,0,127}));
  connect(sig_Edroop.y, virtualRe.Emag)
    annotation (Line(points={{35.6,-58},{35.6,-57.8}}, color={0,0,127}));
  connect(sig_delta_droop.y, virtualRe.Eang)
    annotation (Line(points={{42.8,-58},{42.8,-57.8}}, color={0,0,127}));
  connect(sig_Vt.y, virtualRe.V)
    annotation (Line(points={{57.2,-58},{57.2,-57.8}}, color={0,0,127}));
  connect(sig_anglev.y, virtualRe.anglev)
    annotation (Line(points={{64.4,-58},{64.4,-57.8}}, color={0,0,127}));
  connect(virtualRe.R_e, VS.R_e)
    annotation (Line(points={{50,-18.2},{50,-12}}, color={0,0,127}));
  connect(gain2P0pu.y, pfdroopcntrl.Pout0)
    annotation (Line(points={{3.2,-86},{-28,-86},{-28,-62}}, color={0,0,127}));
  connect(sig_Pmeas.y, pfdroopcntrl.Pmeas)
    annotation (Line(points={{-61,-48},{-42,-48}}, color={0,0,127}));
  connect(sig_q0.y,gain2Q0pu. u)
    annotation (Line(points={{-63,0},{-59.6,0}}, color={0,0,127}));
  connect(gain2Q0pu.y,q_v_droop_scheme. Qout0) annotation (Line(points={{-41.2,0},
          {-28,0},{-28,38.2}}, color={0,0,127}));
  connect(sig_E0.y,q_v_droop_scheme. Emag0) annotation (Line(points={{-12,17},{-12,
          38.2}}, color={0,0,127}));
  connect(sig_Qmeas.y,q_v_droop_scheme. Qmeas) annotation (Line(points={{-63,30},
          {-63,43.6},{-42,43.6}}, color={0,0,127}));
  connect(sig_Vmeas.y,q_v_droop_scheme. Vmeas) annotation (Line(points={{-59,80},
          {-42,80},{-42,72.4}}, color={0,0,127}));
  connect(sig_V0.y,q_v_droop_scheme. Vt0) annotation (Line(points={{-15,92},{-20,
          92},{-20,77.8}}, color={0,0,127}));
  connect(q_v_droop_scheme.Edroop, VS.uEmag) annotation (Line(points={{1,58},{8,
          58},{8,6},{38,6}}, color={0,0,127}));
  connect(pfdroopcntrl.delta_droop, VS.uEang) annotation (Line(points={{1,-32},{
          8,-32},{8,-6},{38,-6}}, color={0,0,127}));
  connect(Pref, pfdroopcntrl.Pref) annotation (Line(points={{-116,-60},{-96,-60},
          {-96,-32},{-42,-32}}, color={0,0,127}));
  connect(Vref, q_v_droop_scheme.Vref) annotation (Line(points={{-116,60},{-84,60},
          {-84,67},{-42,67}}, color={0,0,127}));
  connect(sigPmeas.y,P_meas)
    annotation (Line(points={{81,90},{110,90}}, color={0,0,127}));
  connect(sigQmeas.y,Q_meas)
    annotation (Line(points={{81,70},{110,70}}, color={0,0,127}));
  connect(sigVmeas.y,V)
    annotation (Line(points={{91,-20},{110,-20}}, color={0,0,127}));
  connect(siganglevmeas.y,anglev)
    annotation (Line(points={{91,-40},{110,-40}}, color={0,0,127}));
  connect(sigaEmag.y,Emag)
    annotation (Line(points={{91,-60},{110,-60}}, color={0,0,127}));
  connect(sigaEdelta.y,Edelta)
    annotation (Line(points={{91,-80},{110,-80}}, color={0,0,127}));
  connect(q_v_droop_scheme.Vref0, Vref0) annotation (Line(points={{-4,39.1},{-4,
          30},{-60,30},{-60,-110}},                                                                   color={0,0,127}));
  connect(pfdroopcntrl.Pref0, Pref0) annotation (Line(points={{-20,-61},{-20,-110}}, color={0,0,127}));
  connect(sigOmega_droop.y, omega_droop)
    annotation (Line(points={{81,30},{110,30}}, color={0,0,127}));
  connect(sigOmega_dev.y, omega_dev)
    annotation (Line(points={{81,50},{110,50}}, color={0,0,127}));
  connect(VS.p, p)
    annotation (Line(points={{61,0},{64,0.5},{108.5,0.5}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(extent={{-200,-200},{200,200}}, grid={2,2}),
                   graphics={
        Line(
          points={{-80,-100},{-40,-100},{40,100},{80,100}},
          color={0,0,255},
          thickness=1),
        Rectangle(
          extent={{-200,200},{200,-200}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-200,280},{200,200}},
          textColor={28,108,200},
          textString="%name"),
        Rectangle(
          extent={{-80,80},{80,-80}},
          lineColor={0,0,255},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-180,200},{180,120}},
          textColor={28,108,200},
          fontName="Geist",
          textString="REGFMA1"),
      Polygon(
        points={{-6,4},{10,14},{10,-6},{-6,4}},
        lineColor={28,108,200},
          origin={-158,4},
          rotation=180,
          lineThickness=1,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-184,0},{-168,0}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{82,0},{200,0}},
          color={0,0,255},
          thickness=1),
        Line(
          points={{-132,-36},{-132,-54}},
          color={28,108,200},
          thickness=1),                   Text(
          extent={{-160,-112},{160,-192}},
          textColor={28,108,200},
          fontName="Geist",
          textString="With P&Q Limiters &
Virtual Resistor Current Limiter"),
        Line(
          points={{-112,0},{-92,0}},
          color={28,108,200},
          thickness=1),
      Polygon(
        points={{-6,4},{10,14},{10,-6},{-6,4}},
        lineColor={28,108,200},
          origin={-86,4},
          rotation=180,
          lineThickness=1,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
      Polygon(
        points={{-6,4},{10,14},{10,-6},{-6,4}},
        lineColor={28,108,200},
          origin={-136,-26},
          rotation=270,
          lineThickness=1,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid), Text(
          extent={{0,-8},{80,-48}},
          textColor={0,0,255},
          fontName="Geist",
          textString="AC"),
        Line(
          points={{8,-24},{24,8},{40,-26},{56,-64},{72,-28}},
          color={0,0,255},
          thickness=1,
          smooth=Smooth.Bezier),
        Line(
          points={{-68,24},{-8,24}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None),
        Line(
          points={{-68,4},{-8,4}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None,
          pattern=LinePattern.Dash),      Text(
          extent={{-80,64},{0,24}},
          textColor={0,0,0},
          fontName="Geist",
          textString="DC"),
        Line(
          points={{-60,-56},{60,64}},
          color={0,0,255},
          thickness=1,
          smooth=Smooth.Bezier),
        Rectangle(extent={{-152,20},{-112,-20}},
                                               lineColor={28,108,200},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{60,140},{140,100}},
          textColor={238,46,47},
          fontName="Geist",
          textString="Imax"),
        Line(
          points={{-40,100},{80,100}},
          color={238,46,47},
          pattern=LinePattern.Dash,
          thickness=1),
        Text(
          extent={{-150,18},{-114,-18}},
          textColor={28,108,200},
          fontName="Geist",
          textString="D",
          textStyle={TextStyle.Italic})}),
                                       Documentation(info="<html>
<p>
<code>REGFMA1wPQLimiters</code> with the virtual-resistor current limiter of <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2024]</a>,
built from components: <code>CurrentLimiters.VRe</code> computes the virtual resistance <code>R_e</code> from the droop command
(<code>Edroop</code>, <code>delta_droop</code>) and the terminal voltage, and the voltage source <code>VoltageSources.VSIOwVReInput</code> puts it in series
with its impedance, so that the current never exceeds <code>Imax</code> (pu, machine base).
The droop controls are not changed by the limiter; they keep integrating from the measured power and voltage.
The outputs <code>Emag</code> and <code>Edelta</code> are the droop command, the voltage behind <code>R_a + R_e + jX_d</code>.
</p>
<p>
The virtual resistor can lose synchronism after long faults (about 0.5 s and more), as [Du2024] reports; see
<code>CurrentLimiters.VirtualResistor</code>. The same limiter is <code>REGFMA1wPQLimitersAndReplaceableFCL</code> with
<code>CurrentLimiters.VirtualResistor</code>, and <code>REGFMA1wPQLimitersAndFCL</code> with <code>useVirtualResistor = true</code>;
the clamp of PSS/E's REGFMA1 is <code>REGFMA1wPQLimitersAndClamp</code>.
</p>
<p>
All parameters of the controls are in per unit on the converter base <code>M_b</code> (in VA), as in PSS/E; the measured active and reactive power are converted from the system base.
The outputs <code>Pref0</code> and <code>Vref0</code> are the references of the initial operating point, computed from the power flow data at initialization.
Feeding them back to the inputs <code>Pref</code> and <code>Vref</code> (plus any change a test applies) starts the model in steady state for any power flow and any setting of the flags.
</p>
<p>
<code>QVFlag</code> only selects which reference a plant controller acts on: <code>Qref</code> with <code>QVFlag = 0</code>, <code>Vref</code> with <code>QVFlag = 1</code> <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2021]</a>.
This model has no <code>Qref</code> input: <code>Qref</code> is the constant <code>Q0</code> (<code>QVFlag = 0</code>) or zero (<code>QVFlag = 1</code>), and <code>Vref0</code> absorbs the difference <code>mq*Q0</code>.
With <code>Vref0</code> fed back, both settings therefore give identical trajectories for the same <code>VFlag</code>; only a change of <code>Vref</code> reaches the droop.
</p>

</html>"));
end REGFMA1wPQLimitersAndVR;
