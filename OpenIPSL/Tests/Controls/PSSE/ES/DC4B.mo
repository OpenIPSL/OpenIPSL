within OpenIPSL.Tests.Controls.PSSE.ES;
model DC4B "Simple Machine Infinite Bus with Machine and Exciter"
  extends OpenIPSL.Tests.BaseClasses.SMIB;
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    P_0=40000000,
    Q_0=5415812,
    angle_0=0.070619983433093,
    M_b=100000000,
    Tpd0=5.5,
    Tppd0=0.035,
    Tppq0=0.07,
    H=2.71,
    D=0,
    Xd=1.9,
    Xq=1.8,
    Xpd=0.27,
    Xppd=0.15,
    Xppq=0.15,
    Xl=0.101,
    S10=0.11,
    S12=0.48,
    Xpq=0.6,
    Tpq0=0.75)
    annotation (Placement(transformation(extent={{-88,-16},{-58,16}})));
  Electrical.Controls.PSSE.ES.DC4B
       dC4B(
    T_R=0.01,
    K_P=40,
    K_I=14,
    K_D=15,
    T_D=0.01,
    V_RMAX=10.9,
    V_RMIN=0,
    K_A=0.15,
    T_A=0.01,
    K_E=1,
    T_E=1,
    K_F=0,
    E_1=1.5,
    S_EE_1=0.03,
    E_2=3,
    S_EE_2=1.2,
    UEL=1,
    OEL=1) annotation (Placement(transformation(
        extent={{-20,-18},{20,18}},
        rotation=180,
        origin={-74,-56})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-28,-72},{-38,-62}})));
equation
  connect(gENROU.p, GEN1.p)
    annotation (Line(points={{-58,0},{-30,0}}, color={0,0,255}));
  connect(gENROU.PMECH0,gENROU. PMECH) annotation (Line(points={{-56.5,8},{-52,8},
          {-52,26},{-96,26},{-96,9.6},{-91,9.6}},color={0,0,127}));
  connect(dC4B.EFD,gENROU. EFD) annotation (Line(points={{-85,-58},{-96,-58},{-96,
          -9.6},{-91,-9.6}},  color={0,0,127}));
  connect(gENROU.XADIFD, dC4B.XADIFD) annotation (Line(points={{-56.5,-14.4},{-54,
          -14.4},{-54,-24},{-82,-24},{-82,-47}}, color={0,0,127}));
  connect(gENROU.EFD0, dC4B.EFD0) annotation (Line(points={{-56.5,-8},{-52,-8},
          {-52,-54},{-63,-54}}, color={0,0,127}));
  connect(const.y, dC4B.VOTHSG) annotation (Line(points={{-38.5,-67},{-46.25,-67},
          {-46.25,-62},{-63,-62}}, color={0,0,127}));
  connect(dC4B.VUEL, dC4B.VOTHSG) annotation (Line(points={{-70,-47},{-62,-47},
          {-62,-32},{-44,-32},{-44,-62},{-63,-62}}, color={0,0,127}));
  connect(dC4B.VOEL, dC4B.VOTHSG) annotation (Line(points={{-74,-47},{-66,-47},
          {-66,-32},{-44,-32},{-44,-62},{-63,-62}}, color={0,0,127}));
  connect(gENROU.ETERM, dC4B.ECOMP) annotation (Line(points={{-56.5,-4.8},{-48,
          -4.8},{-48,-58},{-63,-58}}, color={0,0,127}));
  connect(dC4B.VT, dC4B.ECOMP) annotation (Line(points={{-63,-51},{-48,-51},{
          -48,-58},{-63,-58}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {120,100}})),                                        Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    experiment(
      StopTime=10,
      Interval=0.0001,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"),
    conversion(noneFromVersion=""));
end DC4B;
