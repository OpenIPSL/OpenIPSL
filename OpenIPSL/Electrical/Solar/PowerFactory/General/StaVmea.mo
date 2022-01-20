within OpenIPSL.Electrical.Solar.PowerFactory.General;

model StaVmea
  parameter Types.Time Tfe = 3 / 50 annotation(
    Dialog(enable = use_ref_machine_frequency));
  parameter Types.Frequency fn = 50;
  parameter Types.Angle angle_0;
  parameter Boolean use_ref_machine_frequency = false;
  OpenIPSL.Interfaces.PwPin p annotation(
    Placement(visible = true, transformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput u annotation(
    Placement(visible = true, transformation(origin = {118, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput fe annotation(
    Placement(visible = true, transformation(origin = {108, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Real cosphi(start = cos(angle_0));
  Real sinphi(start = sin(angle_0));
  Real df(start = 0);
  Real phi if use_ref_machine_frequency;
  Real vx;
  Real vy;
  Real local_df if not use_ref_machine_frequency;
  Modelica.Blocks.Interfaces.RealInput omega if use_ref_machine_frequency annotation(
    Placement(visible = true, transformation(origin = {-100, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-94, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  u = sqrt(p.vr ^ 2 + p.vi ^ 2);
  if use_ref_machine_frequency then
// First this has to be transformed to the rotating reference frame (w.r.t. the frequency of the reference machine) to correspond to PowerFactory implementation
    der(phi) = 2 * Modelica.Constants.pi * 50 * (omega - 1);
    vx = p.vr * cos(phi) + p.vi * sin(phi);
    vy = (-p.vr * sin(phi)) + p.vi * cos(phi);
    der(cosphi) = (vx / u - cosphi) / Tfe;
    der(sinphi) = (vy / u - sinphi) / Tfe;
    fe = omega + df;
  else
    cosphi = vx/u;
    sinphi = vy/u;
    der(local_df) = (df - local_df) /Tfe;
    vx = p.vr;
    vy = p.vi;
    fe = 1 + local_df;
  end if;
  if abs(cosphi) > abs(sinphi) then
    df = der(sinphi) / cosphi / (2 * Modelica.Constants.pi * fn);
  else
    df = -der(cosphi) / sinphi / (2 * Modelica.Constants.pi * fn);
  end if;
  p.ii = 0;
  p.ir = 0;
  annotation(
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {0, 90}, extent = {{-100, 10}, {100, -10}}, textString = "StaVmeas"), Text(origin = {0, 50}, extent = {{62, 8}, {100, -10}}, textString = "u"), Text(origin = {0, -50}, extent = {{62, 8}, {100, -10}}, textString = "fe")}, coordinateSystem(initialScale = 0.1)),
    Documentation(info="<html>
<p>
StaVmea model in PowerFactory measures voltage and frequency. Frequency in PowerFactory is computed with respect to the frame rorating with frequency equal to the synchronous machine. This is supported via the input omega here. Most of the OpenIPSL examples do not provide omega of the reference machine and thus, if the input is not connected the frequency is computed with respect to the 50Hz reference frame and filtered to simulate the measurement delay. 
</p>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Model Name</p></td>
<td><p>StaVmea</p></td>
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
<td><p>Tin Rabuzin, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
<tr>
<td><p>Model Verification</p></td>
<td><p>This model has not been verified against PowerFactory.</p></td>
</tr>
<tr>
<td><p>Description</p></td>
<td></td>
</tr>
</table>
</html>"));
end StaVmea;
