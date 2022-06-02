within OpenIPSL.Examples.RaPIdExperiments;
model Mostar "System with the original generator parameters for parameter identification"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    B=0,
    G=0,
    R=0,
    X=0.1169,
    displayPF=true)
    annotation (Placement(transformation(extent={{14,-4},{26,4}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(angle_0=0, v_0=0.9617)
    annotation (Placement(transformation(extent={{80,-10},{60,10}})));
  OpenIPSL.Electrical.Loads.PSSE.Load constantLoad(
    PQBRAK=0.7,
    v_0=0.97042,
    angle_0=0,
    P_0=5194860)
    annotation (Placement(transformation(extent={{-6,-32},{6,-20}})));
  OpenIPSL.Electrical.Buses.Bus bus1(displayPF=false)
    annotation (Placement(transformation(extent={{-18,-10},{2,10}})));
  OpenIPSL.Electrical.Buses.Bus bus2
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    M_b=30000000,
    Tpd0=3.77,
    Tppd0=0.0552,
    Tppq0=0.0823,
    D=0,
    Xd=1.183,
    Xq=0.62,
    Xpd=0.371,
    Xppd=0.215,
    Xppq=0.241,
    Xl=0.1,
    S10=0.1,
    S12=0.4,
    R_a=0.017637/(10.5^2/30),
    H=2.137,
    angle_0=0,
    Q_0=1000000*((0.07332*30)),
    v_0=0.9705,
    P_0=5194860)
    annotation (Placement(transformation(extent={{-72,-12},{-48,12}})));
  Modelica.Blocks.Sources.Constant const(k=-Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-80,-76},{-70,-66}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.ST5B sT5B(
    T_C1=1.071137,
    T_B1=10.7561,
    T_C2=3.414283,
    T_B2=1.701033,
    K_R=358.6086,
    T_1=0.004361481)
    annotation (Placement(transformation(extent={{-54,-38},{-74,-20}})));
  Modelica.Blocks.Sources.Constant const1(k=Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-80,-56},{-70,-46}})));
  Modelica.Blocks.Sources.Constant const2(k=0)
    annotation (Placement(transformation(extent={{-28,-58},{-40,-46}})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=30000000,
                                                       fn=50) annotation (
      Placement(transformation(extent={{60,-100},{100,-80}})));
  Modelica.Blocks.Sources.Step step(startTime=1.7, height=-0.05)
    annotation (Placement(transformation(extent={{-16,-24},{-24,-16}})));
  Modelica.Blocks.Sources.Step step1(startTime=10.25, height=0.05)
    annotation (Placement(transformation(extent={{-16,-38},{-24,-30}})));
  Modelica.Blocks.Math.Add3 add3_1
    annotation (Placement(transformation(extent={{-30,-32},{-38,-24}})));
equation
  connect(bus1.p, pwLine.p)
    annotation (Line(points={{-8,0},{14.6,0}}, color={0,0,255}));
  connect(constantLoad.p, pwLine.p) annotation (Line(points={{0,-20},{0,-20},{0,
          0},{14.6,0}}, color={0,0,255}));
  connect(pwLine.n,bus2. p)
    annotation (Line(points={{25.4,0},{25.4,0},{50,0}}, color={0,0,255}));
  connect(bus2.p, infiniteBus.p)
    annotation (Line(points={{50,0},{60,0}}, color={0,0,255}));
  connect(gENSAL.p, bus1.p)
    annotation (Line(points={{-48,0},{-48,0},{-8,0}}, color={0,0,255}));
  connect(const.y, sT5B.VUEL) annotation (Line(points={{-69.5,-71},{-60,-71},{
          -60,-38.9}}, color={0,0,127}));
  connect(const1.y, sT5B.VOEL) annotation (Line(points={{-69.5,-51},{-64,-51},
          {-64,-38.9}}, color={0,0,127}));
  connect(sT5B.EFD, gENSAL.EFD) annotation (Line(points={{-75,-29},{-86,-29},{
          -86,-7.2},{-74.4,-7.2}},
                                color={0,0,127}));
  connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{-74.4,7.2},{-80,
          7.2},{-80,16},{-42,16},{-42,6},{-46.8,6}},
                                                   color={0,0,127}));
  connect(gENSAL.EFD0, sT5B.EFD0) annotation (Line(points={{-46.8,-6},{-42,-6},
          {-42,-32.6},{-53,-32.6}}, color={0,0,127}));
  connect(sT5B.XADIFD, gENSAL.XADIFD) annotation (Line(points={{-72,-38.9},{-40,
          -38.9},{-40,-10.8},{-46.8,-10.8}},
                                       color={0,0,127}));
  connect(step.y, add3_1.u2) annotation (Line(points={{-24.4,-20},{-26,-20},{
          -26,-28},{-29.2,-28}},
                             color={0,0,127}));
  connect(gENSAL.ETERM, add3_1.u1) annotation (Line(points={{-46.8,-3.6},{-28,
          -3.6},{-28,-24.8},{-29.2,-24.8}},
                                      color={0,0,127}));
  connect(add3_1.y, sT5B.ECOMP) annotation (Line(points={{-38.4,-28},{-38.4,-29},
          {-53,-29}}, color={0,0,127}));
  connect(sT5B.VOTHSG, const2.y) annotation (Line(points={{-53,-25.4},{-46,
          -25.4},{-46,-52},{-40.6,-52}}, color={0,0,127}));
  connect(add3_1.u3, step1.y) annotation (Line(points={{-29.2,-31.2},{-26,-31.2},
          {-26,-34},{-24.4,-34}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,40}})),
    experiment(
      StartTime=0,
      StopTime=20,
      Tolerance=1e-06,
      Interval=0.04),
    Documentation(info="<html>
<p>This is a Single-Machine-Infinite-Bus (SMIB) system containing disturbances on the excitation system reference, in generation unit connected to bus 1.
These disturbances allow the user to observe dominant dynamics from the excitation system that can be used to identify certain set of parameters.</p>
<p>Simulate the system for 20 seconds. Variables of interest are:</p>
<ul>
<li><code>sT5B.ECOMP</code></li>
<li><code>sT5B.EFD</code></li>
</ul>
<p>Note that the disturbance changes the measured voltage <code>ECOMP</code>, leading to a response from the excitation system control, which increases the output <code>EFD</code>.
This disturbance shows the dynamic response of the excitation system and, therefore, enables parameter identification procedures to be run.</p>
</html>"));
end Mostar;
