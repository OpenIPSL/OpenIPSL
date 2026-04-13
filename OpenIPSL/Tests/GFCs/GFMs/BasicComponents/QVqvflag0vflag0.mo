within OpenIPSL.Tests.GFCs.GFMs.BasicComponents;
model QVqvflag0vflag0
  "Tests the Q-v control scheme with QVFLAG = 0 and VFLAG = 0"
  extends Modelica.Icons.Example;
  Electrical.GFCs.GFMs.REGFMA1.BasicComponentsAndCntrlSchemes.QVdrpCntrlScheme q_v_droop_scheme(
      QVFlag_val_k=false, VFlag_val_k=false)
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
        origin={10,56})));
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
          {{-82,50},{-94,50},{-94,78},{54,78},{54,0},{42,0}}, color={0,0,
          127}));
  connect(Q0.y, q_v_droop_scheme.Qout0) annotation (Line(points={{-59,-50},
          {-24,-50},{-24,-52},{-16,-52},{-16,-44}}, color={0,0,127}));
  connect(E0.y, q_v_droop_scheme.Emag0) annotation (Line(points={{59,-50},
          {24,-50},{24,-52},{16,-52},{16,-44}}, color={0,0,127}));
  connect(V0.y, q_v_droop_scheme.Vt0) annotation (Line(points={{-1,56},{0,56},{
          0,44}},            color={0,0,127}));
  annotation (Diagram(graphics={
        Text(
          extent={{6,-74},{86,-100}},
          textColor={28,108,200},
          textString="VFlag = 0 
Set --> E Limited"),
        Text(
          extent={{-92,-74},{-2,-102}},
          textColor={28,108,200},
          textString="QVFlag = 0 
Set --> Qref = Qinv")}),
                   experiment(StopTime=10),
    Documentation(info="<html>
Tests the Q-v droop control scheme without limiters. Applies the switches with:
<code>
QVFLAG = 0 </code> and
<code>
VFLAG =0
</code>

</html>"));
end QVqvflag0vflag0;
