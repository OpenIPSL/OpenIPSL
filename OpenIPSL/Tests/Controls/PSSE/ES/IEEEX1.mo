within OpenIPSL.Tests.Controls.PSSE.ES;
model IEEEX1 "SMIB system to test functionality of IEEEX1 model"
  extends OpenIPSL.Tests.BaseClasses.SMIB;
  OpenIPSL.Electrical.Machines.PSSE.GENROE gENROE(
    Tpd0=5,
    Tppd0=0.07,
    Tpq0=0.9,
    Tppq0=0.09,
    H=4.28,
    D=0,
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xpq=0.6,
    Xppd=0.2,
    Xl=0.12,
    S10=0.11,
    S12=0.39,
    angle_0=0.070492225331847,
    Xppq=0.2,
    M_b=100000000,
    P_0=40000000,
    Q_0=5416582,
    v_0=1) annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(extent={{-28,-86},{-40,-74}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.IEEEX1 iEEEX1(
    T_R=0.04,
    K_A=75,
    T_A=0.05,
    T_B=1,
    T_C=1,
    V_RMAX=3.9,
    V_RMIN=-3.9,
    T_E=0.5,
    K_F=0.07,
    T_F=1,
    E_1=2.47,
    S_EE_1=0.035,
    E_2=4.5,
    S_EE_2=0.47,
    K_E=0) annotation (Placement(transformation(extent={{-60,-60},{-80,-40}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-92,10},{-100,10},{-100,30},{-40,30},{-40,10},{-46,10}},
                                                     color={0,0,127}));
  connect(iEEEX1.EFD, gENROE.EFD) annotation (Line(points={{-81,-50},{-100,-50},{-100,-10},{-92,-10}},
                                                                       color={0,
          0,127}));
  connect(iEEEX1.VOTHSG, zero.y) annotation (Line(points={{-59,-46},{-54.1116,-46},{-54.1116,-80},{-40.6,-80}}, color={0,0,127}));
  connect(iEEEX1.EFD0, gENROE.EFD0) annotation (Line(points={{-59,-54},{-38,-54},{-38,-10},{-46,-10}},
                                              color={0,0,127}));
  connect(iEEEX1.ECOMP, gENROE.ETERM) annotation (Line(points={{-59,-50},{-34,-50},{-34,-6},{-46,-6}},
                                             color={0,0,127}));
  connect(iEEEX1.VOEL, zero.y) annotation (Line(points={{-70,-61},{-70,-80},{-40.6,-80}}, color={0,0,127}));
  connect(iEEEX1.VUEL, zero.y) annotation (Line(points={{-66,-61},{-66,-80},{-40.6,-80}}, color={0,0,127}));
  connect(gENROE.p, GEN1.p)
    annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
  connect(gENROE.XADIFD, iEEEX1.XADIFD) annotation (Line(points={{-46,-18},{-42,-18},{-42,-66},{-78,-66},{-78,-61}}, color={0,0,127}));
  annotation (
experiment(StopTime=10));
end IEEEX1;
