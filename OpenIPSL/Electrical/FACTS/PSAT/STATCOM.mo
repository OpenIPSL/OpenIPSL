within OpenIPSL.Electrical.FACTS.PSAT;
model STATCOM "Static Synchronous Compensator (PSAT)"
  extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enabledisplayPF=false,
    final enableQ_0=true,
    final enableP_0=false,
    final enablefn=false,
    final enableangle_0=true,
    final enablev_0=true,
    final enableV_b=true,
    final enableS_b=true,
    P_0 = 0);
  OpenIPSL.Interfaces.PwPin p(vr(start=vr0), vi(start=vi0)) annotation (
      Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));

  parameter Types.ApparentPower Sn=S_b "Power rating"
    annotation (Dialog(group="Device parameters"));
  parameter Types.Voltage Vn=V_b "Voltage rating"
    annotation (Dialog(group="Device parameters"));
  parameter Real Kr=0.1 "Regulator gain [pu/pu]"
    annotation (Dialog(group="Device parameters"));
  parameter Types.Time Tr=0.01 "Regulator time constant"
    annotation (Dialog(group="Device parameters"));
  parameter Types.PerUnit i_Max=0.7 "Maximum current (device base)"
    annotation (Dialog(group="Device parameters"));
  parameter Types.PerUnit i_Min=-0.1 "Minimum current (device base)"
    annotation (Dialog(group="Device parameters"));
  parameter Boolean useWindupGuard=true
    "true: LagLimWindupGuard, PSAT's non-windup limit (STclass/fcall.m, fm_windup); false: SimpleLagLim, as before this option (same output, its state winds up past the limit)"
    annotation (Dialog(group="Device parameters"));
  Types.PerUnit v(start=v_0) "Bus voltage magnitude";
  Types.PerUnit Q
              "Injected reactive power (system base)";
protected
  Modelica.Blocks.Interfaces.RealOutput i_SH "STATCOM current" annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{34,-10},{54,10}})));
public
  Modelica.Blocks.Math.Add3 feedback(k1=-1) annotation (Placement(transformation(extent={{-46,-10},
            {-26,10}})));
  Modelica.Blocks.Sources.RealExpression V(y=v)
    annotation (Placement(transformation(extent={{-90,30},{-70,50}})));
  Modelica.Blocks.Sources.RealExpression V_ref(y=v_ref) annotation (Placement(transformation(extent={{-90,-50},{-70,-30}})));
  Modelica.Blocks.Interfaces.RealInput v_POD annotation (Placement(
        transformation(extent={{-140,-20},{-100,20}}),iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,120})));
protected
  parameter Types.Current In=Sn/Vn "Nominal current (device base)";
  parameter Types.Current I_b=S_b/V_b "Base current";
  parameter Types.PerUnit i_max=i_Max*In/I_b "Max current (system base)";
  parameter Types.PerUnit i_min=i_Min*In/I_b "Min current (system base)";
  parameter Types.PerUnit vr0=v_0*cos(angle_0) "Initial real voltage";
  parameter Types.PerUnit vi0=v_0*sin(angle_0) "Initial imaginary voltage";
  parameter Types.PerUnit u0=v_ref - v_0 "Initial controller input";
  parameter Types.PerUnit i0=(Q_0/S_b)/v_0 "Initial current";
  parameter Types.PerUnit v_ref=i0/Kr + v_0 "Reference voltage";

public
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=Kr,
    T=Tr,
    y_start=i0,
    outMax=i_max,
    outMin=i_min,
    u(start=u0)) if not useWindupGuard
    annotation (Placement(transformation(extent={{0,-20},{40,20}})));
  NonElectrical.Continuous.LagLimWindupGuard lagLimWindupGuard(
    K=Kr,
    T=Tr,
    y_start=i0,
    outMax=i_max,
    outMin=i_min,
    u(start=u0)) if useWindupGuard
    annotation (Placement(transformation(extent={{0,24},{40,64}})));
equation
  v = sqrt(p.vr^2 + p.vi^2);
  0 = p.vr*p.ir + p.vi*p.ii;
  -Q = p.vi*p.ir - p.vr*p.ii;
  Q = i_SH*v;

  connect(simpleLagLim.y, i_SH) annotation (Line(points={{42,0},{70,0}}, color={0,0,127}));
  connect(feedback.y, simpleLagLim.u)
    annotation (Line(points={{-25,0},{-4,0}}, color={0,0,127}));
  connect(lagLimWindupGuard.y, i_SH) annotation (Line(points={{42,44},{56,44},{56,0},{70,0}}, color={0,0,127}));
  connect(feedback.y, lagLimWindupGuard.u)
    annotation (Line(points={{-25,0},{-14,0},{-14,44},{-4,44}}, color={0,0,127}));
  connect(V.y, feedback.u1) annotation (Line(points={{-69,40},{-64,40},{-64,8},{
          -48,8}}, color={0,0,127}));
  connect(V_ref.y, feedback.u3) annotation (Line(points={{-69,-40},{-64,-40},{-64,
          -8},{-48,-8}}, color={0,0,127}));
  connect(v_POD, feedback.u2)
    annotation (Line(points={{-120,0},{-48,0}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={28,108,200}),
                               Ellipse(
          extent={{0,30},{60,-30}},
          lineColor={0,0,255}),
                              Line(
          points={{92,0},{100,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-90,4},{-70,4}},
          color={0,0,255}),
                         Line(
          points={{-90,-4},{-70,-4}},
          color={0,0,255}), Line(
          points={{-52,20},{-80,20},{-80,4}},
          color={0,0,255}), Text(
          extent={{-78,-46},{82,-86}},
          textColor={28,108,200},
          textString="%name"),
        Line(points={{-18,0},{-14,0}}, color={217,67,180}),
        Polygon(
          points={{-20,-6},{-26,4},{-14,4},{-20,-6}},
          lineColor={217,67,180},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-40,4},{-46,-6},{-34,-6},{-40,4}},
          lineColor={217,67,180},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-46,4},{-34,4}}, color={217,67,180}),
        Line(points={{-26,-6},{-14,-6}}, color={217,67,180}),
        Rectangle(extent={{-40,20},{-20,-20}}, lineColor={217,67,180}),
        Line(points={{-30,20},{-30,30}}, color={217,67,180}),
        Line(points={{-30,-30},{-30,-20}}, color={217,67,180}),
        Rectangle(extent={{-52,34},{-8,-34}}, lineColor={0,0,255}),
                              Line(
          points={{-8,0},{0,0}},
          color={0,0,255},
          smooth=Smooth.None), Ellipse(
          extent={{32,28},{92,-32}},
          lineColor={0,0,255}),
        Line(points={{-80,-4},{-80,-20},{-52,-20}}, color={0,0,255})}),
    Documentation(info="<html>
<p>The following documentation is adapted from
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[Milano2010], chapter 20.3</a>:</p>
<blockquote>
<p>The implemented STATCOM model is a current injection model [...].
The STATCOM current is always kept in quadrature in relation
to the bus voltage so that only reactive power is exchanged between the ac system
and the STATCOM.
</p>
</blockquote>
<p><b>Limiter.</b> <code>useWindupGuard = true</code> (the default) limits the current with <a href=\"modelica://OpenIPSL.NonElectrical.Continuous.LagLimWindupGuard\">LagLimWindupGuard</a>, PSAT's non-windup limit (<code>@STclass/fcall.m</code>, <code>fm_windup</code>); <code>false</code> uses <a href=\"modelica://OpenIPSL.NonElectrical.Continuous.SimpleLagLim\">SimpleLagLim</a>, as before the option. The two give the same output; their state and the events differ. <code>SimpleLagLim</code>'s anti-windup relation is zero at rest, and System Modeler makes an event of each of its sign changes: with it the STATCOM at rest stops after thousands of events in System Modeler, with the guard it runs.</p>
<p>The input <code>v_POD</code> adds to the voltage reference (a power oscillation damper, or a reference step).</p>
</html>", revisions="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8 <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Milano2013]</a></p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-10-30</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/dietmarw\">@dietmarw</a>,
       <a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a>
       (original: MAA Murad, SmarTS Lab)</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end STATCOM;
