within OpenIPSL.Tests.Renewable.PSSE.UnitTests.REECA1;
model REECA1CurrentLimitQ
  "REECA1 with Q priority: the active current rides the current limit left by the reactive current injected during a voltage dip"
  extends BaseClasses.SMIBREECA1(
    pqflag=false,
    Kqv=2,
    Xf=0.05);
  annotation (experiment(
      StopTime=6,
      Interval=0.001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>
<a href=\"modelica://OpenIPSL.Tests.Renewable.PSSE.UnitTests.REECA1.REECA1CurrentLimitP\">REECA1CurrentLimitP</a> with Q
priority (<code>pqflag = false</code>), where the active current is limited to
<code>Ipmax = min(VDL2, sqrt(Imax^2 - Iqcmd^2))</code>. A deeper fault (<code>Xf = 0.05</code> pu) holds the terminal voltage
near 0.52 pu and the voltage dip logic (<code>Kqv = 2</code>) asks for a reactive current near 1.0 pu, below
<code>Imax = 1.1</code>: <code>Ipcmd</code> then rides <code>Ipmax</code> and the converter current reaches
<code>Imax</code>. The PSS/E twin is the unit test <code>ut_reeca1_pq0</code>.
</p>
<p>
Simulate for 6 s and plot <code>wind.RenewableController.CCL_REECA.Ipcmd</code>,
<code>wind.RenewableController.CCL_REECA.Ipmax</code>, <code>wind.RenewableController.CCL_REECA.Iqcmd</code>,
<code>wind.RenewableGenerator.Pgen</code>, <code>wind.RenewableGenerator.Qgen</code> and <code>GEN1.v</code>.
</p>
</html>"));
end REECA1CurrentLimitQ;
