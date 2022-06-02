within OpenIPSL.Tests.Controls.PSSE.TG;
model GGOV1 "SMIB system to test functionality of GGOV1 model"
  extends OpenIPSL.Tests.BaseClasses.SMIB;
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    Xppd=0.2,
    Xppq=0.2,
    Xpp=0.2,
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
    Xpq=0.6,
    Tpq0=0.7,
    angle_0=0.07068583470577,
    M_b=100000000,
    P_0=39999950,
    Q_0=5416571,
    v_0=1) annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.GGOV1 gGOV1(
    R=0.,
    T_pelec=1,
    maxerr=0.05,
    minerr=-0.05,
    Kpgov=10,
    Kigov=2,
    Kdgov=0,
    Tdgov=1,
    Vmax=1,
    Vmin=0.15,
    Tact=0.5,
    Kturb=1.5,
    Wfnl=0.2,
    Tb=0.1,
    Tc=0,
    Teng=0.5,
    Tfload=3,
    Kpload=2,
    Kiload=0.67,
    Ldref=1,
    Dm=0,
    Ropen=0.1,
    Rclose=-0.1,
    Kimw=0,
    Aset=0.1,
    Ka=10,
    Ta=0.1,
    Trate=0,
    db=0,
    Tsa=4,
    Tsb=5,
    Rup=99,
    Rdown=-99,
    DELT=0.0001,
    Flag=0,
    Rselect=0) annotation (Placement(transformation(extent={{-60,60},{-80,40}})));
equation
  connect(gGOV1.PELEC, gENROU.PELEC) annotation (Line(points={{-62,56},{-36,56},{-36,6},{-46,6}},color={0,0,127},smooth=Smooth.None));
  connect(gENROU.EFD0, gENROU.EFD) annotation (Line(points={{-46,-10},{-40,-10},{-40,-26},{-98,-26},{-98,-12},{-92,-12}},color={0,0,127},smooth=Smooth.None));
  connect(gGOV1.PMECH, gENROU.PMECH) annotation (Line(points={{-81,50},{-98,50},{-98,12},{-92,12}}, color={0,0,127}));
  connect(gENROU.SPEED, gGOV1.SPEED) annotation (Line(points={{-46,14},{-40,14},{-40,44},{-62,44}},color={0,0,127}));
  connect(gENROU.p, GEN1.p) annotation (Line(points={{-48,0},{-50,0},{-50,0},{-30,0}},color={0,0,255}));
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
end GGOV1;
