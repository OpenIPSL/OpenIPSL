within OpenIPSL.Tests.GFCs.GFMs.PQLimiters;
model Plimiter "Tests the Plimiter"
  extends Modelica.Icons.Example;
  Electrical.GFCs.GFMs.REGFMA1.PQLimitersAndCntrlSchemes.Plimiter Plim_upper
    annotation (Placement(transformation(extent={{-20,40},{20,80}})));
  Modelica.Blocks.Sources.Constant P0_ini(k=0.1)
    annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
  Modelica.Blocks.Sources.Pulse Pfilt_upper(
    amplitude=8,
    period=3,
    nperiod=1,
    offset=0.1,
    startTime=2)
    annotation (Placement(transformation(extent={{-60,50},{-40,70}})));
  Modelica.Blocks.Interfaces.RealOutput Plim_out_upper
    "Active power limiter output signal"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Electrical.GFCs.GFMs.REGFMA1.PQLimitersAndCntrlSchemes.Plimiter Plim_lower
    annotation (Placement(transformation(extent={{-20,-20},{20,-60}})));
  Modelica.Blocks.Sources.Pulse Pfilt_lower(
    amplitude=-0.5,
    period=3,
    nperiod=1,
    offset=0.2,
    startTime=2)
    annotation (Placement(transformation(extent={{-60,-50},{-40,-30}})));
  Modelica.Blocks.Interfaces.RealOutput Plim_out_lower
    "Active power limiter output signal"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
equation
  connect(P0_ini.y, Plim_upper.P0_ini)
    annotation (Line(points={{-21,0},{0,0},{0,38}},   color={0,0,127}));
  connect(Plim_upper.Plim_out, Plim_out_upper)
    annotation (Line(points={{21,60},{110,60}}, color={0,0,127}));
  connect(Pfilt_upper.y, Plim_upper.Pfilt)
    annotation (Line(points={{-39,60},{-22,60}}, color={0,0,127}));
  connect(Plim_lower.P0_ini, P0_ini.y)
    annotation (Line(points={{0,-18},{0,0},{-21,0}},   color={0,0,127}));
  connect(Pfilt_lower.y, Plim_lower.Pfilt)
    annotation (Line(points={{-39,-40},{-22,-40}}, color={0,0,127}));
  connect(Plim_lower.Plim_out, Plim_out_lower)
    annotation (Line(points={{21,-40},{110,-40}}, color={0,0,127}));
  annotation (experiment(StopTime=10), Documentation(info="<html>
<p>
This model uses two instances of the active power limiter model to test limit activation.
Simulate and plot the input and output signals.
</p>
<p>
For the upper limit, plot <code>Pfilt_upper</code> and <code>Plim_out_upper</code>.
</p>
<p>
For the lower limit, plot <code>Pfilt_lower</code> and <code>Plim_out_lower</code>.
</p>
</html>"));
end Plimiter;
