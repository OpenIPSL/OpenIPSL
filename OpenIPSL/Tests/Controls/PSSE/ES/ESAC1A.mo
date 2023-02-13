within OpenIPSL.Tests.Controls.PSSE.ES;
model ESAC1A "SMIB system to test functionality of ESAC1A model"
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
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(extent={{-14,-52},{-26,-40}})));
  Modelica.Blocks.Sources.Constant minusInf(k=-Modelica.Constants.inf) annotation (Placement(transformation(extent={{-32,-78},{-40,-70}})));
  Modelica.Blocks.Sources.Constant plusInf(k=Modelica.Constants.inf) annotation (Placement(transformation(extent={{-32,-92},{-40,-84}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.ESAC1A eSAC1A(
    T_R=0.04,
    T_B=2,
    T_C=10,
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
    V_RMAX=3,
    V_RMIN=-3)
    annotation (Placement(transformation(extent={{-60,-60},{-80,-40}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-92,10},{-100,10},{-100,30},{-40,30},{-40,10},{-46,10}},
                                                     color={0,0,127}));
  connect(eSAC1A.VOTHSG, zero.y) annotation (Line(points={{-59,-46},{-26.6,-46}}, color={0,0,127}));
  connect(gENROE.ETERM, eSAC1A.ECOMP) annotation (Line(points={{-46,-6},{-34,-6},{-34,-50},{-59,-50}},
                                          color={0,0,127}));
  connect(eSAC1A.EFD0, gENROE.EFD0) annotation (Line(points={{-59,-54},{-38,-54},{-38,-10},{-46,-10}},
                                               color={0,0,127}));
  connect(gENROE.XADIFD, eSAC1A.XADIFD) annotation (Line(points={{-46,-18},{-42,-18},{-42,-66},{-78,-66},{-78,-61}},
                                                    color={0,0,127}));
  connect(eSAC1A.EFD, gENROE.EFD) annotation (Line(points={{-81,-50},{-100,-50},{-100,-10},{-92,-10}},
                                                 color={0,0,127}));
  connect(plusInf.y, eSAC1A.VOEL) annotation (Line(points={{-40.4,-88},{-70,-88},{-70,-61}}, color={0,0,127}));
  connect(gENROE.p, GEN1.p)
    annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
  connect(minusInf.y, eSAC1A.VUEL) annotation (Line(points={{-40.4,-74},{-66,-74},{-66,-61}}, color={0,0,127}));
  annotation (
experiment(StopTime=10));
end ESAC1A;
