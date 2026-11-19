within OpenIPSL.Tests.Renewable.PSSE.UnitTests.REECA1;
model REECA1VoltageControlP
  "REECA1 with local voltage control and P priority: the limit of the voltage PI moves with the active current"
  extends BaseClasses.SMIBREECA1(
    pqflag=true,
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
<a href=\"modelica://OpenIPSL.Tests.Renewable.PSSE.UnitTests.REECA1.REECA1VoltageControl\">REECA1VoltageControl</a> with
P priority (<code>pqflag = true</code>): the limit of the voltage PI (<a href=\"modelica://OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses.PIwithVariableLimiter\">PIwithVariableLimiter</a>) is
<code>Iqmax = sqrt(Imax^2 - Ipcmd^2)</code>, which moves with the active current command, a variable limit. During the
fault the PI's sum stays beyond the limit and its integral state is held near 0.66 pu; after the clearing the active
current rises and the limit with it.
The PSS/E twin is the unit test <code>ut_reeca1_vctlp</code>.
</p>
<p>
Simulate for 6 s and plot <code>wind.RenewableController.pI_No_Windup.integral.y</code>,
<code>wind.RenewableController.pI_No_Windup.y</code>, <code>wind.RenewableController.CCL_REECA.Iqmax</code>,
<code>wind.RenewableGenerator.Qgen</code> and <code>GEN1.v</code>.
</p>
</html>"));
end REECA1VoltageControlP;
