within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1;
block Flag "Flag to determine if fluid flow depends on speed"
  parameter Integer Flag "Switch for fuel source characteristic"
    annotation (Evaluate = true,
    choices(choice = 0 "Fuel flow independent of speed", choice = 1 "Fuel flow proportional to speed"));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(
          extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput speed annotation (Placement(
        transformation(extent={{-140,-20},{-100,20}}),
                                                    iconTransformation(
        extent={{-20,-20},{20,20}},
        origin={-120,0})));
equation
  y = if Flag == 1 then speed + 1 else 1;
  annotation (
    Icon(graphics={Text(
          extent={{-60,40},{60,-40}},
          textColor={0,0,255},
          textString="Flag"),Rectangle(extent={{-100,100},{100,-100}},
                                                                   lineColor={0,
          0,255})}),
    Documentation(info="<html>
<p>The following documentation is adapted from
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-Models], chapter 7.12</a>:</p>
<blockquote>
<p>
This flag is used to determine if the fluid flow depends on the speed of the machine.
Gas turbines have fluid flow independent from speed and thus the flag should be set to 0.
Diesel engines on the other hand have their fluid flow proportional on the speed. In this case, the flag should be set to 1.
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
end Flag;
