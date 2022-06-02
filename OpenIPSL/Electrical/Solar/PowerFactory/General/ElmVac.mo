within OpenIPSL.Electrical.Solar.PowerFactory.General;
model ElmVac "Controllable voltage source"
  extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enabledisplayPF=false,
    final enablefn=true,
    final enableV_b=false,
    final enableangle_0=true,
    final enablev_0=true,
    final enableQ_0=false,
    final enableP_0=false,
    final enableS_b=true);
  Types.PerUnit P;
  Types.PerUnit Q;
  Types.Angle phiu;
  Modelica.Blocks.Interfaces.RealInput f0 annotation (
    Placement(transformation(origin = {-100, 50}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-104, 40}, extent = {{-12, -12}, {12, 12}})));
  Modelica.Blocks.Interfaces.RealInput v(start=v_0, fixed=true) annotation (
    Placement(transformation(origin = {-100, -50}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-104, -40}, extent = {{-12, -12}, {12, 12}})));
  OpenIPSL.Interfaces.PwPin p annotation (
    Placement(transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
initial equation
  phiu = angle_0;
equation
  der(phiu) = 2*fn*C.pi*(f0-fn/50);
  p.vr = v*cos(phiu);
  p.vi = v*sin(phiu);
  -P = p.vr * p.ir + p.vi * p.ii;
  -Q = p.vi * p.ir - p.vr * p.ii;
annotation (
    Icon(graphics={ Ellipse(lineColor = {118, 18, 62},fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}, endAngle = 360), Line(origin = {-5.53254, -0.428994}, points = {{-40, 0}, {-20, 20}, {20, -20}, {40, 0}, {40, 0}}), Text(origin = {0, -10}, lineColor = {0, 0, 255}, extent = {{-100, 150}, {100, 110}}, textString = "%name")}),
Documentation(info="<html>
<p>
Controllable voltage source with frequency and volage as inputs.
</p>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Model Name</p></td>
<td><p>ElmVac</p></td>
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
<tr>
<td><p>Model Verification</p></td>
<td><p>This model has been verified against PowerFactory.</p></td>
</tr>
</table>
</html>"));
end ElmVac;
