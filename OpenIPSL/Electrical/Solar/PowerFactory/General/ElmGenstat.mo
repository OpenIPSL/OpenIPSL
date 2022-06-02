within OpenIPSL.Electrical.Solar.PowerFactory.General;
model ElmGenstat "Static generator"
  extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enabledisplayPF=false,
    final enablefn=true,
    final enableV_b=false,
    final enableangle_0=true,
    final enablev_0=true,
    final enableQ_0=false,
    final enableP_0=false,
    final enableS_b=true);
  parameter Types.ApparentPower M_b "Machine base power"
    annotation (Dialog(group="Generator parameters"));
  parameter Boolean pll_connected = false "Enable/disable use of PLL inputs" annotation (Dialog(group="Generator parameters"));
  Types.Angle angle_i;
  Types.Angle angle_v;
  Modelica.Blocks.Interfaces.RealInput id_ref annotation (
    Placement(transformation(origin = {-108, 70}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-90, 80}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput iq_ref annotation (
    Placement(transformation(origin = {-108, 30}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}})));
  OpenIPSL.Interfaces.PwPin p(vr(start=v_0*cos(angle_0)), vi(start=v_0*sin(angle_0))) annotation (
    Placement(transformation(extent = {{90, -10}, {110, 10}}), iconTransformation(extent = {{100, -10}, {120, 10}})));
  Modelica.Blocks.Interfaces.RealOutput i annotation (
    Placement(transformation(origin = {110, 70}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput v annotation (
    Placement(transformation(origin = {110, 30}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput sinref if pll_connected "Optional PLL input for sine" annotation (
    Placement(transformation(origin = {-108, -30}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput cosref if pll_connected "Optional PLL input for cosine"
                                                                                              annotation (
    Placement(transformation(origin = {-108, -70}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-90, -80}, extent = {{-10, -10}, {10, 10}})));
  Real sinu "Internal sine of the voltage angle";
  Real cosu "Internal cosine of the voltage angle";
  Modelica.Blocks.Interfaces.RealOutput P annotation (
    Placement(transformation(origin = {110, -30}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput Q annotation (
    Placement(transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}})));
equation
  if pll_connected then
    connect(sinref, sinu);
    connect(cosref, cosu);
  else
    sinu = p.vi/v;
    cosu = p.vr/v;
  end if;
  p.ir*S_b/M_b = -(id_ref * cosu - iq_ref * sinu);
  p.ii*S_b/M_b = -(id_ref * sinu + iq_ref * cosu);
  -P = p.vr * p.ir + p.vi * p.ii;
  -Q = p.vi * p.ir - p.vr * p.ii;
  v = sqrt(p.vr ^ 2 + p.vi ^ 2);
  angle_v = atan2(p.vi, p.vr);
  i = sqrt(p.ii ^ 2 + p.ir ^ 2)*S_b/M_b;
  angle_i = atan2(p.ii, p.ir);
  annotation (
    Icon(graphics={ Rectangle(
          lineColor={118,18,62},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100,-100},{100,100}}), Text(origin = {-51.7, 80.01}, fillPattern = FillPattern.Solid, extent = {{-20.3, -10.18}, {20.3, 10.18}}, textString = "id_ref", fontName = "Arial", horizontalAlignment = TextAlignment.Left), Text(origin = {-48.7, 39.82}, fillPattern = FillPattern.Solid, extent = {{-23.3, -10.18}, {23.3, 10.18}}, textString = "iq_ref", fontName = "Arial",
            horizontalAlignment = TextAlignment.Left), Ellipse(origin = {71.43, -32.67}, lineColor = {118, 18, 62}, fillColor = {255, 255, 255},
            fillPattern = FillPattern.Solid,
            lineThickness = 0.5, extent = {{-71.43, 66.67}, {-1.43, -1.33}}, endAngle = 360), Line(origin = {49.9468, -19.7732}, points = {{-38, 19}, {8, 19}}, color = {118, 18, 62}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 10), Text(origin = {-50.7, -38.18},
            fillPattern = FillPattern.Solid, extent = {{-21.3, -10.18}, {21.3, 10.18}}, textString = "sinref", fontName = "Arial",
            horizontalAlignment = TextAlignment.Left), Text(origin = {-49.7, -80.18},
            fillPattern = FillPattern.Solid, extent = {{-24.3, -10.18}, {24.3, 10.18}}, textString = "cosref", fontName = "Arial",
            horizontalAlignment = TextAlignment.Left), Text(origin = {68.3, 40.01},
            fillPattern = FillPattern.Solid, extent = {{-20.3, -10.18}, {20.3, 10.18}}, textString = "i", fontName = "Arial",
            horizontalAlignment = TextAlignment.Right), Text(origin = {70.3, 78.01},
            fillPattern = FillPattern.Solid, extent = {{-20.3, -10.18}, {20.3, 10.18}}, textString = "v", fontName = "Arial",
            horizontalAlignment = TextAlignment.Right), Line(origin = {80, 0}, points = {{-10, 0}, {10, 0}, {20, 0}}, color = {118, 18, 62}, thickness = 0.5), Text(origin = {70.3, -39.99},
            fillPattern = FillPattern.Solid, extent = {{-20.3, -10.18}, {20.3, 10.18}}, textString = "P", fontName = "Arial",
            horizontalAlignment = TextAlignment.Right), Text(origin = {72.3, -81.99},
            fillPattern = FillPattern.Solid, extent = {{-20.3, -10.18}, {20.3, 10.18}}, textString = "Q", fontName = "Arial",
            horizontalAlignment = TextAlignment.Right), Text(origin = {0, -8}, lineColor = {0, 0, 255}, extent = {{-100, 150}, {100, 110}}, textString = "%name")}, coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    Diagram,
    Documentation(info="<html>
<p>
Static generator implemented currently only as a current source.
</p>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Model Name</p></td>
<td><p>ElmGenstat</p></td>
</tr>
<tr>
<td><p>Reference</p></td>
<td><p>PowerFactory Manual</p></td>
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
</table>
</html>"));
end ElmGenstat;
