within OpenIPSL.Tests.Controls.PSSE.UEL;
model MNLEX2_SimpleLagLim
  "SMIB system to test MNLEX2 with its previous limiter (SimpleLagLim), compared with MNLEX2_LagLimWindupGuard"
  extends MNLEX2(mNLEX2(useWindupGuard=false));
  annotation (
    experiment(
      StopTime=10,
      Interval=0.001,
      Tolerance=1e-06,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Rkfix2"),
    Documentation(info="<html>
<p><a href=\"modelica://OpenIPSL.Tests.Controls.PSSE.UEL.MNLEX2\">Tests.Controls.PSSE.UEL.MNLEX2</a> - a GENROU with
EXAC1 and the minimum excitation limiter MNLEX2 at <code>GEN1</code> of
<a href=\"modelica://OpenIPSL.Tests.BaseClasses.SMIB\">SMIB</a>, the fault from 2.0 to 2.7 s - with the limiter's
previous block, <code>SimpleLagLim</code> (<code>useWindupGuard = false</code>). The machine operates inside the
limiter's circle, so the UEL rests at its lower limit before the fault and again after 2.9 s, with its input
<code>K_M u</code> at -200; the fault swings the machine out of the circle and the limiter acts for 0.2 s.</p>
<p><a href=\"modelica://OpenIPSL.Tests.Controls.PSSE.UEL.MNLEX2_LagLimWindupGuard\">MNLEX2_LagLimWindupGuard</a> is the
same test with the default limiter, <code>LagLimWindupGuard</code>, which holds the state at the limit as PSS/E holds
MNLEX2's MEL state (STATE K+1). Nothing else differs between the two tests.</p>
<p>What to plot, from this test and its pair (the variables of the limiter in use carry its name):</p>
<ul>
<li><code>mNLEX2.simpleLagLim.state</code> here and <code>mNLEX2.lagLimWindupGuard.state</code> in the pair, against the
limits 0 and <code>mNLEX2.MEL_MAX</code>: this is where the two differ. <code>SimpleLagLim</code>'s state winds up to -200
at rest and is reset to 0 whenever the relation <code>K_M u - state</code> changes sign - at rest it is zero and
round-off flips it about every 15 time constants (0.77 s with <code>T_M = 0.05</code>), and after the fault at every
turning point of the input; <code>LagLimWindupGuard</code>'s state stays at 0.</li>
<li><code>mNLEX2.VUEL</code>, <code>eXAC1_1.EFD</code>, <code>gENROU.ETERM</code>, <code>gENROU.w</code>: the same in both tests
(identical to round-off with the test's fixed-step solver; within 3e-5 with Dassl at tolerance 1e-6, a solver
difference that shrinks with the tolerance).</li>
<li>The number of state events in the simulation log: 65 and 37 with <code>SimpleLagLim</code> and
<code>LagLimWindupGuard</code> in Dymola 2026x with the test's experiment settings (73 and 42 with Dassl at 1e-6); the
difference is the UEL's resets - 29 in this test, 0 in the pair - the others belong to the exciter's regulator.</li>
</ul>
<p><a href=\"modelica://OpenIPSL.Tests.NonElectrical.Continuous.LagLimWindupGuard\">Tests.NonElectrical.Continuous.LagLimWindupGuard</a>
shows the two limiters side by side in one model.</p>
</html>"));
end MNLEX2_SimpleLagLim;
