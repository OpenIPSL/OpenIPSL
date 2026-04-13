within OpenIPSL.Electrical.GFCs.GFMs.TestComponents.BasicComponents;
model qv_droop_scheme_qvflag_1_vflag_0
  "Tests the qv_droop_scheme with QVFLAG = 1 and VFLAG 0"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.GFCs.GFMs.BasicComponentsAndCntrlSchemes.qv_droop_scheme_nolims
    q_v_droop_scheme(QVFlag_val_k=true, VFlag_val_k=false)
    annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
  Modelica.Blocks.Sources.Step Vstep(
    height=0.1,
    offset=1.0,
    startTime=2)
    annotation (Placement(transformation(extent={{-100,10},{-80,30}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    k=0.95,
    T=0.001,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=0.997)
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  Modelica.Blocks.Sources.Step Qmeas(
    height=0.6,
    offset=5.416582/100,
    startTime=5)
    annotation (Placement(transformation(extent={{-100,-20},{-80,0}})));
  Modelica.Blocks.Interfaces.RealOutput Edroop
    "Internal voltage magnitude modulation specified by the droop controller"
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Sources.Constant Q0(k=5.416582/100)
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  Modelica.Blocks.Sources.Constant E0(k=1.049780011) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={70,-50})));
  Modelica.Blocks.Sources.Constant V0(k=1.0) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={14,54})));
equation
  connect(Vstep.y, q_v_droop_scheme.Vref)
    annotation (Line(points={{-79,20},{-44,20}}, color={0,0,127}));
  connect(firstOrder.y, q_v_droop_scheme.Vmeas) annotation (Line(points={
          {-59,50},{-52,50},{-52,32},{-44,32}}, color={0,0,127}));
  connect(Qmeas.y, q_v_droop_scheme.Qmeas) annotation (Line(points={{-79,
          -10},{-54,-10},{-54,-32},{-44,-32}}, color={0,0,127}));
  connect(q_v_droop_scheme.Edroop, Edroop)
    annotation (Line(points={{42,0},{70,0}}, color={0,0,127}));
  connect(firstOrder.u, q_v_droop_scheme.Edroop) annotation (Line(points=
          {{-82,50},{-96,50},{-96,70},{52,70},{52,0},{42,0}}, color={0,0,
          127}));
  connect(Q0.y, q_v_droop_scheme.Qout0) annotation (Line(points={{-59,-50},
          {-24,-50},{-24,-52},{-16,-52},{-16,-44}}, color={0,0,127}));
  connect(E0.y, q_v_droop_scheme.Emag0) annotation (Line(points={{59,-50},
          {24,-50},{24,-52},{16,-52},{16,-44}}, color={0,0,127}));
  connect(V0.y, q_v_droop_scheme.Vt0) annotation (Line(points={{3,54},{0,54},{0,
          44}},              color={0,0,127}));
  annotation (Diagram(graphics={
        Text(
          extent={{10,-72},{90,-98}},
          textColor={28,108,200},
          textString="VFlag = 0 
Set --> E Limited"),
        Text(
          extent={{-84,-74},{-4,-100}},
          textColor={28,108,200},
          textString="QVFlag = 1 
Set --> Qref = 0")}),
                experiment(StopTime=10));
end qv_droop_scheme_qvflag_1_vflag_0;
