within OpenIPSL.Electrical.Sensors;
model PwCurrent "Current sensor"
  Interfaces.PwPin          p
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}}),
        iconTransformation(extent={{-110,-10},{-90,10}})));
  Interfaces.PwPin n annotation (Placement(transformation(extent={{90,-10},{110,
            10}}), iconTransformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealOutput ir annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,-110})));
  Modelica.Blocks.Interfaces.RealOutput ii annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-110})));
  Modelica.Blocks.Interfaces.RealOutput i annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,-110})));
equation
  p.ir = -n.ir;
  p.ii = -n.ii;
  ir = p.ir;
  ii = p.ii;
  p.vr = n.vr;
  p.vi = n.vi;
  i = sqrt(p.ir*p.ir + p.ii*p.ii);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                             Rectangle(extent={{-100,100},{100,-100}},
          lineColor={0,0,255}),Rectangle(extent={{-80,80},{80,-80}}, lineColor=
          {0,0,255}),Rectangle(extent={{-60,60},{60,0}}, lineColor={0,0,255}),
          Text(
          extent={{-20,-20},{20,-60}},
          lineColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="A"),Line(
          points={{0,0},{40,40}},
          color={0,0,255},
          smooth=Smooth.None),
                          Text(
          extent={{-100,160},{100,100}},
          lineColor={0,0,255},
          textString="%name"),Text(
          extent={{-70,-80},{-50,-100}},
          lineColor={0,0,255},
          textString="ir"),   Text(
          extent={{-10,-80},{10,-100}},
          lineColor={0,0,255},
          textString="ii"),   Text(
          extent={{50,-80},{70,-100}},
          lineColor={0,0,255},
          textString="i")}),     Diagram(coordinateSystem(preserveAspectRatio=false)));
end PwCurrent;
