within OpenIPSL.Tests.Controls.PSSE.TG;
model TGOV1 "SMIB system to test functionality of TGOV1 model"
  extends OpenIPSL.Tests.BaseClasses.SMIB;
  OpenIPSL.Electrical.Machines.PSSE.GENROE gENROE(
    Tpd0=5,
    Tppd0=0.07,
    Tpq0=0.9,
    Tppq0=0.09,
    H=4.28,
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
    M_b=100000000,
    P_0=40000000,
    Q_0=5416582,
    v_0=1) annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.TGOV1 tGOV1(
    R=0.04,
    D_t=0,
    T_1=0.4,
    T_2=2,
    T_3=6,
    V_MAX=0.86,
    V_MIN=0.3)
    annotation (Placement(transformation(extent={{-60,60},{-80,40}})));
equation
  connect(gENROE.EFD, gENROE.EFD0) annotation (Line(points={{-92,-10},{-100,-10},{-100,-32},{-40,-32},{-40,-10},{-46,-10}},
                                                     color={0,0,127}));
  connect(tGOV1.SPEED, gENROE.SPEED) annotation (Line(points={{-62,44},{-42,44},{-42,14},{-46,14}},
                                  color={0,0,127}));
  connect(tGOV1.PMECH0, gENROE.PMECH0) annotation (Line(points={{-62,56},{-38,56},{-38,10},{-46,10}},
                                  color={0,0,127}));
  connect(tGOV1.PMECH, gENROE.PMECH) annotation (Line(points={{-81,50.2},{-100,50.2},{-100,10},{-92,10}},
                                    color={0,0,127}));
  connect(gENROE.p, GEN1.p)
    annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
  annotation (
experiment(StopTime=10));
end TGOV1;
