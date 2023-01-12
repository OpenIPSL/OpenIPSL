within OpenIPSL.Tests.Sources;
model VoltageSourceReImInputConstant
  "Test model for the VoltageSourceReImInput model with constant input"
  extends BaseClasses.SMIB;
  replaceable
  Modelica.Blocks.Sources.Constant vRe(k=1) constrainedby Modelica.Blocks.Interfaces.SO
    annotation (Placement(transformation(extent={{-96,14},{-84,26}})));
  replaceable
  Modelica.Blocks.Sources.Constant vIm(k=0) constrainedby Modelica.Blocks.Interfaces.SO
    annotation (Placement(transformation(extent={{-96,-26},{-84,-14}})));
  Electrical.Sources.VoltageSourceReImInput vSource
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(vSource.p, GEN1.p)
    annotation (Line(points={{-39,0},{-30,0}}, color={0,0,255}));
  connect(vIm.y, vSource.vIm) annotation (Line(points={{-83.4,-20},{-70,-20},{-70,-4},{-62,-4}}, color={0,0,127}));
  connect(vRe.y, vSource.vRe) annotation (Line(points={{-83.4,20},{-70,20},{-70,4},{-62,4}}, color={0,0,127}));
  annotation (experiment(StopTime=10),
      Documentation(info="<html>
<p>This model shows how to use the component in <code>Electrical.Sources.VoltageSourceReImInput</code> with user specified <strong>constant real and imaginary parts</strong> of the voltage phasor of the source.</p>
</html>", revisions="<html>
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
</html>"));
end VoltageSourceReImInputConstant;
