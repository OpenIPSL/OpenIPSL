within OpenIPSL.Electrical.GFCs.GFMs;
model REGFM_A1_Light
  "Grid Following Converter with droop type REGFM_A1 \"light\" (No Limiters)"
  import Modelica;
  outer OpenIPSL.Electrical.SystemBase SysData;
  BasicComponentsAndCntrlSchemes.VSIO_for_GFM VS(
    fn=fn,
    M_b=M_b,
    R_a=R_a,
    X_d=X_d,
    S_b=S_b,
    P_0=P_0,
    Q_0=Q_0,
    v_0=v_0,
    angle_0=angle_0)
    annotation (Placement(transformation(extent={{20,-20},{60,20}})));
  BasicComponentsAndCntrlSchemes.pf_droop_scheme_nolims pfdroopcntrl(
    f0=f0,
    mp=mp,
    Tr=Tr) annotation (Placement(transformation(extent={{-40,-60},{0,-20}})));
  Modelica.Blocks.Math.Gain gain2P0pu(k=VS.M_b/VS.S_b)
                                              annotation (Placement(
        transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={12,-86})));
  BasicComponentsAndCntrlSchemes.qv_droop_scheme_nolims q_v_droop_scheme(
    Tr=qTr,
    EMax=EMax,
    EMin=EMin,
    QVFlag_val_k=true,
    VFlag_val_k=true,
    kpv=kpv,
    kiv=kiv,
    mq=mq) annotation (Placement(transformation(extent={{-40,40},{0,76}})));
  Modelica.Blocks.Sources.RealExpression sig_Pmeas(y=VS.P_meas)
    annotation (Placement(transformation(extent={{-82,-58},{-62,-38}})));
  Modelica.Blocks.Sources.RealExpression sig_q0(y=VS.q0)
    annotation (Placement(transformation(extent={{-84,-10},{-64,10}})));
  Modelica.Blocks.Math.Gain gain2Q0pu(k=VS.M_b/VS.S_b)
                                               annotation (Placement(
        transformation(
        extent={{-8,-8},{8,8}},
        rotation=0,
        origin={-50,0})));
  Modelica.Blocks.Sources.RealExpression sig_E0(y=VS.E0) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-12,4})));
  Modelica.Blocks.Sources.RealExpression sig_Qmeas(y=VS.Q_meas)
    annotation (Placement(transformation(extent={{-84,20},{-64,40}})));
  Modelica.Blocks.Sources.RealExpression sig_Vmeas(y=VS.V) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,80})));
  Modelica.Blocks.Sources.RealExpression sig_V0(y=VS.vt0) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-10,94})));
  Interfaces.PwPin                     p1 annotation (Placement(transformation(
          rotation=0, extent={{99,-9},{118,10}}), iconTransformation(extent={{100,
            -20},{140,20}})));
  Modelica.Blocks.Interfaces.RealInput Pref "Active power reference"
                                            annotation (Placement(
        transformation(rotation=0, extent={{-131,-75},{-101,-45}})));
  Modelica.Blocks.Interfaces.RealInput Vref "Reference voltage input"
                                            annotation (Placement(
        transformation(rotation=0, extent={{-131,45},{-101,75}})));

  parameter Real M_b=100 "Voltage Source base power rating (MVA)"
    annotation (Dialog(tab="Voltage Source parameters"));
  parameter Real R_a=1e-3 "Internal source resistance, pu, system base"
    annotation (Dialog(tab="Voltage Source parameters"));
  parameter Real X_d=0.2 "Internal source d-axis reactance, pu, system base"
    annotation (Dialog(tab="Voltage Source parameters"));
  parameter Real f0=SysData.fn "Synchronous frequency, f0 = 60 Hz" annotation (Dialog(
        tab="P-f Droop", group="P-f droop controller parameters"));
  parameter Real mp=0.01 "P-f droop gain. Normal range: 0.005 - 0.05 pu."
    annotation (Dialog(tab="P-f Droop", group="P-f droop controller parameters"));
  parameter Real Tr=0.1
    "Filter time constant, sec. Normal Range: [0.01 - 0.1 sec.]" annotation (
      Dialog(tab="P-f Droop", group="P-f droop controller parameters"));
  parameter Real qTr=0.01 "Filter time constant. Range: [0.01 - 0.1 sec.]"
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
  Modelica.Blocks.Sources.RealExpression sigPmeas(y=VS.P_meas) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,90})));
  Modelica.Blocks.Sources.RealExpression sigQmeas(y=VS.Q_meas) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,70})));
  Modelica.Blocks.Sources.RealExpression sigVmeas(y=VS.V) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={80,-20})));
  Modelica.Blocks.Sources.RealExpression siganglevmeas(y=VS.anglev)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={80,-40})));
  Modelica.Blocks.Sources.RealExpression sigaEmag(y=VS.Emag) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={80,-60})));
  Modelica.Blocks.Sources.RealExpression sigaEdelta(y=VS.Edelta) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={80,-80})));
  Modelica.Blocks.Interfaces.RealOutput P_meas "VS P measurement" annotation
    (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,90})));
  Modelica.Blocks.Interfaces.RealOutput Q_meas "VS Q meas"
                                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,70})));
  Modelica.Blocks.Interfaces.RealOutput V "VS terminal voltage" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,-20})));
  Modelica.Blocks.Interfaces.RealOutput anglev "VS terminal angle"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,-40})));
  Modelica.Blocks.Interfaces.RealOutput Emag
    "Internal voltage source voltage magnitude E"
                                      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,-60})));
  Modelica.Blocks.Interfaces.RealOutput Edelta
    "Internal voltage source angle delta"
                                      annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,-80})));
  Modelica.Blocks.Interfaces.RealOutput omega_droop
    "Speed output from the P-f droop controller"
    annotation (Placement(transformation(extent={{100,-110},{120,-90}})));
  parameter Types.ApparentPower S_b=SysData.S_b "System base power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ActivePower P_0=40e6 "Initial active power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ReactivePower Q_0=5.416582e6
 "Initial reactive power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit v_0=1.0 "Initial voltage magnitude"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Angle angle_0=4.038907 "Initial voltage angle"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Frequency fn=SysData.fn "System frequency (Hz)"
    annotation (Dialog(group="Power flow data"));
equation
  connect(pfdroopcntrl.Edelta0, VS.delta0) annotation (Line(points={{-12,-62},{-12,
          -70},{32,-70},{32,-22}}, color={0,0,127}));
  connect(VS.p0,gain2P0pu. u) annotation (Line(points={{40,-22},{40,-86},{21.6,-86}},
                        color={0,0,127}));
  connect(gain2P0pu.y, pfdroopcntrl.Pout0)
    annotation (Line(points={{3.2,-86},{-28,-86},{-28,-62}}, color={0,0,127}));
  connect(sig_Pmeas.y, pfdroopcntrl.Pmeas)
    annotation (Line(points={{-61,-48},{-42,-48}}, color={0,0,127}));
  connect(sig_q0.y,gain2Q0pu. u)
    annotation (Line(points={{-63,0},{-59.6,0}},     color={0,0,127}));
  connect(gain2Q0pu.y,q_v_droop_scheme. Qout0) annotation (Line(points={{-41.2,0},
          {-28,0},{-28,38.2}},               color={0,0,127}));
  connect(sig_E0.y,q_v_droop_scheme. Emag0) annotation (Line(points={{-12,15},{-12,
          38.2}},                          color={0,0,127}));
  connect(sig_Qmeas.y,q_v_droop_scheme. Qmeas) annotation (Line(points={{-63,30},
          {-63,43.6},{-42,43.6}},            color={0,0,127}));
  connect(sig_Vmeas.y,q_v_droop_scheme. Vmeas) annotation (Line(points={{-59,80},
          {-42,80},{-42,72.4}},                          color={0,0,127}));
  connect(sig_V0.y,q_v_droop_scheme. Vt0) annotation (Line(points={{-21,94},{
          -20,94},{-20,77.8}},           color={0,0,127}));
  connect(q_v_droop_scheme.Edroop, VS.uEmag) annotation (Line(points={{1,58},{8,
          58},{8,8},{16,8}},              color={0,0,127}));
  connect(pfdroopcntrl.delta_droop, VS.uEang) annotation (Line(points={{1,-32},{
          8,-32},{8,-8},{16,-8}}, color={0,0,127}));
  connect(p1, VS.p)
    annotation (Line(points={{108.5,0.5},{106,0},{62,0}}, color={0,0,0}));
  connect(Pref, pfdroopcntrl.Pref) annotation (Line(points={{-116,-60},{-96,-60},
          {-96,-32},{-42,-32}}, color={0,0,127}));
  connect(Vref, q_v_droop_scheme.Vref) annotation (Line(points={{-116,60},{-84,60},
          {-84,67},{-42,67}},       color={0,0,127}));
  connect(sigPmeas.y,P_meas)
    annotation (Line(points={{81,90},{110,90}},     color={0,0,127}));
  connect(sigQmeas.y,Q_meas)
    annotation (Line(points={{81,70},{110,70}},     color={0,0,127}));
  connect(sigVmeas.y,V)
    annotation (Line(points={{91,-20},{110,-20}},   color={0,0,127}));
  connect(siganglevmeas.y,anglev)
    annotation (Line(points={{91,-40},{110,-40}},   color={0,0,127}));
  connect(sigaEmag.y,Emag)
    annotation (Line(points={{91,-60},{110,-60}}, color={0,0,127}));
  connect(sigaEdelta.y,Edelta)
    annotation (Line(points={{91,-80},{110,-80}}, color={0,0,127}));
  connect(pfdroopcntrl.omega_droop, omega_droop) annotation (Line(points={{1,
          -48},{60,-48},{60,-100},{110,-100}}, color={0,0,127}));
  annotation (Icon(graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          lineThickness=1),
        Text(
          extent={{-80,80},{80,40}},
          textColor={0,170,255},
          textString="REGFM_A1 \"light\""),
        Text(
          extent={{-80,-100},{80,-140}},
          textColor={28,108,200},
          textString="%name"),
        Rectangle(extent={{0,40},{80,-40}},       lineColor={28,108,200},
          lineThickness=1),
        Line(points={{80,-40},{0,40}},       color={28,108,200},
          thickness=1),
        Line(
          points={{12,-12},{32,-12}},
          color={28,108,200},
          thickness=1,
          smooth=Smooth.Bezier),
        Ellipse(
          extent={{56,18},{76,-2}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.None,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Ellipse(
          extent={{36,-2},{56,18}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.None,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Ellipse(
          extent={{54,34},{74,14}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.None,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Ellipse(
          extent={{34,14},{54,34}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.None,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Rectangle(extent={{-70,20},{-28,-20}},    lineColor={28,108,200},
          lineThickness=1,
          fillColor={0,203,203},
          fillPattern=FillPattern.Solid),
      Polygon(
        points={{-10,0},{10,6},{10,-6},{-10,0}},
        lineColor={28,108,200},
        fillColor={28,108,200},
        fillPattern=FillPattern.Solid,
          origin={-70,0},
          rotation=180),
        Text(
          extent={{-62,12},{-34,-12}},
          textColor={28,108,200},
          textString="D"),
      Polygon(
        points={{-2,0},{-22,6},{-22,-6},{-2,0}},
        lineColor={28,108,200},
        fillColor={28,108,200},
        fillPattern=FillPattern.Solid),
      Polygon(
        points={{10,0},{-10,6},{-10,-6},{10,0}},
        lineColor={28,108,200},
        fillColor={28,108,200},
        fillPattern=FillPattern.Solid,
          origin={-50,-18},
          rotation=90),
        Line(
          points={{-96,0},{-78,0}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-28,0},{-10,0}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{12,-18},{32,-18}},
          color={28,108,200},
          thickness=1,
          smooth=Smooth.Bezier),
        Line(
          points={{80,0},{100,0}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-50,-22},{-50,-40}},
          color={28,108,200},
          thickness=1),      Rectangle(
          extent={{-80,-50},{80,-90}},
          lineColor={0,128,255},
          fillColor={234,234,234},
          fillPattern=FillPattern.Solid), Text(
          extent={{-60,-50},{60,-90}},
          textColor={28,108,200},
          textString="No P&Q Lims")}));
end REGFM_A1_Light;
