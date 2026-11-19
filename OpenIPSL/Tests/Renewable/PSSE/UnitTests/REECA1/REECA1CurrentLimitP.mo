within OpenIPSL.Tests.Renewable.PSSE.UnitTests.REECA1;
model REECA1CurrentLimitP
  "REECA1 with P priority: the reactive current injected during a voltage dip rides the current limit"
  extends BaseClasses.SMIBREECA1(
    pqflag=true,
    Kqv=5,
    Xf=0.15);
  annotation (experiment(
      StopTime=6,
      Interval=0.001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>
The voltage dip logic and the current limit logic of
<a href=\"modelica://OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECA1\">REECA1</a> acting together, with
P priority (<code>pqflag = true</code>), where the reactive current is limited to
<code>Iqmax = min(VDL1, sqrt(Imax^2 - Ipcmd^2))</code>. The fault (<code>Xf = 0.15</code> pu) holds the terminal voltage
near 0.7 pu. During the dip REECA1 injects <code>Iqinj = Kqv (Vref0 - Vt_filt)</code> with <code>Kqv = 5</code>, limited to
<code>Iqh1 = 1.5</code> (the request reaches 1.73 pu near 2.04 s), more reactive current than the limit leaves, so <code>Iqcmd</code> rides <code>Iqmax</code> and the converter current reaches
<code>Imax = 1.1</code>; the lag <code>Tiq</code> of the constant Q control holds its state.
</p>
<p>
The same case with Q priority is
<a href=\"modelica://OpenIPSL.Tests.Renewable.PSSE.UnitTests.REECA1.REECA1CurrentLimitQ\">REECA1CurrentLimitQ</a>; each of
the three behaviours is tested alone in
<a href=\"modelica://OpenIPSL.Tests.Renewable.PSSE.UnitTests.REECA1.REECA1CurrentLimitCircle\">REECA1CurrentLimitCircle</a>,
<a href=\"modelica://OpenIPSL.Tests.Renewable.PSSE.UnitTests.REECA1.REECA1VoltageDipInjection\">REECA1VoltageDipInjection</a> and
<a href=\"modelica://OpenIPSL.Tests.Renewable.PSSE.UnitTests.REECA1.REECA1VoltageDipTiqHold\">REECA1VoltageDipTiqHold</a>.
Added with the fix of OpenIPSL issue #460 (the limit had been computed as <code>sqrt(sqrt(Imax) - sqrt(|I|))</code>);
the PSS/E twin is the unit test <code>ut_reeca1</code>.
</p>
<p>
Simulate for 6 s and plot <code>wind.RenewableController.CCL_REECA.Iqcmd</code>,
<code>wind.RenewableController.CCL_REECA.Iqmax</code>, <code>wind.RenewableController.CCL_REECA.Ipcmd</code>,
<code>wind.RenewableGenerator.Pgen</code>, <code>wind.RenewableGenerator.Qgen</code> and <code>GEN1.v</code>.
</p>
</html>"));
end REECA1CurrentLimitP;
