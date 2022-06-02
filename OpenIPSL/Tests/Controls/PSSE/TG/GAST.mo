within OpenIPSL.Tests.Controls.PSSE.TG;
model GAST "SMIB system to test functionality of GAST model"
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
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(extent={{-28,-86},{-40,-74}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.IEEET1 iEEET1(
    T_R=0.06,
    K_A=200,
    T_A=0.001,
    T_E=0.55,
    K_F=0.06,
    E_1=2.85,
    S_EE_1=0.3,
    E_2=3.8,
    S_EE_2=0.6,
    V_RMAX=2,
    V_RMIN=-2,
    K_E=0.1)
    annotation (Placement(transformation(extent={{-60,-60},{-80,-40}})));
  Electrical.Controls.PSSE.TG.GAST gAST(
    R=0.05,
    T_1=0.4,
    T_2=0.1,
    T_3=3.0,
    AT=0.9,
    K_T=2,
    V_MAX=1,
    V_MIN=-0.05,
    D_turb=0) annotation (Placement(transformation(extent={{-60,60},{-80,40}})));
equation
  connect(iEEET1.EFD, gENROU.EFD) annotation (Line(points={{-81,-50},{-100,-50},{-100,-10},{-92,-10}},
                                                 color={0,0,127}));
  connect(iEEET1.ECOMP, gENROU.ETERM) annotation (Line(points={{-59,-50},{-34,-50},{-34,-6},{-46,-6}},
                                             color={0,0,127}));
  connect(iEEET1.EFD0, gENROU.EFD0) annotation (Line(points={{-59,-54},{-38,-54},{-38,-10},{-46,-10}},
                                              color={0,0,127}));
  connect(iEEET1.VOTHSG, zero.y) annotation (Line(points={{-59,-46},{-53.3333,-46},{-53.3333,-80},{-40.6,-80}}, color={0,0,127}));
  connect(iEEET1.VOEL, zero.y) annotation (Line(points={{-70,-61},{-70,-80},{-40.6,-80}}, color={0,0,127}));
  connect(iEEET1.VUEL, zero.y) annotation (Line(points={{-66,-61},{-66,-80},{-40.6,-80}}, color={0,0,127}));
  connect(gENROU.p, GEN1.p) annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
  connect(gENROU.XADIFD, iEEET1.XADIFD) annotation (Line(points={{-46,-18},{-42,-18},{-42,-68},{-78,-68},{-78,-61}},
                                              color={0,0,127}));
  connect(gENROU.SPEED, gAST.SPEED) annotation (Line(points={{-46,14},{-42,14},{-42,44},{-62,44}},
                                                color={0,0,127}));
  connect(gAST.PMECH, gENROU.PMECH) annotation (Line(points={{-81,50.2},{-100,50.2},{-100,10},{-92,10}},
                                  color={0,0,127}));
  connect(gENROU.PMECH0, gAST.PMECH0) annotation (Line(points={{-46,10},{-38,10},{-38,56},{-62,56}},
                                                   color={0,0,127}));
annotation (experiment(StopTime=10));
end GAST;
