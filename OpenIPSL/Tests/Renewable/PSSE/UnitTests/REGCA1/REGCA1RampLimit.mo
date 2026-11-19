within OpenIPSL.Tests.Renewable.PSSE.UnitTests.REGCA1;
model REGCA1RampLimit
  "REGCA1's ramp rate limit rrpwr bounds the rise of the active current at rrpwr, whatever Tg"
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=0.01,
      X=0.1,
      t1=2,
      t2=2.15));
  Electrical.Renewables.PSSE.Wind wind(
    M_b=100000000,
    P_0=40000000,
    Q_0=5416582.037,
    v_0=1,
    angle_0=0.0706207996,
    QFunctionality=1,
    PFunctionality=0,
    TOscillation=0,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.REGCA1
      RenewableGenerator(
      Lvplsw=false,
      Tg=0.02,
      rrpwr=2,
      Brkpt=0.9,
      Zerox=0.5,
      Lvpl1=1.22,
      Volim=2,
      lvpnt1=0.3,
      lvpnt0=0.2,
      Iolim=-1.3,
      Tfltr=0.02,
      Khv=0.7,
      Iqrmax=999,
      Iqrmin=-999),
    redeclare OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECA1
      RenewableController(
      pqflag=false,
      Vdip=-99,
      Vup=99,
      Trv=0.02,
      dbd1=0,
      dbd2=0,
      Kqv=0,
      Iqh1=1.5,
      Iql1=-1.5,
      vref0=0,
      Iqfrz=0,
      Thld=0,
      Tp=0.05,
      Qmax=0.5,
      Qmin=-0.5,
      Vmax=1.1,
      Vmin=0.9,
      Kqp=0,
      Kqi=0.1,
      Kvp=0,
      Kvi=0,
      Vbias=0,
      Tiq=0.02,
      dPmax=99,
      dPmin=-99,
      Pmax=1,
      Pmin=0,
      Imax=1.1,
      Tpord=0.04,
      Vq1=0,
      Iq1=1.5,
      Vq2=0.5,
      Iq2=1.5,
      Vq3=1,
      Iq3=1.5,
      Vq4=2,
      Iq4=1.5,
      Vp1=0,
      Ip1=1.5,
      Vp2=0.5,
      Ip2=1.5,
      Vp3=1,
      Ip3=1.5,
      Vp4=2,
      Ip4=1.5),
    redeclare OpenIPSL.Electrical.Renewables.PSSE.PlantController.REPCA1
      PlantController,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.WindDriveTrain.WTDTA1
      DriveTrain,
    W0=0) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(wind.pwPin, GEN1.p)
    annotation (Line(points={{-40,0},{-30,0}}, color={0,0,255}));
  annotation (experiment(
      StopTime=6,
      Interval=0.001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>
The ramp rate limit <code>rrpwr</code> of
<a href=\"modelica://OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.REGCA1\">REGCA1</a> binding. REGCA1 and
<a href=\"modelica://OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECA1\">REECA1</a> are at bus GEN1 of
<code>OpenIPSL.Tests.BaseClasses.SMIB</code>, the network of the library's PSS/E tests, 40 MW at 1.0 pu on a 100 MVA
machine base, with local constant Q control, Q priority, no voltage dip logic (<code>Vdip = -99</code>,
<code>Vup = 99</code>) and no reactive current injection (<code>Kqv = 0</code>). A fault at bus FAULT through
<code>R + jX = 0.01 + j0.1</code> pu lasts from 2 to 2.15 s.
</p>
<p>
With <code>rrpwr = 2</code> pu/s and <code>Tg = 0.02</code> s, the active current <code>Ip</code>, the state of the
converter lag, rises from 0.40 pu at 2 pu/s through the fault, to 0.70 pu at its clearing, as in PSS/E 36.2.1, although the
active current command <code>Ipcmd</code> is above 0.8 pu; it then falls back to 0.40 pu in about 0.1 s, since the fall is
not limited. The low voltage power logic is off (<code>Lvplsw = false</code>) and the terminal voltage stays below 1.03 pu,
below <code>Volim</code>, so that nothing else limits the active current.
</p>
<p>
Added with the fix of OpenIPSL issue #470: the limit was applied before the gain <code>1/Tg</code> of the lag, so that
<code>Ip</code> could rise at <code>rrpwr/Tg</code>, 100 pu/s here, and reached 0.77 pu 50 ms after the fault, whatever
<code>rrpwr</code>. The PSS/E twin is the unit test <code>ut_regca1_ramp</code>.
</p>
<p>
Simulate for 6 s and plot <code>wind.RenewableGenerator.integrator1.y</code> (the state <code>Ip</code>),
<code>wind.RenewableGenerator.Ipcmd</code> and <code>wind.RenewableGenerator.Pgen</code>.
</p>
</html>"));
end REGCA1RampLimit;
