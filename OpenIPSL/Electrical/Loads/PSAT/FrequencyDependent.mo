within OpenIPSL.Electrical.Loads.PSAT;
model FrequencyDependent "Fl - Frequency Dependent Load"
  extends BaseClasses.baseLoad;
  parameter Real alpha_p=0 "Active power voltage coefficient";
  parameter Real alpha_q=0 "Reactive power voltage coefficient";
  parameter Real beta_p=1.3 "Active power frequency coefficient";
  parameter Real beta_q=1.3 "Reactive power frequency coefficient";
  parameter Types.Time Tf=0.1 "Filter time constant";
  Types.PerUnit deltaw "Frequency deviation";
protected
  Real a(start=1) "Auxiliary variable, voltage division";
  Real x(start=0) "auxiliary variable";
initial equation
  der(x) = 0;
equation
  a = v/v_0;
  der(x) = -deltaw/Tf;
  0 = x + 1/(2*C.pi*fn)*1/Tf*(anglev - angle_0) - deltaw;
  P = P_0/S_b*a^alpha_p*(1 + deltaw)^beta_p;
  Q = Q_0/S_b*a^alpha_q*(1 + deltaw)^beta_q;
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
end FrequencyDependent;
