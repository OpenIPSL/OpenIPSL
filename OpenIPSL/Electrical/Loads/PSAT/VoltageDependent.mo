within OpenIPSL.Electrical.Loads.PSAT;
model VoltageDependent "Voltage Dependent Load"
  extends BaseClasses.baseLoad;
  parameter Real alphap=2.0 "Active power exponent";
  parameter Real alphaq=2.0 "Reactive power exponent";
protected
  Real a(start=1) "Auxiliary variable, voltage division";
equation
  a = v/v_0;
  P = P_0/S_b*a^alphap;
  Q = Q_0/S_b*a^alphaq;
  annotation ( Documentation(revisions="<html>
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
end VoltageDependent;
