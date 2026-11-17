within OpenIPSL.Tests.Renewable.PSSE.UnitTests.REECA1.BaseClasses;
partial model SMIBREECA1
  "REGCA1 and REECA1 on the SMIB through a fault at bus FAULT, with the data that the REECA1 unit tests change as parameters"
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=Xf/10,
      X=Xf,
      t1=2,
      t2=2.15));
  parameter Boolean pqflag=true "Priority of the current limit: true for P priority, false for Q priority";
  parameter Real Kqv=5 "Reactive current injection gain of REECA1 during the voltage dip";
  parameter OpenIPSL.Types.PerUnit Vdip=0.9 "Voltage below which REECA1 is in a voltage dip";
  parameter OpenIPSL.Types.PerUnit Vup=1.1 "Voltage above which REECA1 is in a voltage dip";
  parameter OpenIPSL.Types.Time Tiq=0.02 "Time constant of the lag of the reactive current command with constant Q control";
  parameter OpenIPSL.Types.PerUnit Xf=0.15 "Reactance of the fault at bus FAULT (system base), with R = Xf/10";
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
      rrpwr=10,
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
      pqflag=pqflag,
      Vdip=Vdip,
      Vup=Vup,
      Trv=0.02,
      dbd1=0,
      dbd2=0,
      Kqv=Kqv,
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
      Tiq=Tiq,
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
  annotation (Documentation(info="<html>
<p>
The network and data shared by the unit tests of the electrical controller
<a href=\"modelica://OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECA1\">REECA1</a>.
The converter interface
<a href=\"modelica://OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.REGCA1\">REGCA1</a> and REECA1 are at bus GEN1
of <code>OpenIPSL.Tests.BaseClasses.SMIB</code>, the network of the library's PSS/E tests, 40 MW at 1.0 pu on a 100 MVA
machine base, without a plant controller (local constant Q control) and with the drive train unused
(<code>TOscillation = 0</code>, the speed is 1). A fault at bus FAULT through <code>R + jX = Xf/10 + jXf</code> lasts
from 2 to 2.15 s.
</p>
<p>
Nothing but REECA1's current limit and voltage dip logic limits the currents: the low voltage power logic of REGCA1 is
off, its low voltage active current management starts below 0.3 pu and its high voltage reactive current management
above 2 pu, the VDL tables are flat at 1.5 pu, above <code>Imax = 1.1</code>. The tests change <code>pqflag</code>,
<code>Kqv</code>, <code>Vdip</code>, <code>Vup</code>, <code>Tiq</code> and <code>Xf</code>.
</p>
<p>
The voltage control PI of REECA1 (<code>Kvp</code>, <code>Kvi</code>) is not in the path of the reactive current with
local constant Q control, but it still integrates; <code>Kvi = 0</code> keeps it at its initial output, so that its
limiter does not switch during the tests.
</p>
<p>
Each test is the library twin of a PSS/E 36.2 unit test with the same network, data and fault, kept in a private
developer tool of the OpenIPSL development team.
</p>
</html>"));
end SMIBREECA1;
