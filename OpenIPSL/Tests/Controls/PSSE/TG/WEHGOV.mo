within OpenIPSL.Tests.Controls.PSSE.TG;
model WEHGOV "Simple Machine Infinite Bus with Machine and Governor"
  extends OpenIPSL.Tests.BaseClasses.SMIB(pwFault(t1=2, t2=2.15));
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    P_0=40000000,
    Q_0=5415812,
    angle_0=0.070619983433093,
    M_b=120000000,
    Tpd0=4.1,
    Tppd0=0.019,
    Tppq0=0.048,
    H=3.42,
    D=0,
    Xd=1.1106,
    Xq=0.642,
    Xpd=0.247,
    Xppd=0.232,
    Xppq=0.232,
    Xl=0.171,
    S10=0.106,
    S12=0.433,
    R_a=0.0091)
    annotation (Placement(transformation(extent={{-94,-20},{-58,18}})));
  Electrical.Controls.PSSE.TG.WEHGOV
                wEHGOV(
    S_b=SysData.S_b,
    M_b=gENSAL.M_b,
    R_PERM_PE=0.057,
    R_PERM_GATE=0,
    M=0,
    TDV=0.1,
    TW=1.2)
    annotation (Placement(transformation(extent={{-64,34},{-92,60}})));
equation
  connect(gENSAL.p, GEN1.p)
    annotation (Line(points={{-58,-1},{-44,-1},{-44,0},{-30,0}},
                                               color={0,0,255}));
  connect(gENSAL.EFD0, gENSAL.EFD) annotation (Line(points={{-56.2,-10.5},{-44,
          -10.5},{-44,-40},{-110,-40},{-110,-12.4},{-97.6,-12.4}},
                                                  color={0,0,127}));
  connect(wEHGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{-93.4,47},{-110,
          47},{-110,10.4},{-97.6,10.4}},
                                       color={0,0,127}));
  connect(gENSAL.SPEED, wEHGOV.SPEED) annotation (Line(points={{-56.2,12.3},{-54,
          12.3},{-54,12},{-50,12},{-50,54.8},{-61.2,54.8}}, color={0,0,127}));
  connect(gENSAL.PELEC, wEHGOV.PELEC) annotation (Line(points={{-56.2,4.7},{-50,
          4.7},{-50,4},{-42,4},{-42,39.2},{-61.2,39.2}},
                                         color={0,0,127}));
  connect(gENSAL.PMECH0, wEHGOV.PMECH0) annotation (Line(points={{-56.2,8.5},{
          -46,8.5},{-46,47},{-61.2,47}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,
            -100},{120,100}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,
            100}})),
    experiment(
      StopTime=10,
      Interval=0.001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end WEHGOV;
