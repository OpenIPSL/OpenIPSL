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
  Types.Angle phi(start=angle_0) "Voltage angle through a first-order lag of time constant Tf";
initial equation
  der(phi) = 0;
equation
  a = v/v_0;
  deltaw = atan2(p.vi*cos(phi) - p.vr*sin(phi), p.vr*cos(phi) + p.vi*sin(phi))/(2*C.pi*fn*Tf) 
      "The voltage angle minus phi, from the phasor rotated by -phi: it never wraps where anglev does";
  der(phi) = 2*C.pi*fn*deltaw;
  P = P_0/S_b*a^alpha_p*(1 + deltaw)^beta_p;
  Q = Q_0/S_b*a^alpha_q*(1 + deltaw)^beta_q;
  annotation (
    Documentation(info="<html>
<p>The frequency deviation is the voltage angle &theta; through a washout filter of time constant
<code>Tf</code>, as in PSAT: <code>deltaw</code> = s&theta;/(&omega;<sub>0</sub>(1 + sTf)), with
&omega;<sub>0</sub> = 2&pi;fn. It is computed as (&theta; - &phi;)/(&omega;<sub>0</sub>Tf), where
&phi; = &theta;/(1 + sTf) is the angle through a first-order lag, and &theta; - &phi; is the angle
of the voltage phasor rotated by -&phi;. The angle <code>anglev</code> of the base class,
<code>atan2(vi, vr)</code>, jumps by 2&pi; where the voltage angle passes &plusmn;&pi; - in any
network without an infinite bus whose frequency differs from <code>fn</code> - and a filter on it
turns each jump into a spurious frequency spike of about 1/(fn&middot;Tf) pu. &theta; - &phi; stays
small: it would wrap only for a frequency deviation above 1/(2fn&middot;Tf) pu.</p>
</html>", revisions="<html>
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
