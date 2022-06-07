within OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT.Auxiliary;
model SLDWindV "Dynamic support during faults"
  parameter Types.PerUnit Deadband "Deadband for dynamic AC voltage support";
  parameter Real K_FRT "Gain for dynamic AC voltage supports";
  Modelica.Blocks.Math.Add add(k1 = -1, k2 = 1) annotation (
    Placement(transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain gain(k = K_FRT) annotation (
    Placement(transformation(origin = {80, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Product product annotation (
    Placement(transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const(k = Deadband) annotation (
    Placement(transformation(origin = {-60, 50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Abs duac_abs annotation (
    Placement(transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput duac annotation (
    Placement(transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput diq annotation (
    Placement(transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Division division annotation (
    Placement(transformation(origin = {-2, -30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=Modelica.Constants.inf, uMin=Deadband) annotation (Placement(transformation(origin={-30,-30}, extent={{-10,-10},{10,10}})));
equation
  connect(product.y, gain.u) annotation (
    Line(points = {{51, 0}, {68, 0}}, color = {0, 0, 127}));
  connect(duac_abs.u, duac) annotation (
    Line(points = {{-72, 0}, {-100, 0}}, color = {0, 0, 127}));
  connect(gain.y, diq) annotation (
    Line(points = {{91, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(add.u1, const.y) annotation (
    Line(points={{-22,46},{-35,46},{-35,50},{-49,50}}, color = {0, 0, 127}));
  connect(add.u2, duac_abs.y) annotation (
    Line(points={{-22,34},{-40,34},{-40,0},{-49,0},{-49,0}}, color = {0, 0, 127}));
  connect(division.u2, limiter.y) annotation (
    Line(points={{-14,-36},{-19,-36},{-19,-30}}, color = {0, 0, 127}));
  connect(division.u1, duac) annotation (
    Line(points = {{-14, -24}, {-18, -24}, {-18, -14}, {-78, -14}, {-78, 0}, {-100, 0}}, color = {0, 0, 127}));
  connect(division.y, product.u2) annotation (
    Line(points = {{9, -30}, {20, -30}, {20, -6}, {28, -6}}, color = {0, 0, 127}));
  connect(product.u1, add.y) annotation (
    Line(points={{28,6},{20,6},{20,40},{1,40},{1,40}}, color = {0, 0, 127}));
  connect(limiter.u, duac_abs.y) annotation (
    Line(points={{-42,-30},{-46,-30},{-46,0},{-49,0},{-49,0}}, color = {0, 0, 127}));

annotation (
    Diagram,
    Icon(graphics={ Rectangle(lineColor = {118, 18, 62},fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {73, 2}, extent = {{-83, 12}, {83, -12}}, textString = "diq"), Text(origin = {-33, 2}, extent = {{-83, 12}, {83, -12}}, textString = "duac"), Text(origin = {0, -10}, lineColor = {0, 0, 255}, extent = {{-100, 150}, {100, 110}}, textString = "%name")}),
         Documentation(info = "<html>
<p>
A fault ride through implementation for reactive power support.
</p>
</html>", revisions = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Model Name</p></td>
<td><p>SLDWindV</p></td>
</tr>
<tr>
<td><p>Reference</p></td>
<td><p>PowerFactory Implementation in Templates</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>January 2021</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a></p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
<tr>
<td><p>Model Verification</p></td>
<td><p>This model has not been verified against PowerFactory.</p></td>
</tr>
</table>
</html>"));
end SLDWindV;
