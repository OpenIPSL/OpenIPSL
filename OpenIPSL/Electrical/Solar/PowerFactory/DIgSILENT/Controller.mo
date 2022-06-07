within OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT;
model Controller "Controller for the solar plant"
  parameter Real Kp = 0.005 "Gain, Active Power PI-Controller";
  parameter Types.Time Tip = 0.03 "Integration Time Constant, Active Power PI-Ctrl.";
  parameter Types.Time Tr = 0.001 "Measurement Delay";
  parameter Types.Time Tmpp = 5 "Time Delay MPP-Tracking";
  parameter Types.PerUnit id_min = 0 "Min. Active Current Limit";
  parameter Types.PerUnit id_max = 1 "Max. Active Current Limit";
  parameter Types.Voltage U_min = 200 "Minimal allowed DC-voltage";
  parameter Real iq_min = -1 "Min. Reactive Current Limit";
  parameter Real iq_max = 1 "Max. Reactive Current Limit";
  parameter Real Deadband = 0.1 "Deadband for Dynamic AC Voltage Support";
  parameter Real K_FRT = 2 "Gain for Dynamic AC Voltage Support";
  parameter Boolean i_EEG = false "false = acc. TC2007; true = acc. SDLWindV";
  parameter Types.PerUnit maxAbsCur = 1 "Max. allowed absolute current";
  parameter Types.PerUnit maxIq = 1 "Max.abs reactive current in normal operation";
  parameter Types.PerUnit uac0 = 1 "Initial voltage magnitude";
  parameter Types.PerUnit iq0 = -0.2 "Initial q-axis current";
  parameter Types.PerUnit id0 = 0.6 "Initial d-axis current";
  Modelica.Blocks.Interfaces.RealInput vdcref annotation (
    Placement(transformation(origin = {-200, 90}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput uac annotation (
    Placement(transformation(origin = {-200, -70}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput pred annotation (
    Placement(transformation(origin = {-200, 130}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-90, -80}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Feedback feedback annotation (
    Placement(transformation(origin = {-90, -70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.FirstOrder MPP_delay(T = Tmpp, initType = Modelica.Blocks.Types.Init.SteadyState) annotation (
    Placement(transformation(origin = {-150, 90}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput vdcin annotation (
    Placement(transformation(origin = {-200, 30}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-90, 80}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.FirstOrder voltage_measurement_delay(T = Tr, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = uac0) annotation (
    Placement(transformation(origin = {-150, -70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant reference_voltage(k = uac0) annotation (
    Placement(transformation(origin = {-150, -110}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=Modelica.Constants.inf, uMin=U_min) annotation (Placement(transformation(origin={-110,90}, extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Feedback feedback1 annotation (
    Placement(transformation(origin = {-70, 30}, extent = {{-10, 10}, {10, -10}})));
  Modelica.Blocks.Continuous.FirstOrder filter(T = Tr, initType = Modelica.Blocks.Types.Init.SteadyState, y_start = 0) annotation (
    Placement(transformation(origin = {-20, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput id_ref annotation (
    Placement(transformation(origin = {210, 80}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput iq_ref annotation (
    Placement(transformation(origin = {210, -80}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}})));
  OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT.Auxiliary.ReactivePowerSupport reactivePowerSupport(Deadband = Deadband, K_FRT = K_FRT, i0 = iq0, i_EEG = i_EEG, iq_max = iq_max, iq_min = iq_min) annotation (
    Placement(transformation(origin = {-20, -70}, extent = {{-10, -10}, {10, 10}})));
  OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT.CurrentLimiter current_limiter(Deadband = Deadband, maxAbsCur = maxAbsCur, maxIq = maxIq, i_EEG = i_EEG) annotation (
    Placement(transformation(origin = {140, 0}, extent = {{-10, -10}, {10, 10}})));
  OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT.Auxiliary.ActivePowerController activePowerController(K = Kp, T = Tip, id0 = id0,yo_max = id_max, yo_min = id_min) annotation (
    Placement(transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(vdcref, MPP_delay.u) annotation (
    Line(points = {{-200, 90}, {-162, 90}}, color = {0, 0, 127}));
  connect(uac, voltage_measurement_delay.u) annotation (
    Line(points = {{-200, -70}, {-162, -70}, {-162, -70}, {-162, -70}}, color = {0, 0, 127}));
  connect(voltage_measurement_delay.y, feedback.u1) annotation (
    Line(points={{-139,-70},{-100,-70},{-100,-70},{-98,-70}}, color = {0, 0, 127}));
  connect(reference_voltage.y, feedback.u2) annotation (
    Line(points={{-139,-110},{-90,-110},{-90,-78},{-90,-78}}, color = {0, 0, 127}));
  connect(vdcin, feedback1.u1) annotation (
    Line(points = {{-200, 30}, {-78, 30}, {-78, 30}, {-78, 30}}, color = {0, 0, 127}));
  connect(feedback1.y, filter.u) annotation (
    Line(points={{-61,30},{-32,30}}, color = {0, 0, 127}));
  connect(filter.y, activePowerController.yi) annotation (
    Line(points={{-9,30},{18,30},{18,30},{20,30}}, color = {0, 0, 127}));
  connect(MPP_delay.y, limiter.u) annotation (
    Line(points={{-139,90},{-122,90},{-122,90},{-122,90}}, color = {0, 0, 127}));
  connect(limiter.y, feedback1.u2) annotation (
    Line(points={{-99,90},{-70,90},{-70,38},{-70,38}}, color = {0, 0, 127}));
  connect(feedback.y, reactivePowerSupport.duac) annotation (
    Line(points={{-81,-70},{-28,-70}}, color = {0, 0, 127}));
  connect(current_limiter.iqout, iq_ref) annotation (
    Line(points={{151,-6},{170,-6},{170,-80},{210,-80}}, color = {0, 0, 127}));
  connect(current_limiter.idout, id_ref) annotation (
    Line(points={{151,6},{180,6},{180,80},{210,80}}, color = {0, 0, 127}));
  connect(reactivePowerSupport.iq, current_limiter.iqin) annotation (
    Line(points={{-9,-70},{120,-70},{120,-6},{132,-6}}, color = {0, 0, 127}));
  connect(current_limiter.duac, feedback.y) annotation (
    Line(points={{132,0},{-60,0},{-60,-70},{-81,-70}}, color = {0, 0, 127}));
  connect(activePowerController.yo, current_limiter.idin) annotation (
    Line(points={{41,30},{120,30},{120,6},{132,6}}, color = {0, 0, 127}));
  connect(activePowerController.pred, pred) annotation (
    Line(points = {{20, 36}, {0, 36}, {0, 130}, {-200, 130}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(grid = {2, 2}, extent = {{-200, -160}, {200, 160}}, preserveAspectRatio = true)),
    Icon(coordinateSystem(grid = {2, 2}), graphics={ Text(origin = {-50, 70}, extent = {{-30, 10}, {30, -10}}, textString = "vdcin"), Text(origin = {-50, 30}, extent = {{-30, 10}, {30, -10}}, textString = "vdcref"), Text(origin = {-50, -30}, extent = {{-30, 10}, {30, -10}}, textString = "uac"), Text(origin = {-50, -70}, extent = {{-30, 10}, {30, -10}}, textString = "pred"), Text(origin = {70, 50}, extent = {{-30, 10}, {30, -10}}, textString = "id_ref"), Text(origin = {70, -50}, extent = {{-30, 10}, {30, -10}}, textString = "iq_ref"), Rectangle(lineColor = {118, 18, 62},fillColor = {255, 255, 255},
            fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, -10}, lineColor = {0, 0, 255}, extent = {{-100, 150}, {100, 110}}, textString = "%name"), Text(origin = {-54, -78}, extent = {{-30, 10}, {30, -10}}, textString = "pred"), Text(origin = {-58, -38}, extent = {{-30, 10}, {30, -10}}, textString = "uac"), Text(origin = {-48, 42}, extent = {{-30, 10}, {30, -10}}, textString = "vdcref"), Text(origin = {-50, 82}, extent = {{-30, 10}, {30, -10}}, textString = "vdcin"), Text(origin = {62, 42}, extent = {{-30, 10}, {30, -10}}, textString = "id_ref",
            horizontalAlignment = TextAlignment.Right), Text(origin = {62, -38}, extent = {{-30, 10}, {30, -10}}, textString = "iq_ref",
            horizontalAlignment = TextAlignment.Right)}),
    Documentation(info = "<html>
<p>
Controller for DIgSILENT's implementation of the PV plant.
</p>
</html>", revisions = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Model Name</p></td>
<td><p>Current Controller</p></td>
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
end Controller;
