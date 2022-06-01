within OpenIPSL.Electrical.Branches.Simulink.LTC;
model LTC_lookup "Lookup block for load tap changing transformer implementation"
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(
          extent={{-76,-2},{-56,18}}), iconTransformation(extent={{-92,-20},{-56,
            18}})));
  Modelica.Blocks.Interfaces.RealOutput out annotation (Placement(
        transformation(extent={{62,-12},{82,8}}), iconTransformation(extent={{
            62,-16},{92,18}})));
  parameter Real Uplim;
  parameter Real Downlim;
equation
  if u > Uplim then
    out = 1;
  elseif u < Downlim then
    out = -1;
  else
    out = 0;
  end if;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(extent={{-54,32},{62,-34}}, lineColor={
          0,0,255}),Line(
          points={{-46,-18},{-12,-18},{-10,-18}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-10,0},{12,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-10,0},{-10,-18}},
          color={0,0,255},
          smooth=Smooth.None,
          pattern=LinePattern.Dash),Line(
          points={{12,20},{12,0}},
          color={0,0,255},
          smooth=Smooth.None,
          pattern=LinePattern.Dash),Line(
          points={{12,20},{34,20},{52,20}},
          color={0,0,255},
          smooth=Smooth.None)}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Load Tap Changer's lookup</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end LTC_lookup;
