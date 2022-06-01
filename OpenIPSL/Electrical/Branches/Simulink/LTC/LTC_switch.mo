within OpenIPSL.Electrical.Branches.Simulink.LTC;
model LTC_switch "Switch block for load tap changing transformer implementation"
  Modelica.Blocks.Interfaces.RealInput Signalin annotation (Placement(
        transformation(extent={{-68,-4},{-48,16}}), iconTransformation(extent={
            {-78,-16},{-48,16}})));
  Modelica.Blocks.Interfaces.RealInput LTCin annotation (Placement(
        transformation(extent={{-68,46},{-48,66}}), iconTransformation(extent={
            {-80,32},{-48,66}})));
  Modelica.Blocks.Interfaces.RealInput Normalin annotation (Placement(
        transformation(extent={{-68,-58},{-48,-38}}), iconTransformation(extent=
           {{-78,-68},{-48,-38}})));
  Modelica.Blocks.Interfaces.RealOutput r annotation (Placement(transformation(
          extent={{54,0},{74,20}}), iconTransformation(extent={{56,-8},{86,24}})));
equation
  if Signalin > 0 then
    r = LTCin;
  else
    r = Normalin;
  end if;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(
          extent={{-46,94},{56,-94}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(
          points={{-46,0},{-32,0},{-32,18}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=1),Line(
          points={{-32,0},{-32,-18}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=1)}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Load Tap Changer with switching</td>
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
end LTC_switch;
