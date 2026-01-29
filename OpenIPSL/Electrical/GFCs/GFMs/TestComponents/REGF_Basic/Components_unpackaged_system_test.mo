within OpenIPSL.Electrical.GFCs.GFMs.TestComponents.REGF_Basic;
model Components_unpackaged_system_test
  "Test the three components of the REGF_A1_Light model in a power system"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=1e-6,
      X=1e-3,
      t1=62.0,
      t2=62.15));
  Modelica.Blocks.Sources.Ramp Pstep(
    height=0.1,
    duration=5,
    offset=0.4,
    startTime=20)
    annotation (Placement(transformation(extent={{-340,0},{-320,20}})));
  BasicComponentsAndCntrlSchemes.VSIO_for_GFM VS(
    fn=60,
    M_b=100)
    annotation (Placement(transformation(extent={{-102,-20},{-62,20}})));
  BasicComponentsAndCntrlSchemes.pf_droop_scheme_nolims basic_dROOP(
    f0=60,
    mp=0.01,
    Tr=0.1) annotation (Placement(transformation(extent={{-260,-38},{-220,2}})));
  Modelica.Blocks.Math.Gain gain2P0pu(k=1/100) annotation (Placement(
        transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={-126,-80})));
  Modelica.Blocks.Sources.Ramp     Vref(
    height=0.1,
    duration=1,
    offset=0.5,
    startTime=46)
    annotation (Placement(transformation(extent={{-340,100},{-320,120}})));
  Modelica.Blocks.Sources.Ramp     Vref1(
    height=-0.1,
    duration=1.0,
    offset=0.5,
    startTime=40)
    annotation (Placement(transformation(extent={{-340,62},{-320,82}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-300,82},{-280,102}})));
  BasicComponentsAndCntrlSchemes.qv_droop_scheme_nolims q_v_droop_scheme(
    QVFlag_val_k=true,
    VFlag_val_k=true,
    mq=0.01)
    annotation (Placement(transformation(extent={{-240,66},{-200,102}})));
  Modelica.Blocks.Sources.RealExpression sig_Pmeas(y=VS.P_meas)
    annotation (Placement(transformation(extent={{-318,-42},{-298,-22}})));
  Modelica.Blocks.Sources.RealExpression sig_q0(y=VS.q0)
    annotation (Placement(transformation(extent={{-300,28},{-280,48}})));
  Modelica.Blocks.Math.Gain gain2Q0pu(k=1/100) annotation (Placement(
        transformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
        origin={-254,38})));
  Modelica.Blocks.Sources.RealExpression sig_E0(y=VS.E0) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-198,40})));
  Modelica.Blocks.Sources.RealExpression sig_Qmeas(y=VS.Q_meas)
    annotation (Placement(transformation(extent={{-300,58},{-280,78}})));
  Modelica.Blocks.Sources.RealExpression sig_Vmeas(y=VS.V) annotation (
      Placement(transformation(extent={{-300,112},{-280,132}})));
  Modelica.Blocks.Sources.RealExpression sig_V0(y=VS.vt0) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-198,116})));
equation
  connect(basic_dROOP.Edelta0, VS.delta0) annotation (Line(points={{-232,-40},{
          -232,-60},{-90,-60},{-90,-22}}, color={0,0,127}));
  connect(VS.p0, gain2P0pu.u) annotation (Line(points={{-82,-22},{-84,-22},{-84,
          -80},{-116.4,-80}},
                        color={0,0,127}));
  connect(gain2P0pu.y, basic_dROOP.Pout0) annotation (Line(points={{-134.8,
          -80},{-248,-80},{-248,-40}},
                                  color={0,0,127}));
  connect(Vref.y, add.u1) annotation (Line(points={{-319,110},{-312,110},
          {-312,98},{-302,98}},
                      color={0,0,127}));
  connect(Vref1.y, add.u2) annotation (Line(points={{-319,72},{-314,72},{
          -314,86},{-302,86}},
                          color={0,0,127}));
  connect(q_v_droop_scheme.Vref, add.y) annotation (Line(points={{-242,93},
          {-274,93},{-274,92},{-279,92}}, color={0,0,127}));
  connect(Pstep.y, basic_dROOP.Pref) annotation (Line(points={{-319,10},{
          -280,10},{-280,-10},{-262,-10}}, color={0,0,127}));
  connect(sig_Pmeas.y, basic_dROOP.Pmeas) annotation (Line(points={{-297,
          -32},{-280,-32},{-280,-26},{-262,-26}}, color={0,0,127}));
  connect(sig_q0.y, gain2Q0pu.u)
    annotation (Line(points={{-279,38},{-263.6,38}}, color={0,0,127}));
  connect(gain2Q0pu.y, q_v_droop_scheme.Qout0) annotation (Line(points={{
          -245.2,38},{-228,38},{-228,64.2}}, color={0,0,127}));
  connect(sig_E0.y, q_v_droop_scheme.Emag0) annotation (Line(points={{
          -209,40},{-212,40},{-212,64.2}}, color={0,0,127}));
  connect(sig_Qmeas.y, q_v_droop_scheme.Qmeas) annotation (Line(points={{
          -279,68},{-276,69.6},{-242,69.6}}, color={0,0,127}));
  connect(sig_Vmeas.y, q_v_droop_scheme.Vmeas) annotation (Line(points={{
          -279,122},{-258,122},{-258,98.4},{-242,98.4}}, color={0,0,127}));
  connect(sig_V0.y, q_v_droop_scheme.Vt0) annotation (Line(points={{-209,
          116},{-220,116},{-220,103.8}}, color={0,0,127}));
  connect(q_v_droop_scheme.Edroop, VS.uEmag) annotation (Line(points={{-199,84},
          {-134,84},{-134,8},{-106,8}},            color={0,0,127}));
  connect(basic_dROOP.delta_droop, VS.uEang) annotation (Line(points={{-219,-10},
          {-134,-10},{-134,-8},{-106,-8}},           color={0,0,127}));
  connect(VS.p, GEN1.p)
    annotation (Line(points={{-60,0},{-30,0}}, color={0,0,255}));
  annotation (experiment(
      StopTime=120,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"),                                 Diagram(
        coordinateSystem(extent={{-400,-200},{400,200}}, initialScale=0.5)));
end Components_unpackaged_system_test;
