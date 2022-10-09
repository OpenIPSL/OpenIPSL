within OpenIPSL.Electrical.Controls.PSAT.AVR;
model AVRtypeIII "PSAT AVR Type 3"
  parameter Types.PerUnit vfmax=5;
  parameter Types.PerUnit vfmin=-5;
  parameter Types.PerUnit K0=20 "regulator gain";
  parameter Types.Time T2=0.1 "regulator pole";
  parameter Types.Time T1=0.45 "Regulator zero";
  parameter Types.Time Te=0.1 "Field circuit time constant";
  parameter Types.Time Tr=0.0015 "Measurement time constant";
  Real vm;
  Real vr;
  Real vf1;
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=vfmax, uMin=vfmin)
    annotation (Placement(transformation(
        origin={5,0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Interfaces.RealInput v(start=1) annotation (Placement(
      transformation(
        origin={-119.972,50},
        extent={{-20.0,-20.0},{20.0,20.0}}),
      iconTransformation(
        origin={-110,60},
        extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput vf annotation (Placement(
      transformation(
        origin={130,0},
        extent={{-10.0,-10.0},{10.0,10.0}}),
      iconTransformation(
        origin={130,0},
        extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealInput vs annotation (Placement(transformation(
          extent={{-140,-82},{-100,-42}}), iconTransformation(extent={{-120,-70},
            {-100,-50}})));
  Modelica.Blocks.Interfaces.RealInput vf0(start=1) annotation (Placement(
      transformation(
        origin={0.028,120},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=-90),
      iconTransformation(
        origin={0,110},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
protected
  parameter Types.PerUnit vref(fixed=false);
  parameter Types.PerUnit s0(fixed=false);
initial equation
  vref = v;
  s0 = vs;
  vf1 = vf0;
  vm = v;
  vr = K0*(1 - T1/T2)*(vref + vs - vm);
equation
  der(vm) = (v - vm)/Tr;
  der(vr) = (K0*(1 - T1/T2)*(vref + vs - vm) - vr)/T2;
  der(vf1) = ((vr + K0*(T1/T2)*(vref + vs - vm) + vf0)*(1 + s0*(v/vm - 1)) -
    vf1)/Te;
  limiter1.u = vf1;
  limiter1.y = vf;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,-120},{120,
            120}}), graphics={Rectangle(
          extent={{-120,120},{120,-120}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-104,72},{-72,50}},
          textColor={0,0,255},
          textString="v"),Text(
          extent={{-100,-48},{-68,-70}},
          textColor={0,0,255},
          textString="vs"),Text(
          extent={{88,10},{120,-12}},
          textColor={0,0,255},
          textString="vf"),Text(
          extent={{-34,36},{42,-24}},
          textColor={0,0,255},
          textString="AVRTypeIII"),Text(
          extent={{-16,100},{16,78}},
          textColor={0,0,255},
          textString="vf0")}),
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
</html>", info="<html>
<p>See also <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Milano2013], section 18.3.3</a>
 or <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Milano2010], chapter 16.2.3</a>.</p>
</html>"),
    Diagram(coordinateSystem(extent={{-120,-120},{120,120}})));
end AVRtypeIII;
