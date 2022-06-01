within OpenIPSL.Electrical.Branches.Simulink.LTC;
model LTC_quantizer "Quantizer block for load tap changing transformer implementation"
  Modelica.Blocks.Interfaces.RealInput p annotation (Placement(transformation(
          extent={{-76,-2},{-56,18}}), iconTransformation(extent={{-90,-18},{-56,
            18}})));
  Modelica.Blocks.Interfaces.RealOutput n annotation (Placement(transformation(
          extent={{70,-4},{90,16}}), iconTransformation(extent={{70,-14},{100,
            16}})));
  parameter Real Ratio[1, 33]=[0.88, 0.89, 0.9, 0.91, 0.92, 0.93, 0.94, 0.95,
      0.96, 0.97, 0.98, 0.99, 1, 1.01, 1.02, 1.03, 1.04, 1.05, 1.06, 1.07, 1.08,
      1.09, 1.1, 1.11, 1.12, 1.13, 1.14, 1.15, 1.16, 1.17, 1.18, 1.19, 1.2];
equation
  if 0.77 <= p and p < Ratio[1, 2] then
    n = Ratio[1, 1];
  elseif Ratio[1, 2] <= p and p < Ratio[1, 3] then
    n = Ratio[1, 2];
  elseif Ratio[1, 3] <= p and p < Ratio[1, 4] then
    n = Ratio[1, 3];
  elseif Ratio[1, 4] <= p and p < Ratio[1, 5] then
    n = Ratio[1, 4];
  elseif Ratio[1, 5] <= p and p < Ratio[1, 6] then
    n = Ratio[1, 5];
  elseif Ratio[1, 6] <= p and p < Ratio[1, 7] then
    n = Ratio[1, 6];
  elseif Ratio[1, 7] <= p and p < Ratio[1, 8] then
    n = Ratio[1, 7];
  elseif Ratio[1, 8] <= p and p < Ratio[1, 9] then
    n = Ratio[1, 8];
  elseif Ratio[1, 9] <= p and p < Ratio[1, 10] then
    n = Ratio[1, 9];
  elseif Ratio[1, 10] <= p and p < Ratio[1, 11] then
    n = Ratio[1, 10];
  elseif Ratio[1, 11] <= p and p < Ratio[1, 12] then
    n = Ratio[1, 11];
  elseif Ratio[1, 12] <= p and p < Ratio[1, 13] then
    n = Ratio[1, 12];
  elseif Ratio[1, 13] <= p and p < Ratio[1, 14] then
    n = Ratio[1, 13];
  elseif Ratio[1, 14] <= p and p < Ratio[1, 15] then
    n = Ratio[1, 14];
  elseif Ratio[1, 15] <= p and p < Ratio[1, 16] then
    n = Ratio[1, 15];
  elseif Ratio[1, 16] <= p and p < Ratio[1, 17] then
    n = Ratio[1, 16];
  elseif Ratio[1, 17] <= p and p < Ratio[1, 18] then
    n = Ratio[1, 17];
  elseif Ratio[1, 18] <= p and p < Ratio[1, 19] then
    n = Ratio[1, 18];
  elseif Ratio[1, 19] <= p and p < Ratio[1, 20] then
    n = Ratio[1, 19];
  elseif Ratio[1, 20] <= p and p < Ratio[1, 21] then
    n = Ratio[1, 20];
  elseif Ratio[1, 21] <= p and p < Ratio[1, 22] then
    n = Ratio[1, 21];
  elseif Ratio[1, 22] <= p and p < Ratio[1, 23] then
    n = Ratio[1, 22];
  elseif Ratio[1, 23] <= p and p < Ratio[1, 24] then
    n = Ratio[1, 23];
  elseif Ratio[1, 24] <= p and p < Ratio[1, 25] then
    n = Ratio[1, 24];
  elseif Ratio[1, 25] <= p and p < Ratio[1, 26] then
    n = Ratio[1, 25];
  elseif Ratio[1, 26] <= p and p < Ratio[1, 27] then
    n = Ratio[1, 26];
  elseif Ratio[1, 27] <= p and p < Ratio[1, 28] then
    n = Ratio[1, 27];
  elseif Ratio[1, 28] <= p and p < Ratio[1, 29] then
    n = Ratio[1, 28];
  elseif Ratio[1, 29] <= p and p < Ratio[1, 30] then
    n = Ratio[1, 29];
  elseif Ratio[1, 30] <= p and p < Ratio[1, 31] then
    n = Ratio[1, 30];
  elseif Ratio[1, 31] <= p and p < Ratio[1, 32] then
    n = Ratio[1, 31];
  elseif Ratio[1, 32] <= p and p < Ratio[1, 33] then
    n = Ratio[1, 32];
  else
    n = Ratio[1, 33];
  end if;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(extent={{-54,46},{70,-42}}, lineColor={
          0,0,255}),Line(
          points={{-36,-36},{-26,-36},{-26,-28},{-16,-28},{-16,-18},{-8,-18},{-8,
            -8},{2,-8},{2,2},{10,2},{10,10},{18,10},{18,18},{26,18},{26,26},{34,
            26},{34,32},{42,32},{42,38},{50,38},{50,44},{60,44}},
          color={0,0,255},
          smooth=Smooth.None)}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Load Tap Changer's quantizer</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end LTC_quantizer;
