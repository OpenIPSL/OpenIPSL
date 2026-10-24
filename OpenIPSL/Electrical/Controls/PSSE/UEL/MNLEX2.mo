within OpenIPSL.Electrical.Controls.PSSE.UEL;
model MNLEX2 "Minimum Excitation Limiter [PSSE-MODELS]"
  parameter Types.PerUnit K_F2=0.1 "Rate feedback gain";
  parameter Types.Time T_F2=1 "Rate feedback time constant (>0)";
  parameter Types.PerUnit K_M=0.3 "MEL gain";
  parameter Types.Time T_M=0.5 "MEL time constant";
  parameter Types.PerUnit MEL_MAX=0.1 "Maximum limiter output";
  parameter Types.PerUnit Q_0=2.5 "Reactive power circle center in PQ plane (pu on machine base)";
  parameter Types.PerUnit Radius=3 "Reactive power circle radius in PQ plane (pu on machine base)";
  parameter Boolean useWindupGuard=true
    "true (default, as PSS/E, which holds the MEL state at its limit): LagLimWindupGuard; false: SimpleLagLim, as before this option (same output, its state winds up past the limit and is reset at every sign change of the relation K_M*u - state)"
    annotation (Evaluate=true, choices(checkBox=true), Dialog(group="Limiter"));
  Modelica.Blocks.Interfaces.RealInput QELEC
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput Eterm
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput PELEC
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Math.Add add(k1=-1)
    annotation (Placement(transformation(extent={{-74,-10},{-54,10}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{-80,50},{-60,70}})));
  Modelica.Blocks.Math.Gain gain(k=Q_0)
    annotation (Placement(transformation(extent={{-46,50},{-26,70}})));
  Modelica.Blocks.Math.Product product2
    annotation (Placement(transformation(extent={{-34,-10},{-14,10}})));
  Modelica.Blocks.Math.Add3 add3_1(k1=-1)
    annotation (Placement(transformation(extent={{12,-10},{32,10}})));
  Modelica.Blocks.Math.Gain gain1(k=Radius)
    annotation (Placement(transformation(extent={{-16,70},{4,90}})));
  Modelica.Blocks.Math.Product product3
    annotation (Placement(transformation(extent={{20,70},{40,90}})));
  Modelica.Blocks.Math.Product product4
    annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  NonElectrical.Continuous.SimpleLagLim
                             simpleLagLim(
    K=K_M,
    T=T_M,
    y_start=0,
    outMax=MEL_MAX,
    outMin=0) if not useWindupGuard
    annotation (Placement(transformation(extent={{68,-10},{88,10}})));
  NonElectrical.Continuous.LagLimWindupGuard lagLimWindupGuard(
    K=K_M,
    T=T_M,
    y_start=0,
    outMax=MEL_MAX,
    outMin=0) if useWindupGuard
    annotation (Placement(transformation(extent={{68,22},{88,42}})));
  Modelica.Blocks.Interfaces.RealOutput VUEL
    annotation (Placement(transformation(extent={{100,-10},{120,10}}),
        iconTransformation(extent={{100,-10},{120,10}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag(
    K=K_F2,
    T=T_F2,
    y_start=0)
    annotation (Placement(transformation(extent={{84,-50},{64,-30}})));
equation
  connect(Eterm, product1.u1)
    annotation (Line(points={{-120,60},{-88,60},{-88,66},{-82,66}}, color={0,0,127}));
  connect(Eterm, product1.u2)
    annotation (Line(points={{-120,60},{-88,60},{-88,54},{-82,54}}, color={0,0,127}));
  connect(QELEC, add.u2)
    annotation (Line(points={{-120,0},{-88,0},{-88,-6},{-76,-6}}, color={0,0,127}));
  connect(product1.y, gain.u) annotation (Line(points={{-59,60},{-48,60}}, color={0,0,127}));
  connect(gain.y, add.u1) annotation (Line(points={{-25,60},{-20,60},{-20,28},
          {-88,28},{-88,6},{-76,6}},
               color={0,0,127}));
  connect(add.y, product2.u1)
    annotation (Line(points={{-53,0},{-42,0},{-42,6},{-36,6}}, color={0,0,127}));
  connect(product2.u2, add.y)
    annotation (Line(points={{-36,-6},{-42,-6},{-42,0},{-53,0}}, color={0,0,127}));
  connect(product2.y, add3_1.u2)
    annotation (Line(points={{-13,0},{10,0}}, color={0,0,127}));
  connect(gain1.u, product1.y)
    annotation (Line(points={{-18,80},{-54,80},{-54,60},{-59,60}}, color={0,0,127}));
  connect(gain1.y, product3.u1)
    annotation (Line(points={{5,80},{10,80},{10,86},{18,86}}, color={0,0,127}));
  connect(product3.u2, product3.u1)
    annotation (Line(points={{18,74},{10,74},{10,86},{18,86}}, color={0,0,127}));
  connect(product3.y, add3_1.u1)
    annotation (Line(points={{41,80},{44,80},{44,50},{0,50},{0,8},{10,8}}, color={0,0,127}));
  connect(product4.y, add3_1.u3)
    annotation (Line(points={{-59,-60},{0,-60},{0,-8},{10,-8}}, color={0,0,127}));
  connect(PELEC, product4.u1)
    annotation (Line(points={{-120,-60},{-88,-60},{-88,-54},{-82,-54}}, color={0,0,127}));
  connect(PELEC, product4.u2)
    annotation (Line(points={{-120,-60},{-88,-60},{-88,-66},{-82,-66}}, color={0,0,127}));
  connect(add3_1.y, feedback.u1) annotation (Line(points={{33,0},{42,0}}, color={0,0,127}));
  connect(feedback.y, simpleLagLim.u)
    annotation (Line(points={{59,0},{66,0}}, color={0,0,127}));
  connect(simpleLagLim.y, VUEL)
    annotation (Line(points={{89,0},{110,0}}, color={0,0,127}));
  connect(feedback.y, lagLimWindupGuard.u)
    annotation (Line(points={{59,0},{62,0},{62,32},{66,32}}, color={0,0,127}));
  connect(lagLimWindupGuard.y, VUEL)
    annotation (Line(points={{89,32},{96,32},{96,0},{110,0}}, color={0,0,127}));
  connect(derivativeLag.u, VUEL) annotation (Line(points={{86,-40},{96,-40},{
          96,0},{110,0}},
                       color={0,0,127}));
  connect(derivativeLag.y, feedback.u2)
    annotation (Line(points={{63,-40},{50,-40},{50,-8}}, color={0,0,127}));
  annotation (
    Icon( graphics={
          Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}), Text(
          extent={{-70,28},{66,-30}},
          textColor={28,108,200},
          textString="MNLEX2")}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>Minimum Excitation Limiter (PSS/E Manual)</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2026-10-24</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Giuseppe Laera, ALSETLab, RPI Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>", info="<html>
<p>Minimum excitation limiter MNLEX2 of PSS/E (PSS&reg;E Model Library, Minimum Excitation Limiter Models, MNLEX2):
the limiter output <code>VUEL</code> is the lag <code>K_M/(1 + sT_M)</code>, limited to [0, <code>MEL_MAX</code>]
by a non-windup limit, of the signal <code>(Q - Q_0 E_t^2)^2 + P^2 - (Radius E_t^2)^2</code> minus the rate
feedback <code>sK_F2/(1 + sT_F2)</code> of <code>VUEL</code>. While the machine operates inside the circle the
signal is negative and the limiter rests at its lower limit, 0.</p>
<h5>Limiter of the MEL lag</h5>
<p>The default, <code>useWindupGuard = true</code>, holds the lag's state at the limit as PSS/E does: in a PSS/E 36.2
run of the twin of <a href=\"modelica://OpenIPSL.Tests.Controls.PSSE.UEL.MNLEX2\">Tests.Controls.PSSE.UEL.MNLEX2</a>
the MEL state (STATE K+1) stays exactly at 0 while its input pushes it below the limit, which is
<a href=\"modelica://OpenIPSL.NonElectrical.Continuous.LagLimWindupGuard\">LagLimWindupGuard</a>'s formulation
(the derivative is zero at a limit while the input pushes outward). With <code>useWindupGuard = false</code> the
model uses <a href=\"modelica://OpenIPSL.NonElectrical.Continuous.SimpleLagLim\">SimpleLagLim</a>, as before this
option existed: the same output, but a state that winds up past the limit (to -200 in that test) and is reset to
the limit at every sign change of <code>K_M u - state</code>, an event each - once every 0.77 s while the limiter is
inactive, its normal state, because that relation rests at zero and round-off flips it.
<a href=\"modelica://OpenIPSL.Tests.Controls.PSSE.UEL.MNLEX2_SimpleLagLim\">MNLEX2_SimpleLagLim</a> and
<a href=\"modelica://OpenIPSL.Tests.Controls.PSSE.UEL.MNLEX2_LagLimWindupGuard\">MNLEX2_LagLimWindupGuard</a> show
the difference.</p>
</html>"));
end MNLEX2;
