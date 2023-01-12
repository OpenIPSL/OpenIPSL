within OpenIPSL.Examples.Tutorial.Example_4.BaseModels.GeneratingUnits;
model GeneratorTurbGovAVR
  "Machine with Turbine, Governor and Excitation System"
  extends OpenIPSL.Interfaces.Generator;
  OpenIPSL.Electrical.Machines.PSSE.GENROE gENROE(
    v_0=v_0,
    Tpd0=5,
    Tppd0=0.07,
    Tppq0=0.09,
    H=4.28,
    D=0 "Speed Damping",
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xppd=0.2,
    Xppq=0.2,
    Xl=0.12,
    V_b=100000,
    M_b=100000000,
    S10=0.11,
    S12=0.39,
    R_a=0,
    angle_0=angle_0,
    P_0(displayUnit="MW") = P_0,
    Q_0=Q_0,
    Xpq=0.6,
    Tpq0=0.9) annotation (Placement(transformation(extent={{10,-30},{70,30}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.IEEEG1 iEEEG1_1(
    P0=0.4,
    K=20,
    T_1=0.15,
    T_2=0,
    T_3=0.2,
    U_o=0.1,
    U_c=-0.1,
    P_MAX=0.903,
    P_MIN=0,
    T_4=0.25,
    K_1=0.25,
    K_2=0,
    T_5=7.5,
    K_3=0.25,
    K_4=0,
    T_6=0.4,
    K_5=0.5)
    annotation (Placement(transformation(extent={{-80,80},{-40,40}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.ESST1A eSST1A1(
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
    annotation (Placement(transformation(extent={{-26,-70},{-86,-10}})));
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(extent={{12,-86},{0,-74}})));
  Modelica.Blocks.Sources.Constant negInf(k=-Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-96,-96},{-84,-84}})));
  Modelica.Blocks.Sources.Constant posInf(k=Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-32,-96},{-44,-84}})));
equation
  connect(eSST1A1.EFD, gENROE.EFD) annotation (Line(points={{-89,-40},{-96,-40},{-96,8},{-10,8},{-10,-18},{4,-18}},
                                                       color={102,44,145}));
  connect(gENROE.SPEED, iEEEG1_1.SPEED_HP) annotation (Line(points={{73,21},{90,21},{90,92},{-92,92},{-92,60},{-76,60}},
        color={0,140,72}));
  connect(gENROE.EFD0, eSST1A1.EFD0) annotation (Line(points={{73,-15},{86,-15},{86,-52},{-23,-52}},
                                color={102,44,145}));
  connect(zero.y, eSST1A1.VUEL) annotation (Line(points={{-0.6,-80},{-44,-80},{-44,-73}}, color={0,0,0}));
  connect(gENROE.XADIFD, eSST1A1.XADIFD) annotation (Line(points={{73,-27},{80,-27},{80,-100},{-80,-100},{-80,-73}},
                                                       color={0,0,127}));
  connect(negInf.y, eSST1A1.VUEL2) annotation (Line(points={{-83.4,-90},{-65.03,-90},{-65.03,-72.97}},
                             color={0,0,0}));
  connect(posInf.y, eSST1A1.VOEL) annotation (Line(points={{-44.6,-90},{-56,-90},{-56,-73}},
                       color={0,0,0}));
  connect(iEEEG1_1.PMECH_HP, gENROE.PMECH) annotation (Line(points={{-38,52},{-20,52},{-20,18},{4,18}},
                                                   color={0,140,72}));
  connect(gENROE.p, pwPin) annotation (Line(points={{70,0},{110,0}},
               color={0,0,255}));
  connect(eSST1A1.VOTHSG, zero.y) annotation (Line(points={{-23,-28},{-14,-28},{-14,-80},{-0.6,-80}}, color={0,0,127}));
  connect(eSST1A1.ECOMP, gENROE.ETERM) annotation (Line(points={{-23,-40},{-8,-40},{-8,-64},{90,-64},{90,-9},{73,-9}}, color={0,0,127}));
  connect(eSST1A1.VOTHSG2, zero.y) annotation (Line(points={{-23,-16},{-14,-16},{-14,-80},{-0.6,-80}}, color={0,0,127}));
  connect(eSST1A1.VUEL3, negInf.y) annotation (Line(points={{-71.555,-72.985},{-71.555,-90},{-83.4,-90}}, color={0,0,127}));
  connect(eSST1A1.VT, gENROE.ETERM) annotation (Line(points={{-23.075,-63.475},{-8,-64},{90,-64},{90,-9},{73,-9}}, color={0,0,127}));
end GeneratorTurbGovAVR;
