within OpenIPSL.Electrical.Loads.PSAT;
model Mixed "Mixload - Mixed Load"
  extends BaseClasses.baseLoad;
  parameter Types.PerUnit Kpf=0 "Frequency coefficient for the active power";
  parameter Real alpha=0 "Voltage exponent for the active power";
  parameter Types.Time Tpv=0.12 "Time constant of dV/dt for the active power";
  parameter Types.PerUnit Kqf=0 "Frequency coefficient for the reactive power";
  parameter Real beta=0 "Voltage exponent for the reactive power";
  parameter Types.Time Tqv=0.075 "Time constant of dV/dt for the reactive power";
  parameter Types.Time Tfv=0.005 "Time constant of voltage magnitude filter";
  parameter Types.Time Tft=0.007 "Time constant of voltage angle filter";
  Types.PerUnit deltaw "Frequency deviation";
protected
  Real a(start=1) "Auxiliary variable, voltage division";
  Real b "Auxiliary variable, derivation";
  Real x(start=-v_0/Tfv);
  Types.Angle phi(start=angle_0) "Voltage angle through a first-order lag of time constant Tft";
equation
  a = v/v_0;
  der(x) = ((-v/Tfv) - x)/Tfv;
  b = x + v/Tfv;
  deltaw = atan2(p.vi*cos(phi) - p.vr*sin(phi), p.vr*cos(phi) + p.vi*sin(phi))/(2*C.pi*fn*Tft) "The voltage angle minus phi, from the phasor rotated by -phi: it never wraps where anglev does";
  der(phi) = 2*C.pi*fn*deltaw;
  P = Kpf*deltaw + P_0/S_b*(a^alpha + Tpv*b);
  Q = Kqf*deltaw + Q_0/S_b*(a^beta + Tqv*b);
  annotation (
    Documentation(info="<html>
<p>The frequency deviation is the voltage angle &theta; through a washout filter of time constant
<code>Tft</code>, as in PSAT: <code>deltaw</code> = s&theta;/(&omega;<sub>0</sub>(1 + sTft)), with
&omega;<sub>0</sub> = 2&pi;fn. It is computed as (&theta; - &phi;)/(&omega;<sub>0</sub>Tft), where
&phi; = &theta;/(1 + sTft) is the angle through a first-order lag, and &theta; - &phi; is the angle
of the voltage phasor rotated by -&phi;. The angle <code>anglev</code> of the base class,
<code>atan2(vi, vr)</code>, jumps by 2&pi; where the voltage angle passes &plusmn;&pi; - in any
network without an infinite bus whose frequency differs from <code>fn</code> - and a filter on it
turns each jump into a spurious frequency spike of about 1/(fn&middot;Tft) pu. &theta; - &phi; stays
small: it would wrap only for a frequency deviation above 1/(2fn&middot;Tft) pu.</p>
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
end Mixed;
