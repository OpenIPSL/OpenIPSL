within OpenIPSL.Tests.Controls.PSSE.ES;
model EXAC2 "SMIB system to test functionality of EXAC2 model"
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
  OpenIPSL.Electrical.Controls.PSSE.ES.EXAC2 eXAC2(
    K_B=2,
    K_H=2,
    K_A=400,
    T_A=0.02,
    V_AMAX=9,
    V_AMIN=-5.34,
    T_E=0.8,
    K_F=0.03,
    T_F=1,
    K_C=0.2,
    K_D=0.48,
    K_E=1,
    E_1=5.25,
    E_2=7,
    S_EE_1=0.03,
    S_EE_2=0.1,
    T_R=0.005,
    T_B=0.005,
    T_C=0.005,
    V_RMAX=4,
    V_RMIN=-4,
    K_L=1,
    V_LR=10)
    annotation (Placement(transformation(extent={{-60,-60},{-80,-40}})));
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={-34,-80})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-92,10},{-100,10},{-100,30},{-40,30},{-40,10},{-46,10}},
                                                     color={0,0,127}));
  connect(gENROE.EFD0, eXAC2.EFD0) annotation (Line(points={{-46,-10},{-38,-10},{-38,-54},{-59,-54}},
                                          color={0,0,127}));
  connect(gENROE.XADIFD, eXAC2.XADIFD) annotation (Line(points={{-46,-18},{-42,-18},{-42,-68},{-78,-68},{-78,-61}},
                                                      color={0,0,127}));
  connect(gENROE.ETERM, eXAC2.ECOMP) annotation (Line(points={{-46,-6},{-34,-6},{-34,-50},{-59,-50}},
                                          color={0,0,127}));
  connect(eXAC2.EFD, gENROE.EFD) annotation (Line(points={{-81,-50},{-100,-50},{-100,-10},{-92,-10}},
                                                 color={0,0,127}));
  connect(gENROE.p, GEN1.p)
    annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
  connect(eXAC2.VUEL, zero.y) annotation (Line(points={{-66,-61},{-66,-80},{-40.6,-80}}, color={0,0,127}));
  connect(eXAC2.VOEL, zero.y) annotation (Line(points={{-70,-61},{-70,-80},{-40.6,-80}}, color={0,0,127}));
  connect(zero.y, eXAC2.VOTHSG) annotation (Line(points={{-40.6,-80},{-54,-80},{-54,-46},{-59,-46}}, color={0,0,127}));
  annotation (
experiment(StopTime=10));
end EXAC2;
