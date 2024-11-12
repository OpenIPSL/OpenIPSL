within OpenIPSL.Tests.Controls.PSSE.ES;
model DC4B "SMIB system to test functionality of exciter DC4B"
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
  Electrical.Controls.PSSE.ES.DC4B dC4B(
    T_R=0.01,
    K_PR=40,
    K_IR=14,
    K_DR=15,
    T_DR=0.01,
    V_RMAX=10.9,
    V_RMIN=0,
    K_A=0.15,
    K_E=1,
    T_E=1,
    K_F=0,
    E_1=1.5,
    S_EE_1=0.03,
    E_2=3,
    S_EE_2=1.2,
    UEL=1,
    OEL=1) annotation (Placement(transformation(
        extent={{-13,13},{13,-13}},
        rotation=180,
        origin={-73,-51})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-30,-76},{-42,-64}})));
equation
  connect(gENROU.p, GEN1.p)
    annotation (Line(points={{-58,0},{-30,0}}, color={0,0,255}));
  connect(gENROU.PMECH0,gENROU. PMECH) annotation (Line(points={{-56.5,8},{-52,8},
          {-52,26},{-96,26},{-96,9.6},{-91,9.6}},color={0,0,127}));
  connect(dC4B.EFD, gENROU.EFD) annotation (Line(points={{-87.3,-51},{-96,-51},
          {-96,-9.6},{-91,-9.6}}, color={0,0,127}));
  connect(gENROU.XADIFD, dC4B.XADIFD) annotation (Line(points={{-56.5,-14.4},{-54,
          -14.4},{-54,-74},{-83.4,-74},{-83.4,-65.3}}, color={0,0,127}));
  connect(const.y, dC4B.VOTHSG) annotation (Line(points={{-42.6,-70},{-50,-70},
          {-50,-45.8},{-58.7,-45.8}}, color={0,0,127}));
  connect(dC4B.VUEL, dC4B.VOTHSG) annotation (Line(points={{-67.8,-65.3},{-67.8,
          -72},{-50,-72},{-50,-45.8},{-58.7,-45.8}}, color={0,0,127}));
  connect(dC4B.VOEL, dC4B.VOTHSG) annotation (Line(points={{-73,-65.3},{-73,-72},
          {-50,-72},{-50,-45.8},{-58.7,-45.8}}, color={0,0,127}));
  connect(gENROU.ETERM, dC4B.ECOMP) annotation (Line(points={{-56.5,-4.8},{-46,
          -4.8},{-46,-51},{-58.7,-51}}, color={0,0,127}));
  connect(dC4B.VT, gENROU.ETERM) annotation (Line(points={{-58.7,-60.1},{-52,-60.1},
          {-52,-60},{-46,-60},{-46,-4.8},{-56.5,-4.8}}, color={0,0,127}));
  connect(gENROU.EFD0, dC4B.EFD0) annotation (Line(points={{-56.5,-8},{-42,-8},
          {-42,-56.2},{-58.7,-56.2}}, color={0,0,127}));
  annotation ( experiment(
      StopTime=10,
      Interval=0.0001,
      Tolerance=1e-05));
end DC4B;
