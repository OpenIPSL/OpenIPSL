within OpenIPSL.Examples.Tutorial.Example_4.BaseModels.GeneratingUnits;
model GeneratorTurbGov "Machine with Turbine and Governor"
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
    annotation (Placement(transformation(extent={{-72,-10},{-32,30}})));
equation
  connect(iEEEG1_1.PMECH_HP, gENROE.PMECH) annotation (Line(points={{-30,18},{4,18}},
                                                   color={0,140,72}));
  connect(gENROE.p, pwPin) annotation (Line(points={{70,0},{110,0}},
               color={0,0,255}));
  connect(iEEEG1_1.SPEED_HP, gENROE.SPEED) annotation (Line(points={{-68,10},{-90,10},{-90,50},{88,50},{88,21},{73,21}},
                                                              color={0,0,127}));
  connect(gENROE.EFD0, gENROE.EFD) annotation (Line(points={{73,-15},{92,-15},{92,-40},{-20,-40},{-20,-18},{4,-18}},
                                                     color={0,0,127}));
end GeneratorTurbGov;
