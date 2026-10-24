within OpenIPSL.Tests.Banks.PSSE;
model CSVGN1 "SMIB system to test functionality of model CSVGN1"
 extends OpenIPSL.Tests.BaseClasses.SMIB(
    gENCLS(P_0=10016963.4299816, Q_0=2979911.82085724),
    constantLoad(v_0=0.994015188619077, angle_0=-0.0100321741951427));
 OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Tpd0=5,
    Tppd0=0.07,
    Tppq0=0.09,
    H=4.28,
    D=0,
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xppd=0.2,
    Xl=0.12,
    S10=0.11,
    S12=0.39,
    angle_0=0.0704921936685261,
    Xppq=0.2,
    R_a=0,
    M_b=100000000,
    P_0=40000000,
    Q_0=4402877.00923675,
    v_0=1) annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
 OpenIPSL.Electrical.Banks.PSSE.CSVGN1 cSVGN1(
    K=5,
    T1=0.01,
    T2=0,
    T3=10,
    T4=0,
    T5=0.05,
    VMAX=1.05,
    VMIN=0,
    CBASE=40000000,
    MBASE=80000000,
    v_0=1,
    angle_0=-0.00501610177997755,
    P_0=0,
    Q_0=6009897.16622744)
 annotation (Placement(transformation(extent={{-10,10},{10,-10}},origin={40,70})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=SHUNT.v)
    annotation (Placement(transformation(extent={{-6,38},{14,58}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{0,68},{14,82}})));
equation
 connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{-92,10},{-100,10},{-100,26},{-42,26},{-42,10},{-46,10}},
                                                     color={0,0,127}));
    connect(gENSAL.EFD, gENSAL.EFD0) annotation (Line(points={{-92,-10},{-100,-10},{-100,-30},{-42,-30},{-42,-10},{-46,-10}},
                                                     color={0,0,127}));
    connect(gENSAL.p, GEN1.p) annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
 connect(cSVGN1.p, SHUNT.p) annotation (Line(points={{40,60},{40,30}}, color={0,0,255}));
  connect(cSVGN1.V, realExpression.y)
    annotation (Line(points={{28,65},{20,65},{20,48},{15,48}},
                                               color={0,0,127}));
  connect(const.y, cSVGN1.VOTHSG) annotation (Line(points={{14.7,75},{28,75}},
                        color={0,0,127}));
    annotation (experiment(StopTime=10), Documentation(info="<html>
<p>
The CSVGN is a Static Compensator and should inject reactive power to control the terminal bus voltage during the fault disturbance.
Simulate for 10 seconds.
</p>
<p>The power flow data is PSS/E 36.2's solution of this network with the compensator holding bus <code>SHUNT</code>
at 1 pu, polished in double precision (2026-10-24): the machine's and the compensator's angle and reactive power,
and, because the compensator changes them, the slack's power (<code>gENCLS</code>) and the load bus's voltage
(<code>constantLoad</code>), which <code>SMIB</code> gives for the network without it. The test then starts at
rest. With its data <code>T2 = T4 = 0</code> the compensator's limited lead-lag is a limited gain
(<code>cSVGN1.lagLimT4</code>).</p>
<p>Variables of interest:</p>
<ul>
<li><code>cSVGN1.v</code></li>
<li><code>cSVGN1.Q</code></li>
</ul>
</html>"));
end CSVGN1;
