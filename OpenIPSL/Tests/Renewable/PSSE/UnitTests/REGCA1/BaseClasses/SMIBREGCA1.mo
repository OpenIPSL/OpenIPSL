within OpenIPSL.Tests.Renewable.PSSE.UnitTests.REGCA1.BaseClasses;
partial model SMIBREGCA1
  "REGCA1 alone on the SMIB, current commands held at their initial values, a capacitive shunt at bus FAULT"
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=0,
      X=-1/B,
      t1=2,
      t2=2.15));
  parameter OpenIPSL.Types.PerUnit B=1
    "Susceptance of the shunt connected at bus FAULT from 2 to 2.15 s (system base), capacitive for B > 0";
  parameter OpenIPSL.Types.PerUnit Volim=1.1
    "Voltage limit of the high voltage reactive current management of REGCA1";
  OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.REGCA1 regca1(
    M_b=100000000,
    P_0=40000000,
    Q_0=5416582.037,
    v_0=1,
    angle_0=0.0706207996,
    Lvplsw=false,
    Tg=0.02,
    rrpwr=10,
    Brkpt=0.9,
    Zerox=0.5,
    Lvpl1=1.22,
    Volim=Volim,
    lvpnt1=0.3,
    lvpnt0=0.2,
    Iolim=-1.3,
    Tfltr=0.02,
    Khv=0.7,
    Iqrmax=999,
    Iqrmin=-999) annotation (Placement(transformation(extent={{-70,-14},{-42,14}})));
  Modelica.Blocks.Math.Gain iqcmd(k=-1)
    "Reactive current command: the initial reactive current, injected positive"
    annotation (Placement(transformation(extent={{-84,-36},{-94,-26}})));
equation
  connect(regca1.p, GEN1.p)
    annotation (Line(points={{-41,0},{-30,0}}, color={0,0,255}));
  connect(regca1.IQ0, iqcmd.u)
    annotation (Line(points={{-68,-15},{-68,-31},{-83,-31}}, color={0,0,127}));
  connect(iqcmd.y, regca1.Iqcmd)
    annotation (Line(points={{-94.5,-31},{-100,-31},{-100,8},{-74,8}}, color={0,0,127}));
  connect(regca1.IP0, regca1.Ipcmd)
    annotation (Line(points={{-62,-15},{-62,-20},{-78,-20},{-78,-8},{-74,-8}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>
The network and data shared by the unit tests of the converter interface
<a href=\"modelica://OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.REGCA1\">REGCA1</a>. REGCA1 is alone at bus GEN1
of <code>OpenIPSL.Tests.BaseClasses.SMIB</code>, the network of the library's PSS/E tests, 40 MW at 1.0 pu on a 100 MVA
machine base, without an electrical controller: its current commands <code>Ipcmd</code> and <code>Iqcmd</code> are held at
their initial values (<code>Iqcmd</code> is injected positive, <code>IQ0</code> absorbed positive, hence the gain of -1).
</p>
<p>
The event raises the voltage instead of lowering it: the fault of the base class is a capacitive shunt of susceptance
<code>B</code> (<code>R = 0</code>, <code>X = -1/B</code>) at bus FAULT from 2 to 2.15 s, which lifts the terminal voltage to
1.33 pu with <code>B = 1</code> when nothing limits it. With the current commands constant and the low voltage logic of
REGCA1 out of reach (<code>Lvplsw = false</code>, <code>lvpnt1 = 0.3</code>), only the high voltage reactive current
management can act. The tests change <code>Volim</code>.
</p>
<p>
Each test is the library twin of a PSS/E 36.2 unit test with the same network, data and event, kept in a private
developer tool of the OpenIPSL development team.
</p>
</html>"));
end SMIBREGCA1;
