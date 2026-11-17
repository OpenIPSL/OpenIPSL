within OpenIPSL.Tests.Renewable.PSSE.UnitTests.REECA1;
model REECA1VoltageDipTiqHold
  "REECA1's voltage dip logic alone: the lag Tiq of the reactive current command holds its state during the dip"
  extends BaseClasses.SMIBREECA1(
    pqflag=true,
    Kqv=0,
    Xf=0.25);
  annotation (experiment(
      StopTime=6,
      Interval=0.001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>
The hold of the lag <code>Tiq</code> of
<a href=\"modelica://OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECA1\">REECA1</a> during a voltage dip,
with nothing else of REECA1's fault response acting. With local constant Q control the reactive current command is
<code>Qext/Vt</code> through the lag <code>Tiq = 0.02</code> s. The fault (<code>Xf = 0.25</code> pu) brings the terminal
voltage below <code>Vdip = 0.9</code>, to about 0.46 pu; during the dip the lag holds its state, so the reactive current
stays at its value before the fault, 0.054 pu, instead of rising to <code>Qext/Vt</code>, about 0.11 pu. There is no
injection (<code>Kqv = 0</code>), and the currents stay far from the current limit under both of its formulas (before
and after the fix of OpenIPSL issue #460). Before the fix the lag kept tracking <code>Qext/Vt</code> during the dip.
The PSS/E twin is the unit test <code>ut_reeca1_tiq</code>.
</p>
<p>
Simulate for 6 s and plot <code>wind.RenewableController.CCL_REECA.Iqcmd</code>,
<code>wind.RenewableGenerator.Qgen</code> and <code>GEN1.v</code>.
</p>
</html>"));
end REECA1VoltageDipTiqHold;
