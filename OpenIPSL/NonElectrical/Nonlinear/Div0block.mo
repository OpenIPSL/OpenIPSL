within OpenIPSL.NonElectrical.Nonlinear;
block Div0block "Block that implements division by zero protection"
  extends Modelica.Blocks.Interfaces.SI2SO;
equation
   y =OpenIPSL.NonElectrical.Functions.div0protect(u1, u2)
  annotation (Icon(graphics={
        Text(
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
          extent={{-80,90},{82,60}},
          textColor={128,128,128},
          textString="u1 / u2"),
        Text(
          extent={{-100,-60},{100,-100}},
          textColor={238,46,47},
          textString="div0protect")}));
end Div0block;
