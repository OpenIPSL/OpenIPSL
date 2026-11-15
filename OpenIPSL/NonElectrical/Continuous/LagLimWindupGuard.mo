within OpenIPSL.NonElectrical.Continuous;
block LagLimWindupGuard
  "First order lag with a non-windup limiter: the state stops at a limit and leaves it as soon as the input turns back"
  extends Modelica.Blocks.Interfaces.SISO(y(start=y_start));
  parameter Real K "Gain";
  parameter Types.Time T "Lag time constant";
  parameter Real y_start "Output start value";
  parameter Real outMax "Maximum output value";
  parameter Real outMin "Minimum output value";
  parameter Boolean eventLimits=true
    "true (the default): the state is held at a limit and released from it at events; false: the limits are tested without events, the form of OpenIPSL #424, kept for comparison"
    annotation (Evaluate=true, choices(checkBox=true));
  Real state(start=y_start) "State of the lag, held between outMin and outMax";
  Boolean atMax(start=false, fixed=true) "Held at outMax: from the start or the event at which the state is at it with the input pushing outward to the event at which K*u falls below outMax";
  Boolean atMin(start=false, fixed=true) "Held at outMin: from the start or the event at which the state is at it with the input pushing outward to the event at which K*u rises above outMin";
protected
  parameter Boolean noLag=T < Modelica.Constants.eps "Without a lag, the output is the limited gain";
  parameter Types.Time T_mod=if noLag then 1000 else T "Any positive value when there is no lag: the state is then held";
  Boolean stateHigh=eventLimits and not noLag and state >= outMax
    "Event-generating, read by the when-clauses: the state at or above outMax";
  Boolean inputAbove=eventLimits and not noLag and K*u > outMax
    "Event-generating, read by the when-clauses: K*u above outMax, pushing outward";
  Boolean inputHigh=eventLimits and not noLag and K*u >= outMax
    "Event-generating, read by the when-clauses: K*u at or above outMax";
  Boolean stateLow=eventLimits and not noLag and state <= outMin
    "Event-generating, read by the when-clauses: the state at or below outMin";
  Boolean inputBelow=eventLimits and not noLag and K*u < outMin
    "Event-generating, read by the when-clauses: K*u below outMin, pushing outward";
  Boolean inputLow=eventLimits and not noLag and K*u <= outMin
    "Event-generating, read by the when-clauses: K*u at or below outMin";
initial equation
  state = y_start;
equation
  if eventLimits and not noLag then
    when {initial(), stateHigh and inputAbove, pre(atMax) and not inputHigh} then
      atMax = stateHigh and inputHigh
        "The Booleans, not the relations: inside a when-clause a relation is taken literally (Modelica 3.6, section 8.5), so it can disagree with the event that activated the clause";
    end when;
    when {initial(), stateLow and inputBelow, pre(atMin) and not inputLow} then
      atMin = stateLow and inputLow
        "The Booleans, not the relations: inside a when-clause a relation is taken literally (Modelica 3.6, section 8.5), so it can disagree with the event that activated the clause";
    end when;
    T_mod*der(state) = if atMax or atMin then 0 else K*u - state
      "PSAT's fm_windup: held while the state is at a limit and the input pushes outward, from the start on, released when K*u crosses back inside the limit, a relation that is not zero while the state is held";
  else
    atMax = false "Not used without events or without a lag";
    atMin = false "Not used without events or without a lag";
    T_mod*der(state) = noEvent(if noLag then 0
      elseif state >= outMax then min(K*u - state, 0)
      elseif state <= outMin then max(K*u - state, 0)
      else K*u - state)
      "OpenIPSL #424: at a limit the state may only move back inside, tested without events; the release is found only when the solver's step has shrunk enough to see it. Without a lag the state is not used and stays at y_start";
  end if;
  y = if noLag then smooth(0, noEvent(max(min(K*u, outMax), outMin)))
    else smooth(0, noEvent(max(min(state, outMax), outMin)))
    "The limits also bound the output while the state overshoots a limit by the solver's tolerance";
  annotation (Documentation(info="<html>
<p>First order lag <code>K/(1 + sT)</code> with a non-windup limiter, as in IEEE Std. 421.5-2005, Annex E
(non-windup limit on a single time constant block): while the state is at a limit and the input pushes it further
out, its derivative is zero; as soon as the input turns back, the state leaves the limit. PSAT implements its
non-windup limits the same way (<code>fm_windup.m</code>: the derivative set to zero and the state clipped at the
limit while the input is beyond it).</p>
<p>Both moments are events. The state is held (<code>atMax</code>, <code>atMin</code>) from the event at which it
is at a limit with the input pushing outward, or from the start when it starts there, and released at the event at
which <code>K*u</code> crosses back inside the limit: PSAT's own test, on the input against the limit. The hold is
tested on both the state and the input, so it takes effect again when the input turns outward while the state is
still at the limit. While the state is held that relation is not zero, so it
does not chatter, and its crossing is located by the tool's event iteration instead of by the step that happens to
pass it.</p>
<p>The when-clauses read the relations through Booleans declared outside them (<code>stateHigh</code>,
<code>inputAbove</code>, <code>inputHigh</code> and their counterparts at <code>outMin</code>), not the relations
themselves. Inside a when-clause a relation is taken literally and generates no event (Modelica 3.6, section 8.5),
while the same relation in the clause's condition is the event-generating one, whose crossing a tool locates
within its tolerance: at the event that releases the state, a relation written in the body may still be on the
outward side of the limit and keep the state held. Wolfram System Modeler 15.0 did that at 20 of 666 releases
of the PSAT-2-Modelica cases; the Booleans have one value at an event, the one that activated the clause.</p>
<p>It differs from <a href=\"modelica://OpenIPSL.NonElectrical.Continuous.SimpleLagLim\">SimpleLagLim</a> in two
ways:</p>
<ul>
<li><code>SimpleLagLim</code> lets its state run past the limit while its output is clamped, and resets it to the
limit whenever the input turns back below that state. Its output therefore leaves the limit together with the one
here, but its state winds up (ten times the limit in
<a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.AVR.AVRTypeII_SimpleLagLim\">AVRTypeII_SimpleLagLim</a>), and every
reset is an event. Here the state stops at the limit.</li>
<li><code>SimpleLagLim</code> detects that turning point with the relation <code>K*u - state &lt; 0</code> (and
<code>&gt; 0</code>) in a <code>when</code> condition. In steady state <code>K*u - state</code> is exactly zero, so
numerical noise changes its sign again and again; a tool that stops at every such sign change (Wolfram System
Modeler) spends thousands of events on it. Here the release is tested on <code>K*u</code> against the limit,
which is not zero while the state is held.</li>
</ul>
<p><code>eventLimits = false</code> keeps the earlier form (OpenIPSL #424), for comparison: the limits are tested
inside <code>noEvent</code>, as the <code>strict</code> option of
<a href=\"modelica://Modelica.Blocks.Continuous.LimIntegrator\">Modelica.Blocks.Continuous.LimIntegrator</a> does.
Without an event the release is found only when the solver's step has shrunk enough to see it, late or not at all:
on the cases of the PSAT-2-Modelica tool chain (84 simulations of PSAT systems and unit tests, against an exact
Dymola run with a tolerance of 1e-10) the release came up to 0.15 s late in Dymola, where one of them left PSAT's
tolerance, and up to 0.3 s late in OpenModelica; with the events here every release happened, within 61 ms of the
exact run in Dymola and in OpenModelica (the 61 ms on a field voltage that cycles in and out of its limit with
a time constant of 1e-4 s). The events also made the runs faster, not slower: the total run time of those cases fell
by about a fifth in Dymola and in OpenModelica. The release is not tested on <code>K*u - state</code>, the turning
of the derivative: that relation is exactly zero while the state is held, and a tool may stop at every sign change of
its numerical noise (System Modeler 15.0 did, 148985 events on those cases).</p>
<p>The output is clipped to the limits separately, so an overshoot of the state by the error of the step that reaches
a limit does not reach the output.</p>
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
<td>2026-11-05</td>
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
