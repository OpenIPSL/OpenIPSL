within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1;
block Min_select "Output the minimum element of the input vector"
  parameter Integer nu(min=0) = 0 "Number of input connections"
    annotation (Dialog(connectorSizing=true), HideResult=true);
  Modelica.Blocks.Interfaces.RealVectorInput u[nu]
    annotation (Placement(transformation(extent={{-120,70},{-80,-70}})));
  Modelica.Blocks.Interfaces.RealOutput yMin(start=frs0) annotation (Placement(
        transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  parameter Real frs0;
equation
  yMin = min(u);
  annotation (
    Icon(graphics={Text(
          extent={{-60,60},{80,-40}},
          textColor={0,0,255},
          textString="Low value
select"),Rectangle(extent={{-100,100},{100,-100}},
                                                 lineColor={0,0,255})}),
    Documentation(info="<html>
<p>The following documentation is adapted from
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-Models], chapter 7.12</a>:</p>
<blockquote>
<p>
Determines the minimum element of the input vector and provide its value as output.
</p>
</blockquote>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Models</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-11-22</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/maguilerac\">@maguilerac</a>,
       <a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a>
   </p>
</td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end Min_select;
