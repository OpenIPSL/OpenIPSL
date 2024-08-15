within OpenIPSL.Tests.Controls.PSSE.TG;
model WPIDHY "SMIB system to test functionality of WPIDHY model"
  extends OpenIPSL.Tests.BaseClasses.SMIB(constantLoad(angle_0=-0.0100577809552));
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Xppd=0.2,
    Xppq=0.2,
    Xl=0.12,
    Tpd0=5,
    Tppd0=0.50000E-01,
    Tppq0=0.1,
    H=4.0000,
    D=0,
    Xd=1.41,
    Xq=1.3500,
    Xpd=0.3,
    S10=0.1,
    S12=0.5,
    angle_0=0.07068583470577,
    M_b=100000000,
    P_0=39999950,
    Q_0=5416571,
    v_0=1) annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.WPIDHY wPIDHY(
    T_REG=1,
    REG=-0.05,
    K_P=3,
    K_I=0.3,
    K_D=0,
    T_A=0.01,
    T_W=1.47,
    T_B=0.25,
    VELMX=0.1320,
    VELMN=-0.1320,
    GATMX=1,
    GATMN=0,
    PMAX=1,
    PMIN=0.2580,
    D=0,
    G0=0.0833,
    G1=0.5,
    G2=0.75,
    P1=0.5910,
    P2=0.8170,
    P3=0.9785)
    annotation (Placement(transformation(extent={{-60,60},{-80,40}})));
equation
  connect(wPIDHY.PELEC, gENSAL.PELEC) annotation (Line(
      points={{-62,56},{-36,56},{-36,6},{-46,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.EFD0,gENSAL. EFD) annotation (Line(points={{-46,-10},{-40,-10},{-40,-26},{-98,-26},{-98,-12},{-92,-12}},color={0,0,127},smooth=Smooth.None));
  connect(wPIDHY.PMECH, gENSAL.PMECH) annotation (Line(points={{-81,50},{-98,50},
          {-98,12},{-92,12}}, color={0,0,127}));
  connect(gENSAL.SPEED, wPIDHY.SPEED) annotation (Line(points={{-46,14},{-40,14},
          {-40,44},{-62,44}}, color={0,0,127}));
  connect(gENSAL.p, GEN1.p) annotation (Line(points={{-48,0},{-50,0},{-50,0},{-30,0}},color={0,0,255}));
  annotation (
experiment(StopTime=10),Documentation(info="<html>
<p>
Simulate for 10 seconds.
</p>
<p>Variables of interest:</p>
<ul>
<li><code>gGOV1.PMECH</code></li>
<li><code>gENROU.PELEC</code></li>
<li><code>gENROU.SPEED</code></li>
<li><code>gENROU.delta</code></li>
</ul>
</html>"));
end WPIDHY;
