within OpenIPSL.Examples.Microgrids.UniversityCampuses.GeneratorGroups;
model SteamTurbineUnit
    extends OpenIPSL.Interfaces.Generator(V_b = 13800);
  Electrical.Machines.PSSE.GENROE gENROE(
    P_0=P_0,
    Q_0=Q_0,
    v_0=v_0,
    angle_0=angle_0,
    M_b=4475000,
    Tpd0=4.610,
    Tppd0=0.054,
    Tppq0=0.107,
    H=125.40/25.00,
    D=2.000,
    Xd=1.850,
    Xq=1.850,
    Xpd=0.232,
    Xppd=0.120,
    Xppq=0.120,
    Xl=0.134,
    S10=0.279,
    S12=0.886,
    R_a=0.0014,
    Xpq=0.715,
    Tpq0=1.50) annotation (Placement(transformation(extent={{20,-20},{60,20}})));
  Electrical.Controls.PSSE.TG.IEESGO iEESGO(
    T_1=0,
    T_2=0.000,
    T_3=0.000,
    T_4=0.025,
    T_5=0.000,
    T_6=0.025,
    K_1=0.050,
    K_2=1.000,
    K_3=0.025,
    P_MAX=1,
    P_MIN=0)
    annotation (Placement(transformation(extent={{-20,2},{0,22}}, rotation=0)));
  Electrical.Controls.PSSE.ES.ESDC1A eSDC1A(
    T_R=0.000,
    K_A=120,
    T_A=0.050,
    T_B=0,
    T_C=0,
    V_RMAX=1.200,
    V_RMIN=-1.200,
    K_E=1.000,
    T_E=0.5,
    K_F=0.02,
    T_F1=0.461,
    E_1=0,
    E_2=7.3,
    S_EE_1=0.5,
    S_EE_2=0.860)
    annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=180,
        origin={-66,-16})));
equation
  connect(gENROE.p, pwPin)
    annotation (Line(points={{60,0},{110,0}}, color={0,0,255}));
  connect(iEESGO.PMECH, gENROE.PMECH)
    annotation (Line(points={{1,12},{16,12}}, color={0,0,127}));
  connect(eSDC1A.EFD, gENROE.EFD) annotation (Line(points={{1,-20},{6,-20},{6,-12},
          {16,-12}}, color={0,0,127}));
  connect(iEESGO.SPEED, gENROE.SPEED) annotation (Line(points={{-18,18},{-26,18},
          {-26,30},{68,30},{68,14},{62,14}}, color={0,0,127}));
  connect(iEESGO.PMECH0, gENROE.PMECH0) annotation (Line(points={{-18,6},{-34,6},
          {-34,36},{74,36},{74,10},{62,10}}, color={0,0,127}));
  connect(zero.y, eSDC1A.VOTHSG)
    annotation (Line(points={{-59.4,-16},{-21,-16}}, color={0,0,127}));
  connect(gENROE.XADIFD, eSDC1A.XADIFD) annotation (Line(points={{62,-18},{68,-18},
          {68,-36},{-2,-36},{-2,-31}}, color={0,0,127}));
  connect(gENROE.EFD0, eSDC1A.EFD0) annotation (Line(points={{62,-10},{74,-10},{
          74,-42},{-28,-42},{-28,-24},{-21,-24}}, color={0,0,127}));
  connect(gENROE.ETERM, eSDC1A.ECOMP) annotation (Line(points={{62,-6},{80,-6},{
          80,-48},{-34,-48},{-34,-20},{-21,-20}}, color={0,0,127}));
  connect(eSDC1A.VUEL, eSDC1A.VOTHSG) annotation (Line(points={{-14,-31},{-14,-34},
          {-48,-34},{-48,-16},{-21,-16}}, color={0,0,127}));
  connect(eSDC1A.VOEL, eSDC1A.VOTHSG) annotation (Line(points={{-10,-31},{-10,-38},
          {-48,-38},{-48,-16},{-21,-16}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SteamTurbineUnit;
