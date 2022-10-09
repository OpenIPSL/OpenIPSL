within OpenIPSL.NonElectrical.Nonlinear;
model SaturationBlockTan
  "Block 1 in the OEL to decide the input signal of MIN Gate"
  parameter Real r "Exiciter parameter";
  parameter Real f "Exiciter parameter";
  Modelica.Blocks.Interfaces.RealInput p1 annotation (Placement(transformation(
          extent={{-86,-10},{-66,10}}), iconTransformation(extent={{-80,-10},{-60,
            10}})));
  Modelica.Blocks.Interfaces.RealOutput n1 annotation (Placement(transformation(
          extent={{46,-10},{66,10}}), iconTransformation(extent={{60,-6},{72,6}})));
equation
  if p1 <= (-0.1) then
    n1 = -1;
  elseif p1 > (-0.1) and p1 < 0 then
    n1 = 0;
  else
    n1 = tan(r)*p1 + f;
  end if;
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-60,-60},{60,60}}),
        graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-60,-60},{60,60}}),
        graphics={Rectangle(
          extent={{-60,60},{60,-60}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(
          points={{-42,0},{36,0},{38,0},{40,0}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None,
          arrow={Arrow.None,Arrow.Open}),Line(
          points={{0,-30},{0,36}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None,
          arrow={Arrow.None,Arrow.Open}),Line(
          points={{0,12},{34,12}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{22,22},{38,12}},
          textColor={0,0,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textStyle={TextStyle.Italic},
          textString="r"),Text(
          extent={{-12,16},{4,6}},
          textColor={0,0,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="f",
          textStyle={TextStyle.Italic}),Text(
          extent={{-2,0},{12,-8}},
          textColor={0,0,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="0"),Text(
          extent={{-26,8},{-12,0}},
          textColor={0,0,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="-0.1"),Line(
          points={{-20,-20},{-2,-20},{0,-20}},
          color={0,0,255},
          pattern=LinePattern.Dot,
          smooth=Smooth.None),Text(
          extent={{-2,-16},{12,-24}},
          textColor={0,0,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="-1"),Line(
          points={{-34,-20},{-20,-20},{-20,0},{0,0},{0,12},{32,22}},
          color={0,0,0},
          thickness=0.5,
          smooth=Smooth.None)}),
    Documentation(info="<html>
</html>"));
end SaturationBlockTan;
