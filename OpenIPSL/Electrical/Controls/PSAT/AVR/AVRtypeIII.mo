within OpenIPSL.Electrical.Controls.PSAT.AVR;
model AVRtypeIII "PSAT AVR Type 3"
  parameter Types.PerUnit vfmax=5;
  parameter Types.PerUnit vfmin=-5;
  parameter Types.PerUnit K0=20 "regulator gain";
  parameter Types.Time T2=0.1 "regulator pole";
  parameter Types.Time T1=0.45 "Regulator zero";
  parameter Types.Time Te=0.1 "Field circuit time constant";
  parameter Types.Time Tr=0.0015 "Measurement time constant";
  parameter Boolean busFed=false
    "true: the exciter is fed from the generator's terminals, its output scaled by v/v0, as PSAT does when Exc.con column 9 is not 0; false (default): no scaling, PSAT with column 9 = 0"
    annotation (Evaluate=true, choices(checkBox=true));
  parameter Boolean useWindupGuard=true
    "true (default, reproduces PSAT): LagLimWindupGuard, the field voltage held at its limits (PSAT's fm_windup); false: SimpleLag and Limiter, as before this option (the lag's state winds up past the limits)"
    annotation (Evaluate=true, choices(checkBox=true), Dialog(group="Limiter"));
  Real vm "Measured voltage";
  Real vr "Regulator state";
  Modelica.Blocks.Sources.RealExpression fieldCommand(y=(vr + K0*(T1/T2)*(vref
         + vs - vm) + vf0)*(if busFed then v/v0 else 1))
    "Input of the field circuit: the regulator's output plus vf0, scaled by v/v0 when bus-fed"
    annotation (Placement(transformation(extent={{-80,-10},{-40,10}})));
  NonElectrical.Continuous.LagLimWindupGuard lagLimWindupGuard(
    K=1,
    T=Te,
    y_start=vf00,
    outMax=vfmax,
    outMin=vfmin) if useWindupGuard
    "Field circuit with a non-windup limit, as in PSAT"
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
  NonElectrical.Continuous.SimpleLag simpleLag(
    K=1,
    T=Te,
    y_start=vf00) if not useWindupGuard
    "Field circuit without a limit on its state (useWindupGuard = false)"
    annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=vfmax, uMin=vfmin) if not
    useWindupGuard "Limit on the field voltage (useWindupGuard = false)"
    annotation (Placement(transformation(
        origin={50,-30},
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
  parameter Types.PerUnit vref(fixed=false, start=1);
  parameter Types.PerUnit v0(fixed=false, start=1)
    "Initial terminal voltage, the base of the bus-fed scaling (a start value, since it divides v)";
  parameter Types.PerUnit vf00(fixed=false, start=1) "Initial field voltage";
initial equation
  vref = v;
  v0 = v;
  vf00 = vf0;
  vm = v;
  vr = K0*(1 - T1/T2)*(vref + vs - vm);
equation
  der(vm) = (v - vm)/Tr;
  der(vr) = (K0*(1 - T1/T2)*(vref + vs - vm) - vr)/T2;
  connect(fieldCommand.y, lagLimWindupGuard.u)
    annotation (Line(points={{-38,0},{-20,0},{-20,30},{-2,30}}, color={0,0,127}));
  connect(lagLimWindupGuard.y, vf)
    annotation (Line(points={{21,30},{90,30},{90,0},{130,0}}, color={0,0,127}));
  connect(fieldCommand.y, simpleLag.u)
    annotation (Line(points={{-38,0},{-20,0},{-20,-30},{-2,-30}}, color={0,0,127}));
  connect(simpleLag.y, limiter1.u)
    annotation (Line(points={{21,-30},{38,-30}}, color={0,0,127}));
  connect(limiter1.y, vf)
    annotation (Line(points={{61,-30},{90,-30},{90,0},{130,0}}, color={0,0,127}));
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
<p>The model follows PSAT 2.1.11 (<code>@AVclass/fcall.m</code>, type 3) in two respects that two parameters
select:</p>
<ul>
<li><code>busFed</code>: an exciter fed from the generator's terminals. PSAT multiplies the input of the field
circuit by <code>s = v/v0</code>, with <code>v0</code> the initial bus voltage, when column 9 of
<code>Exc.con</code> is not 0 (<code>@AVclass/setx0.m</code> sets it), and leaves it unscaled when column 9 is 0.
<code>busFed = true</code> is the former, the default <code>busFed = false</code> the latter. Before this
parameter the scaling was <code>1 + s0*(v/vm - 1)</code> with <code>s0</code> the stabiliser input at the start,
which is 0 in steady state, so the term was never on.</li>
<li><code>useWindupGuard</code>: the field voltage's limits. PSAT holds the field state at <code>vfmax</code> and
<code>vfmin</code> while the input pushes it further out (<code>fm_windup.m</code>, a non-windup limit). The
default, <code>useWindupGuard = true</code>, does the same with
<a href=\"modelica://OpenIPSL.NonElectrical.Continuous.LagLimWindupGuard\">LagLimWindupGuard</a>;
<code>useWindupGuard = false</code> keeps the model as it was before this option, a lag whose state winds up past
the limits followed by a limiter on its output, which leaves a limit later than PSAT once the field voltage has
been held there. A model whose field voltage reaches a limit therefore behaves differently with the default than it
did before this option; one that never reaches its limits does not change. <code>busFed = false</code>, the default,
leaves out only the bus-fed scaling, not the limit.</li>
</ul>
<p><a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.AVR.AVRTypeIII_BusFed_on\">Tests.Controls.PSAT.AVR.AVRTypeIII_BusFed_on</a>
and <a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.AVR.AVRTypeIII_BusFed_off\">AVRTypeIII_BusFed_off</a> show the
bus-fed term through a long fault, the second also the field voltage held at its ceiling.</p>
</html>"),
    Diagram(coordinateSystem(extent={{-120,-120},{120,120}})));
end AVRtypeIII;
