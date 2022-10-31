within OpenIPSL.Tests.Controls.PSSE.PSS;
model IEEEST "SMIB system to test functionality of IEEEST model"
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
    v_0=1) annotation (Placement(transformation(extent={{-88,20},{-48,60}})));
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(extent={{-24,-84},{-36,-72}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.ESST1A eSST1A(
    V_IMAX=0.3,
    V_IMIN=-0.3,
    T_C=2,
    T_B=10,
    T_C1=0.08,
    T_B1=0.083,
    K_A=300,
    V_AMAX=7,
    V_AMIN=-7,
    V_RMAX=5.2,
    V_RMIN=-5.2,
    K_C=0.38,
    K_F=1,
    T_F=1,
    K_LR=1,
    I_LR=0,
    T_A=0.1,
    T_R=0.1)
    annotation (Placement(transformation(extent={{-56,-68},{-86,-38}})));
  Modelica.Blocks.Sources.Constant minusInf(k=-Modelica.Constants.inf) annotation (Placement(transformation(extent={{-96,-96},{-84,-84}})));
  Modelica.Blocks.Sources.Constant plusInf(k=Modelica.Constants.inf) annotation (Placement(transformation(extent={{-46,-96},{-58,-84}})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.IEEEST iEEEST(
    A_1=48.7435,
    A_2=4.7488,
    A_3=0.0,
    A_4=0.0,
    A_5=-85.7761,
    A_6=0.0459,
    T_1=0.7361,
    T_2=1.5868,
    T_3=0.0,
    T_4=0.02,
    T_5=13.8921,
    T_6=0.1057,
    K_S=0.0099,
    L_SMAX=0.1,
    L_SMIN=-0.1,
    V_CU=0.0,
    V_CL=0.0)
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-92,52},{-98,
          52},{-98,68},{-40,68},{-40,50},{-46,50}},  color={0,0,127}));
  connect(eSST1A.ECOMP, gENROE.ETERM) annotation (Line(points={{-54.5,-53},{-38,-53},{-38,34},{-46,34}},
                                            color={0,0,127}));
  connect(minusInf.y, eSST1A.VUEL2) annotation (Line(points={{-83.4,-90},{-75.515,-90},{-75.515,-69.485}}, color={0,0,127}));
  connect(eSST1A.VUEL, zero.y) annotation (Line(points={{-65,-69.5},{-65,-78},{-36.6,-78}}, color={0,0,127}));
  connect(eSST1A.VUEL3, eSST1A.VUEL2) annotation (Line(points={{-78.7775,-69.4925},{-78.7775,-90},{-75.515,-90},{-75.515,-69.485}},
                                                              color={0,0,127}));
  connect(plusInf.y, eSST1A.VOEL) annotation (Line(points={{-58.6,-90},{-71,-90},{-71,-69.5}}, color={0,0,127}));
  connect(eSST1A.EFD, gENROE.EFD) annotation (Line(points={{-87.5,-53},{-98,-53},
          {-98,28},{-92,28}},               color={0,0,127}));
  connect(eSST1A.VT, gENROE.ETERM) annotation (Line(points={{-54.5375,-64.7375},{-38,-64.7375},{-38,34},{-46,34}},
                                             color={0,0,127}));
  connect(eSST1A.EFD0, gENROE.EFD0) annotation (Line(points={{-54.5,-59},{-40,-59},{-40,30},{-46,30}},
                                          color={0,0,127}));
  connect(iEEEST.V_CT, gENROE.ETERM) annotation (Line(points={{-82,-6},{-90,-6},{-90,4},{-38,4},{-38,34},{-46,34}},
                                                        color={0,0,127}));
  connect(iEEEST.V_S, gENROE.PELEC) annotation (Line(points={{-82,-14},{-100,-14},{-100,72},{-36,72},{-36,46},{-46,46}},
                                                      color={0,0,127}));
  connect(eSST1A.VOTHSG2, zero.y) annotation (Line(points={{-54.5,-41},{-50,-41},{-50,-78},{-36.6,-78}}, color={0,0,127}));
  connect(iEEEST.VOTHSG, eSST1A.VOTHSG) annotation (Line(points={{-59,-10},{-46,-10},{-46,-47},{-54.5,-47}},
                                                    color={0,0,127}));
  connect(gENROE.p, GEN1.p)
    annotation (Line(points={{-48,40},{-34,40},{-34,0},{-30,0}},
                                                       color={0,0,255}));
  connect(gENROE.XADIFD, eSST1A.XADIFD) annotation (Line(points={{-46,22},{-42,22},{-42,-76},{-83,-76},{-83,-69.5}}, color={0,0,127}));
  annotation (
experiment(StopTime=10));
end IEEEST;
