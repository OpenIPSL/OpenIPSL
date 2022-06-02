within OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT;
model DCBusBar "Model of a DC busbar between the module and inverter"
  parameter SI.Capacitance C=1.5e-3 "Capacity of capacitor on DC busbar";
  Modelica.Blocks.Interfaces.RealInput P_conv annotation (
      Placement(
      transformation(
        origin={-120.245,-44},
        extent={{-20, -20},{20, 20}}),
      iconTransformation(
        origin={-90,-40},
        extent={{-10, -10},{10, 10}})));
  Modelica.Blocks.Interfaces.RealInput I_pv "current array" annotation (
      Placement(
      transformation(
        origin={-120.096,51.0723},
        extent={{-20, -20},{20, 20}}),
      iconTransformation(
        origin={-90,40},
        extent={{-10, -10},{10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput Udc annotation (Placement(
      transformation(
        origin={130,0},
        extent={{-10, -10},{10, 10}}),
      iconTransformation(
        origin={110,0},
        extent={{-10, -10},{10, 10}})));
  Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(transformation(origin = {6, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Division P_to_I annotation (
    Placement(transformation(origin = {-24, -50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.Integrator integrator(initType = Modelica.Blocks.Types.Init.SteadyState, k = 1 / C) annotation (
    Placement(transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(I_pv, add.u1) annotation (
    Line(points={{-120.096,51.0723},{-10,51.0723},{-10,6},{-6,6}},
                                                              color = {0, 0, 127}));
  connect(P_to_I.y, add.u2) annotation (
    Line(points={{-13,-50},{-10,-50},{-10,-6},{-6,-6},{-6,-6}}, color = {0, 0, 127}));
  connect(P_conv, P_to_I.u1) annotation (
    Line(points={{-120.245,-44},{-36,-44}}, color = {0, 0, 127}));
  connect(integrator.u, add.y) annotation (
    Line(points={{58,0},{16,0},{16,0},{17,0}}, color = {0, 0, 127}));
  connect(integrator.y, Udc) annotation (
    Line(points={{81,0},{122,0},{122,0},{130,0}}, color = {0, 0, 127}));
  connect(P_to_I.u2, integrator.y) annotation (
    Line(points={{-36,-56},{-60,-56},{-60,-80},{100,-80},{100,0},{81,0},{81,0}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(
        extent={{-100, -100},{100, 100}},
        preserveAspectRatio=true,
        grid={2,2}), graphics={Rectangle(lineColor = {118, 18, 62},fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, -100}, {100, 100}}),Text(origin = {-50, -38}, fillPattern = FillPattern.Solid, extent = {{-29.23, -10}, {29.23, 10}}, textString = "P_conv", fontName = "Arial"),Text(origin = {-61.52, 42.04}, fillPattern = FillPattern.Solid, extent = {{-20.9, -9.01}, {20.9, 9.01}}, textString = "I_pv", fontName = "Arial"),Text(origin = {82, 0}, fillPattern = FillPattern.Solid, extent = {{-25.16, -9.47}, {25.16, 9.47}}, textString = "Udc", fontName = "Arial"), Line(points = {{6, 28}, {6, -28}}, color = {118, 18, 62}), Line(points = {{6, 0}, {38, 0}}, color = {118, 18, 62}), Line(points = {{-6, 28}, {-6, -28}}, color = {118, 18, 62}), Line(points = {{-40, 0}, {-6, 0}}, color = {118, 18, 62}), Text(origin = {0, -10}, lineColor = {0, 0, 255}, extent = {{-100, 150}, {100, 110}}, textString = "%name")}),
    Diagram(coordinateSystem(
        extent={{-120, -100},{120, 100}},
        preserveAspectRatio=true,
        grid={2,2})),
    Documentation(info = "<html>
<p>
DC busbar model for DIgSILENT's implementation of the PV plant.
</p>
</html>", revisions = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Model Name</p></td>
<td><p>DC Busbar model</p></td>
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
end DCBusBar;
