within OpenIPSL.Tests.FACTS.PSAT;
model TCSC_LagLimWindupGuard
  "SMIB system to test the PSAT TCSC with its default limiter (LagLimWindupGuard), compared with TCSC_SimpleLagLim"
  extends TCSC_SimpleLagLim(tcsc(useWindupGuard=true));
  annotation (experiment(StopTime=20, Tolerance=1e-06),
    Documentation(info="<html>
<p><a href=\"modelica://OpenIPSL.Tests.FACTS.PSAT.TCSC_SimpleLagLim\">TCSC_SimpleLagLim</a> with the default limiter of
the PSAT TCSC, <code>LagLimWindupGuard</code> (<code>useWindupGuard = true</code>), which reproduces PSAT's non-windup
limit: the state stops at the limit while the input pushes outward. The pair's documentation says what to plot.</p>
</html>"));
end TCSC_LagLimWindupGuard;
