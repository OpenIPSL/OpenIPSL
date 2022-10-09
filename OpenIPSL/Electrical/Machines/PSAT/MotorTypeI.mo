within OpenIPSL.Electrical.Machines.PSAT;
model MotorTypeI "Induction Machine - Order I"
  extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enabledisplayPF=false,
    final enablefn=false,
    final enableV_b=false,
    final enableangle_0=true,
    final enablev_0=true,
    final enableQ_0=true,
    final enableP_0=true,
    final enableS_b=true);
  parameter Integer Sup=1 "Start-up control" annotation (Dialog(group=
          "Machine parameters"), choices(choice=0, choice=1));
  parameter Types.PerUnit Rs=0.01 "Stator resistance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Xs=0.15 "Stator reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Rr1=0.05 "1st cage rotor resistance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Xr1=0.15 "1st cage rotor reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Xm=5 "Magnetizing reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.Time Hm=3 "Inertia constant [Ws/VA]"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit a=0.5 "1st coefficient of tau_m(w)"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit b=0.00 "2nd coefficient of tau_m(w)"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit c=0.00 "3rd coefficient of tau_m(w)"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.Time tup=0 "Start up time"
    annotation (Dialog(group="Machine parameters"));
  Types.PerUnit v(start=v_0) "Bus voltage magnitude";
  Types.Angle anglev(start=angle_0) "Bus voltage angle";
  Types.PerUnit s(start=Rr1*P_0/S_b*(Q_0/S_b + v_0*v_0/Xm)/(v_0*v_0*v_0*v_0*(Xs + Xr1)));
  Types.PerUnit Tm;
  Types.PerUnit P(start=P_0/S_b);
  Types.PerUnit Q(start=Q_0/S_b);
  Types.PerUnit Re;
  OpenIPSL.Interfaces.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0))
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
protected
  parameter Types.PerUnit vr0=v_0*cos(angle_0);
  parameter Types.PerUnit vi0=v_0*sin(angle_0);
  parameter Types.PerUnit ir0=(P_0/S_b*vr0 + Q_0/S_b*vi0)/(vr0^2 + vi0^2);
  parameter Types.PerUnit ii0=(P_0/S_b*vi0 - Q_0/S_b*vr0)/(vr0^2 + vi0^2);
  parameter Types.PerUnit A=a + b + c;
  parameter Types.PerUnit B=(-b) - 2*c;
  parameter Types.PerUnit C=c;
  parameter Types.PerUnit Xe=Xs + Xr1;
initial equation
  der(s) = 0;
equation
  P = p.vr*p.ir + p.vi*p.ii;
  Q = (-p.vr*p.ii) + p.vi*p.ir;
  anglev = atan2(p.vi, p.vr);
  v = sqrt(p.vr^2 + p.vi^2);
  Tm = A + B*s + C*s*s;
  Re = Rs + Rr1/s;
  //s=Rr1/(Re-Rs);
  der(s) = (Tm - P)/(2*Hm);
  p.ii = (-p.vr/Xm) + (p.vi*Re - p.vr*Xe)/(Re*Re + Xe*Xe);
  p.ir = p.vi/Xm + (p.vr*Re + p.vi*Xe)/(Re*Re + Xe*Xe);
  annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
            {100,100}}), graphics={Rectangle(
          fillColor={255,255,255},
          extent={{-100,-100},{100,100}}),Ellipse(
          fillColor={255,255,255},
          extent={{-56,-58},{55.9318,54}}),Text(
          extent={{-50,48},{50,-52}},
          textColor={0,0,0},
          textString="M"),Text(
          origin={0,-76.0978},
          fillPattern=FillPattern.Solid,
          extent={{-57.2101,-15.0},{57.2101,15.0}},
          fontName="Arial",
          textString="%name",
          lineColor={0,0,0})}), Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
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
end MotorTypeI;
