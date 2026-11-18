within OpenIPSL.Tests.Renewable.PSSE.UnitTests.REECA1;
model REECA1VoltageDipInjection
  "REECA1's voltage dip logic alone: the reactive current Iqinj = Kqv (Vref0 - Vt_filt) is injected during the dip"
  extends BaseClasses.SMIBREECA1(
    pqflag=true,
    Kqv=0.5,
    vref0=1.05,
    Tiq=10,
    Xf=0.25);
  annotation (experiment(
      StopTime=6,
      Interval=0.001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>
The reactive current injection of
<a href=\"modelica://OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECA1\">REECA1</a> during a voltage dip,
with nothing else of REECA1's fault response acting. The fault (<code>Xf = 0.25</code> pu) brings the terminal voltage
below <code>Vdip = 0.9</code>, and REECA1 adds <code>Iqinj = Kqv (Vref0 - Vt_filt)</code>, with <code>Kqv = 0.5</code>,
<code>Vref0 = 1.05</code> and <code>Vt_filt</code> the terminal voltage through the lag <code>Trv</code>, about 0.23 pu, to the
reactive current command; the terminal voltage stays near 0.58 pu. Before the dip <code>Vref0</code> differs from the
initial voltage, 1.0 pu, and nothing is injected: the test also checks that the controller starts in steady state. The currents stay far from the
current limit under both of its formulas (before and after the fix of OpenIPSL issue #460), and
<code>Tiq = 10</code> s makes the lag of the constant Q control move by less than 1e-3 pu in the 0.15 s of the
fault, whether or not it holds its state. Before the fix the dip switch passed <code>Iqinj</code> outside the dip and
zero during it. The PSS/E twin is the unit test <code>ut_reeca1_dip</code>.
</p>
<p>
Simulate for 6 s and plot <code>wind.RenewableController.CCL_REECA.Iqcmd</code>,
<code>wind.RenewableGenerator.Qgen</code> and <code>GEN1.v</code>.
</p>
</html>"));
end REECA1VoltageDipInjection;
