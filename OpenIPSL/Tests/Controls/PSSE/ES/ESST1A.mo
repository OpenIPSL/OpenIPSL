within OpenIPSL.Tests.Controls.PSSE.ES;
model ESST1A "SMIB system to test functionality of ESST1A model"
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
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(extent={{-16,-48},{-24,-40}})));
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
    annotation (Placement(transformation(extent={{-50,-72},{-90,-32}})));
  Modelica.Blocks.Sources.Constant minusInf(k=-Modelica.Constants.inf) annotation (Placement(transformation(extent={{-32,-100},{-40,-92}})));
  Modelica.Blocks.Sources.Constant plusInf(k=Modelica.Constants.inf) annotation (Placement(transformation(extent={{-20,-92},{-28,-84}})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-92,10},{-100,10},{-100,30},{-40,30},{-40,10},{-46,10}},
                                                     color={0,0,127}));
  connect(minusInf.y, eSST1A.VUEL2) annotation (Line(points={{-40.4,-96},{-76.02,-96},{-76.02,-73.98}}, color={0,0,127}));
  connect(plusInf.y, eSST1A.VOEL) annotation (Line(points={{-28.4,-88},{-70,-88},{-70,-74}}, color={0,0,127}));
  connect(eSST1A.EFD, gENROE.EFD) annotation (Line(points={{-92,-52},{-100,-52},{-100,-10},{-92,-10}},
                                            color={0,0,127}));
  connect(gENROE.ETERM, eSST1A.ECOMP) annotation (Line(points={{-46,-6},{-34,-6},{-34,-52},{-48,-52}},
                                          color={0,0,127}));
  connect(eSST1A.VT, eSST1A.ECOMP) annotation (Line(points={{-48.05,-67.65},{-34,-67.65},{-34,-52},{-48,-52}},
                                                         color={0,0,127}));
  connect(eSST1A.EFD0, gENROE.EFD0) annotation (Line(points={{-48,-60},{-38,-60},{-38,-10},{-46,-10}},
                                          color={0,0,127}));
  connect(eSST1A.XADIFD, gENROE.XADIFD) annotation (Line(points={{-86,-74},{-86,-80},{-42,-80},{-42,-18},{-46,-18}},
                                                 color={0,0,127}));
  connect(gENROE.p, GEN1.p)
    annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
  connect(eSST1A.VOTHSG2, zero.y) annotation (Line(points={{-48,-36},{-30,-36},{-30,-44},{-24.4,-44}}, color={0,0,127}));
  connect(eSST1A.VOTHSG, zero.y) annotation (Line(points={{-48,-44},{-24.4,-44}}, color={0,0,127}));
  connect(eSST1A.VUEL, zero.y) annotation (Line(points={{-62,-74},{-62,-84},{-30,-84},{-30,-44},{-24.4,-44}}, color={0,0,127}));
  connect(minusInf.y, eSST1A.VUEL3) annotation (Line(points={{-40.4,-96},{-80.37,-96},{-80.37,-73.99}}, color={0,0,127}));
  annotation (
experiment(StopTime=10));
end ESST1A;
