within OpenIPSL.Tests.Sources;
model CurrentSourceReImInputConstant
  "Test model for the VoltageSourceReImInput model with constant input"
  extends BaseClasses.SMIB;
  Modelica.Blocks.Sources.Constant vRe(k=1)
    annotation (Placement(transformation(extent={{-96,14},{-84,26}})));
  Modelica.Blocks.Sources.Constant vIm(k=0)
    annotation (Placement(transformation(extent={{-96,-26},{-84,-14}})));
  Electrical.Sources.CurrentSourceReImInput iSource
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(iSource.p, GEN1.p)
    annotation (Line(points={{-39,0},{-30,0}}, color={0,0,255}));
  connect(iSource.iRe, vRe.y) annotation (Line(points={{-62,4},{-72,4},{-72,20},{-83.4,20}},
                       color={0,0,127}));
  connect(iSource.iIm, vIm.y) annotation (Line(points={{-62,-4},{-72,-4},{-72,-20},{-83.4,-20}},
                             color={0,0,127}));
  annotation (experiment(StopTime=10, __Dymola_Algorithm="Dassl"),
      Documentation(info="<html>
<p>This model shows how to use the component in <code>Electrical.Sources.CurrentSourceReImInput</code> with user specified <strong>constant real and imaginary parts</strong> of the current phasor of the source.</p>
</html>", revisions="<html>
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
</html>"));
end CurrentSourceReImInputConstant;
