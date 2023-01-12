within OpenIPSL.Electrical.Sources;
model CurrentSourceReImInput
  "Ideal current source with user defined real and imaginary parts of the current phasor"
  extends OpenIPSL.Electrical.Essentials.pfComponent(enableS_b = true);
  Types.Angle angle "Bus voltage angle";
  Types.Voltage v "Bus voltage magnitude";
  Types.ActivePower P "Active Power absorbed or provided by the source";
  Types.ReactivePower Q "Reactive Power absorbed or provided by the source";
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput iRe "Real Part of voltage phasor"
    annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput iIm "Imaginary Part of Voltage Phasor"
    annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));
equation
  p.ir =iRe;
  p.ii =iIm;
  v = sqrt(p.vr^2 + p.vi^2);
  angle = atan2(p.vi, p.vr);
  P = -(p.vr*p.ir + p.vi*p.ii)*S_b;
  Q = -(p.vr*p.ii - p.vi*p.ir)*S_b;
  annotation(Icon(graphics={ Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={213,255,170},
          fillPattern=FillPattern.Solid),
                         Text(
          extent={{-40,20},{40,-20}},
          lineColor={0,0,0},
          textString="%name"),
        Line(points={{-90,0},{-50,0}}, color={0,0,0}),
        Line(points={{50,0},{80,0}}, color={0,0,0}),
        Polygon(
          points={{70,10},{70,-10},{90,0},{70,10}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}), Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>None.</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2022-11-02 (First commit)</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Luigi Vanfretti, Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>", info="<html>
<p>This model allows the user to specify the voltage real and imaginary part of the voltage phasor of an ideal voltage source. </p>
<p>The value of each part of the phasor have to be provided through sources from Modelica.Blocks.Sources with Real valued interfaces to be connected to the vRe and vIm real interfaces.</p>
</html>"));
end CurrentSourceReImInput;
