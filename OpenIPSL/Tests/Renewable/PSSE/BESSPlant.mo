within OpenIPSL.Tests.Renewable.PSSE;
model BESSPlant
  "BESS source in a SMIB system to test functionality of REPCA plant controller model"
  extends BaseClasses.SMIBRenewable;
  Electrical.Renewables.PSSE.BESS bESS(
    fn=SysData.fn,
    P_0=1500000,
    Q_0=-5665800,
    v_0=1,
    angle_0=0.02574992,
    QFunctionality=4,
    PFunctionality=0,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.REGCA1
      RenewableGenerator(
      V_b=100000,
      Tg=0.017,
      Brkpt=0.1,
      lvpnt1=0.2,
      lvpnt0=0.05,
      Iqrmax=99,
      Iqrmin=-99,
      Lvplsw=true),
    redeclare OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECCU1
      RenewableController(
      pfflag=false,
      vflag=false,
      qflag=false,
      pqflag=false,
      dbd1=-0.05,
      dbd2=0.05,
      Kqv=15,
      Iqh1=0.75,
      Iql1=-0.75,
      Tp=0.05,
      Qmax=0.75,
      Qmin=-0.75,
      Kqi=1,
      Kvi=1,
      Tiq=0.017,
      Pmin=-0.667,
      Imax=1.11,
      Tpord=0.017,
      Vq1=0,
      Vq2=0.2,
      Vq3=0.5,
      Vq4=1),
    redeclare OpenIPSL.Electrical.Renewables.PSSE.PlantController.REPCA1
      PlantController)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(bESS.pwPin, GEN1.p)
    annotation (Line(points={{-40,0},{-30,0}}, color={0,0,255}));
  connect(freq.y, bESS.FREQ)
    annotation (Line(points={{-75,0},{-62,0}}, color={0,0,127}));
  connect(pwVoltage.vi, bESS.regulate_vi)
    annotation (Line(points={{-36.6,30},{-44,30},{-44,10}}, color={0,0,127}));
  connect(pwVoltage.vr, bESS.regulate_vr) annotation (Line(points={{-36.6,33.6},
          {-56,33.6},{-56,10}}, color={0,0,127}));
  connect(bESS.branch_ir, pwCurrent.ir) annotation (Line(points={{-44,-10},{-44,
          -16},{-17.6,-16},{-17.6,-6.6}}, color={0,0,127}));
  connect(pwCurrent.ii, bESS.branch_ii) annotation (Line(points={{-14,-6.6},{
          -14,-20},{-56,-20},{-56,-10}}, color={0,0,127}));
  annotation (experiment(
      StopTime=5),                                Documentation(
        info="<html>
<p>
Simulate for 5 seconds.
</p>
<p>This test system aims to show how to use the renewable BESS plant component in all the possible control options. The model was developed following the
modeling template from the WECC BESS Power Plant Dynamic Modeling Guide and PSSE manuals.</p>
<p>There are a total of eight reactive power control options (Constant local PF control, Constant local Q control, Local V control, Local coordinated
 V/Q control, Plant level Q control, Plant level V control, Plant level Q control + local coordinated V/Q control, Plant level V control + local
coordinated V/Q control), 2 active power options (No governor response, Governor response with up and down regulation).</p>
<p>Variables of interest:</p>
<ul>
<li><code>bESS.RenewableGenerator.Pgen</code></li>
<li><code>bESS.RenewableGenerator.Qgen</code></li>
<li><code>GEN1.v</code></li>
<li><code>FAULT.v</code></li>
<li><code>GEN2.v</code></li>
</ul>
</html>"));
end BESSPlant;
