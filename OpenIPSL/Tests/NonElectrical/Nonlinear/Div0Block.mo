within OpenIPSL.Tests.NonElectrical.Nonlinear;
model Div0Block "Test the block Div0Block"
  extends Modelica.Icons.Example;
  OpenIPSL.NonElectrical.Nonlinear.Div0block div0block1
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Sources.RealExpression num(y=1.0)
    annotation (Placement(transformation(extent={{-60,2},{-40,22}})));
  Modelica.Blocks.Sources.RealExpression den(y=0.0)
    annotation (Placement(transformation(extent={{-60,-22},{-40,-2}})));
equation
  connect(num.y, div0block1.u1)
    annotation (Line(points={{-39,12},{-24,12}}, color={0,0,127}));
  connect(den.y, div0block1.u2)
    annotation (Line(points={{-39,-12},{-24,-12}}, color={0,0,127}));
end Div0Block;
