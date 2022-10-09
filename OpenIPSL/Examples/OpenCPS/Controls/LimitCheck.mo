within OpenIPSL.Examples.OpenCPS.Controls;
model LimitCheck "Model of a limit checker"
  parameter Real upperLim "Upper limit";
  parameter Real lowerLim "Lower limit";
  parameter Real dt "Comparison threshold";
  Modelica.Blocks.Logical.And and1
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(
          extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Interfaces.BooleanOutput START
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(threshold=
       lowerLim)
    annotation (Placement(transformation(extent={{-74,10},{-54,30}})));
  Modelica.Blocks.Logical.LessEqualThreshold lessEqualThreshold(threshold=
        upperLim)
    annotation (Placement(transformation(extent={{-74,-30},{-54,-10}})));
  Modelica.Blocks.Logical.Timer timer
    annotation (Placement(transformation(extent={{18,-10},{38,10}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold1(
      threshold=dt)
    annotation (Placement(transformation(extent={{46,-10},{66,10}})));
  Modelica.Blocks.Logical.Pre pre1
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
equation
  connect(greaterEqualThreshold.y, and1.u1) annotation (Line(points={{-53,20},{
          -48,20},{-48,0},{-42,0}}, color={255,0,255}));
  connect(u, greaterEqualThreshold.u) annotation (Line(points={{-100,0},{-80,0},
          {-80,20},{-76,20}}, color={0,0,127}));
  connect(lessEqualThreshold.y, and1.u2) annotation (Line(points={{-53,-20},{-48,
          -20},{-48,-8},{-42,-8}}, color={255,0,255}));
  connect(timer.y, greaterEqualThreshold1.u)
    annotation (Line(points={{39,0},{44,0}}, color={0,0,127}));
  connect(and1.y, pre1.u)
    annotation (Line(points={{-19,0},{-15.5,0},{-12,0}}, color={255,0,255}));
  connect(pre1.y, timer.u)
    annotation (Line(points={{11,0},{16,0}}, color={255,0,255}));
  connect(lessEqualThreshold.u, greaterEqualThreshold.u) annotation (Line(
        points={{-76,-20},{-80,-20},{-80,20},{-76,20}}, color={0,0,127}));
  connect(greaterEqualThreshold1.y, START)
    annotation (Line(points={{67,0},{110,0},{110,0}}, color={255,0,255}));
  annotation ( Icon(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-48,96},{40,76}},
          textColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="LIMIT CHECK")}),
    Documentation(info="<html>
<p>This model checks if a determined variable is within an interval determined by lower and upper limits.</p>
</html>"));
end LimitCheck;
