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
  T_mod*der(state) = noEvent(if noLag then 0
    elseif state >= outMax then min(K*u - state, 0)
    elseif state <= outMin then max(K*u - state, 0)
    else K*u - state)
    "At a limit the state may only move back inside. The limits are tested without events, as the strict option of Modelica.Blocks.Continuous.LimIntegrator does: tested with events, the relation chatters while the state leaves a limit. Without a lag the state is not used and stays at y_start";
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
limit whenever the input turns back below that state. Its output therefore leaves the limit at about the same time as
here (within 2 ms in the test pairs, see below), but its state winds up (ten times the limit in
<a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.AVR.AVRTypeII_SimpleLagLim\">AVRTypeII_SimpleLagLim</a>), and every
reset is an event. Here the state stops at the limit.</li>
<li><code>SimpleLagLim</code> detects that turning point with the relation <code>K*u - state &lt; 0</code> (and
<code>&gt; 0</code>) in a <code>when</code> condition. In steady state <code>K*u - state</code> is exactly zero, so
numerical noise changes its sign again and again; a tool that stops at every such sign change (Wolfram System
Modeler) spends thousands of events on it. Here no relation generates events: the comparison with zero is a
continuous <code>min</code> or <code>max</code>, and the limit tests <code>state &gt;= outMax</code> and
<code>state &lt;= outMin</code> are inside <code>noEvent</code> as well.</li>
</ul>
<p>The limits are tested without events for the same reason that
<a href=\"modelica://Modelica.Blocks.Continuous.LimIntegrator\">Modelica.Blocks.Continuous.LimIntegrator</a> offers its
<code>strict</code> option: when the state leaves a limit, the relation <code>state &gt;= outMax</code> sits on its
boundary with the derivative zero on one side and pointing at the boundary on the other, and a tool that handles the
relation with events walks through its hysteresis band in a cluster of events (on
<a href=\"modelica://OpenIPSL.Examples.IEEE14.IEEE_14_Buses\">Examples.IEEE14.IEEE_14_Buses</a>, 2 to 13 events
within a millisecond at each limit exit, in Dymola, OpenModelica and System Modeler alike). Without events the
integrator is not restarted when the state reaches or leaves a limit. The state may pass a limit by the error of the
step that reaches it, and keeps that excess while the input pushes outward (6.5e-4 above a ceiling of 7.32 when the
AVR of <a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.PSS.PSSTypeIII_LagLimWindupGuard\">PSSTypeIII_LagLimWindupGuard</a>
reaches it during the fault, in Dymola with a tolerance of 1e-6); the output is clipped to the limits separately, so
the excess does not reach it while the state is at the limit. When the output leaves a limit, it does so up to 2 ms
earlier or later than with events (in
<a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.AVR.AVRTypeII_LagLimWindupGuard\">AVRTypeII_LagLimWindupGuard</a>,
1.9 ms later after the voltage reference step).</p>
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
<td>2026-10-15</td>
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
