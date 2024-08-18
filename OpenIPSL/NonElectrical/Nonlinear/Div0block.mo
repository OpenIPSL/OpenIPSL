within OpenIPSL.NonElectrical.Nonlinear;
block Div0block "Block that implements division by zero protection"
  Modelica.Blocks.Interfaces.RealInput u1
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput u2
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
   y =OpenIPSL.NonElectrical.Functions.div0protect(u1, u2)
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
  annotation (Icon(graphics={   Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid), Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        textColor={0,0,255}),
        Line(points={{-100,60},{-60,60},{0,0}}, color={0,0,127}),
        Line(points={{-100,-60},{-60,-60},{0,0}}, color={0,0,127}),
        Ellipse(lineColor={0,0,127}, extent={{-50,-50},{50,50}},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{50,0},{100,0}}, color={0,0,127}),
        Line(points={{-30,0},{30,0}}),
        Ellipse(fillPattern=FillPattern.Solid, extent={{-5,20},{5,30}}),
        Ellipse(fillPattern=FillPattern.Solid, extent={{-5,-30},{5,-20}}),
        Text(
          extent={{-70,94},{80,54}},
          textColor={128,128,128},
          textString="u1 / u2"),
        Text(
          extent={{-102,-60},{100,-100}},
          textColor={238,46,47},
          textString="div0protect")}));
end Div0block;
