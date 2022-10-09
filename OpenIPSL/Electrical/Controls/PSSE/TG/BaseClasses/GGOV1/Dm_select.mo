within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1;
block Dm_select
  "Representation of the variation of maximum power capability with shaft speed"
  parameter Real Dm "Mechanical damping coefficient";
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(
          extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput speed annotation (Placement(
        transformation(extent={{-140,-20},{-100,20}}),
                                                    iconTransformation(
        extent={{-20,-20},{20,20}},
        origin={-120,0})));
equation
  y = if Dm >= 0 then speed + 1 else (speed + 1)^Dm;
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-60,40},{60,-40}},
          textColor={0,0,255},
          horizontalAlignment=TextAlignment.Left,
          rotation=360,
          textString="Dm_select"),Rectangle(extent={{-100,100},{100,-100}},
          lineColor={0,0,255})}),
    Documentation(info="<html>
<p>The following documentation is adapted from
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-Models], chapter 7.12</a>:</p>
<blockquote>
<p>
This variable is used to represent the variation of the maximum power capability or maximum engine power with shaft speed.
If Dm is positive it describes a lower maximum power output as speed increases. This is characteristic of some engines and aeroderivative turbines.
If Dm is negative the maximum fuel flow is considered to decrease as speed increases. This is common on single shaft gas turbines.
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
end Dm_select;
