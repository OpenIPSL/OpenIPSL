within OpenIPSL.Examples.Microgrids.IEEEMicrogrid.GeneratorGroups;
model DieselGeneratorUnit
  extends OpenIPSL.Interfaces.Generator(V_b = 400);
  Electrical.Machines.PSSE.GENROE gENROE(
    V_b=400,
    P_0=P_0,
    Q_0=Q_0,
    v_0=v_0,
    angle_0=angle_0,
    M_b(displayUnit="kW") = 100000,
    Tpd0=3.7,
    Tppd0=0.05,
    Tppq0=0.05,
    H=1.07,
    D=0,
    Xd=1.56,
    Xq=1.06,
    Xpd=0.296,
    Xppd=0.177,
    Xppq=0.177,
    Xl=0.052,
    S10=0.12,
    S12=0.4,
    R_a=0.0036,
    Xpq=0.4610,
    Tpq0=0.391)
    annotation (Placement(transformation(extent={{20,-20},{60,20}})));
  Electrical.Controls.PSSE.ES.ESAC1A eSAC1A(
    T_R=0.02,
    T_B=0,
    T_C=0,
    K_A=400,
    T_A=0.02,
    V_AMAX=14.5,
    V_AMIN=-14.5,
    T_E=0.8,
    K_F=0.03,
    T_F=1,
    K_C=0.2,
    K_D=0.38,
    K_E=1.0,
    E_1=4.18,
    E_2=5.6,
    S_EE_1=0.1827,
    S_EE_2=0.255,
    V_RMAX=6.03,
    V_RMIN=-5.43)
    annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=180,
        origin={-66,-16})));
  Modelica.Blocks.Sources.Constant minusInf(k=-Modelica.Constants.inf) annotation (Placement(transformation(extent={{-60,-74},
            {-52,-66}})));
  Modelica.Blocks.Sources.Constant plusInf(k=Modelica.Constants.inf) annotation (Placement(transformation(extent={{-60,-88},
            {-52,-80}})));
  Electrical.Controls.PSSE.TG.DEGOV dEGOV(
    T1=0.01,
    T2=0.02,
    T3=0.2,
    K=40,
    T4=0.25,
    T5=0.009,
    T6=0.0384,
    TD=0.024,
    TMAX=1.1,
    TMIN=0) annotation (Placement(transformation(extent={{-20,2},{0,22}})));
equation
  connect(gENROE.p, pwPin)
    annotation (Line(points={{60,0},{110,0}}, color={0,0,255}));
  connect(eSAC1A.EFD, gENROE.EFD) annotation (Line(points={{1,-20},{6,-20},{6,
          -12},{16,-12}}, color={0,0,127}));
  connect(zero.y, eSAC1A.VOTHSG)
    annotation (Line(points={{-59.4,-16},{-21,-16}}, color={0,0,127}));
  connect(minusInf.y, eSAC1A.VUEL) annotation (Line(points={{-51.6,-70},{-14,
          -70},{-14,-31}}, color={0,0,127}));
  connect(plusInf.y, eSAC1A.VOEL) annotation (Line(points={{-51.6,-84},{-10,-84},
          {-10,-31}}, color={0,0,127}));
  connect(eSAC1A.XADIFD, gENROE.XADIFD) annotation (Line(points={{-2,-31},{-2,
          -40},{70,-40},{70,-18},{62,-18}}, color={0,0,127}));
  connect(eSAC1A.EFD0, gENROE.EFD0) annotation (Line(points={{-21,-24},{-26,-24},
          {-26,-44},{74,-44},{74,-10},{62,-10}}, color={0,0,127}));
  connect(eSAC1A.ECOMP, gENROE.ETERM) annotation (Line(points={{-21,-20},{-30,
          -20},{-30,-48},{78,-48},{78,-6},{62,-6}}, color={0,0,127}));
  connect(dEGOV.PMECH, gENROE.PMECH)
    annotation (Line(points={{1,12},{16,12}}, color={0,0,127}));
  connect(gENROE.SPEED, dEGOV.SPEED) annotation (Line(points={{62,14},{70,14},{
          70,28},{-24,28},{-24,18},{-18,18}}, color={0,0,127}));
  connect(gENROE.PMECH0, dEGOV.PMECH0) annotation (Line(points={{62,10},{74,10},
          {74,32},{-28,32},{-28,6},{-18,6}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DieselGeneratorUnit;
