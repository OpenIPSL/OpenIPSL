within OpenIPSL.Electrical.GFCs.GFMs.TestComponents.Limiters;
model Qlimiter "Tests the Qlimiter"
  extends Modelica.Icons.Example;
  LimitersAndCntrlSchemes.Qlimiter
    Qlim_upper annotation (Placement(transformation(extent={{-20,40},{20,80}})));
  Modelica.Blocks.Sources.Constant Q0_ini(k=0.0)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Sources.Pulse Qfilt_upper(
    amplitude=0.5,
    period=8,
    nperiod=1,
    offset=0,
    startTime=2)
    annotation (Placement(transformation(extent={{-60,50},{-40,70}})));
  Modelica.Blocks.Interfaces.RealOutput Qlim_out_upper
    "Reactive power limiter output signal"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  LimitersAndCntrlSchemes.Qlimiter
    Qlim_lower
    annotation (Placement(transformation(extent={{-20,-20},{20,-60}})));
  Modelica.Blocks.Sources.Pulse Qfilt_lower(
    amplitude=-0.5,
    period=8,
    nperiod=1,
    offset=0.0,
    startTime=2)
    annotation (Placement(transformation(extent={{-60,-50},{-40,-30}})));
  Modelica.Blocks.Interfaces.RealOutput Qlim_out_lower
    "Reactive power limiter output signal"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
equation
  connect(Q0_ini.y,Qlim_upper. Q0_ini)
    annotation (Line(points={{-39,0},{0,0},{0,38}}, color={0,0,127}));
  connect(Qlim_lower.Q0_ini, Q0_ini.y)
    annotation (Line(points={{0,-18},{0,0},{-39,0}}, color={0,0,127}));
  connect(Qfilt_upper.y, Qlim_upper.Qfilt)
    annotation (Line(points={{-39,60},{-22,60}}, color={0,0,127}));
  connect(Qfilt_lower.y, Qlim_lower.Qfilt)
    annotation (Line(points={{-39,-40},{-22,-40}}, color={0,0,127}));
  connect(Qlim_upper.Qlim_out, Qlim_out_upper)
    annotation (Line(points={{21,60},{110,60}}, color={0,0,127}));
  connect(Qlim_lower.Qlim_out, Qlim_out_lower)
    annotation (Line(points={{21,-40},{110,-40}}, color={0,0,127}));
  annotation (experiment(StopTime=10, __Dymola_Algorithm="Dassl"),
      __Dymola_Commands(file(
        description="Plots results",
        ensureSimulated=true,
        autoRun=true) =
        "Resources/Plotting/qlimiter_component_test_plot.mos"
        "Plot Results"));
end Qlimiter;
