within OpenIPSL.Tests.Sources;
model VoltageSourceReImInputVaryImag
  "Test model for the VoltageSourceReImInput model with varying the imaginary part"
  extends VoltageSourceReImInputConstant(redeclare Modelica.Blocks.Sources.Ramp vIm(
      height=3.14/8,
      duration=2.5,
      startTime=5));
  annotation (experiment(StopTime=10),
      Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>None.</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2022-11-01 (First commit)</p></td>
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
<p>This model shows how to use the component in <code>Electrical.Sources.VoltageSourceReImInput</code> with user specified <strong>constant real and varying imaginary parts</strong> of the voltage phasor of the source.</p>
</html>"));
end VoltageSourceReImInputVaryImag;
