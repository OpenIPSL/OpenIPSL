within OpenIPSL.Electrical.Branches.Simulink.LTC;
model LTC_deadband "Deadband block for load tap changing transformer implementation"
  Modelica.Blocks.Interfaces.RealOutput signal annotation (Placement(
        transformation(extent={{56,-2},{76,18}}), iconTransformation(extent={{
            56,-2},{76,18}})));
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(
          extent={{-68,0},{-48,20}}), iconTransformation(extent={{-70,-2},{-50,
            18}})));
  parameter Real Uplim;
  parameter Real Downlim;
equation
  if u > Uplim or u < Downlim then
    signal = 1;
  else
    signal = -100;
  end if;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(
          extent={{-50,52},{56,-38}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-34,32},{40,-24}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="deadband")}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Load Tap Changer with a deadband</td>
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
end LTC_deadband;
