within OpenIPSL.NonElectrical.Logical;
model Relay3 "Relay, y = if u1 > Vov then u3 elseif u1 < -Vov then u4 else u2"
  parameter Real Vov=0.5 "Threshold for relay";
  Modelica.Blocks.Interfaces.RealInput u1 annotation (Placement(transformation(
          extent={{-140,60},{-100,100}})));
  Modelica.Blocks.Interfaces.RealInput u2 annotation (Placement(transformation(
          extent={{-140,20},{-100,60}}),iconTransformation(extent={{-140,0},{-100,40}})));
  Modelica.Blocks.Interfaces.RealInput u3 annotation (Placement(transformation(
          extent={{-140,-40},{-100,0}}), iconTransformation(extent={{-140,-50},{-100,-10}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(
          extent={{100,-10},{120,10}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=Vov)
                                                            annotation (Placement(transformation(extent={{-68,70},{-48,90}})));
  Modelica.Blocks.Logical.Switch switch_u3 annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Blocks.Interfaces.RealInput u4 annotation (Placement(transformation(
          extent={{-140,-80},{-100,-40}}), iconTransformation(extent={{-140,-100},{-100,-60}})));
  Modelica.Blocks.Logical.Switch switch_u4 annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  Modelica.Blocks.Logical.LessThreshold lessThreshold(threshold=-Vov)
                                                            annotation (Placement(transformation(extent={{-68,40},{-48,60}})));
equation

  connect(greaterThreshold.u, u1) annotation (Line(points={{-70,80},{-120,80}}, color={0,0,127}));
  connect(greaterThreshold.y, switch_u3.u2) annotation (Line(points={{-47,80},{-10,80},{-10,0},{48,0}}, color={255,0,255}));
  connect(switch_u3.y, y) annotation (Line(points={{71,0},{110,0}}, color={0,0,127}));
  connect(u3, switch_u3.u1) annotation (Line(points={{-120,-20},{-60,-20},{-60,8},{48,8}}, color={0,0,127}));
  connect(lessThreshold.u, u1) annotation (Line(points={{-70,50},{-80,50},{-80,80},{-120,80}}, color={0,0,127}));
  connect(switch_u4.u1, u4) annotation (Line(points={{-12,-22},{-40,-22},{-40,-60},{-120,-60}}, color={0,0,127}));
  connect(u2, switch_u4.u3) annotation (Line(points={{-120,40},{-80,40},{-80,-38},{-12,-38}}, color={0,0,127}));
  connect(switch_u4.y, switch_u3.u3) annotation (Line(points={{11,-30},{30,-30},{30,-8},{48,-8}}, color={0,0,127}));
  connect(lessThreshold.y, switch_u4.u2) annotation (Line(points={{-47,50},{-30,50},{-30,-30},{-12,-30}}, color={255,0,255}));
  annotation (
    Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(
          points={{-100,20},{-42,20}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-100,-80},{-42,-80}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-34,20},{36,-30},{70,-30},{70,0},{100,0}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-42,24},{-34,16}},
                                                               lineColor={0,0,
          255}),Ellipse(extent={{-42,-76},{-34,-84}},
                                                    lineColor={0,0,255}),
          Rectangle(
          extent={{-30,90},{30,70}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(points={{-30,80},{-100,80}},color=
           {0,0,255}),Line(points={{100,80},{30,80}},color={0,0,255}),Line(
          points={{0,70},{0,-4}},
          color={0,0,255},
          pattern=LinePattern.Dash),Text(
          extent={{-150,150},{150,110}},
          lineColor={0,0,255},
          textString="%name"),Line(
          points={{-100,-30},{-42,-30}},
          color={0,0,255},
          smooth=Smooth.None),
                Ellipse(extent={{-42,-26},{-34,-34}},
                                                    lineColor={0,0,255}),
                              Ellipse(extent={{32,-26},{40,-34}},
                                                               lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid)}));
end Relay3;
