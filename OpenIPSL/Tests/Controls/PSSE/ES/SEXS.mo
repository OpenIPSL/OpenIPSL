within OpenIPSL.Tests.Controls.PSSE.ES;
model SEXS "SMIB system to test functionality of SEXS model"
  extends OpenIPSL.Tests.BaseClasses.SMIB;
  Modelica.Blocks.Sources.Constant const2(k=0)
    annotation (Placement(transformation(extent={{-110,166},{-94,182}})));
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
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
  OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
    T_AT_B=0.1,
    T_B=1,
    K=100,
    T_E=0.1,
    E_MIN=-10,
    E_MAX=10)
    annotation (Placement(transformation(extent={{-60,-60},{-80,-40}})));
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(extent={{6,-6},{-6,6}}, origin={-34,-80})));
equation
  connect(gENROU.PMECH, gENROU.PMECH0) annotation (Line(points={{-92,10},{-100,10},{-100,30},{-40,30},{-40,10},{-46,10}},
                                                     color={0,0,127}));
  connect(gENROU.EFD0, sEXS.EFD0) annotation (Line(points={{-46,-10},{-38,-10},{-38,-54},{-59,-54}},
                                         color={0,0,127}));
  connect(gENROU.ETERM, sEXS.ECOMP) annotation (Line(points={{-46,-6},{-34,-6},{-34,-50},{-59,-50}},
                                         color={0,0,127}));
  connect(sEXS.VOEL, zero.y) annotation (Line(points={{-70,-61},{-70,-80},{-40.6,-80}}, color={0,0,127}));
  connect(sEXS.VOTHSG, zero.y) annotation (Line(points={{-59,-46},{-54,-46},{-54,-80},{-40.6,-80}}, color={0,0,127}));
  connect(sEXS.VUEL, zero.y) annotation (Line(points={{-66,-61},{-66,-80},{-40.6,-80}}, color={0,0,127}));
  connect(sEXS.EFD, gENROU.EFD) annotation (Line(points={{-81,-50},{-100,-50},{-100,-10},{-92,-10}},
                                            color={0,0,127}));
  connect(gENROU.p, GEN1.p)
    annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
  connect(gENROU.XADIFD, sEXS.XADIFD) annotation (Line(points={{-46,-18},{-42,-18},{-42,-68},{-78,-68},{-78,-61}}, color={0,0,127}));
  annotation (
    experiment(StopTime=10));
end SEXS;
