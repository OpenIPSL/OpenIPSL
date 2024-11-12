within OpenIPSL.Tests.Controls.PSSE.ES;
model ESURRY "SMIB system to test functionality of ESURRY model"
  extends OpenIPSL.Tests.BaseClasses.SMIB;
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    Tpd0=6.805,
    Tppd0=0.054,
    Tpq0=0.756,
    Tppq0=0.07,
    H=5.1,
    D=0,
    Xd=1.9117,
    Xq=1.8574,
    Xpd=0.4737,
    Xpq=0.6022,
    Xppd=0.314,
    Xl=0.261,
    S10=0.082,
    S12=0.385,
    angle_0=0.070492225331847,
    Xppq=0.314,
    M_b=1055000000,
    P_0=40000000,
    Q_0=5416582,
    v_0=1)
    annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(extent={{-14,-52},{-26,-40}})));
  Modelica.Blocks.Sources.Constant minusInf(k=0) annotation (Placement(transformation(extent={{-32,-78},{-40,-70}})));
  Modelica.Blocks.Sources.Constant plusInf(k=0) annotation (Placement(transformation(extent={{-32,-92},{-40,-84}})));
  Electrical.Controls.PSSE.ES.ESURRY eSURRY(
    T_1=0.5,
    T_C=0.42,
    T_B=0.7,
    T_D=0.06,
    T_E=1.2,
    K_10=97,
    K_16=1.7786,
    K_D=0.1,
    K_E=0.35,
    E_1=1,
    E_2=6,
    S_EE_1=0.02,
    S_EE_2=0.25,
    V_RMAX=12,
    V_RMIN=-7.5,
    K_C=0.1240,
    K_F=0.7115,
    T_F=2,
    T_A=0.574,
    T_R=0.035)
    annotation (Placement(transformation(extent={{-60,-60},{-80,-40}})));
equation
  connect(gENROU.PMECH,gENROU. PMECH0) annotation (Line(points={{-92,12},{-100,12},
          {-100,30},{-40,30},{-40,10},{-46,10}}, color={0,0,127}));
  connect(eSURRY.VOTHSG, zero.y)
    annotation (Line(points={{-59,-46},{-26.6,-46}}, color={0,0,127}));
  connect(gENROU.ETERM, eSURRY.ECOMP) annotation (Line(points={{-46,-6},{-34,-6},
          {-34,-50},{-59,-50}}, color={0,0,127}));
  connect(eSURRY.EFD0, gENROU.EFD0) annotation (Line(points={{-59,-54},{-38,-54},
          {-38,-10},{-46,-10}}, color={0,0,127}));
  connect(gENROU.XADIFD, eSURRY.XADIFD) annotation (Line(points={{-46,-18},{-42,
          -18},{-42,-66},{-78,-66},{-78,-61}}, color={0,0,127}));
  connect(eSURRY.EFD, gENROU.EFD) annotation (Line(points={{-81,-50},{-100,-50},
          {-100,-12},{-92,-12}}, color={0,0,127}));
  connect(plusInf.y, eSURRY.VOEL) annotation (Line(points={{-40.4,-88},{-70,-88},
          {-70,-61}}, color={0,0,127}));
  connect(gENROU.p, GEN1.p)
    annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
  connect(minusInf.y, eSURRY.VUEL) annotation (Line(points={{-40.4,-74},{-66,-74},
          {-66,-61}}, color={0,0,127}));
  annotation (
experiment(
      StopTime=10,
      Interval=0.001,
      Tolerance=1e-06));
end ESURRY;
