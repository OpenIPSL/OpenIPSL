within OpenIPSL.Examples.Tutorial.Example_4.BaseModels.GeneratingUnits;
model GeneratorTurbGovAVRPSS
  "Machine with Turbine, Governor, Excitation System and PSS"
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
    Tpq0=0.9) annotation (Placement(transformation(extent={{20,-30},{80,30}})));
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
    annotation (Placement(transformation(extent={{-70,46},{-30,6}})));
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
    annotation (Placement(transformation(extent={{-28,-70},{-68,-30}})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.PSS2A pSS2A(
    T_w1=5,
    T_w2=5,
    T_6=0,
    T_w3=5,
    T_w4=5,
    T_7=5,
    K_S2=0.758,
    K_S3=1,
    T_8=0.12,
    T_9=0.1,
    K_S1=2,
    T_1=0.47,
    T_2=0.07,
    T_3=0.47,
    T_4=0.07,
    V_STMAX=0.1,
    V_STMIN=-0.1)
    annotation (Placement(transformation(extent={{60,40},{20,80}})));
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(extent={{12,-86},{0,-74}})));
  Modelica.Blocks.Sources.Constant negInf(k=-Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-84,-94},{-74,-84}})));
  Modelica.Blocks.Sources.Constant posInf(k=Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-34,-94},{-44,-84}})));
equation
  connect(eSST1A1.EFD, gENROE.EFD) annotation (Line(points={{-70,-50},{-90,-50},{-90,-18},{14,-18}},
                                                       color={102,44,145}));
  connect(pSS2A.VOTHSG, eSST1A1.VOTHSG) annotation (Line(points={{18,60},{0,60},{0,-42},{-26,-42}},
                                     color={238,46,47}));
  connect(gENROE.SPEED, iEEEG1_1.SPEED_HP) annotation (Line(points={{83,21},{94,21},{94,90},{-90,90},{-90,26},{-66,26}},
        color={0,140,72}));
  connect(gENROE.ETERM, eSST1A1.VT) annotation (Line(points={{83,-9},{98,-9},{98,-66},{-26.05,-66},{-26.05,-65.65}},
                                                                color={102,44,
          145}));
  connect(gENROE.EFD0, eSST1A1.EFD0) annotation (Line(points={{83,-15},{94,-15},{94,-58},{-26,-58}},
                                color={102,44,145}));
  connect(zero.y, eSST1A1.VUEL) annotation (Line(points={{-0.6,-80},{-40,-80},{-40,-72}}, color={0,0,0}));
  connect(gENROE.XADIFD, eSST1A1.XADIFD) annotation (Line(points={{83,-27},{90,-27},{90,-98},{-64,-98},{-64,-72}},
                                                       color={0,0,127}));
  connect(gENROE.PELEC, pSS2A.V_S2) annotation (Line(points={{83,9},{90,9},{90,52},{62,52}},
                                        color={238,46,47}));
  connect(negInf.y, eSST1A1.VUEL2) annotation (Line(points={{-73.5,-89},{-54.02,-89},{-54.02,-71.98}},
                             color={0,0,0}));
  connect(posInf.y, eSST1A1.VOEL) annotation (Line(points={{-44.5,-89},{-48,-89},{-48,-72}},
                       color={0,0,0}));
  connect(iEEEG1_1.PMECH_HP, gENROE.PMECH) annotation (Line(points={{-28,18},{14,18}},
                                                   color={0,140,72}));
  connect(gENROE.p, pwPin) annotation (Line(points={{80,0},{110,0}},
               color={0,0,255}));
  connect(eSST1A1.VUEL3, negInf.y) annotation (Line(points={{-58.37,-71.99},{-58.37,-89},{-73.5,-89}}, color={0,0,127}));
  connect(eSST1A1.VOTHSG2, zero.y) annotation (Line(points={{-26,-34},{-16,-34},{-16,-80},{-0.6,-80}}, color={0,0,127}));
  connect(eSST1A1.ECOMP, gENROE.ETERM) annotation (Line(points={{-26,-50},{-10,-50},{-10,-66},{98,-66},{98,-9},{83,-9}}, color={0,0,127}));
  connect(pSS2A.V_S1, gENROE.SPEED) annotation (Line(points={{62,68},{94,68},{94,21},{83,21}}, color={0,140,72}));
end GeneratorTurbGovAVRPSS;
