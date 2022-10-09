within OpenIPSL.Electrical.Machines.PSAT;
model MotorTypeV "Induction Machine - Order V"
  extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enabledisplayPF=false,
    final enablefn=false,
    final enableV_b=false,
    final enableangle_0=true,
    final enablev_0=true,
    final enableQ_0=true,
    final enableP_0=true,
    final enableS_b=true);
  parameter Integer Sup=1 "Start up control" annotation (Dialog(group=
          "Machine parameters"), choices(choice=0, choice=1));
  parameter Types.PerUnit Rs=0.01 "Stator resistance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Xs=0.15 "Stator reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Rr1=0.05 "1st cage rotor resistance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Xr1=0.15 "1st cage rotor reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Rr2=0.001 "2nd cage rotor resistance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Xr2=0.04 "2nd cage rotor reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Xm=5 "Magnetizing reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.Time Hm=3 "Inertia constant"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit a=0.13 "1st coefficient of tau_m(w)"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit b=0.02 "2nd coefficient of tau_m(w)"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit c=0.024 "3rd coefficient of tau_m(w)"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.Time tup=0 "Start up time"
    annotation (Dialog(group="Machine parameters"));
  Types.PerUnit v(start=v_0) "Bus voltage magnitude";
  Types.Angle anglev(start=angle_0) " Bus voltage angle";
  Types.PerUnit s(start=S0);
  //(start=Rr1*P_0*(Q_0+v_0*v_0/Xm)/(v_0*v_0*v_0*v_0*(Xs + Xr1)));
  Types.PerUnit Tm;
  Types.PerUnit Te;
  Types.PerUnit P(start=P_0/S_b);
  Types.PerUnit Q(start=Q_0/S_b);
  Types.PerUnit e1r(start=epr0);
  Types.PerUnit e1m(start=epm0);
  Types.PerUnit e2r(start=0.0353);
  Types.PerUnit e2m(start=0.9995);
  Types.PerUnit Vr;
  Types.PerUnit Vm;
  Types.PerUnit Ir;
  Types.PerUnit Im;
  OpenIPSL.Interfaces.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0))
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  import Modelica.Constants.pi;

protected
  parameter Types.AngularVelocity Omegab=2*pi*fn "Base freq in rad/s";
  parameter Types.PerUnit vr0=v_0*cos(angle_0);
  parameter Types.PerUnit vi0=v_0*sin(angle_0);
  parameter Types.PerUnit ir0=(P_0*vr0 + Q_0*vi0)/(vr0^2 + vi0^2);
  parameter Types.PerUnit ii0=(P_0*vi0 - Q_0*vr0)/(vr0^2 + vi0^2);
  parameter Types.PerUnit A=a + b + c;
  parameter Types.PerUnit B=(-b) - 2*c;
  parameter Types.PerUnit C=c;
  parameter Types.PerUnit X0=Xs + Xm;
  parameter Types.PerUnit X1=Xs + Xr1*Xm/(Xr1 + Xm);
  parameter Types.Time T10=(Xr1 + Xm)/(Omegab*Rr1);
  parameter Types.PerUnit X2=Xs + Xr1*Xm*Xr2/(Xr1*Xr2 + Xr1*Xm + Xr2*Xm);
  parameter Types.Time T20=(Xr2 + Xr1*Xm/(Xr1 + Xm))/(Omegab*Rr2);
  parameter Real a05=Rs^2 + X2^2;
  parameter Real a15=Rs/a05;
  parameter Real a25=X2/a05;
  parameter Real a35=X0 - X1;
  parameter Real a45=X1 - X2;
  parameter Types.PerUnit i2=ir0*ir0 + ii0*ii0;
  parameter Real K=Rr1/((Xr1 + Xm)*A);
  parameter Real K2=1 + T10*T10*Omegab*Omegab*S0*S0;
  parameter Real K1=T10*Omegab*S0;
  parameter Types.PerUnit S0=K*((-Q_0/S_b) + X0*i2);
  parameter Real epm0=(K1*(X0 - X1)*ir0 + (X0 - X1)*(-1)*ii0)/K2;
  parameter Real epr0=(K1*(X0 - X1)*(-1)*ii0 - (X0 - X1)*ir0)/K2;
initial equation
  der(e2r) = 0;
  der(e2m) = 0;
  der(s) = 0;
  der(e1r) = 0;
  der(e1m) = 0;
equation
  anglev = atan2(p.vi, p.vr);
  v = sqrt(p.vr^2 + p.vi^2);
  Vr = p.vi;
  Vm = p.vr;
  Im = p.ir;
  Ir = -p.ii;
  P = p.vr*p.ir + p.vi*p.ii;
  Q = (-p.vr*p.ii) + p.vi*p.ir;
  Ir = a15*((-Vr) - e2r) + a25*(Vm - e2m);
  Im = (-a25*((-Vr) - e2r)) + a15*(Vm - e2m);
  der(s) = (Tm - Te)/(2*Hm);
  Te = e2r*Ir + e2m*Im;
  der(e1r) = Omegab*s*e1m - (e1r + a35*Im)/T10;
  der(e1m) = (-Omegab*s*e1r) - (e1m - a35*Ir)/T10;
  der(e2r) = (-Omegab*s*(e1m - e2m)) + der(e1r) + (e1r - e2r - a45*Im)/T20;
  der(e2m) = Omegab*s*(e1r - e2r) + der(e1m) + (e1m - e2m + a45*Ir)/T20;
  Tm = A + B*s + C*s*s;
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
end MotorTypeV;
