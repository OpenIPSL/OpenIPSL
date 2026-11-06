within OpenIPSL.Tests.Controls.PSAT.AVR;
model AVRTypeIII_BusFed_off
  "AVRTypeIII_BusFed_on with busFed = false, the library twin of the PSAT-2-Modelica unit test ut_avr_type3_busfed_off"
  extends AVRTypeIII_BusFed_on(avr(busFed=false));
  annotation (experiment(StopTime=20, Tolerance=1e-06),
    Documentation(info="<html>
<p><a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.AVR.AVRTypeIII_BusFed_on\">AVRTypeIII_BusFed_on</a> with the
exciter not bus-fed (<code>busFed = false</code>): the regulator's command is not scaled by the terminal voltage, so
in the fault the field voltage rises to its ceiling, <code>vfmax</code> = 3.0 pu, and the non-windup limit
(<code>useWindupGuard = true</code>, the default) holds it there until the command falls below it.</p>
<h4>Why this test exists</h4>
<p>It is the library twin of the unit test <code>ut_avr_type3_busfed_off</code> of ALSETLab/PSAT-2-Modelica, verified
against PSAT 2.1.11: the data of <code>ut_avr_type3_busfed_on</code> with column 9 of PSAT's <code>Exc.con</code> at
0. Compared with <code>AVRTypeIII_BusFed_on</code> it shows the bus-fed term, and it drives the field voltage to its
ceiling, which the bus-fed test does not.</p>
<h4>What to plot</h4>
<ul>
<li><code>avr.vf</code> against <code>avr.vfmax</code>, and against <code>avr.vf</code> of
<code>AVRTypeIII_BusFed_on</code>.</li>
<li><code>avr.lagLimWindupGuard.state</code>: it stops at the ceiling.</li>
<li><code>machine.v</code>, <code>machine.P</code>, <code>machine.Q</code> and <code>avr.vf</code> against PSAT's
results of the unit test (the first 10 s).</li>
</ul>
</html>"));
end AVRTypeIII_BusFed_off;
