within OpenIPSL.Tests.Renewable.PSSE.UnitTests.REECA1;
model REECA1CurrentLimitCircle
  "REECA1's current limit alone: with Q priority the active current command is limited by the circular limit sqrt(Imax^2 - Iqcmd^2)"
  extends BaseClasses.SMIBREECA1(
    pqflag=false,
    Kqv=0,
    Vdip=-99,
    Vup=99,
    Xf=0.2);
  annotation (experiment(
      StopTime=6,
      Interval=0.001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>
The current limit logic of
<a href=\"modelica://OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECA1\">REECA1</a> with nothing else of
REECA1's fault response acting: the voltage dip logic never starts (<code>Vdip = -99</code>, <code>Vup = 99</code>) and
injects nothing (<code>Kqv = 0</code>). With Q priority (<code>pqflag = false</code>) the active current is limited to
<code>Ipmax = min(VDL2, sqrt(Imax^2 - Iqcmd^2))</code>, here about 1.09 pu, since the reactive current stays near
0.1 pu. The fault (<code>Xf = 0.2</code> pu) lowers the terminal voltage to about 0.4 pu, so the active current
command <code>Pord/Vt</code> rises to about 0.96 pu: below the circular limit, so the limit does not bind. Before the fix of
OpenIPSL issue #460 the limit was <code>sqrt(sqrt(Imax) - sqrt(|Iqcmd|))</code>, about 0.83 pu here, and it cut the
active current. The PSS/E twin is the unit test <code>ut_reeca1_lim</code>.
</p>
<p>
Simulate for 6 s and plot <code>wind.RenewableController.CCL_REECA.Ipcmd</code>,
<code>wind.RenewableController.CCL_REECA.Ipmax</code>, <code>wind.RenewableController.CCL_REECA.Iqcmd</code>,
<code>wind.RenewableGenerator.Pgen</code> and <code>GEN1.v</code>.
</p>
</html>"));
end REECA1CurrentLimitCircle;
