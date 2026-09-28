within OpenIPSL.Electrical.Loads.PSAT;
model ZIP "ZIP Load"
  extends BaseClasses.baseLoad;
  parameter Types.PerUnit Pz=0.33 "Conductance";
  parameter Types.PerUnit Pi=0.33 "Active current";
  parameter Types.PerUnit Pp=1 - Pz - Pi "Active power";
  parameter Types.PerUnit Qz=0.33 "Susceptance";
  parameter Types.PerUnit Qi=0.33 "Reactive current";
  parameter Types.PerUnit Qp=1 - Qz - Qi "Reactive power";
protected
  Real a(start=1) "Auxiliary variable, voltage division";
equation
  a = v/v_0;
  P = P_0/S_b*(Pz*a^2 + Pi*a + Pp);
  Q = Q_0/S_b*(Qz*a^2 + Qi*a + Qp);
  annotation (
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-09</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end ZIP;
