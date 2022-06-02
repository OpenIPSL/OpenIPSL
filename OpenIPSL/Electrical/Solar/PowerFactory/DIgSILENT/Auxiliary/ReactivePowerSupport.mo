within OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT.Auxiliary;
model ReactivePowerSupport "Reactive power support for FRT"
  parameter Types.PerUnit iq_max "Maximum d-axis current";
  parameter Types.PerUnit iq_min "Minimum d-axis current";
  parameter Boolean i_EEG "Selection of the FRT Charateristic";
  parameter Types.PerUnit Deadband "Deadband for dynamic AC voltage support";
  parameter Real K_FRT "Gain for dynamic AC voltage supports";
  parameter Types.PerUnit i0 "Initial reactive current";
  Modelica.Blocks.Interfaces.RealInput duac annotation (
    Placement(transformation(origin = {-200, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput iq annotation (
    Placement(transformation(origin = {210, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Logical.Switch FRT_characteristic_selection annotation (
    Placement(transformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.BooleanConstant FRTCharac(k=i_EEG) annotation (
    Placement(transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(limitsAtInit = true, uMax = iq_max, uMin = iq_min) annotation (
    Placement(transformation(origin = {182, 0}, extent = {{-10, -10}, {10, 10}})));
  OpenIPSL.Electrical.Solar.PowerFactory.General.Picdro picdro(Tdrop = if i_EEG then 0 else 0.5, Tpick = 0) annotation (
    Placement(transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(threshold = 0) annotation (
    Placement(transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Abs abs annotation (
    Placement(transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Nonlinear.DeadZone deadZone(deadZoneAtInit = true, uMax = Deadband, uMin = -Deadband) annotation (
    Placement(transformation(origin = {-158, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant initial_current(k = i0) annotation (
    Placement(transformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Add add annotation (
    Placement(transformation(origin = {140, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain gain(k = K_FRT) annotation (
    Placement(transformation(origin = {-30, 70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Logical.Switch switch annotation (
    Placement(transformation(origin = {60, 40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant zero_FRT_support(k = 0) annotation (
    Placement(transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (
    Placement(transformation(origin = {60, -50}, extent = {{-10, 10}, {10, -10}})));
  SLDWindV sLDWindV(Deadband = Deadband, K_FRT = K_FRT) annotation (
    Placement(transformation(origin = {-30, -80}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(FRTCharac.y, FRT_characteristic_selection.u2) annotation (
    Line(points = {{71, 0}, {86, 0}}, color = {255, 0, 255}));
  connect(limiter.y, iq) annotation (
    Line(points={{193,0},{199,0},{199,0},{210,0}}, color = {0, 0, 127}));
  connect(greaterEqualThreshold.u, abs.y) annotation (
    Line(points={{-82,0},{-100,0},{-100,0},{-99,0}}, color = {0, 0, 127}));
  connect(greaterEqualThreshold.y, picdro.condition) annotation (
    Line(points={{-59,0},{-41,0},{-41,0},{-38,0}}, color = {255, 0, 255}));
  connect(duac, deadZone.u) annotation (
    Line(points = {{-200, 0}, {-172, 0}, {-172, 0}, {-170, 0}}, color = {0, 0, 127}));
  connect(deadZone.y, abs.u) annotation (
    Line(points={{-147,0},{-122,0},{-122,0},{-122,0}}, color = {0, 0, 127}));
  connect(FRT_characteristic_selection.y, add.u1) annotation (
    Line(points={{109,0},{120,0},{120,6},{128,6},{128,6}}, color = {0, 0, 127}));
  connect(add.y, limiter.u) annotation (
    Line(points={{151,0},{170,0},{170,0},{170,0}}, color = {0, 0, 127}));
  connect(initial_current.y, add.u2) annotation (
    Line(points={{121,-50},{124,-50},{124,-6},{128,-6},{128,-6}}, color = {0, 0, 127}));
  connect(gain.u, deadZone.y) annotation (
    Line(points={{-42,70},{-136,70},{-136,0},{-147,0}}, color = {0, 0, 127}));
  connect(picdro.trip, switch.u2) annotation (
    Line(points={{-19,0},{-4,0},{-4,40},{48,40}}, color = {255, 0, 255}));
  connect(switch.u1, gain.y) annotation (
    Line(points = {{48, 48}, {26, 48}, {26, 70}, {-19, 70}}, color = {0, 0, 127}));
  connect(switch.y, FRT_characteristic_selection.u1) annotation (
    Line(points={{71,40},{80,40},{80,8},{86,8},{86,8}}, color = {0, 0, 127}));
  connect(zero_FRT_support.y, switch.u3) annotation (
    Line(points={{31,0},{40,0},{40,32},{48,32},{48,32}}, color = {0, 0, 127}));
  connect(switch1.y, FRT_characteristic_selection.u3) annotation (
    Line(points = {{71, -50}, {80, -50}, {80, -8}, {86, -8}}, color = {0, 0, 127}));
  connect(switch1.u3, zero_FRT_support.y) annotation (
    Line(points={{48,-42},{40,-42},{40,0},{31,0},{31,0}}, color = {0, 0, 127}));
  connect(switch1.u2, picdro.trip) annotation (
    Line(points={{48,-50},{34,-50},{34,-20},{-4,-20},{-4,0},{-19,0}}, color = {255, 0, 255}));
  connect(sLDWindV.diq, switch1.u1) annotation (
    Line(points={{-19,-80},{34,-80},{34,-58},{48,-58},{48,-58}}, color = {0, 0, 127}));
  connect(sLDWindV.duac, duac) annotation (
    Line(points = {{-38, -80}, {-176, -80}, {-176, 0}, {-200, 0}, {-200, 0}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-200, -120}, {200, 120}}), graphics={ Rectangle(origin = {-92.8493, 0.111888}, pattern = LinePattern.Dash, extent = {{-85.0493, 19.7918}, {85.0493, -19.7918}}), Text(origin = {-67, 27}, extent = {{-55, 5}, {55, -5}}, textString = "Voltage deadband with delay"), Rectangle(origin = {-92.8493, 0.111888}, pattern = LinePattern.Dash, extent = {{-85.0493, 19.7918}, {85.0493, -19.7918}}), Rectangle(origin = {-34.5559, 68.6529}, pattern = LinePattern.Dash, extent = {{-42.6785, 15.9659}, {42.6785, -15.9659}}), Rectangle(origin = {-30.0177, -79.8509}, pattern = LinePattern.Dash, extent = {{-29.8565, 19.5166}, {29.8565, -19.5166}}), Text(origin = {-35, 90}, extent = {{-43, 4}, {43, -4}}, textString = "Transmission Code 2007"), Text(origin = {-21, -56}, extent = {{-21, 4}, {21, -4}}, textString = "SDLWindV")}),
    Icon(graphics={ Rectangle(
          lineColor={118,18,62},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100,100},{100,-100}}), Text(origin = {-33, 2}, extent = {{-83, 12}, {83, -12}}, textString = "duac"), Text(origin = {73, 2}, extent = {{-83, 12}, {83, -12}}, textString = "iq"), Text(origin = {0, -10}, lineColor = {0, 0, 255}, extent = {{-100, 150}, {100, 110}}, textString = "%name")}),
             Documentation(info = "<html>
<p>
Reactive power support for the DIgSILENT PV model.
</p>
</html>", revisions = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Model Name</p></td>
<td><p>N/A</p></td>
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
end ReactivePowerSupport;
