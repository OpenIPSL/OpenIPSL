within OpenIPSL.Tests.GFCs.GFMs.REGFMA1withPQLimEncapsulate;
model CombiningComponents
  "Test the three components of the REGF_A1 model in a power system"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=1e-6,
      X=1e-3,
      t1=62.0,
      t2=62.15));
  Electrical.GFCs.GFMs.VoltageSources.VSIOforGFM VS(fn=60, M_b=100)
    annotation (Placement(transformation(extent={{-102,-18},{-62,22}})));
  Electrical.GFCs.GFMs.REGFMA1.PQLimitersAndCntrlSchemes.PfdrpControlSchemePLim
    basic_dROOP(
    f0=60,
    mp=0.01,
    Tr=0.1) annotation (Placement(transformation(extent={{-240,-40},{-200,0}})));
  Modelica.Blocks.Math.Gain gain2P0pu(k=1/100) annotation (Placement(
        transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={-126,-80})));
  Modelica.Blocks.Sources.Ramp     Vref(
    height=0.1,
    duration=1,
    offset=0.5,
    startTime=66)
    annotation (Placement(transformation(extent={{-340,158},{-320,178}})));
  Modelica.Blocks.Sources.Ramp     Vref1(
    height=-0.1,
    duration=1.0,
    offset=0.5,
    startTime=50)
    annotation (Placement(transformation(extent={{-340,120},{-320,140}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-300,140},{-280,160}})));
  Electrical.GFCs.GFMs.REGFMA1.PQLimitersAndCntrlSchemes.QVdrpCntrlSchemeQLim
    q_v_droop_scheme(
    QVFlag_val_k=true,
    VFlag_val_k=true,
    mq=0.01)
    annotation (Placement(transformation(extent={{-240,124},{-200,160}})));
  Modelica.Blocks.Sources.RealExpression sig_Pmeas(y=VS.P_meas)
    annotation (Placement(transformation(extent={{-278,-38},{-258,-18}})));
  Modelica.Blocks.Sources.RealExpression sig_q0(y=VS.q0)
    annotation (Placement(transformation(extent={{-338,90},{-318,110}})));
  Modelica.Blocks.Math.Gain gain2Q0pu(k=1/100) annotation (Placement(
        transformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
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
  Electrical.GFCs.GFMs.REGFMA1.PQLimitersAndCntrlSchemes.Plimiter plimiter
    annotation (Placement(transformation(extent={{-260,-100},{-220,-140}})));
  Electrical.GFCs.GFMs.REGFMA1.BasicComponentsAndCntrlSchemes.LPFilter Pfilt
    annotation (Placement(transformation(extent={{-300,-130},{-280,-110}})));
  Modelica.Blocks.Sources.RealExpression sig_Pmeas_4pfilt(y=VS.P_meas)
    annotation (Placement(transformation(extent={{-330,-130},{-310,-110}})));
  Electrical.GFCs.GFMs.REGFMA1.PQLimitersAndCntrlSchemes.Qlimiter qlimiter
    annotation (Placement(transformation(extent={{-280,80},{-240,40}})));
  Modelica.Blocks.Sources.RealExpression sig_Qmeas_4qfilt(y=VS.Q_meas)
    annotation (Placement(transformation(extent={{-340,50},{-320,70}})));
  Electrical.GFCs.GFMs.REGFMA1.BasicComponentsAndCntrlSchemes.LPFilter Qfilt(y0val=
        5.416582/100)
    annotation (Placement(transformation(extent={{-310,50},{-290,70}})));
  Modelica.Blocks.Math.Add3 add3_1_Pref
    annotation (Placement(transformation(extent={{-320,-20},{-300,0}})));
  Modelica.Blocks.Sources.Ramp Pstep(
    height=0.1,
    duration=5,
    offset=0.4,
    startTime=2.5)
    annotation (Placement(transformation(extent={{-380,-12},{-360,8}})));
  Modelica.Blocks.Sources.Pulse Pfilt_upper(
    amplitude=8,
    period=2,
    nperiod=1,
    offset=0.1,
    startTime=5.0)
    annotation (Placement(transformation(extent={{-380,-60},{-360,-40}})));
  Modelica.Blocks.Sources.Pulse Pfilt_lower(
    amplitude=-0.5,
    period=3,
    nperiod=1,
    offset=0.2,
    startTime=40)
    annotation (Placement(transformation(extent={{-380,-100},{-360,-80}})));
equation
  connect(basic_dROOP.Edelta0, VS.delta0) annotation (Line(points={{-212,
          -42},{-212,-60},{-90,-60},{-90,-20}},
                                          color={0,0,127}));
  connect(VS.p0, gain2P0pu.u) annotation (Line(points={{-82,-20},{-84,-20},
          {-84,-80},{-116.4,-80}},
                        color={0,0,127}));
  connect(gain2P0pu.y, basic_dROOP.Pout0) annotation (Line(points={{-134.8,
          -80},{-228,-80},{-228,-42}},
                                  color={0,0,127}));
  connect(Vref.y, add.u1) annotation (Line(points={{-319,168},{-312,168},
          {-312,156},{-302,156}},
                      color={0,0,127}));
  connect(Vref1.y, add.u2) annotation (Line(points={{-319,130},{-314,130},
          {-314,144},{-302,144}},
                          color={0,0,127}));
  connect(q_v_droop_scheme.Vref, add.y) annotation (Line(points={{-242,
          151},{-274,151},{-274,150},{-279,150}},
                                          color={0,0,127}));
  connect(sig_Pmeas.y, basic_dROOP.Pmeas) annotation (Line(points={{-257,
          -28},{-242,-28}},                       color={0,0,127}));
  connect(sig_q0.y, gain2Q0pu.u)
    annotation (Line(points={{-317,100},{-301.6,100}},
                                                     color={0,0,127}));
  connect(gain2Q0pu.y, q_v_droop_scheme.Qout0) annotation (Line(points={{-283.2,
          100},{-228,100},{-228,122.2}},     color={0,0,127}));
  connect(sig_E0.y, q_v_droop_scheme.Emag0) annotation (Line(points={{-209,98},
          {-212,98},{-212,122.2}},         color={0,0,127}));
  connect(sig_Qmeas.y, q_v_droop_scheme.Qmeas) annotation (Line(points={{-279,
          126},{-276,127.6},{-242,127.6}},   color={0,0,127}));
  connect(sig_Vmeas.y, q_v_droop_scheme.Vmeas) annotation (Line(points={{-279,
          180},{-258,180},{-258,156.4},{-242,156.4}},    color={0,0,127}));
  connect(sig_V0.y, q_v_droop_scheme.Vt0) annotation (Line(points={{-209,
          174},{-220,174},{-220,161.8}}, color={0,0,127}));
  connect(q_v_droop_scheme.Edroop, VS.uEmag) annotation (Line(points={{-199,
          142},{-140,142},{-140,10},{-106,10}},    color={0,0,127}));
  connect(basic_dROOP.delta_droop, VS.uEang) annotation (Line(points={{-199,
          -12},{-114,-12},{-114,-6},{-106,-6}},      color={0,0,127}));
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
  connect(add3_1_Pref.y, basic_dROOP.Pref) annotation (Line(points={{-299,
          -10},{-299,-12},{-242,-12}}, color={0,0,127}));
  connect(Pstep.y, add3_1_Pref.u1)
    annotation (Line(points={{-359,-2},{-322,-2}}, color={0,0,127}));
  connect(Pfilt_upper.y, add3_1_Pref.u2) annotation (Line(points={{-359,
          -50},{-348,-50},{-348,-10},{-322,-10}}, color={0,0,127}));
  connect(Pfilt_lower.y, add3_1_Pref.u3) annotation (Line(points={{-359,
          -90},{-340,-90},{-340,-18},{-322,-18}}, color={0,0,127}));
  connect(VS.p, GEN1.p) annotation (Line(points={{-60,2},{-46,2},{-46,0},{-30,0}},
        color={0,0,255}));
  annotation (experiment(
      StopTime=60,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"),                                 Diagram(
        coordinateSystem(extent={{-400,-200},{100,200}}, initialScale=0.5)),
    Icon(coordinateSystem(initialScale=0.5)),
    Documentation(info="<html>
Illustrates how to combine the different components in this sub-package to create the 
<code>REGFMA1PQLimiters</code> model.
</html>"));
end CombiningComponents;
