within OpenIPSL.NonElectrical.Logical;
model Relay "Relay, y = if u1 > 0 then u2 else u3"
  Modelica.Blocks.Interfaces.RealInput u1 annotation (Placement(transformation(
          extent={{-140,60},{-100,100}})));
  Modelica.Blocks.Interfaces.RealInput u2 annotation (Placement(transformation(
          extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput u3 annotation (Placement(transformation(
          extent={{-140,-100},{-100,-60}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(
          extent={{100,-10},{120,10}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
  Modelica.Blocks.Logical.Switch switch annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
equation

  connect(greaterThreshold.u, u1) annotation (Line(points={{-82,80},{-94,80},{-94,80},{-120,80}}, color={0,0,127}));
  connect(greaterThreshold.y, switch.u2) annotation (Line(points={{-59,80},{-20,80},{-20,0},{-10,0}}, color={255,0,255}));
  connect(switch.u1, u2) annotation (Line(points={{-10,8},{-80,8},{-80,0},{-120,0}}, color={0,0,127}));
  connect(switch.u3, u3) annotation (Line(points={{-10,-8},{-20,-8},{-20,-80},{-120,-80}}, color={0,0,127}));
  connect(switch.y, y) annotation (Line(points={{13,0},{110,0}}, color={0,0,127}));
  annotation (
    Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(
          points={{-100,0},{-42,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-100,-80},{-42,-80}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-34,0},{22,-40},{70,-40},{70,0},{100,0}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-42,4},{-34,-4}},
                                                               lineColor={0,0,
          255}),Ellipse(extent={{-42,-76},{-34,-84}},
                                                    lineColor={0,0,255}),
          Rectangle(
          extent={{-30,90},{30,70}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(points={{-30,80},{-100,80}},color=
           {0,0,255}),Line(points={{100,80},{30,80}},color={0,0,255}),Line(
          points={{0,70},{0,-24}},
          color={0,0,255},
          pattern=LinePattern.Dash),Text(
          extent={{-150,150},{150,110}},
          lineColor={0,0,255},
          textString="%name"),Ellipse(extent={{18,-36},{26,-44}},
                                                               lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid)}));
end Relay;
