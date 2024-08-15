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
    annotation (Placement(transformation(extent={{-96,-20},{-60,18}})));
  Electrical.Controls.PSSE.TG.WSIEG1
         wSIEG1(T_2=0, T_7=0,
    db1=0,
    err=0,
    db2=0.01)
    annotation (Placement(transformation(extent={{-64,34},{-92,60}})));
equation
  connect(gENROU.p, GEN1.p)
    annotation (Line(points={{-60,-1},{-44,-1},{-44,0},{-30,0}},
                                               color={0,0,255}));
  connect(gENROU.EFD0,gENROU. EFD) annotation (Line(points={{-58.2,-10.5},{-44,
          -10.5},{-44,-40},{-110,-40},{-110,-12.4},{-99.6,-12.4}},
                                                  color={0,0,127}));
  connect(gENROU.SPEED, wSIEG1.SPEED_HP) annotation (Line(points={{-58.2,12.3},
          {-44,12.3},{-44,54.8},{-66.8,54.8}}, color={0,0,127}));
  connect(wSIEG1.PMECH_HP, gENROU.PMECH) annotation (Line(points={{-93.4,52.2},
          {-110,52.2},{-110,10.4},{-99.6,10.4}}, color={0,0,127}));
  connect(gENROU.PMECH0, wSIEG1.PMECH0) annotation (Line(points={{-58.2,8.5},{
          -52,8.5},{-52,37.9},{-66.8,37.9}},
                                           color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,
            -100},{120,100}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,
            100}})),
    experiment(
      StopTime=10,
      Interval=0.0001,
      Tolerance=1e-06,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Rkfix2"));
end WSIEG1;
