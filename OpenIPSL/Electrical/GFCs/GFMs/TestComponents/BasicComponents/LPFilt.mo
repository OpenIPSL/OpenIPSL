within OpenIPSL.Electrical.GFCs.GFMs.TestComponents.BasicComponents;
model LPFilt "Test the LowPassFilter"
  extends Modelica.Icons.Example;
  BasicComponentsAndCntrlSchemes.low_pass_filter lowPassFilter
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Sources.Step step(offset=40.0/100, startTime=1)
    annotation (Placement(transformation(extent={{-80,-20},{-40,20}})));
equation
  connect(step.y, lowPassFilter.u)
    annotation (Line(points={{-38,0},{-24,0}}, color={0,0,127}));
  annotation (experiment(StopTime=2, __Dymola_Algorithm="Dassl"));
end LPFilt;
