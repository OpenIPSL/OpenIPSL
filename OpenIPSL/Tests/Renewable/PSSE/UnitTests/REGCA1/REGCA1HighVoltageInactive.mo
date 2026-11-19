within OpenIPSL.Tests.Renewable.PSSE.UnitTests.REGCA1;
model REGCA1HighVoltageInactive
  "REGCA1 through the same overvoltage with Volim out of reach: the high voltage reactive current management does not act"
  extends BaseClasses.SMIBREGCA1(B=1, Volim=1.4);
  annotation (experiment(
      StopTime=4,
      Interval=0.001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>
The case of <a href=\"modelica://OpenIPSL.Tests.Renewable.PSSE.UnitTests.REGCA1.REGCA1HighVoltage\">REGCA1HighVoltage</a>
with <code>Volim = 1.4</code>, above the 1.33 pu to which the capacitive shunt lifts the terminal voltage: the high voltage
reactive current management of
<a href=\"modelica://OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.REGCA1\">REGCA1</a> stays at zero, and the test
checks that the converter and the network follow PSS/E without it. Added with the fix of OpenIPSL issue #466; the PSS/E
twin is the unit test <code>ut_regca1_hv_off</code>.
</p>
<p>
Simulate for 4 s and plot <code>GEN1.v</code>, <code>regca1.Ihv</code> and <code>regca1.Qgen</code>.
</p>
</html>"));
end REGCA1HighVoltageInactive;
