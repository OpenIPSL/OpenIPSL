within OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT;
model PVArray "Array of PV modules"
  parameter Types.ActivePower P_init "Initial active power of the array";
  parameter Integer n_series = 20 "Number of modules in series" annotation (
    Dialog(group = "PV Array Dimensions"));
  parameter Integer n_parallel = 140 "Number of modules in parallel" annotation (
    Dialog(group = "PV Array Dimensions"));
  parameter Types.Time Tr = 0.01 "Time constant of modules" annotation (
    Dialog(group = "Parameters of PV Modules"));
  parameter Types.Voltage U0_stc = 43.8 "Open-circuit voltage at Standard Test Conditions" annotation (
    Dialog(group = "Parameters of PV Modules"));
  parameter Types.Voltage Umpp_stc = 35 "MPP voltage at Standard Test Conditions" annotation (
    Dialog(group = "Parameters of PV Modules"));
  parameter Types.Current Impp_stc = 4.58 "MPP current at Standard Test Conditions" annotation (
    Dialog(group = "Parameters of PV Modules"));
  parameter Types.Current Isc_stc = 5 "Short-circuit current at Standard Test Conditions" annotation (
    Dialog(group = "Parameters of PV Modules"));
  parameter SI.LinearTemperatureCoefficient au = -0.0039 "Temperature correction factor (voltage)" annotation (
    Dialog(group = "Parameters of PV Modules"));
  parameter SI.LinearTemperatureCoefficient ai = 0.0004 "Temperature correction factor (current)" annotation (
    Dialog(group = "Parameters of PV Modules"));
  parameter Boolean use_input_E = false;
  parameter Boolean use_input_theta = false;
  Modelica.Blocks.Interfaces.RealOutput Iarray annotation (
    Placement(transformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput Vmpp_array annotation (
    Placement(transformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput Uarray annotation (
    Placement(transformation(origin = {-100, 70}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-90, 80}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput E if use_input_E annotation (
    Placement(transformation(origin = {-100, 30}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput theta if use_input_theta annotation (
    Placement(transformation(origin = {-100, -30}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain gain(k = n_parallel) annotation (
    Placement(transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain gain1(k = n_series) annotation (
    Placement(transformation(origin = {70, -50}, extent = {{-10, -10}, {10, 10}})));
  OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT.PVModule module(Impp_stc = Impp_stc, Isc_stc = Isc_stc, P_init = P_init / (n_parallel * n_series), U0_stc = U0_stc, Umpp_stc = Umpp_stc, ai = ai, au = au, use_input_E = use_input_E, use_input_theta = use_input_theta) annotation (
    Placement(transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.FirstOrder module_time(T = Tr, initType = Modelica.Blocks.Types.Init.SteadyState) annotation (
    Placement(transformation(origin = {-60, 70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain gain2(k = 1 / n_series) annotation (
    Placement(transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(gain.y, Iarray) annotation (
    Line(points={{81,50},{104,50},{104,50},{110,50}}, color = {0, 0, 127}));
  connect(gain1.y, Vmpp_array) annotation (
    Line(points={{81,-50},{104,-50},{104,-50},{110,-50}}, color = {0, 0, 127}));
  if use_input_E then
    connect(module.E, E) annotation (
      Line(points={{-9,5},{-68,5},{-68,30},{-100,30},{-100,30}}, color = {0, 0, 127}));
  end if;
  if use_input_theta then
    connect(module.theta, theta) annotation (
      Line(points={{-9,-4},{-60,-4},{-60,-30},{-100,-30},{-100,-30}}, color = {0, 0, 127}));
  end if;
  connect(module_time.u, Uarray) annotation (
    Line(points = {{-72, 70}, {-82, 70}, {-82, 70}, {-100, 70}}, color = {0, 0, 127}));
  connect(module_time.y, gain2.u) annotation (
    Line(points={{-49,70},{-30,70},{-30,62},{-30,62}}, color = {0, 0, 127}));
  connect(gain2.y, module.U) annotation (
    Line(points={{-30,39},{-30,9},{-9,9}}, color = {0, 0, 127}));
  connect(module.I, gain.u) annotation (
    Line(points = {{11, 4}, {40, 4}, {40, 50}, {58, 50}}, color = {0, 0, 127}));
  connect(module.Umpp, gain1.u) annotation (
    Line(points = {{11, -4}, {40, -4}, {40, -50}, {58, -50}}, color = {0, 0, 127}));
  annotation (
    Icon(graphics={ Rectangle(lineColor = {118, 18, 62},fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-50, 80}, extent = {{-20, 8}, {20, -8}}, textString = "Uarray"), Text(origin = {-58, 38}, extent = {{-20, 8}, {20, -8}}, textString = "E"), Text(origin = {-54, -40}, extent = {{-20, 8}, {20, -8}}, textString = "theta"), Text(origin = {72, 62}, extent = {{-20, 8}, {20, -8}}, textString = "Iarray"), Text(origin = {59, -58}, extent = {{-37, 8}, {37, -8}}, textString = "Vmpp_array"), Text(origin = {0, -10}, lineColor = {0, 0, 255}, extent = {{-100, 150}, {100, 110}}, textString = "%name")}),
        Documentation(info = "<html>
<p>
Model of a PV Array used in DIgSILENT's implementation of the PV plant. Provides optional inputs of irradiance (E) and temperature (theta). If those inputs are not connected, the model set temperature to 25&nbsp;&deg;C and irradiance so that it matches the specified initial power production.
</p>
</html>", revisions = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Model Name</p></td>
<td><p>PV Array</p></td>
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
end PVArray;
