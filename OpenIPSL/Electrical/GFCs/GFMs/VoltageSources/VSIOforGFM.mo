within OpenIPSL.Electrical.GFCs.GFMs.VoltageSources;
model VSIOforGFM
  "Extends the VS Droop model with additional outputs to interface with the GFM converter"
  import Modelica;
  outer OpenIPSL.Electrical.SystemBase SysData;
  Sources.SourceBehindImpedance.VoltageSources.VSourceIO VS(
    S_b=S_b,
    fn=fn,
    P_0=P_0,
    Q_0=Q_0,
    v_0=v_0,
    angle_0=angle_0,
    M_b=M_b,
    R_a=R_a,
    X_d=X_d,
    useEphasorInternalAsInput=false)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Interfaces.PwPin p
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Sources.RealExpression Pmeas(y=VS.P) "Active power"
    annotation (Placement(transformation(extent={{60,70},{80,90}})));
  Modelica.Blocks.Sources.RealExpression Qmeas(y=VS.Q) "Reactive power"
    annotation (Placement(transformation(extent={{60,50},{80,70}})));
  Modelica.Blocks.Interfaces.RealOutput P_meas "Active power"
    annotation (Placement(transformation(extent={{100,70},{120,90}})));
  Modelica.Blocks.Interfaces.RealOutput Q_meas "Reactive power"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput Emag "Internal voltage magnitude"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
  Modelica.Blocks.Interfaces.RealOutput Edelta "Internal voltage angle"
    annotation (Placement(transformation(extent={{100,-90},{120,-70}})));
  Modelica.Blocks.Interfaces.RealOutput V "Terminal voltage"
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput anglev "Terminal voltage angle"
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
  Modelica.Blocks.Sources.RealExpression Vmeas(y=VS.V)
    "Terminal voltage magnitude"
    annotation (Placement(transformation(extent={{60,30},{80,50}})));
  Modelica.Blocks.Sources.RealExpression anglevmeas(y=VS.anglev)
    "Terminal voltage angle"
    annotation (Placement(transformation(extent={{60,10},{80,30}})));
  Modelica.Blocks.Interfaces.RealOutput E0
    "Internal voltage magnitude start value" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,-110})));
  Modelica.Blocks.Interfaces.RealOutput delta0
    "Internal voltage angle start value" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-40,-110})));
  Modelica.Blocks.Interfaces.RealInput uEmag
    "Input to vary the voltage magnitude of the voltage source"
    annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput uEang
    "Input to vary the angle of the voltage source"
    annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));

  Modelica.Blocks.Sources.Constant p0meas(k=VS.P_0)
    "Active power start value" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-50})));
  Modelica.Blocks.Interfaces.RealOutput p0 "Active power start value"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-110})));
  Modelica.Blocks.Sources.Constant q0meas(k=VS.Q_0)
    "Reactive power start value" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,-50})));
  Modelica.Blocks.Interfaces.RealOutput q0 "Reactive power start value"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,-110})));
  Modelica.Blocks.Sources.Constant vt0meas(k=VS.v_0)
    "Terminal voltage magnitude start value" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={70,-50})));
  Modelica.Blocks.Interfaces.RealOutput vt0 "Connector of Real output signal"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={70,-110})));
  parameter Types.ApparentPower S_b=SysData.S_b "System base power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Frequency fn = SysData.fn "System frequency (Hz)";
  parameter Types.ActivePower P_0=40e6 "Initial active power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ReactivePower Q_0=5.416582e6 "Initial reactive power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit v_0=1.0 "Initial voltage magnitude"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Angle angle_0=4.038907 "Initial voltage angle"
    annotation (Dialog(group="Power flow data"));
  parameter Real M_b=100 "Voltage Source base power rating (MVA)"
    annotation (Dialog(tab="Voltage Source parameters"));
  parameter Real R_a=1e-3 "Internal source resistance, pu, system base"
    annotation (Dialog(tab="Voltage Source parameters"));
  parameter Real X_d=0.2 "Internal source d-axis reactance, pu, system base"
    annotation (Dialog(tab="Voltage Source parameters"));
equation
  connect(Pmeas.y, P_meas) annotation (Line(
      points={{81,80},{110,80}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(Qmeas.y, Q_meas) annotation (Line(
      points={{81,60},{110,60}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(VS.Emag, Emag) annotation (Line(points={{22,12},{50,12},{50,-6},{76,-6},
          {76,-40},{110,-40}},
                     color={0,0,127}));
  connect(VS.Edelta, Edelta) annotation (Line(points={{22,-12},{46,-12},{46,-80},
          {110,-80}}, color={0,0,127}));
  connect(Vmeas.y, V)
    annotation (Line(points={{81,40},{110,40}}, color={0,0,127}));
  connect(anglevmeas.y, anglev)
    annotation (Line(points={{81,20},{110,20}}, color={0,0,127}));
  connect(p0meas.y, p0)
    annotation (Line(points={{0,-61},{0,-110}}, color={0,0,127}));
  connect(q0meas.y, q0)
    annotation (Line(points={{30,-61},{30,-110}}, color={0,0,127}));
  connect(vt0meas.y, vt0)
    annotation (Line(points={{70,-61},{70,-110}}, color={0,0,127}));
  connect(VS.p, p) annotation (Line(points={{22,0},{110,0}}, color={0,0,0}));
  connect(uEmag, VS.uDEmag) annotation (Line(points={{-120,40},{-40,40},{-40,12},
          {-24,12}}, color={0,0,127}));
  connect(VS.uDEang, uEang) annotation (Line(points={{-24,-12},{-96,-12},{-96,-40},
          {-120,-40}}, color={0,0,127}));
  connect(VS.Emag0, E0) annotation (Line(points={{0,22},{0,30},{-80,30},{-80,-110}},
        color={0,0,127}));
  connect(VS.Eang0, delta0) annotation (Line(points={{0,-22},{0,-28},{-40,-28},{
          -40,-110}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          lineThickness=1),
        Text(
          extent={{-100,142},{100,100}},
          textColor={28,108,200},
          textString="%name"),
        Ellipse(extent={{-80,80},{80,-80}},lineColor={215,215,215},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{3,8},{7,-2},{-1,-2},{3,8}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          origin={-46,3},
          rotation=270),
        Line(
          points={{-58,40},{-58,0}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-58,-40},{-58,0}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-58,0},{-38,0}},
          color={28,108,200},
          thickness=1),
        Ellipse(extent={{-38,40},{42,-40}},lineColor={28,108,200},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-18,-10},{2,10}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Ellipse(
          extent={{2,10},{22,-10}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.None,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Line(
          points={{42,0},{102,0}},
          color={0,0,255},
          thickness=1),
        Line(
          points={{-98,40},{-58,40}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-98,-40},{-58,-40}},
          color={28,108,200},
          thickness=1)}),                                        Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
This model extends the voltage source with an impedance model <code>OpenIPSL.Electrical.Sources.SourceBehindImpedance.VoltageSources.VSourceIO</code>.
It expands the afromentioned model to provide additional outputs, which are later used as measurements or for initialization by the different control blocks.
<p>
The 
</p>
</html>"));
end VSIOforGFM;
