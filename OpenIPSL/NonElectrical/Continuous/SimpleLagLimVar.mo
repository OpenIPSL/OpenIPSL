within OpenIPSL.NonElectrical.Continuous;
block SimpleLagLimVar
  "First order lag transfer function block with a non windup limiter and variable limits"
  extends Modelica.Blocks.Interfaces.SISO(y(start=y_start));
  Modelica.Blocks.Interfaces.RealInput outMax annotation (Placement(
        transformation(extent={{98,106},{138,146}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={80,140})));
  Modelica.Blocks.Interfaces.RealInput outMin annotation (Placement(
        transformation(extent={{-90,-6},{-50,34}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-80,-140})));
  Modelica.Blocks.Sources.RealExpression const(y=T)
    annotation (Placement(transformation(extent={{-58,32},{-38,52}})));
  parameter Real K "Gain";
  parameter Types.Time T "Lag time constant" annotation(Evaluate = true);
  parameter Real y_start "Output start value";
  parameter Real T_mod=if T < Modelica.Constants.eps then 1000 else T;
  Real state;
initial equation
  state = y_start;
equation
  T_mod*der(state) = K*u - y;
  when abs(y - outMax) <= Modelica.Constants.eps and K*u - y < 0 or abs(y -
      outMin) <= Modelica.Constants.eps and K*u - y > 0 then
    reinit(state, y);
  end when;
  if abs(const.y) <= Modelica.Constants.eps then
    y = max(min(u*K, outMax), outMin);
  else
    y = max(min(state, outMax), outMin);
  end if;
  annotation (
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>IEEE Std. 421.5-2005, Annex E</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-11-25</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a></p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Line(points={{40,100},{60,140},{100,140}}, color=
          {0,0,0}),Text(
          extent={{-20,68},{20,8}},
          lineColor={0,0,255},
          textString="K"),Line(
          points={{-80,0},{78,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=0.5),Text(
          extent={{-70,-20},{70,-80}},
          lineColor={0,0,255},
          textString="1 + Ts"),Line(points={{-100,-140},{-60,-140},{-40,-100}},
          color={0,0,0})}),
    Diagram);
end SimpleLagLimVar;
