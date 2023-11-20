within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusB.GeneratorGroups;
model SteamTurbineUnit
    extends OpenIPSL.Interfaces.Generator(V_b = 13800);
  Electrical.Machines.PSSE.GENROE gENROE(
    P_0=P_0,
    Q_0=Q_0,
    v_0=v_0,
    angle_0=angle_0,
    M_b=4475000,
    Tpd0=7,
    Tppd0=0.03,
    Tppq0=0.05,
    H=3,
    D=0,
    Xd=2.1,
    Xq=2,
    Xpd=0.2,
    Xppd=0.18,
    Xppq=0.18,
    Xl=0.15,
    S10=0.05,
    S12=0.3,
    R_a=0.01,
    Xpq=0.5,
    Tpq0=0.75) annotation (Placement(transformation(extent={{38,-20},{78,20}})));
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=180,
        origin={-22,-16})));
  Electrical.Controls.PSSE.ES.EXST1 eXST1_1(
    V_IMAX=1,
    V_IMIN=-1,
    T_C=1,
    T_B=10,
    K_A=200,
    T_A=0.05,
    V_RMAX=5,
    V_RMIN=-4,
    K_C=0.04,
    K_F=0.02,
    T_F=1) annotation (Placement(transformation(extent={{4,-30},{24,-10}})));
  Electrical.Controls.PSSE.TG.TGOV1 tGOV1_1(
    R=0.05,
    D_t=0,
    T_1=0.49,
    T_2=2.1,
    T_3=7,
    V_MAX=1,
    V_MIN=0) annotation (Placement(transformation(extent={{4,2},{24,22}})));
equation
  connect(gENROE.p, pwPin)
    annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
  connect(eXST1_1.EFD, gENROE.EFD) annotation (Line(points={{25,-20},{28,-20},{
          28,-12},{34,-12}},
                          color={0,0,127}));
  connect(zero.y, eXST1_1.VOTHSG)
    annotation (Line(points={{-15.4,-16},{3,-16}},   color={0,0,127}));
  connect(gENROE.EFD0, eXST1_1.EFD0) annotation (Line(points={{80,-10},{90,-10},
          {90,-40},{-2,-40},{-2,-24},{3,-24}},     color={0,0,127}));
  connect(eXST1_1.ECOMP, gENROE.ETERM) annotation (Line(points={{3,-20},{-6,-20},
          {-6,-44},{94,-44},{94,-6},{80,-6}},       color={0,0,127}));
  connect(eXST1_1.VUEL, eXST1_1.VOTHSG) annotation (Line(points={{10,-31},{10,
          -36},{-10,-36},{-10,-16},{3,-16}},   color={0,0,127}));
  connect(eXST1_1.XADIFD, gENROE.XADIFD) annotation (Line(points={{22,-31},{22,
          -36},{86,-36},{86,-18},{80,-18}}, color={0,0,127}));
  connect(tGOV1_1.PMECH, gENROE.PMECH)
    annotation (Line(points={{25,12},{34,12}},color={0,0,127}));
  connect(tGOV1_1.SPEED, gENROE.SPEED) annotation (Line(points={{6,18},{0,18},{
          0,32},{86,32},{86,14},{80,14}},        color={0,0,127}));
  connect(tGOV1_1.PMECH0, gENROE.PMECH0) annotation (Line(points={{6,6},{-4,6},
          {-4,36},{90,36},{90,10},{80,10}},     color={0,0,127}));
  connect(eXST1_1.VOEL, eXST1_1.VOTHSG) annotation (Line(points={{14,-31},{14,
          -36},{-10,-36},{-10,-16},{3,-16}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SteamTurbineUnit;
