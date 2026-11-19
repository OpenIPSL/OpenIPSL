within OpenIPSL.Tests.Renewable.PSSE.UnitTests.REECA1;
model REECA1VoltageQControl
  "REECA1 with local coordinated V/Q control: both PIs in the path, the reactive power PI on its limit during the fault"
  extends BaseClasses.SMIBREECA1(
    pqflag=false,
    Kqv=0,
    Vdip=-99,
    Vup=99,
    Xf=0.1,
    wind(QFunctionality=3, RenewableController(Kqp=0.5, Kqi=20, Kvp=0.5, Kvi=120)));
  annotation (experiment(
      StopTime=6,
      Interval=0.001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>
<a href=\"modelica://OpenIPSL.Tests.Renewable.PSSE.UnitTests.REECA1.REECA1VoltageControl\">REECA1VoltageControl</a> with
local coordinated V/Q control (<code>QFunctionality = 3</code>, VFLAG 1): the reactive power PI of <a href=\"modelica://OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECA1\">REECA1</a>
(<a href=\"modelica://OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses.PIwithNoVariableLimiter\">PIwithNoVariableLimiter</a>, <code>Kqp = 0.5</code>, <code>Kqi = 20</code>, limits <code>Vmin = 0.9</code> and <code>Vmax = 1.1</code>) makes
the voltage reference of the voltage PI (<a href=\"modelica://OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses.PIwithVariableLimiter\">PIwithVariableLimiter</a>). During the fault the reactive power rises above its reference, the
reactive power PI's sum falls below <code>Vmin</code> and its integral state is held near 0.986 pu, while the voltage PI
rides <code>Iqmax</code> as in REECA1VoltageControl.
The PSS/E twin is the unit test <code>ut_reeca1_vqctl</code>.
</p>
<p>
Simulate for 6 s and plot <code>wind.RenewableController.pI_No_Windup_notVariable.integral.y</code>,
<code>wind.RenewableController.pI_No_Windup.integral.y</code>, <code>wind.RenewableGenerator.Qgen</code> and
<code>GEN1.v</code>.
</p>
</html>"));
end REECA1VoltageQControl;
