within OpenIPSL.Tests.Controls.PSSE.TG;
model WSIEG1 "Simple Machine Infinite Bus with Machine and Governor"
  extends OpenIPSL.Tests.BaseClasses.SMIB;
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    P_0=40000000,
    Q_0=5415812,
    angle_0=0.070619983433093,
    M_b=150000000,
    Tpd0=4.815,
    Tppd0=0.046,
    Tppq0=0.04,
    H=4.39,
    D=0,
    Xd=1.24,
    Xq=1.22,
    Xpd=0.216,
    Xppd=0.165,
    Xppq=0.165,
    Xl=0.148,
    S10=0.111,
    S12=0.356,
    R_a=0,
    Xpq=0.382,
    Tpq0=1)
    annotation (Placement(transformation(extent={{-86,-20},{-50,18}})));
  Electrical.Controls.PSSE.TG.WSIEG1
         wSIEG1(T_2=0, T_7=0,
    db1=0,
    err=0,
    db2=0.01)
    annotation (Placement(transformation(extent={{-54,34},{-82,60}})));
equation
  connect(gENROU.p, GEN1.p)
    annotation (Line(points={{-50,-1},{-34,-1},{-34,0},{-30,0}},
                                               color={0,0,255}));
  connect(gENROU.EFD0,gENROU. EFD) annotation (Line(points={{-48.2,-10.5},{-40,
          -10.5},{-40,-28},{-96,-28},{-96,-12.4},{-89.6,-12.4}},
                                                  color={0,0,127}));
  connect(wSIEG1.PMECH_HP, gENROU.PMECH) annotation (Line(points={{-83.4,52.2},
          {-96,52.2},{-96,10},{-92,10},{-92,10.4},{-89.6,10.4}},
                                                 color={0,0,127}));
  connect(gENROU.SPEED, wSIEG1.SPEED_HP) annotation (Line(points={{-48.2,12.3},
          {-40,12.3},{-40,54.8},{-56.8,54.8}}, color={0,0,127}));
  connect(gENROU.PMECH0, wSIEG1.PMECH0) annotation (Line(points={{-48.2,8.5},{
          -44,8.5},{-44,37.9},{-56.8,37.9}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-80},{100,100}})),
    experiment(
      StopTime=10,
      Interval=0.0001,
      Tolerance=1e-06,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Rkfix2"));
end WSIEG1;
