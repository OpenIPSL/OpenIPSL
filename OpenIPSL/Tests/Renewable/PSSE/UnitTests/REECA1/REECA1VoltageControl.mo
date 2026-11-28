within OpenIPSL.Tests.Renewable.PSSE.UnitTests.REECA1;
model REECA1VoltageControl
  "REECA1 with local voltage control: the voltage PI reaches its limit during the fault and slides along it"
  extends BaseClasses.SMIBREECA1(
    pqflag=false,
    Kqv=0,
    Vdip=-99,
    Vup=99,
    Xf=0.1,
    wind(QFunctionality=2, RenewableController(Kvp=0.5, Kvi=120)));
  annotation (experiment(
      StopTime=6,
      Interval=0.001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>
The non-windup limit of the voltage PI of <a href=\"modelica://OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECA1\">REECA1</a> (<a href=\"modelica://OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses.PIwithVariableLimiter\">PIwithVariableLimiter</a>, gains <code>Kvp = 0.5</code>, <code>Kvi = 120</code>, limits
<code>Iqmin</code> and <code>Iqmax</code>), with the PI in the signal path: local voltage control
(<code>QFunctionality = 2</code>, the PSS/E flags PFFLAG 0, VFLAG 0, QFLAG 1), so that the PI makes the reactive current
command. The voltage dip logic is off (<code>Vdip = -99</code>, <code>Vup = 99</code>), so that the dip does not hold
the PI's state, and so is the injection (<code>Kqv = 0</code>). With Q priority (<code>pqflag = false</code>) the limit
is <code>Iqmax = Imax = 1.1</code>.
</p>
<p>
The fault (<code>Xf = 0.1</code> pu) takes the terminal voltage to 0.33 pu, and the PI's output reaches 1.1 pu within
30 ms. The voltage recovers to 0.69 pu during the fault and the error shrinks, so the integral state rises from 0.90 to
0.95 pu while the output stays on the limit and the sum of the state and the proportional part tracks slightly above
it (1.105 pu at 2.05 s); after the clearing the output leaves the limit about 5 ms later, when the rising filtered
terminal voltage (0.87 pu at 2.155 s) has shrunk the proportional part enough for the sum to fall below Iqmax. Before the fix of OpenIPSL issue #467 the state wound up to 5.3 pu in Dymola and held the output at
the limit for about 0.1 s after the clearing (the reactive power 1.67 pu at 2.2 s instead of 0.38 pu), and the
anti-windup switched without end in OpenModelica and System Modeler.
The PSS/E twin is the unit test <code>ut_reeca1_vctl</code>.
</p>
<p>
Simulate for 6 s and plot <code>wind.RenewableController.pI_No_Windup.integral.y</code>,
<code>wind.RenewableController.pI_No_Windup.y</code>, <code>wind.RenewableController.CCL_REECA.Iqmax</code>,
<code>wind.RenewableGenerator.Qgen</code> and <code>GEN1.v</code>.
</p>
</html>"));
end REECA1VoltageControl;
