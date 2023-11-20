within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusB.GeneratorGroups;
model GasTurbineUnit
  extends OpenIPSL.Interfaces.Generator(V_b = 13800);
  Electrical.Machines.PSSE.GENROE gENROE(
    V_b=13800,
    P_0=P_0,
    Q_0=Q_0,
    v_0=v_0,
    angle_0=angle_0,
    M_b=16667000,
    Tpd0=4.822,
    Tppd0=0.023,
    Tppq0=0.065,
    H=8.75,
    D=2,
    Xd=1.897,
    Xq=1.78,
    Xpd=0.23,
    Xppd=0.156,
    Xppq=0.156,
    Xl=0.123,
    S10=0.12,
    S12=0.4,
    R_a=0.01,
    Xpq=0.4610,
    Tpq0=0.391)
            annotation (Placement(transformation(extent={{38,-20},{78,20}})));
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=180,
        origin={-20,-16})));
  Electrical.Controls.PSSE.ES.EXAC1 eXAC1_1(
    T_R=0,
    T_B=0,
    T_C=0,
    K_A=150,
    T_A=0.02,
    V_RMAX=20,
    V_RMIN=-20,
    T_E=0.5,
    K_F=0.0045,
    T_F=0.1,
    K_C=0.1,
    K_D=1,
    K_E=1,
    E_1=4.20,
    E_2=5.6,
    S_EE_1=0.1827,
    S_EE_2=0.2558)
    annotation (Placement(transformation(extent={{4,-30},{24,-10}})));
  Electrical.Controls.PSSE.TG.GAST gAST
    annotation (Placement(transformation(extent={{4,2},{24,22}})));
equation
  connect(gENROE.p, pwPin)
    annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
  connect(eXAC1_1.EFD, gENROE.EFD) annotation (Line(points={{25,-20},{28,-20},{
          28,-12},{34,-12}},
                          color={0,0,127}));
  connect(zero.y, eXAC1_1.VOTHSG)
    annotation (Line(points={{-13.4,-16},{3,-16}},   color={0,0,127}));
  connect(gENROE.XADIFD, eXAC1_1.XADIFD) annotation (Line(points={{80,-18},{86,
          -18},{86,-38},{22,-38},{22,-31}}, color={0,0,127}));
  connect(gENROE.EFD0, eXAC1_1.EFD0) annotation (Line(points={{80,-10},{90,-10},
          {90,-42},{0,-42},{0,-24},{3,-24}},       color={0,0,127}));
  connect(gENROE.ETERM, eXAC1_1.ECOMP) annotation (Line(points={{80,-6},{94,-6},
          {94,-46},{-4,-46},{-4,-20},{3,-20}},     color={0,0,127}));
  connect(gAST.PMECH, gENROE.PMECH)
    annotation (Line(points={{25,12},{34,12}},color={0,0,127}));
  connect(gAST.SPEED, gENROE.SPEED) annotation (Line(points={{6,18},{0,18},{0,
          32},{86,32},{86,14},{80,14}},      color={0,0,127}));
  connect(gAST.PMECH0, gENROE.PMECH0) annotation (Line(points={{6,6},{-4,6},{-4,
          36},{90,36},{90,10},{80,10}},      color={0,0,127}));
  connect(eXAC1_1.VUEL, eXAC1_1.VOTHSG) annotation (Line(points={{10,-31},{10,
          -36},{-8,-36},{-8,-16},{3,-16}},     color={0,0,127}));
  connect(eXAC1_1.VOEL, eXAC1_1.VOTHSG) annotation (Line(points={{14,-31},{14,
          -36},{-8,-36},{-8,-16},{3,-16}},     color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
                                   Diagram(coordinateSystem(preserveAspectRatio=
           false)));
end GasTurbineUnit;
