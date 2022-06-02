within OpenIPSL.Tests.Controls.PSSE.ES;
model EXST1 "SMIB system to test functionality of EXST1 model"
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
  OpenIPSL.Electrical.Controls.PSSE.ES.EXST1 eXST1(
    V_IMAX=10,
    V_IMIN=-10,
    T_R=0.02,
    T_B=1,
    K_A=80,
    T_A=0.05,
    V_RMAX=8,
    V_RMIN=-3,
    K_C=0.2,
    K_F=0.1,
    T_F=1,
    T_C=0.1)
    annotation (Placement(transformation(extent={{-60,-60},{-80,-40}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-92,10},{-100,10},{-100,28},{-40,28},{-40,10},{-46,10}},
                                                     color={0,0,127}));
  connect(eXST1.EFD, gENROE.EFD) annotation (Line(points={{-81,-50},{-100,-50},{-100,-10},{-92,-10}},
                                                 color={0,0,127}));
  connect(eXST1.ECOMP, gENROE.ETERM) annotation (Line(points={{-59,-50},{-34,-50},{-34,-6},{-46,-6}},
                                            color={0,0,127}));
  connect(zero.y, eXST1.VOEL) annotation (Line(points={{-40.6,-80},{-70,-80},{-70,-61}}, color={0,0,127}));
  connect(eXST1.VOTHSG, eXST1.VOEL) annotation (Line(points={{-59,-46},{-54,-46},{-54,-80},{-70,-80},{-70,-61}},
                                                               color={0,0,127}));
  connect(eXST1.VUEL, eXST1.VOEL) annotation (Line(points={{-66,-61},{-66,-80},{-70,-80},{-70,-61}},
                                                     color={0,0,127}));
  connect(eXST1.XADIFD, gENROE.XADIFD) annotation (Line(points={{-78,-61},{-78,-68},{-42,-68},{-42,-18},{-46,-18}},
                                                 color={0,0,127}));
  connect(eXST1.EFD0, gENROE.EFD0) annotation (Line(points={{-59,-54},{-38,-54},{-38,-10},{-46,-10}},
                                               color={0,0,127}));
  connect(gENROE.p, GEN1.p)
    annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
  annotation (
experiment(StopTime=10));
end EXST1;
