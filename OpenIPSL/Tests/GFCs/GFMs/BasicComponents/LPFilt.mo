within OpenIPSL.Tests.GFCs.GFMs.BasicComponents;
model LPFilt "Test LPFilter"
  extends Modelica.Icons.Example;
  Electrical.GFCs.GFMs.REGFMA1.BasicComponentsAndCntrlSchemes.LPFilter lowPassFilter
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Sources.Step step(offset=40.0/100, startTime=1)
    annotation (Placement(transformation(extent={{-80,-20},{-40,20}})));
equation
  connect(step.y, lowPassFilter.u)
    annotation (Line(points={{-38,0},{-24,0}}, color={0,0,127}));
  annotation (experiment(StopTime=2), Documentation(info="<html>
Tests the low-pass filter model. Simulate and compare the input and output signals <code>step.y</code> and <code>lowPassFilter.y</code>.
</html>"));
end LPFilt;
