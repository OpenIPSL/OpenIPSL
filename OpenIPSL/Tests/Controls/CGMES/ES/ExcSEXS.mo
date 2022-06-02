within OpenIPSL.Tests.Controls.CGMES.ES;
model ExcSEXS "SMIB system to test functionality of excitation system model ExcSEXS"
  extends OpenIPSL.Tests.BaseClasses.SMIB;
  Modelica.Blocks.Sources.Constant const2(k=0)
    annotation (Placement(transformation(extent={{-110,166},{-94,182}})));
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROE(
    Tpd0=5,
    Tppd0=0.07,
    Tpq0=0.9,
    Tppq0=0.09,
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
    R_a=0,
    Xpp=0.2,
    H=4.28,
    M_b=100000000,
    P_0=40000000,
    Q_0=5416582,
    v_0=1) annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
  Electrical.Controls.CGMES.ES.ExcSEXS sEXS(
    T_AT_B=0.1,
    T_B=1,
    K=100,
    T_E=0.1,
    E_MIN=-10,
    E_MAX=10,
    K_C=0.08,
    EFD_MAX=5,
    EFD_MIN=-5,
    T_C=1) annotation (Placement(transformation(extent={{-56,-64},{-84,-36}})));
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(extent={{4,-4},{-4,4}}, origin={-34,-88})));
equation
  connect(gENROE.PMECH, gENROE.PMECH0) annotation (Line(points={{-92,10},{-100,10},{-100,26},{-38,26},{-38,10},{-46,10}},
                                                     color={0,0,127}));
  connect(gENROE.EFD0, sEXS.EFD0) annotation (Line(points={{-46,-10},{-38,-10},{-38,-55.6},{-54.6,-55.6}},
                                         color={0,0,127}));
  connect(gENROE.ETERM, sEXS.ECOMP) annotation (Line(points={{-46,-6},{-36,-6},{-36,-50},{-54.6,-50}},
                                         color={0,0,127}));
  connect(sEXS.VOEL, zero.y) annotation (Line(points={{-70,-65.4},{-70,-88},{-38.4,-88}}, color={0,0,127}));
  connect(sEXS.VOTHSG, zero.y) annotation (Line(points={{-54.6,-44.4},{-50,-44.4},{-50,-88},{-38.4,-88}}, color={0,0,127}));
  connect(sEXS.VUEL, zero.y) annotation (Line(points={{-64.4,-65.4},{-64,-65.4},{-64,-88},{-38.4,-88}}, color={0,0,127}));
  connect(sEXS.EFD, gENROE.EFD) annotation (Line(points={{-85.4,-50},{-100,-50},{-100,-10},{-92,-10}},
                                            color={0,0,127}));
  connect(gENROE.p, GEN1.p)
    annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
  connect(gENROE.XADIFD, sEXS.XADIFD) annotation (Line(points={{-46,-18},{-40,-18},{-40,-78},{-81.2,-78},{-81.2,-65.4}}, color={0,0,127}));
  annotation (experiment(StopTime=10));
end ExcSEXS;
