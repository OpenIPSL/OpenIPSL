within OpenIPSL.Tests.GFCs.GFMs.BasicComponents;
model PFdrpScheme "Test"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Step step(
    height=41.0/100,
    offset=40.0/100,
    startTime=1)
    annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
  Modelica.Blocks.Interfaces.RealOutput omega_droop
    "Speed output from the P-f droop controller"
    annotation (Placement(transformation(extent={{100,-22},{120,-2}})));
  Modelica.Blocks.Sources.Constant Pref(k=40.0/100) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-90,10})));
  Modelica.Blocks.Interfaces.RealOutput delta_droop
    "Desired internal angle from the P-f droop controller"
    annotation (Placement(transformation(extent={{100,2},{120,22}})));
  Modelica.Blocks.Sources.Constant Edelta0(k=0.14)
                                               annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={30,-70})));
  Electrical.GFCs.GFMs.REGFMA1.BasicComponentsAndCntrlSchemes.PFdrpScheme p_f_droop_scheme_nolims
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
equation
  connect(Pref.y, p_f_droop_scheme_nolims.Pref) annotation (Line(points={{-79,10},
          {-30,10},{-30,8},{-22,8}},                color={0,0,127}));
  connect(step.y, p_f_droop_scheme_nolims.Pmeas) annotation (Line(
        points={{-79,-30},{-32,-30},{-32,-8},{-22,-8}},
                                                color={0,0,127}));
  connect(p_f_droop_scheme_nolims.Pout0, step.y) annotation (Line(
        points={{-8,-22},{-8,-30},{-79,-30}},
        color={0,0,127}));
  connect(p_f_droop_scheme_nolims.Edelta0,Edelta0. y) annotation (Line(
        points={{8,-22},{8,-54},{30,-54},{30,-59}},   color={0,0,127}));
  connect(p_f_droop_scheme_nolims.delta_droop, delta_droop)
    annotation (Line(points={{21,8},{94,8},{94,12},{110,12}},
                                              color={0,0,127}));
  connect(p_f_droop_scheme_nolims.omega_droop, omega_droop) annotation
    (Line(points={{21,-8},{94,-8},{94,-12},{110,-12}}, color={0,0,127}));
  annotation (experiment(StopTime=2), Documentation(info="<html>
Tests the P-f droop control scheme without limiters.
Simulate and plot the input signal, <code> step.y</code>, and the output signals, <code>delta_droop</code> and <code> omega_droop</code>.

</html>"));
end PFdrpScheme;
