within OpenIPSL.Tests.Controls.PSAT.AVR;
model AVRTypeII_LagLimWindupGuard
  "SMIB system to test AVRTypeII with its default limiter (LagLimWindupGuard), compared with AVRTypeII_SimpleLagLim"
  extends AVRTypeII_SimpleLagLim(avr(useWindupGuard=true));
  annotation (experiment(StopTime=20, Tolerance=1e-06),
    Documentation(info="<html>
<p><a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.AVR.AVRTypeII_SimpleLagLim\">AVRTypeII_SimpleLagLim</a> with the
default limiter of <code>AVRTypeII</code>, <code>LagLimWindupGuard</code> (<code>useWindupGuard = true</code>), which
reproduces PSAT's non-windup limit: the regulator's state stops at the limit and leaves it as soon as its input turns
back. Nothing else differs between the two tests. What to plot to see the difference - the state of the limiter, not its output - is listed in
<a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.AVR.AVRTypeII_SimpleLagLim\">AVRTypeII_SimpleLagLim</a>.</p>
</html>"));
end AVRTypeII_LagLimWindupGuard;
