within OpenIPSL.Electrical.Controls.PSSE.OEL;
model IF_comparisor "Discrete over excitation limiter based on comparison and if-statements"
  Modelica.Blocks.Interfaces.RealInput p
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput n1
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput n2 annotation (Placement(transformation(
          extent={{100,10},{120,30}}),
                                     iconTransformation(extent={{100,10},{120,30}})));
  parameter Real HighCurrentLimit=1.5;
  parameter Real MediumCurrentLimit=1.2;
  parameter Real LowCurrentLimit=1.1;
  parameter Real LL=1 - HighCurrentLimit;
  parameter Real ML=1 - MediumCurrentLimit;
  parameter Real HL=1 - LowCurrentLimit;
  Modelica.Blocks.Interfaces.RealOutput n3
    annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
  Modelica.Blocks.Interfaces.RealOutput n4
    annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
equation
  if p >= HL then
    n1 = 100;
    n2 = 0;
    n3 = 0;
    n4 = 0;
  elseif p >= ML and p < HL then
    n1 = 0;
    n2 = -0.1;
    n3 = 0;
    n4 = 0;
  elseif p >= LL and p < ML then
    n1 = 0;
    n2 = 0;
    n3 = -0.2;
    n4 = 0;
  else
    n1 = 0;
    n2 = 0;
    n3 = 0;
    n4 = -0.5;
  end if;
  annotation (
     Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={
          0,0,255}),Text(
          extent={{40,-14},{80,-54}},
          lineColor={0,0,255},
          textString=">"),Text(
          extent={{40,66},{80,26}},
          lineColor={0,0,255},
          textString="<"),Line(
          points={{-100,0},{-40,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{0,60},{50,60}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{0,-20},{50,-20}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-40,0},{-16,-10}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-16,-8},{-10,-14}}, lineColor={0,
          0,255},
          startAngle=0,
          endAngle=360),
                  Ellipse(extent={{-4,62},{0,58}},    lineColor={0,0,255}),
          Ellipse(extent={{-4,-18},{0,-22}},    lineColor={0,0,255}),Line(
          points={{0,20},{50,20}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-4,22},{0,18}},    lineColor={0,
          0,255}),Line(
          points={{0,-60},{48,-60}},
          color={0,0,255},
          smooth=Smooth.None),Ellipse(extent={{-4,-58},{0,-62}},    lineColor={
          0,0,255}),
        Text(
          extent={{-120,140},{120,100}},
          lineColor={0,0,255},
          textString="%name")}));
end IF_comparisor;
