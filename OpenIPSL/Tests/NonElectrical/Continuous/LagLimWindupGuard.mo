within OpenIPSL.Tests.NonElectrical.Continuous;
model LagLimWindupGuard "LagLimWindupGuard beside SimpleLagLim, driven by the same input beyond their limits"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Sine u(amplitude=2, f=0.5) "Input that exceeds the limits of +-1 in both directions"
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=1,
    T=0.1,
    y_start=0,
    outMax=1,
    outMin=-1) annotation (Placement(transformation(extent={{0,20},{20,40}})));
  OpenIPSL.NonElectrical.Continuous.LagLimWindupGuard lagLimWindupGuard(
    K=1,
    T=0.1,
    y_start=0,
    outMax=1,
    outMin=-1) annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
equation
  connect(u.y, simpleLagLim.u)
    annotation (Line(points={{-39,0},{-20,0},{-20,30},{-2,30}}, color={0,0,127}));
  connect(u.y, lagLimWindupGuard.u)
    annotation (Line(points={{-39,0},{-20,0},{-20,-30},{-2,-30}}, color={0,0,127}));
  annotation (experiment(StopTime=4, Tolerance=1e-06),
    Documentation(info="<html>
<p>The two lag limiters of the library side by side, with the same parameters (<code>K = 1</code>,
<code>T = 0.1</code> s, limits &plusmn;1) and the same input, a sine of amplitude 2 that drives them beyond both
limits and back.</p>
<p>What to plot:</p>
<ul>
<li><code>simpleLagLim.state</code> and <code>lagLimWindupGuard.state</code>: <code>SimpleLagLim</code>'s state runs
past the limit and is reset to it, again and again, until the input has fallen below the limit; each reset is an
event. <code>LagLimWindupGuard</code>'s state stops at the limit, as in a non-windup limit (IEEE Std. 421.5-2005,
Annex E).</li>
<li><code>simpleLagLim.y</code> and <code>lagLimWindupGuard.y</code>: the outputs are the same, and leave the limit at
the same time.</li>
</ul>
<p>The PSAT models that can use either limiter have test pairs of their own, in
<a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.AVR\">Tests.Controls.PSAT.AVR</a> and
<a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.PSS\">Tests.Controls.PSAT.PSS</a>.</p>
</html>"));
end LagLimWindupGuard;
