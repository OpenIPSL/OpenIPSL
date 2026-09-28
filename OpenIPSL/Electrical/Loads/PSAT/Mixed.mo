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
  Real y(start=0);
equation
  a = v/v_0;
  der(x) = ((-v/Tfv) - x)/Tfv;
  b = x + v/Tfv;
  der(y) = -1/Tft*(1/(2*C.pi*fn*Tft)*(anglev - angle_0) + y);
  deltaw = y + 1/(2*C.pi*fn*Tft)*(anglev - angle_0);
  P = Kpf*deltaw + P_0/S_b*(a^alpha + Tpv*b);
  Q = Kqf*deltaw + Q_0/S_b*(a^beta + Tqv*b);
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
end Mixed;
