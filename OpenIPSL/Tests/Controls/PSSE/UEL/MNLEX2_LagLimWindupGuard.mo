within OpenIPSL.Tests.Controls.PSSE.UEL;
model MNLEX2_LagLimWindupGuard
  "SMIB system to test MNLEX2 with its default limiter (LagLimWindupGuard), compared with MNLEX2_SimpleLagLim"
  extends MNLEX2_SimpleLagLim(mNLEX2(useWindupGuard=true));
  annotation (
    experiment(
      StopTime=10,
      Interval=0.001,
      Tolerance=1e-06,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Rkfix2"),
    Documentation(info="<html>
<p><a href=\"modelica://OpenIPSL.Tests.Controls.PSSE.UEL.MNLEX2_SimpleLagLim\">MNLEX2_SimpleLagLim</a> with the default
limiter of <code>MNLEX2</code>, <code>LagLimWindupGuard</code> (<code>useWindupGuard = true</code>), which holds the lag's
state at the limit as PSS/E holds MNLEX2's MEL state: the state stops at the limit and leaves it as soon as its input
turns back. Nothing else differs between the two tests; this one is
<a href=\"modelica://OpenIPSL.Tests.Controls.PSSE.UEL.MNLEX2\">Tests.Controls.PSSE.UEL.MNLEX2</a> under the name of its
limiter, so that the pair reads like the PSAT pairs
(<a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.AVR.AVRTypeII_LagLimWindupGuard\">AVRTypeII_LagLimWindupGuard</a>).
What to plot to see the difference - the state of the limiter, not its output - is listed in
<a href=\"modelica://OpenIPSL.Tests.Controls.PSSE.UEL.MNLEX2_SimpleLagLim\">MNLEX2_SimpleLagLim</a>.</p>
</html>"));
end MNLEX2_LagLimWindupGuard;
