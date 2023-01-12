within OpenIPSL.Electrical.Solar.PSAT.ConstantPQPV;
model PQ1 "Constant PQ Generator, Solar Photo-Voltaic Generator"
  outer OpenIPSL.Electrical.SystemBase SysData "Use outer SystemBase record";
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  parameter Types.ApparentPower S_b=SysData.S_b "System base power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ApparentPower Sn=SysData.S_b "Nominal power";
  parameter Types.PerUnit v_0=1.00018548610126 "Voltage magnitude"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Angle angle_0=-0.0000253046024029618 "Voltage angle"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit P_0=0.4 "Active power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit Q_0=0.3 "Reactive power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Time Td=15 "d-axis inverter time constant";
  parameter Types.Time Tq=15 "q-axis inverter time constant";
protected
  parameter Real CoB=Sn/S_b;
  parameter Types.PerUnit Pref=P_0*CoB "active power initialization";
  parameter Types.PerUnit Qref=Q_0*CoB "reactive power initialization";
  parameter Types.PerUnit vd0=-v_0*sin(angle_0) "d-axis voltage initialization";
  parameter Types.PerUnit vq0=v_0*cos(angle_0) "q-axis voltage initialization";
  parameter Types.PerUnit idref=(vq0*Qref + Pref*vd0)/(vq0^2 + vd0^2) "d-axis current initialization";
  parameter Types.PerUnit iqref=((-vd0*Qref) + Pref*vq0)/(vq0^2 + vd0^2) "q-axis current initialization";
public
  Types.PerUnit v "Bus voltage magnitude";
  Types.Angle anglev "Bus voltage angle";
  Types.PerUnit id(start=idref) "d-axis current";
  Types.PerUnit iq(start=iqref) "q-axis current";
  Types.PerUnit vd(start=vd0) "d-axis voltage";
  Types.PerUnit vq(start=vq0) "q-axis voltage";
  Types.PerUnit P(start=Pref) "Active power";
  Types.PerUnit Q(start=Qref) "Reactive power";
  Types.PerUnit idref1(start=idref) "d-axis current setpoint";
  Types.PerUnit iqref1(start=iqref) "q-axis current setpoint";
equation
  P = vd*id + vq*iq;
  Q = vq*id - vd*iq;
  idref1 = (vq*Qref + Pref*vd)/(vq^2 + vd^2);
  iqref1 = ((-vd*Qref) + Pref*vq)/(vq^2 + vd^2);
  der(id) = (idref1 - id)/Td;
  der(iq) = (iqref1 - iq)/Tq;
  v = sqrt(p.vr^2 + p.vi^2);
  anglev = atan2(p.vi, p.vr);
  p.ir = -iq
    "change of sign due to the fact than in modelica when entering is + and in this case is going out";
  p.ii = id
    "change of sign due to the fact than in modelica when entering is + and in this case is going out";
  p.vr = vq;
  p.vi = -vd;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true),
        graphics={                                  Text(
            origin={0,0},
            extent={{-80,-40},{80,40}},
          textString="%name",
          lineColor={0,0,0}), Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,0})}),
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
end PQ1;
