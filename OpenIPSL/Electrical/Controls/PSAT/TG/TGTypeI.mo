within OpenIPSL.Electrical.Controls.PSAT.TG;
model TGTypeI "TG Type I"
  Modelica.Blocks.Interfaces.RealInput w "Rotor speed [pu]" annotation (
      Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput pm "Mechanical power [pu]" annotation (
      Placement(transformation(extent={{100,-10},{120,10}})));
  parameter Types.PerUnit wref=1 "Speed reference";
  parameter Types.PerUnit pref "Active power reference";
  parameter Types.PerUnit R "Droop";
  parameter Types.PerUnit pmax "Maximum turbine output";
  parameter Types.PerUnit pmin "Minimum turbine output";
  parameter Types.Time Ts "Governor time constant";
  parameter Types.Time Tc "Servo time constant";
  parameter Types.Time T3 "Transient gain time constant";
  parameter Types.Time T4 "Power fraction time constant";
  parameter Types.Time T5 "Reheat time constant";
  Types.PerUnit pin "Turbine output";
protected
  parameter Types.PerUnit pin0=pref "Initialization";
  parameter Types.PerUnit xg10=pin0 "Initialization";
  parameter Types.PerUnit xg20=(1 - T3/Tc)*xg10 "Initialization";
  parameter Types.PerUnit xg30=(1 - T4/T5)*(xg20 + T3*xg10/Tc) "Initialization";
  Types.PerUnit pinstar;
  Types.PerUnit xg1(start=xg10, fixed=true);
  Types.PerUnit xg2(start=xg20, fixed=true);
  Types.PerUnit xg3(start=xg30, fixed=true);
equation
  pinstar = pref + (wref - w)/R;
  if pinstar >= pmin and pinstar <= pmax then
    pin = pinstar;
  elseif pinstar > pmax then
    pin = pmax;
  else
    pin = pmin;
  end if;
  der(xg1) = (pin - xg1)/Ts;
  der(xg2) = ((1 - T3/Tc)*xg1 - xg2)/Tc;
  der(xg3) = ((1 - T4/T5)*(xg2 + T3*xg1/Tc) - xg3)/T5;
  pm = xg3 + (xg2 + T3*xg1/Tc)*T4/T5;
  annotation (
    Icon(graphics={ Text(
          extent={{-100,10},{-60,-10}},
          lineColor={0,0,0},
          textString="w"),Text(
          extent={{60,10},{100,-10}},
          lineColor={0,0,0},
          textString="pm"),
       Text(
          extent={{-60,0},{60,-80}},
          lineColor={0,0,255},
          textString="TGTypeI"),
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,0}),
        Text(
          extent={{-80,80},{80,20}},
          lineColor={0,0,0},
          textString="%name")}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSAT Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end TGTypeI;
