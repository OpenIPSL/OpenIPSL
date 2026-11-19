within OpenIPSL.Tests.Renewable.PSSE.UnitTests.REGCA1;
model REGCA1HighVoltage
  "REGCA1's high voltage reactive current management holds the terminal voltage at Volim during an overvoltage"
  extends BaseClasses.SMIBREGCA1(B=1, Volim=1.1);
  annotation (experiment(
      StopTime=4,
      Interval=0.001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>
The high voltage reactive current management of
<a href=\"modelica://OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.REGCA1\">REGCA1</a> acting. The capacitive shunt
at bus FAULT (<code>B = 1</code> pu) would lift the terminal voltage to 1.33 pu; with <code>Volim = 1.1</code> REGCA1
absorbs the reactive current <code>Ihv</code> that holds it at 1.1 pu from 2 to 2.15 s, and the voltage returns to 1.0 pu
when the shunt is removed.
</p>
<p>
PSS/E 36.2.1 computes the same correction in the iterations of its network solution and holds the voltage at 1.069 pu
here, a level set by the iteration's gains <code>Khv</code> and <code>Accel</code> (CON J+13 of PSS/E's REGCA1, 0.7 in the
PSS/E twin) and by the settings of PSS/E's network solution (from 1.067 to 1.20 pu); the model holds it at <code>Volim</code> (see the Documentation of REGCA1). The case where the management
does not act is <a href=\"modelica://OpenIPSL.Tests.Renewable.PSSE.UnitTests.REGCA1.REGCA1HighVoltageInactive\">REGCA1HighVoltageInactive</a>.
Added with the fix of OpenIPSL issue #466 (the correction had raised the voltage instead of limiting it); the PSS/E twin
is the unit test <code>ut_regca1_hv</code>.
</p>
<p>
Simulate for 4 s and plot <code>GEN1.v</code>, <code>regca1.Ihv</code> and <code>regca1.Qgen</code>.
</p>
</html>"));
end REGCA1HighVoltage;
