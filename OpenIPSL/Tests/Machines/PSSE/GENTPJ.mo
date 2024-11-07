within OpenIPSL.Tests.Machines.PSSE;
model GENTPJ
  "SMIB system to test functionality of WECC Type J generator: round rotor with saturation on both axes"
  extends OpenIPSL.Tests.BaseClasses.SMIB (gENCLS(P_0=10017030, Q_0=8005052), GEN1(angle_0=0.070619983433093), SysData(
        fn=60), FAULT(v_0=0.995985, angle_0=-0.0050086621115692));
  Electrical.Machines.PSSE.GENTPJ gENTPJ(
    Tpd0=6.7,
    Tppd0=0.039,
    Tpq0=0.586,
    Tppq0=0.079,
    D=0,
    Xd=2.12,
    Xq=2.02,
    Xpd=0.26,
    Xpq=0.464,
    Xppd=0.195,
    Xppq=0.195,
    Xl=0.15,
    S10=0.057,
    S12=0.441,
    angle_0=0.070619983433093,
    R_a=0,
    H=4.88,
    M_b=234000000,
    P_0=40000000,
    Q_0=5415812,
    v_0=1,
    Kis=0.03)
    annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
equation
  connect(GEN1.p,pwLine. p)
    annotation (Line(points={{-30,0},{-19.4,0}},         color={0,0,255}));
  connect(pwLine.n,LOAD. p)
    annotation (Line(points={{-8.6,0},{0,0}},            color={0,0,255}));
  connect(pwLine3.p,LOAD. p) annotation (Line(points={{14.6,-30},{10,-30},{10,0},
          {0,0}},color={0,0,255}));
  connect(constantLoad.p,LOAD. p)
    annotation (Line(points={{0,-52},{0,0}},       color={0,0,255}));
  connect(GEN2.p,gENCLS. p)
    annotation (Line(points={{80,0},{90,0}},        color={0,0,255}));
  connect(pwLine4.n,GEN2. p) annotation (Line(points={{65.4,-30},{70,-30},{70,0},
          {80,0}}, color={0,0,255}));
  connect(FAULT.p,pwLine4. p)
    annotation (Line(points={{40,-30},{54.6,-30}}, color={0,0,255}));
  connect(FAULT.p,pwLine3. n)
    annotation (Line(points={{40,-30},{25.4,-30}}, color={0,0,255}));
  connect(pwFault.p,pwLine4. p)
    annotation (Line(points={{40,-48.3333},{40,-30},{54.6,-30}},
                                                            color={0,0,255}));
  connect(pwLine2.n,GEN2. p) annotation (Line(points={{65.4,30},{70,30},{70,0},{
          80,0}},  color={0,0,255}));
  connect(gENTPJ.PMECH,gENTPJ. PMECH0) annotation (Line(points={{-92,12},{-100,
          12},{-100,26},{-42,26},{-42,10},{-46,10}}, color={0,0,127}));
  connect(gENTPJ.EFD,gENTPJ. EFD0) annotation (Line(points={{-92,-12},{-100,-12},
          {-100,-30},{-42,-30},{-42,-10},{-46,-10}}, color={0,0,127}));
  connect(gENTPJ.p,GEN1. p)
    annotation (Line(points={{-48,0},{-30,0}},         color={0,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Ellipse(lineColor = {75,138,73},
                fillColor={255,255,255},
                fillPattern = FillPattern.Solid,
                extent={{-100,-100},{100,100}}),
        Polygon(lineColor = {0,0,255},
                fillColor = {75,138,73},
                pattern = LinePattern.None,
                fillPattern = FillPattern.Solid,
                points={{-36,60},{64,0},{-36,-60},{-36,60}})}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end GENTPJ;
