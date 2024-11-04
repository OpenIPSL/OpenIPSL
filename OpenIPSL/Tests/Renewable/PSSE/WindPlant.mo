within OpenIPSL.Tests.Renewable.PSSE;
model WindPlant
  "Wind source in a SMIB system to test functionality of REECCA electrical controller model"
  extends BaseClasses.SMIBRenewable;
  Electrical.Renewables.PSSE.Wind wind(
    P_0=1500000,
    Q_0=-5665800,
    v_0=1,
    angle_0=0.02574992,
    QFunctionality=4,
    PFunctionality=0,
    TOscillation=0,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.REGCA1
      RenewableGenerator(
      Tg=0.01,
      rrpwr=3,
      Brkpt=0.8,
      Zerox=0.1,
      Lvpl1=1.22,
      Volim=1.2,
      lvpnt1=0.6,
      lvpnt0=0.1,
      Iolim=-1.3,
      Tfltr=0.02,
      Khv=1,
      Iqrmax=99,
      Iqrmin=-99),
    redeclare OpenIPSL.Electrical.Renewables.PSSE.PlantController.REPCA1
      PlantController,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECA1
      RenewableController(
      pqflag=false,
      dbd1=-0.1,
      dbd2=0.1,
      Iqh1=1,
      Iql1=-1,
      vref0=0,
      Iqfrz=0.07,
      Tp=0.3,
      Qmax=0.5,
      Qmin=-0.5,
      Vmax=1.1,
      Vmin=0.9,
      Kqp=0.1,
      Kqi=0.1,
      Kvp=1.6,
      Kvi=1,
      Vbias=0,
      Tiq=0.01,
      dPmax=99,
      dPmin=-99,
      Pmax=1,
      Pmin=0,
      Imax=1.2,
      Tpord=0.3,
      Vq1=0.1,
      Iq1=0.01,
      Vq2=0.4,
      Iq2=0.5,
      Vq3=0.6,
      Iq3=0.7,
      Vq4=0.9,
      Iq4=1.0,
      Vp1=0.1,
      Ip1=0.4,
      Vp2=0.5,
      Ip2=0.7,
      Vp3=0.9,
      Ip3=1.2,
      Vp4=1,
      Ip4=1.2),
    redeclare OpenIPSL.Electrical.Renewables.PSSE.WindDriveTrain.WTDTA1
      DriveTrain(
      H=0.01,
      Freq1=10,
      Dshaft=0.015),
    W0=0) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(wind.pwPin, GEN1.p)
    annotation (Line(points={{-40,0},{-30,0}}, color={0,0,255}));
  connect(freq.y, wind.FREQ)
    annotation (Line(points={{-75,0},{-62,0}},   color={0,0,127}));
  connect(wind.regulate_vi, pwVoltage.vi)
    annotation (Line(points={{-44,10},{-44,30},{-36.6,30}},  color={0,0,127}));
  connect(pwVoltage.vr, wind.regulate_vr) annotation (Line(points={{-36.6,33.6},
          {-56,33.6},{-56,10}},  color={0,0,127}));
  connect(wind.branch_ir, pwCurrent.ir) annotation (Line(points={{-44,-10},{-44,
          -16},{-17.6,-16},{-17.6,-6.6}},     color={0,0,127}));
  connect(pwCurrent.ii, wind.branch_ii) annotation (Line(points={{-14,-6.6},{
          -14,-20},{-56,-20},{-56,-10}},  color={0,0,127}));
  annotation (experiment(
      StopTime=5),                                Documentation(
        info="<html>
<p>
Simulate for 5 seconds.
</p>
<p>This test system aims to show how to use the renewable Wind plant component in all the possible control options. The model was developed following the
modeling template from the WECC PV Power Plant Dynamic Modeling Guide and PSSE manuals.</p>
<p>There are a total of eight reactive power control options (Constant local PF control, Constant local Q control, Local V control, Local coordinated
 V/Q control, Plant level Q control, Plant level V control, Plant level Q control + local coordinated V/Q control, Plant level V control + local
coordinated V/Q control), 2 active power options (No governor response, Governor response with up and down regulation). The user can also simulate the torsional oscillation in the wind turbine drive train (Do not emulate torsional oscillation, Emulated torsional oscillation in power output).</p>
<p>Variables of interest:</p>
<ul>
<li><code>wind.RenewableGenerator.Pgen</code></li>
<li><code>wind.RenewableGenerator.Qgen</code></li>
<li><code>GEN1.v</code></li>
<li><code>FAULT.v</code></li>
<li><code>GEN2.v</code></li>
</ul>
</html>"));
end WindPlant;
