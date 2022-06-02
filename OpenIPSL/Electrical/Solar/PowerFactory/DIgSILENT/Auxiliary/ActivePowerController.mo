within OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT.Auxiliary;
model ActivePowerController "Controller for the active power of a PV plant"
  parameter Real K = 0.005 "Gain of the PI-Controller";
  parameter Types.Time T=0.03 "Integration Time Constant of the PI controller";
  parameter Real yo_min "Minimum d-axis current";
  parameter Real yo_max "Maximum d-axis current";
  parameter Types.PerUnit id0 "Initial d-axis current";
  Modelica.Blocks.Interfaces.RealInput yi annotation (
    Placement(transformation(origin = {-160, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin={-80,0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput yo annotation (
    Placement(transformation(origin = {170, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput pred annotation (
    Placement(transformation(origin = {-160, 70}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin={-80,60}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Continuous.LimIntegrator I(initType = Modelica.Blocks.Types.Init.InitialOutput,k = K / T, limitsAtInit = false,outMax = yo_max, outMin = yo_min, y_start = id0) if with_I annotation (
    Placement(transformation(origin = {-88, -20}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant disable(k = 0) if not with_I annotation (
    Placement(transformation(origin = {-90, -60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Add add annotation (
    Placement(transformation(origin = {10, -6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain P(k = K) annotation (
    Placement(transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.Integrator tracker(initType = Modelica.Blocks.Types.Init.InitialOutput, k = 1 / 0.1, y_start = id0) annotation (
    Placement(transformation(origin = {10, 70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Feedback feedback annotation (
    Placement(transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(limitsAtInit = true, uMax = yo_max, uMin = yo_min) annotation (
    Placement(transformation(origin = {100, 70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Product product annotation (
    Placement(transformation(origin = {60, 70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(limitsAtInit = true, uMax = yo_max, uMin = yo_min) annotation (
    Placement(transformation(origin = {44, -6}, extent = {{-10, -10}, {10, 10}})));
  //protected
  Modelica.Blocks.Interfaces.RealOutput yo1 annotation (
    Placement(transformation(origin={170,-20}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin={110,-40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput yo2 annotation (
    Placement(transformation(origin={170,20}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin={110,40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput x annotation (Placement(transformation(origin={170,-60}, extent={{-10,-10},{10,10}}), iconTransformation(origin={110,-80}, extent={{-10,-10},{10,10}})));
  parameter Boolean with_I = if T > 0 then true else false;
equation
  yo = if pred < 1 then min(yo1,yo2) else yo1;
  if pred < 1 then
    tracker.u = feedback.y;
  else
    tracker.u = 0;
  end if;
  connect(P.y, add.u1) annotation (
    Line(points = {{-19, 0}, {-2, 0}}, color = {0, 0, 127}));
  connect(I.u, yi) annotation (
    Line(points = {{-100, -20}, {-144, -20}, {-144, 0}, {-160, 0}}, color = {0, 0, 127}));
  connect(yi, P.u) annotation (
    Line(points = {{-160, 0}, {-42, 0}}, color = {0, 0, 127}));
  connect(I.y, x) annotation (
    Line(points={{-77,-20},{-53,-20},{-53,-60},{170,-60}}, color = {0, 0, 127}));
  connect(disable.y, x) annotation (
    Line(points={{-79,-60},{170,-60}}, color = {0, 0, 127}));
  connect(feedback.u2, tracker.y) annotation (
    Line(points={{-30,62},{-30,62},{-30,50},{32,50},{32,70},{21,70},{21,70}}, color = {0, 0, 127}));
  connect(product.y, limiter.u) annotation (
    Line(points={{71,70},{87,70},{87,70},{88,70}}, color = {0, 0, 127}));
  connect(product.u1, tracker.y) annotation (
    Line(points={{48,76},{32,76},{32,70},{21,70},{21,70}}, color = {0, 0, 127}));
  connect(pred, product.u2) annotation (
    Line(points = {{-160, 70}, {-60, 70}, {-60, 40}, {40, 40}, {40, 64}, {48, 64}, {48, 64}}, color = {0, 0, 127}));
  connect(limiter.y, yo2) annotation (
    Line(points={{111,70},{128,70},{128,20},{170,20}}, color = {0, 0, 127}));
  connect(x, add.u2) annotation (
    Line(points={{170,-60},{-10,-60},{-10,-12},{-2,-12}}, color = {0, 0, 127}));
  connect(feedback.u1, yo1) annotation (
    Line(points={{-38,70},{-48,70},{-48,20},{72,20},{72,-20},{170,-20}}, color = {0, 0, 127}));
  connect(limiter1.u, add.y) annotation (
    Line(points={{32,-6},{20,-6},{20,-6},{21,-6}}, color = {0, 0, 127}));
  connect(yo1, limiter1.y) annotation (
    Line(points={{170,-20},{56,-20},{56,-6},{55,-6}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-160, -160}, {160, 160}}), graphics={ Rectangle(origin = {24, 67}, pattern = LinePattern.Dash, extent = {{-94, 39}, {94, -39}}), Text(origin = {-27, 113}, extent = {{-47, 7}, {47, -7}}, textString = "Tracking yo1", horizontalAlignment = TextAlignment.Left), Line(origin = {-12, 70}, points = {{-6, 0}, {6, 0}, {6, 0}}, color = {255, 0, 0})}),
    Icon(graphics={ Rectangle(lineColor = {118, 18, 62}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100, 100}}), Line(origin = {50.106, -52.0451}, points = {{-80, -40}, {-80, -20}, {-6, 30}}, color = {0, 0, 127}), Polygon(origin = {50, -84}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}), Line(origin = {50.175, -93.8248}, points = {{-80, 78}, {-80, 0}}, color = {192, 192, 192}), Line(origin = {40.2612, -7.74434}, points = {{-80, -80}, {30, -80}}, color = {192, 192, 192}), Polygon(origin = {2, -8}, lineColor = {192, 192, 192}, fillColor = {192, 192, 192},
            fillPattern = FillPattern.Solid, points = {{90, -80}, {68, -72}, {68, -88}, {90, -80}}), Text(origin = {18, -50.9032}, lineColor = {192, 192, 192}, extent = {{0, 2.90323}, {34, -27.0968}}, textString = "PI"), Text(origin={
              -34,60}, extent = {{-30, 10}, {30, -10}}, textString = "pred"), Text(origin={
              -44,2}, extent = {{-30, 10}, {30, -10}}, textString = "yi"), Text(origin = {82, 2}, extent = {{-30, 10}, {30, -10}}, textString = "yo"), Text(origin = {0, -10}, lineColor = {0, 0, 255}, extent = {{-100, 150}, {100, 110}}, textString = "%name"),
                                                                                                                                                                                                      Text(origin={92,-78}, extent = {{-30, 10}, {30, -10}},
          textString="x",
          lineColor={0,0,0}), Text(origin={84,
              -40}, extent = {{-30, 10}, {30, -10}},
          textString="yo1",
          lineColor={0,0,0}), Text(origin={80,
              40}, extent = {{-30, 10}, {30, -10}},
          textString="yo2",
          lineColor={0,0,0})}),
     Documentation(info = "<html>
<p>
This is essentially a PI controller whose output is reduced during the activation of FRT. PI from Modelica Standard Library was not used due to the specific implementation in PowerFactory which this model follows.
</p>
</html>", revisions = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Model Name</p></td>
<td><p>Active Power Controller for PV</p></td>
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
end ActivePowerController;
