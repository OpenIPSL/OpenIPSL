within OpenIPSL.NonElectrical.Functions;
model ImSE_exp "Block for Saturation function of Exc "
  Modelica.Blocks.Interfaces.RealInput VE_IN "Unsaturated Input" annotation (
      Placement(transformation(extent={{-140,-20},{-130,-10}}),
        iconTransformation(extent={{-120,-10},{-100,10}})));
  Modelica.Blocks.Interfaces.RealOutput VE_OUT "Saturated Output" annotation (
      Placement(transformation(extent={{100,-2},{110,8}}), iconTransformation(
          extent={{100,-6},{112,6}})));
  parameter Real SE1 "Saturation at E1";
  parameter Real SE2 "Saturation at E2";
  parameter Real E1;
  parameter Real E2;
equation
  VE_OUT = OpenIPSL.NonElectrical.Functions.SE_exp(
    VE_IN,
    SE1,
    SE2,
    E1,
    E2);
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-60},{100,
            60}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-60},{100,60}}),
        graphics={Ellipse(
          extent={{-100,60},{100,-60}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-88,38},{82,-42}},
          textColor={0,0,255},
          textString="SE(Efd)")}));
end ImSE_exp;
