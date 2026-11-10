within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.Variants.REGFMA1;
model CombiningComponents
  "Test the components of the REGF_A1 model with a replaceable current limiter in a power system"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=1e-6,
      X=1e-3,
      t1=55.0,
      t2=55.15));
  Electrical.GFCs.GFMs.VoltageSources.VSIOforGFM VS(fn=60)
    annotation (Placement(transformation(extent={{-100,-20},{-60,20}})));
  replaceable Electrical.GFCs.GFMs.REGFMA1.Components.CurrentLimiters.Clamp currentLimiter constrainedby
    Electrical.GFCs.GFMs.REGFMA1.Components.CurrentLimiters.Base.PartialCurrentLimiter(
    R_a=VS.R_a,
    X_d=VS.X_d,
    Imax=1.5) "The current limiter between the droop controls and the voltage source: the clamp unless replaced"
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-160,-20},{-120,20}})));
  Electrical.GFCs.GFMs.REGFMA1.Components.PQLimitersAndCntrlSchemes.PfdrpControlSchemePLim
    basic_dROOP(
    f0=60,
    mp=0.01,
    Tr=0.1) annotation (Placement(transformation(extent={{-240,-40},{-200,0}})));
  Modelica.Blocks.Math.Gain gain2P0pu(k=1/VS.M_b) "Initial active power (W) to pu on the source base" annotation (Placement(
        transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={-126,-80})));
  Modelica.Blocks.Sources.Ramp Vref(
    height=0.1,
    duration=1,
    offset=0,
    startTime=66)
    annotation (Placement(transformation(extent={{-340,158},{-320,178}})));
  Modelica.Blocks.Sources.Ramp Vref1(
    height=-0.1,
    duration=1.0,
    offset=0,
    startTime=50)
    annotation (Placement(transformation(extent={{-340,120},{-320,140}})));
  Modelica.Blocks.Math.Add3 add "Vref = Vref0 of the initial operating point plus the two ramps"
    annotation (Placement(transformation(extent={{-300,140},{-280,160}})));
  Electrical.GFCs.GFMs.REGFMA1.Components.PQLimitersAndCntrlSchemes.QVdrpCntrlSchemeQLim
    q_v_droop_scheme(
    QVFlag_val_k=true,
    VFlag_val_k=true,
    mq=0.01)
    annotation (Placement(transformation(extent={{-240,124},{-200,160}})));
  Modelica.Blocks.Sources.RealExpression sig_Pmeas(y=VS.P_meas)
    annotation (Placement(transformation(extent={{-278,-38},{-258,-18}})));
  Modelica.Blocks.Sources.RealExpression sig_q0(y=VS.q0)
    annotation (Placement(transformation(extent={{-338,90},{-318,110}})));
  Modelica.Blocks.Math.Gain gain2Q0pu(k=1/VS.M_b) "Initial reactive power (var) to pu on the source base" annotation (Placement(
        transformation(
        extent={{-8,-8},{8,8}},
        origin={-292,100})));
  Modelica.Blocks.Sources.RealExpression sig_E0(y=VS.E0) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-198,98})));
  Modelica.Blocks.Sources.RealExpression sig_Qmeas(y=VS.Q_meas)
    annotation (Placement(transformation(extent={{-300,116},{-280,136}})));
  Modelica.Blocks.Sources.RealExpression sig_Vmeas(y=VS.V) annotation (
      Placement(transformation(extent={{-300,170},{-280,190}})));
  Modelica.Blocks.Sources.RealExpression sig_V0(y=VS.vt0) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-198,174})));
  Electrical.GFCs.GFMs.REGFMA1.Components.PQLimitersAndCntrlSchemes.Plimiter plimiter
    annotation (Placement(transformation(extent={{-260,-100},{-220,-140}})));
  Electrical.GFCs.GFMs.REGFMA1.Components.BasicComponentsAndCntrlSchemes.LPFilter Pfilt
    annotation (Placement(transformation(extent={{-300,-130},{-280,-110}})));
  Modelica.Blocks.Sources.RealExpression sig_Pmeas_4pfilt(y=VS.P_meas)
    annotation (Placement(transformation(extent={{-330,-130},{-310,-110}})));
  Electrical.GFCs.GFMs.REGFMA1.Components.PQLimitersAndCntrlSchemes.Qlimiter qlimiter
    annotation (Placement(transformation(extent={{-280,80},{-240,40}})));
  Modelica.Blocks.Sources.RealExpression sig_Qmeas_4qfilt(y=VS.Q_meas)
    annotation (Placement(transformation(extent={{-340,50},{-320,70}})));
  Electrical.GFCs.GFMs.REGFMA1.Components.BasicComponentsAndCntrlSchemes.LPFilter Qfilt(y0val=
        5.416582/100)
    annotation (Placement(transformation(extent={{-310,50},{-290,70}})));
  Modelica.Blocks.Math.Add3 add3_1_Pref
    annotation (Placement(transformation(extent={{-320,-20},{-300,0}})));
  Modelica.Blocks.Math.Add addPref0 "Pref = Pref0 of the initial operating point plus the changes"
    annotation (Placement(transformation(extent={{-290,-20},{-276,-6}})));
  Modelica.Blocks.Sources.Ramp Pstep(
    height=0.1,
    duration=5,
    offset=0,
    startTime=2.5)
    annotation (Placement(transformation(extent={{-380,-12},{-360,8}})));
  Modelica.Blocks.Sources.Pulse Pfilt_upper(
    amplitude=8,
    period=2,
    nperiod=1,
    offset=0,
    startTime=5.0)
    annotation (Placement(transformation(extent={{-380,-60},{-360,-40}})));
  Modelica.Blocks.Sources.Pulse Pfilt_lower(
    amplitude=-0.5,
    period=3,
    nperiod=1,
    offset=0,
    startTime=40)
    annotation (Placement(transformation(extent={{-380,-100},{-360,-80}})));
  Modelica.Blocks.Sources.RealExpression sig_Vm(y=VS.V)
    annotation (Placement(transformation(extent={{-188,-8},{-176,2}})));
  Modelica.Blocks.Sources.RealExpression sig_Vang(y=VS.anglev)
    annotation (Placement(transformation(extent={{-188,-16},{-176,-6}})));
equation
  connect(basic_dROOP.Edelta0, VS.delta0) annotation (Line(points={{-212,-42},{
          -212,-60},{-88,-60},{-88,-22}}, color={0,0,127}));
  connect(VS.p0, gain2P0pu.u) annotation (Line(points={{-80,-22},{-84,-22},{-84,
          -80},{-116.4,-80}},
                        color={0,0,127}));
  connect(gain2P0pu.y, basic_dROOP.Pout0) annotation (Line(points={{-134.8,
          -80},{-228,-80},{-228,-42}},
                                  color={0,0,127}));
  connect(Vref.y, add.u1) annotation (Line(points={{-319,168},{-312,168},{-312,
          158},{-302,158}},
                      color={0,0,127}));
  connect(Vref1.y, add.u2) annotation (Line(points={{-319,130},{-314,130},
          {-314,150},{-302,150}},
                          color={0,0,127}));
  connect(q_v_droop_scheme.Vref, add.y) annotation (Line(points={{-242,
          151},{-274,151},{-274,150},{-279,150}},
                                          color={0,0,127}));
  connect(sig_Pmeas.y, basic_dROOP.Pmeas) annotation (Line(points={{-257,
          -28},{-242,-28}}, color={0,0,127}));
  connect(sig_q0.y, gain2Q0pu.u)
    annotation (Line(points={{-317,100},{-301.6,100}},
                                                     color={0,0,127}));
  connect(gain2Q0pu.y, q_v_droop_scheme.Qout0) annotation (Line(points={{-283.2,
          100},{-228,100},{-228,122.2}}, color={0,0,127}));
  connect(sig_E0.y, q_v_droop_scheme.Emag0) annotation (Line(points={{-209,98},
          {-212,98},{-212,122.2}}, color={0,0,127}));
  connect(sig_Qmeas.y, q_v_droop_scheme.Qmeas) annotation (Line(points={{-279,
          126},{-276,127.6},{-242,127.6}}, color={0,0,127}));
  connect(sig_Vmeas.y, q_v_droop_scheme.Vmeas) annotation (Line(points={{-279,
          180},{-258,180},{-258,156.4},{-242,156.4}}, color={0,0,127}));
  connect(sig_V0.y, q_v_droop_scheme.Vt0) annotation (Line(points={{-209,
          174},{-220,174},{-220,161.8}}, color={0,0,127}));
  connect(q_v_droop_scheme.Edroop, currentLimiter.Emag) annotation (Line(points={{-199,
          142},{-180,142},{-180,13.3333},{-161.667,13.3333}},
                                                    color={0,0,127}));
  connect(basic_dROOP.delta_droop, currentLimiter.Eang) annotation (Line(points={{-199,
          -12},{-194,-12},{-194,3.33333},{-161.667,3.33333}},
                                                      color={0,0,127}));
  connect(currentLimiter.ElimMag, VS.uEmag) annotation (Line(points={{-118.333,10},{-114,
          8},{-104,8}},                       color={0,0,127}));
  connect(currentLimiter.ElimAng, VS.uEang) annotation (Line(points={{-118.333,-10},{
          -114,-8},{-104,-8}},                color={0,0,127}));
  connect(Pfilt.y, plimiter.Pfilt)
    annotation (Line(points={{-279,-120},{-262,-120}}, color={0,0,127}));
  connect(sig_Pmeas_4pfilt.y, Pfilt.u)
    annotation (Line(points={{-309,-120},{-302,-120}}, color={0,0,127}));
  connect(plimiter.P0_ini, gain2P0pu.y) annotation (Line(points={{-240,
          -98},{-240,-80},{-134.8,-80}}, color={0,0,127}));
  connect(qlimiter.Q0_ini, gain2Q0pu.y) annotation (Line(points={{-260,82},
          {-260,100},{-283.2,100}}, color={0,0,127}));
  connect(qlimiter.Qfilt, Qfilt.y)
    annotation (Line(points={{-282,60},{-289,60}}, color={0,0,127}));
  connect(sig_Qmeas_4qfilt.y, Qfilt.u)
    annotation (Line(points={{-319,60},{-312,60}}, color={0,0,127}));
  connect(add3_1_Pref.y, addPref0.u1) annotation (Line(points={{-299,-10},{-291.4,
          -10},{-291.4,-8.8}}, color={0,0,127}));
  connect(addPref0.y, basic_dROOP.Pref) annotation (Line(points={{-275.3,-13},{-260,
          -13},{-260,-12},{-242,-12}}, color={0,0,127}));
  connect(basic_dROOP.Pref0, addPref0.u2) annotation (Line(points={{-220,-41},{-220,
          -50},{-296,-50},{-296,-17.2},{-291.4,-17.2}}, color={0,0,127}));
  connect(q_v_droop_scheme.Vref0, add.u3) annotation (Line(points={{-204,123.1},
          {-204,116},{-306,116},{-306,142},{-302,142}},
                                                  color={0,0,127}));
  connect(Pstep.y, add3_1_Pref.u1)
    annotation (Line(points={{-359,-2},{-322,-2}}, color={0,0,127}));
  connect(Pfilt_upper.y, add3_1_Pref.u2) annotation (Line(points={{-359,
          -50},{-348,-50},{-348,-10},{-322,-10}}, color={0,0,127}));
  connect(Pfilt_lower.y, add3_1_Pref.u3) annotation (Line(points={{-359,
          -90},{-340,-90},{-340,-18},{-322,-18}}, color={0,0,127}));
  connect(VS.p, GEN1.p) annotation (Line(points={{-58,0},{-30,0}},
        color={0,0,255}));
  connect(sig_Vm.y, currentLimiter.V) annotation (Line(points={{-175.4,-3},{-175.4,
          -3.33333},{-161.667,-3.33333}}, color={0,0,127}));
  connect(sig_Vang.y, currentLimiter.anglev) annotation (Line(points={{-175.4,-11},{
          -175.4,-11.6667},{-161.667,-11.6667}}, color={0,0,127}));
  annotation (experiment(
      StopTime=60,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"), Diagram(
        coordinateSystem(extent={{-400,-200},{100,200}}, initialScale=0.5)),

    Documentation(info="<html>
<p>
Illustrates how to combine the components of REGFM_A1 with a replaceable current limiter, without encapsulating them:
<code>PQLims.CombiningComponents</code> with <code>currentLimiter</code>, by default <code>REGFMA1.Components.CurrentLimiters.Clamp</code>
(<code>Imax = 1.5</code> pu), between the droop controls (<code>q_v_droop_scheme.Edroop</code>, <code>basic_dROOP.delta_droop</code>) and the voltage source
<code>VS</code>, which gives the limiter its terminal voltage. This is how <code>Variants.REGFMA1</code> is built.
</p>
<p>
The references start from the outputs <code>basic_dROOP.Pref0</code> and <code>q_v_droop_scheme.Vref0</code>, the references of the initial operating point,
so the model starts in steady state. The changes of the references are those of <code>PQLims.CombiningComponents</code>;
in addition a fault (0.000001 + j0.001 pu) at bus FAULT from 55 to 55.15 s drives the current above <code>Imax</code>, and the limiter holds it at 1.5 pu.
With the default limiter its trajectories are those of <code>PQLimsAndClamp.CombiningComponents</code>.
</p>
<p>
Simulate and plot <code>currentLimiter.I_unlim</code>, <code>currentLimiter.I_mag</code>, <code>currentLimiter.limited</code>, <code>VS.P_meas</code>, <code>VS.Q_meas</code> and <code>VS.V</code>.
</p>
</html>"));
end CombiningComponents;
