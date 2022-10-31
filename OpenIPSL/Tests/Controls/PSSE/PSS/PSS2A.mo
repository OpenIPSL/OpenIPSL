within OpenIPSL.Tests.Controls.PSSE.PSS;
model PSS2A "SMIB system to test functionality of PSS2A model"
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
    v_0=1) annotation (Placement(transformation(extent={{-86,20},{-50,56}})));
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
  Modelica.Blocks.Sources.Constant plusInf(k=Modelica.Constants.inf) annotation (Placement(transformation(extent={{-44,-96},{-56,-84}})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.PSS2A pSS2A(
    T_w2=5,
    T_6=0,
    T_w3=5,
    T_w4=5,
    T_7=5,
    K_S2=0.758,
    K_S3=1,
    T_8=0.12,
    T_9=0.1,
    K_S1=2,
    T_1=0.47,
    T_2=0.07,
    T_3=0.47,
    T_4=0.07,
    V_STMAX=0.1,
    V_STMIN=-0.1,
    M=5,
    N=1,
    T_w1=0)
    annotation (Placement(transformation(extent={{-80,-20},{-60,0}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-89.6,48.8},{
          -96,48.8},{-96,68},{-44,68},{-44,47},{-48.2,47}},
                                                     color={0,0,127}));
  connect(eSST1A.ECOMP, gENROE.ETERM) annotation (Line(points={{-54.5,-53},{-40,-53},{-40,32.6},{-48.2,32.6}},
                                            color={0,0,127}));
  connect(minusInf.y, eSST1A.VUEL2) annotation (Line(points={{-83.4,-90},{-75.515,-90},{-75.515,-69.485}}, color={0,0,127}));
  connect(eSST1A.VUEL, zero.y) annotation (Line(points={{-65,-69.5},{-65,-78},{-36.6,-78}}, color={0,0,127}));
  connect(eSST1A.VUEL3, eSST1A.VUEL2) annotation (Line(points={{-78.7775,-69.4925},{-78.7775,-90},{-75.515,-90},{-75.515,-69.485}},
                                                              color={0,0,127}));
  connect(plusInf.y, eSST1A.VOEL) annotation (Line(points={{-56.6,-90},{-71,-90},{-71,-69.5}}, color={0,0,127}));
  connect(pSS2A.V_S2, gENROE.PELEC) annotation (Line(points={{-81,-14},{-99.7,-14},{-99.7,74},{-40,74},{-40,43.4},{-48.2,43.4}},
                                                 color={0,0,127}));
  connect(pSS2A.V_S1, gENROE.SPEED) annotation (Line(points={{-81,-6},{-98,-6},{-98,72},{-42,72},{-42,50.6},{-48.2,50.6}},
                                                 color={0,0,127}));
  connect(eSST1A.EFD, gENROE.EFD) annotation (Line(points={{-87.5,-53},{-96,-53},
          {-96,27.2},{-89.6,27.2}},         color={0,0,127}));
  connect(eSST1A.VT, gENROE.ETERM) annotation (Line(points={{-54.5375,-64.7375},{-40,-64.7375},{-40,32.6},{-48.2,32.6}},
                                             color={0,0,127}));
  connect(eSST1A.EFD0, gENROE.EFD0) annotation (Line(points={{-54.5,-59},{-38,-59},{-38,29},{-48.2,29}},
                                          color={0,0,127}));
  connect(eSST1A.VOTHSG2, pSS2A.VOTHSG) annotation (Line(points={{-54.5,-41},{-44,-41},{-44,-10},{-59,-10}},
                                          color={0,0,127}));
  connect(eSST1A.VOTHSG, zero.y) annotation (Line(points={{-54.5,-47},{-50,-47},{-50,-78},{-36.6,-78}}, color={0,0,127}));
  connect(gENROE.p, GEN1.p)
    annotation (Line(points={{-50,38},{-34,38},{-34,0},{-30,0}},
                                                       color={0,0,255}));
  connect(gENROE.XADIFD, eSST1A.XADIFD) annotation (Line(points={{-48.2,21.8},{-42,21.8},{-42,-76},{-83,-76},{-83,-69.5}}, color={0,0,127}));
  annotation (
experiment(StopTime=10));
end PSS2A;
