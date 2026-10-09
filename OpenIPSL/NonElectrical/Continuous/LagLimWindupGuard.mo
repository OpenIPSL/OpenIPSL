within OpenIPSL.NonElectrical.Continuous;
block LagLimWindupGuard
  "First order lag with a non-windup limiter: the state stops at a limit and leaves it as soon as the input turns back"
  extends Modelica.Blocks.Interfaces.SISO(y(start=y_start));
  parameter Real K "Gain";
  parameter Types.Time T "Lag time constant";
  parameter Real y_start "Output start value";
  parameter Real outMax "Maximum output value";
  parameter Real outMin "Minimum output value";
  Real state(start=y_start) "State of the lag, held between outMin and outMax";
protected
  parameter Boolean noLag=T < Modelica.Constants.eps "Without a lag, the output is the limited gain";
  parameter Types.Time T_mod=if noLag then 1000 else T "Any positive value when there is no lag: the state is then held";
initial equation
  state = y_start;
equation
  T_mod*der(state) = if noLag then 0
    elseif state >= outMax then smooth(0, noEvent(min(K*u - state, 0)))
    elseif state <= outMin then smooth(0, noEvent(max(K*u - state, 0)))
    else K*u - state
    "At a limit the state may only move back inside; the only events are the state reaching a limit. Without a lag the state is not used and stays at y_start";
  y = if noLag then smooth(0, noEvent(max(min(K*u, outMax), outMin)))
    else smooth(0, noEvent(max(min(state, outMax), outMin)))
    "The limits also bound the output while the state overshoots a limit by the solver's tolerance";
  annotation (Documentation(info="<html>
<p>First order lag <code>K/(1 + sT)</code> with a non-windup limiter, as in IEEE Std. 421.5-2005, Annex E
(non-windup limit on a single time constant block): while the state is at a limit and the input pushes it further
out, its derivative is zero; as soon as the input turns back, the state leaves the limit. PSAT implements its
non-windup limits the same way (<code>fm_windup.m</code>: the derivative set to zero and the state clipped at the
limit).</p>
<p>It differs from <a href=\"modelica://OpenIPSL.NonElectrical.Continuous.SimpleLagLim\">SimpleLagLim</a> in two
ways:</p>
<ul>
<li><code>SimpleLagLim</code> lets its state run past the limit while its output is clamped, and resets it to the
limit whenever the input turns back below that state. Its output therefore leaves the limit at the same time as here,
but its state winds up (ten times the limit in
<a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.AVR.AVRTypeII_SimpleLagLim\">AVRTypeII_SimpleLagLim</a>), and every
reset is an event. Here the state stops at the limit.</li>
<li><code>SimpleLagLim</code> detects that turning point with the relation <code>K*u - state &lt; 0</code> (and
<code>&gt; 0</code>) in a <code>when</code> condition. In steady state <code>K*u - state</code> is exactly zero, so
numerical noise changes its sign again and again; a tool that stops at every such sign change (Wolfram System
Modeler) spends thousands of events on it. Here the only event-generating relations are <code>state &gt;= outMax</code>
and <code>state &lt;= outMin</code>, away from zero in normal operation; the comparison with zero is a continuous
<code>min</code> or <code>max</code> inside <code>noEvent</code>.</li>
</ul>
<p>With <code>T = 0</code> the output is <code>K*u</code> limited to [<code>outMin</code>, <code>outMax</code>], as in
<code>SimpleLagLim</code>.</p>
<p><a href=\"modelica://OpenIPSL.Tests.NonElectrical.Continuous.LagLimWindupGuard\">Tests.NonElectrical.Continuous.LagLimWindupGuard</a>
shows the two limiters side by side; plot their <code>state</code> and <code>y</code>.</p>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>IEEE Std. 421.5-2005, Annex E; PSAT 2.1.11, <code>fm_windup.m</code></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2026-10-08</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/lvanfretti\">@lvanfretti</a></p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"), Icon(graphics={Line(
          points={{40,100},{60,140},{100,140}},
          color={162,29,29},
          thickness=1),Rectangle(
          extent={{96,130},{106,150}},
          lineColor={162,29,29},
          fillColor={162,29,29},
          fillPattern=FillPattern.Solid),Text(
          extent={{-20,68},{20,8}},
          textColor={0,0,255},
          textString="K"),Line(
          points={{-80,0},{78,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=0.5),Text(
          extent={{-70,-14},{70,-64}},
          textColor={0,0,255},
          textString="1 + Ts"),Text(
          extent={{-90,-70},{90,-94}},
          textColor={162,29,29},
          textString="non-windup"),Line(
          points={{-100,-140},{-60,-140},{-40,-100}},
          color={162,29,29},
          thickness=1),Rectangle(
          extent={{-106,-150},{-96,-130}},
          lineColor={162,29,29},
          fillColor={162,29,29},
          fillPattern=FillPattern.Solid)}));
end LagLimWindupGuard;
