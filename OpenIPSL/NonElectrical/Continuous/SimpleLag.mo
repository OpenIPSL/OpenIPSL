within OpenIPSL.NonElectrical.Continuous;
block SimpleLag "First order lag transfer function block"
  extends Modelica.Blocks.Interfaces.SISO(y(start=y_start));
  Modelica.Blocks.Sources.RealExpression const(y=T)
    annotation (Placement(transformation(extent={{-58,32},{-38,52}})));
  Real state(start=y_start);
  parameter Real K "Gain";
  parameter Types.Time T "Lag time constant" annotation(Evaluate = true);
  parameter Real y_start "Output start value";
protected
  parameter Real T_mod=if T < Modelica.Constants.eps then 1000 else T;
initial equation
  state = y_start;
equation
  T_mod*der(state) = K*u - state;
  if abs(const.y) <= Modelica.Constants.eps then
    y = u*K;
  else
    y = state;
  end if;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Text(
          extent={{-18,68},{22,8}},
          lineColor={0,0,255},
          textString="K"),Text(
          extent={{-68,-20},{72,-80}},
          lineColor={0,0,255},
          textString="1 + Ts"),Line(
          points={{-78,0},{80,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=0.5)}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td> </td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-11-24</td>
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
</html>"));
end SimpleLag;
