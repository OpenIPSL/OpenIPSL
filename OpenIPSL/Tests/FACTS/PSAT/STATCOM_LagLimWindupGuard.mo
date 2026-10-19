within OpenIPSL.Tests.FACTS.PSAT;
model STATCOM_LagLimWindupGuard
  "SMIB system to test the PSAT STATCOM with its default limiter (LagLimWindupGuard), compared with STATCOM_SimpleLagLim"
  extends STATCOM_SimpleLagLim(statcom(useWindupGuard=true));
  annotation (experiment(StopTime=20, Tolerance=1e-06),
    Documentation(info="<html>
<p><a href=\"modelica://OpenIPSL.Tests.FACTS.PSAT.STATCOM_SimpleLagLim\">STATCOM_SimpleLagLim</a> with the default
limiter of the PSAT STATCOM, <code>LagLimWindupGuard</code> (<code>useWindupGuard = true</code>), which reproduces
PSAT's non-windup limit: the state stops at the limit while the input pushes outward. The pair's documentation says
what to plot.</p>
</html>"));
end STATCOM_LagLimWindupGuard;
