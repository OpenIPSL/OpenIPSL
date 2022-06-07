within OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT;
model PVModule "Model of a single PV module"
  parameter SI.Voltage U0_stc = 43.8 "Open-circuit voltage at Standard Test Conditions";
  parameter SI.Voltage Umpp_stc = 35 "MPP voltage at Standard Test Conditions";
  parameter Types.Current Impp_stc = 4.58 "MPP current at Standard Test Conditions";
  parameter Types.Current Isc_stc = 5 "Short-circuit current at Standard Test Conditions";
  parameter SI.LinearTemperatureCoefficient au = -0.0039 "Temperature correction factor (voltage)";
  parameter SI.LinearTemperatureCoefficient ai = 0.0004 "Temperature correction factor (current)";
  parameter Boolean use_input_E = false "If true irradiance is used as input";
  parameter Boolean use_input_theta = false "If true temperature is used as input";
  parameter Types.ActivePower P_init "Initial active power (needed only if input E is not used)";
  parameter SI.Irradiance E_STC = 1000;
  parameter SI.Temperature theta_STC = 298.15;
  Modelica.Blocks.Interfaces.RealInput U annotation (
    Placement(transformation(origin={-100,80}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin={-90,90}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput E if use_input_E annotation (
    Placement(transformation(origin={-100,40}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin={-90,50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput theta if use_input_theta annotation (
    Placement(transformation(origin={-100,-40}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput I annotation (
    Placement(transformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput Umpp annotation (
    Placement(transformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}})));
  Types.Voltage U0 "Open-circuit voltage";
  Types.Current Isc "Short-circuit current";
  Types.Current Impp "MPP Current";
  Real tempCorrU "Voltage Correction Factor";
  Real tempCorrI "Current Correction Factor";
  Modelica.Blocks.Sources.RealExpression not_use_input_theta(y=theta_STC)
                                                                      if not use_input_theta annotation (Placement(transformation(extent={{-60,-70},{-40,-50}})));
  Modelica.Blocks.Sources.RealExpression not_use_input_E(y=P_init) if not use_input_E annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
protected
  Real lnEquot "Logarithm of the irradiance ratio";
  Real c1 "Helper variable";
  Real c2 "Helper variable";
  Modelica.Blocks.Interfaces.RealOutput local_E annotation (Placement(transformation(extent={{-20,50},{0,30}})));
  Modelica.Blocks.Interfaces.RealOutput local_theta annotation (Placement(transformation(extent={{-20,-30},{0,-50}})));
  Modelica.Blocks.Interfaces.RealOutput P "Value of Real output" annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
initial equation
if not use_input_E then
  der(local_E) = 0;
end if;
equation
  tempCorrU =1 + au*(Modelica.Units.Conversions.to_degC(local_theta) - 25);
  tempCorrI =1 + ai*(Modelica.Units.Conversions.to_degC(local_theta) - 25);
// Open-circuit voltage
  lnEquot = if local_E > 1.0 then log(max(local_E, 1.0)) / log(E_STC) else 0;
// ln(E)/ln(1000W/m2), if E > 1W/m2
  U0 = U0_stc * lnEquot * tempCorrU;
// Open-circuit voltage dependent from E and theta, proportional to log(E)
// Short-circuit current
  Isc = if local_E > 1 then Isc_stc * local_E / E_STC * tempCorrI else 0;
//Current generation only if E>1 (limitation of model)
// Maximum Power Point
  Umpp = Umpp_stc * lnEquot * tempCorrU;
// MPP voltage dependent on E and theta
  Impp = if local_E > 1 then Impp_stc * local_E / E_STC * tempCorrI else 0;
// Helper Variables
  c1 = if U0 > 0 then Umpp - U0 else 1;
// Avoids division by 0 in equation for c2
  if U0 > 0 then
    if c1 < 0 then
      c2 = log(1 - Impp / Isc) / c1;
    else
      c2 = 0;
    end if;
  else
    c2 = 0;
  end if;
// Current output, Current generation only if E>1 (limitation of model)
  I = max(Isc * (1 - exp(c2 * (min(U0, U) - U0))), 0.0);
// Blocking diode function included by max- and min-function
  P = Impp * Umpp;
  connect(E, local_E) annotation (Line(
      points={{-100,40},{-10,40}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(theta, local_theta) annotation (Line(
      points={{-100,-40},{-10,-40}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(not_use_input_theta.y, local_theta) annotation (Line(
      points={{-39,-60},{-28,-60},{-28,-40},{-10,-40}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(not_use_input_E.y, P) annotation (Line(
      points={{-39,0},{-24,0},{-24,-10},{-10,-10}},
      color={0,0,127},
      pattern=LinePattern.Dash));
  annotation (
    Icon(graphics={ Rectangle(lineColor = {118, 18, 62}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-54, -40}, extent = {{-20, 8}, {20, -8}}, textString = "theta"), Text(origin = {-58, 38}, extent = {{-20, 8}, {20, -8}}, textString = "E"), Text(origin = {-58, 80}, extent = {{-20, 8}, {20, -8}}, textString = "U"), Text(origin = {76, 42}, extent = {{-20, 8}, {20, -8}}, textString = "I"), Text(origin = {76, -40}, extent = {{-20, 8}, {20, -8}}, textString = "Ummp"), Text(origin = {0, -10}, lineColor = {0, 0, 255}, extent = {{-100, 150}, {100, 110}}, textString = "%name")}),
 Documentation(info = "<html>
<p>
Model of a PV Module within a PV array.
</p>
</html>", revisions = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Model Name</p></td>
<td><p>PV Module</p></td>
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
end PVModule;
