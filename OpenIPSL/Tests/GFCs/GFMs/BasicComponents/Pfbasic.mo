within OpenIPSL.Tests.GFCs.GFMs.BasicComponents;
model Pfbasic "Tests the PFdrp"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.BasicComponentsAndCntrlSchemes.PFdrp
    pfbasic annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Electrical.GFCs.GFMs.REGFMA1.BasicComponentsAndCntrlSchemes.LPFilter lowPassFilter
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-50,-30})));
  Modelica.Blocks.Sources.Step step(
    height=41.0/100,
    offset=40.0/100,
    startTime=1)
    annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
  Modelica.Blocks.Sources.Constant Plimin(k=0) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,-70})));
  Modelica.Blocks.Sources.Constant Pref(k=40.0/100) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-90,0})));
  Modelica.Blocks.Sources.Constant Plimin1(k=0.14)
                                               annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={30,-70})));
  Modelica.Blocks.Interfaces.RealOutput delta_droop
    "Desired internal angle from the P-f droop controller"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealOutput omega_droop
    "Speed output from the P-f droop controller"
    annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
equation
  connect(Plimin.y, pfbasic.Plim_in) annotation (Line(points={{-10,-59},{
          -10,-32},{-8,-32},{-8,-24}}, color={0,0,127}));
  connect(Pref.y, pfbasic.Pref)
    annotation (Line(points={{-79,0},{-24,0}}, color={0,0,127}));
  connect(step.y, lowPassFilter.u)
    annotation (Line(points={{-79,-30},{-62,-30}}, color={0,0,127}));
  connect(lowPassFilter.y, pfbasic.Pfilt) annotation (Line(points={{-39,
          -30},{-32,-30},{-32,-16},{-24,-16}}, color={0,0,127}));
  connect(Plimin1.y, pfbasic.Edelta0) annotation (Line(points={{30,-59},
          {30,-42},{8,-42},{8,-24}}, color={0,0,127}));
  connect(pfbasic.delta_droop, delta_droop)
    annotation (Line(points={{22,0},{110,0}}, color={0,0,127}));
  connect(pfbasic.omega_droop, omega_droop) annotation (Line(points={{22,-12},{
          94,-12},{94,-20},{110,-20}}, color={0,0,127}));
  annotation (experiment(StopTime=2), Documentation(info="<html>
Tests the P-f droop model components that are used to build the control scheme base class.
Simulate and plot the input signal, <code> step.y</code>, and the output signals, <code>delta_droop</code> and <code> omega_droop</code>.


</html>"));
end Pfbasic;
