within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.Variants.Light;
model CombiningComponents
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
    offset=0,
    startTime=20)
    annotation (Placement(transformation(extent={{-320,-50},{-300,-30}})));
  Electrical.GFCs.GFMs.VoltageSources.VSIOforGFM VS(fn=60)
    annotation (Placement(transformation(extent={{-102,-20},{-62,20}})));
  Electrical.GFCs.GFMs.REGFMA1.Components.BasicComponentsAndCntrlSchemes.PFdrpScheme basic_dROOP(
    f0=60,
    mp=0.01,
    Tr=0.1)
    annotation (Placement(transformation(extent={{-260,-80},{-220,-40}})));
  Modelica.Blocks.Math.Gain gain2P0pu(k=1/VS.M_b) "Initial active power (W) to pu on the source base" annotation (Placement(
        transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={-126,-120})));
  Modelica.Blocks.Sources.Ramp Vref(
    height=0.1,
    duration=1,
    offset=0,
    startTime=46)
    annotation (Placement(transformation(extent={{-360,58},{-340,78}})));
  Modelica.Blocks.Sources.Ramp Vref1(
    height=-0.1,
    duration=1.0,
    offset=0,
    startTime=40)
    annotation (Placement(transformation(extent={{-360,20},{-340,40}})));
  Modelica.Blocks.Math.Add3 add "Vref = Vref0 of the initial operating point plus the two ramps"
    annotation (Placement(transformation(extent={{-320,40},{-300,60}})));
  Modelica.Blocks.Math.Add addPref0 "Pref = Pref0 of the initial operating point plus the ramp"
    annotation (Placement(transformation(extent={{-290,-50},{-276,-36}})));
  Electrical.GFCs.GFMs.REGFMA1.Components.BasicComponentsAndCntrlSchemes.QVdrpCntrlScheme q_v_droop_scheme(
    QVFlag_val_k=true,
    VFlag_val_k=true,
    mq=0.01)
    annotation (Placement(transformation(extent={{-260,24},{-220,60}})));
  Modelica.Blocks.Sources.RealExpression sig_Pmeas(y=VS.P_meas)
    annotation (Placement(transformation(extent={{-318,-84},{-298,-64}})));
  Modelica.Blocks.Sources.RealExpression sig_q0(y=VS.q0)
    annotation (Placement(transformation(extent={{-320,-14},{-300,6}})));
  Modelica.Blocks.Math.Gain gain2Q0pu(k=1/VS.M_b) "Initial reactive power (var) to pu on the source base" annotation (Placement(
        transformation(
        extent={{-8,-8},{8,8}},
        origin={-274,-4})));
  Modelica.Blocks.Sources.RealExpression sig_E0(y=VS.E0) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-218,-2})));
  Modelica.Blocks.Sources.RealExpression sig_Qmeas(y=VS.Q_meas)
    annotation (Placement(transformation(extent={{-320,16},{-300,36}})));
  Modelica.Blocks.Sources.RealExpression sig_Vmeas(y=VS.V) annotation (
      Placement(transformation(extent={{-320,70},{-300,90}})));
  Modelica.Blocks.Sources.RealExpression sig_V0(y=VS.vt0) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-218,74})));
equation
  connect(basic_dROOP.Edelta0, VS.delta0) annotation (Line(points={{-232,-82},{
          -232,-100},{-90,-100},{-90,-22}},
                                          color={0,0,127}));
  connect(VS.p0, gain2P0pu.u) annotation (Line(points={{-82,-22},{-84,-22},{-84,
          -120},{-116.4,-120}},
                        color={0,0,127}));
  connect(gain2P0pu.y, basic_dROOP.Pout0) annotation (Line(points={{-134.8,-120},
          {-248,-120},{-248,-82}},color={0,0,127}));
  connect(Vref.y, add.u1) annotation (Line(points={{-339,68},{-332,68},{-332,58},
          {-322,58}}, color={0,0,127}));
  connect(Vref1.y, add.u2) annotation (Line(points={{-339,30},{-334,30},{-334,
          50},{-322,50}}, color={0,0,127}));
  connect(q_v_droop_scheme.Vref0, add.u3) annotation (Line(points={{-224,21},{-224,
          14},{-328,14},{-328,42},{-322,42}}, color={0,0,127}));
  connect(q_v_droop_scheme.Vref, add.y) annotation (Line(points={{-262,51},{
          -294,51},{-294,50},{-299,50}}, color={0,0,127}));
  connect(Pstep.y, addPref0.u1) annotation (Line(points={{-299,-40},{-291.4,-40},
          {-291.4,-38.8}}, color={0,0,127}));
  connect(addPref0.y, basic_dROOP.Pref) annotation (Line(points={{-275.3,-43},{-270,
          -43},{-270,-52},{-262,-52}}, color={0,0,127}));
  connect(basic_dROOP.Pref0, addPref0.u2) annotation (Line(points={{-240,-81},{-240,
          -90},{-296,-90},{-296,-47.2},{-291.4,-47.2}}, color={0,0,127}));
  connect(sig_Pmeas.y, basic_dROOP.Pmeas) annotation (Line(points={{-297,-74},{
          -280,-74},{-280,-68},{-262,-68}}, color={0,0,127}));
  connect(sig_q0.y, gain2Q0pu.u)
    annotation (Line(points={{-299,-4},{-283.6,-4}}, color={0,0,127}));
  connect(gain2Q0pu.y, q_v_droop_scheme.Qout0) annotation (Line(points={{-265.2,
          -4},{-248,-4},{-248,22.2}}, color={0,0,127}));
  connect(sig_E0.y, q_v_droop_scheme.Emag0) annotation (Line(points={{-229,-2},
          {-232,-2},{-232,22.2}}, color={0,0,127}));
  connect(sig_Qmeas.y, q_v_droop_scheme.Qmeas) annotation (Line(points={{-299,26},
          {-296,27.6},{-262,27.6}}, color={0,0,127}));
  connect(sig_Vmeas.y, q_v_droop_scheme.Vmeas) annotation (Line(points={{-299,80},
          {-278,80},{-278,56.4},{-262,56.4}}, color={0,0,127}));
  connect(sig_V0.y, q_v_droop_scheme.Vt0) annotation (Line(points={{-229,74},{
          -240,74},{-240,61.8}}, color={0,0,127}));
  connect(q_v_droop_scheme.Edroop, VS.uEmag) annotation (Line(points={{-219,42},
          {-154,42},{-154,8},{-106,8}}, color={0,0,127}));
  connect(basic_dROOP.delta_droop, VS.uEang) annotation (Line(points={{-219,-52},
          {-134,-52},{-134,-8},{-106,-8}}, color={0,0,127}));
  connect(VS.p, GEN1.p)
    annotation (Line(points={{-60,0},{-30,0}}, color={0,0,255}));
  annotation (experiment(
      StopTime=120,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"), Diagram(
        coordinateSystem(extent={{-400,-200},{100,100}}, initialScale=0.5,
        grid={2,2})),

    Documentation(info="<html>
<p>
Illustrates how to combine the different components in this sub-package to create the
<code>Variants.Light</code> model.
</p>
<p>
The references start from the outputs <code>basic_dROOP.Pref0</code> and <code>q_v_droop_scheme.Vref0</code>, the references of the initial operating point, so the model starts in steady state.
</p>
</html>"));
end CombiningComponents;
