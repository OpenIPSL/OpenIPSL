within OpenIPSL.Tests.Controls.PSAT.PSS;
model PSSTypeIII_LagLimWindupGuard
  "SMIB system to test PSSTypeIII with its default limiter (LagLimWindupGuard), compared with PSSTypeIII_SimpleLagLim"
  extends PSSTypeIII_SimpleLagLim(pss(useWindupGuard=true));
  annotation (experiment(StopTime=20, Tolerance=1e-06),
    Documentation(info="<html>
<p><a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.PSS.PSSTypeIII_SimpleLagLim\">PSSTypeIII_SimpleLagLim</a> with
the default limiter of <code>PSSTypeIII</code>, <code>LagLimWindupGuard</code> (<code>useWindupGuard = true</code>):
the limiter's state stops at the limit and leaves it as soon as its input turns back. Nothing else differs between
the two tests. What to plot to see the difference - the state of the limiter, not its output - is listed in
<a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.PSS.PSSTypeIII_SimpleLagLim\">PSSTypeIII_SimpleLagLim</a>.</p>
</html>"));
end PSSTypeIII_LagLimWindupGuard;
