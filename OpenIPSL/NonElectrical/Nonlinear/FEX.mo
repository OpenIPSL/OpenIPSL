within OpenIPSL.NonElectrical.Nonlinear;
model FEX "FEX=f(IN)"
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(
          extent={{-70,-10},{-50,10}}), iconTransformation(extent={{-110,-10},{
            -90,10}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(
          extent={{58,-10},{78,10}}), iconTransformation(extent={{100,-10},{120,
            10}})));
equation
  if u <= 0 then
    y = 1;
  elseif u > 0 and u <= 0.433 then
    y = 1 - 0.577*u;
  elseif u > 0.433 and u < 0.75 then
    y = sqrt(0.75 - u^2);
  elseif u >= 0.75 and u <= 1 then
    y = 1.732*(1 - u);
  else
    y = 0;
  end if;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-62,28},{64,-30}},
          textColor={0,0,255},
          textString="FEX=f(IN)")}));
end FEX;
