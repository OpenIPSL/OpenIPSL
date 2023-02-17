within OpenIPSL.Tests.Controls.PSSE.PSS;
model PSS2B "SMIB system to test functionality of PSS2B model"
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
    v_0=1) annotation (Placement(transformation(extent={{-84,20},{-48,58}})));
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
    annotation (Placement(transformation(extent={{-54,-66},{-84,-36}})));
  Modelica.Blocks.Sources.Constant minusInf(k=-Modelica.Constants.inf) annotation (Placement(transformation(extent={{-96,-96},{-84,-84}})));
  Modelica.Blocks.Sources.Constant plusInf(k=Modelica.Constants.inf) annotation (Placement(transformation(extent={{-44,-96},{-56,-84}})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.PSS2B pSS2B(
    T_w1=2,
    T_w2=2,
    T_6=0,
    T_w3=2,
    T_w4=0,
    T_7=2,
    K_S2=0.1564,
    K_S3=1,
    T_8=0,
    T_9=0,
    K_S1=10,
    T_1=0.25,
    T_2=0.03,
    T_3=0.15,
    T_4=0.015,
    T_10=0,
    T_11=0,
    V_S1MAX=999,
    V_S1MIN=-999,
    V_S2MAX=999,
    V_S2MIN=-999,
    V_STMAX=0.1,
    V_STMIN=-0.1,
    M=0,
    N=0) annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-87.6,50.4},{
          -94,50.4},{-94,64},{-36,64},{-36,48.5},{-46.2,48.5}},
                                                     color={0,0,127}));
  connect(eSST1A.ECOMP, gENROE.ETERM) annotation (Line(points={{-52.5,-51},{-38,-51},{-38,33.3},{-46.2,33.3}},
                                            color={0,0,127}));
  connect(minusInf.y, eSST1A.VUEL2) annotation (Line(points={{-83.4,-90},{-73.515,-90},{-73.515,-67.485}}, color={0,0,127}));
  connect(eSST1A.VUEL, zero.y) annotation (Line(points={{-63,-67.5},{-63,-78},{-36.6,-78}}, color={0,0,127}));
  connect(eSST1A.VUEL3, eSST1A.VUEL2) annotation (Line(points={{-76.7775,-67.4925},{-76.7775,-90},{-73.515,-90},{-73.515,-67.485}},
                                                              color={0,0,127}));
  connect(plusInf.y, eSST1A.VOEL) annotation (Line(points={{-56.6,-90},{-69,-90},{-69,-67.5}}, color={0,0,127}));
  connect(eSST1A.EFD, gENROE.EFD) annotation (Line(points={{-85.5,-51},{-94,-51},
          {-94,27.6},{-87.6,27.6}},         color={0,0,127}));
  connect(eSST1A.EFD0, gENROE.EFD0) annotation (Line(points={{-52.5,-57},{-40,-57},{-40,29.5},{-46.2,29.5}},
                                          color={0,0,127}));
  connect(eSST1A.VOTHSG, zero.y) annotation (Line(points={{-52.5,-45},{-48,-45},{-48,-78},{-36.6,-78}}, color={0,0,127}));
  connect(gENROE.p, GEN1.p)
    annotation (Line(points={{-48,39},{-34,39},{-34,0},{-30,0}},
                                                       color={0,0,255}));
  connect(gENROE.SPEED, pSS2B.V_S1) annotation (Line(points={{-46.2,52.3},{-38,52.3},{-38,62},{-98,62},{-98,-6},{-81,-6}},
                                                    color={0,0,127}));
  connect(gENROE.PELEC, pSS2B.V_S2) annotation (Line(points={{-46.2,44.7},{-34,44.7},{-34,66},{-100,66},{-100,-14},{-81,-14}},
                                                  color={0,0,127}));
  connect(pSS2B.VOTHSG, eSST1A.VOTHSG2) annotation (Line(points={{-59,-10},{-48,-10},{-48,-39},{-52.5,-39}},
                                                       color={0,0,127}));
  connect(gENROE.XADIFD, eSST1A.XADIFD) annotation (Line(points={{-46.2,21.9},{-42,21.9},{-42,-76},{-81,-76},{-81,-67.5}}, color={0,0,127}));
  connect(eSST1A.VT, gENROE.ETERM) annotation (Line(points={{-52.5375,-62.7375},{-38,-62.7375},{-38,33.3},{-46.2,33.3}}, color={0,0,127}));
  annotation (
experiment(StopTime=10));
end PSS2B;
