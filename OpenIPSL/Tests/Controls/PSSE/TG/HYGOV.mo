within OpenIPSL.Tests.Controls.PSSE.TG;
model HYGOV "SMIB system to test functionality of HYGOV model"
  extends OpenIPSL.Tests.BaseClasses.SMIB;
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Xppd=0.2,
    Xppq=0.2,
    Xl=0.12,
    angle_0=0.07068583470577,
    Tpd0=6.7000,
    Tppd0=0.028,
    Tppq0=0.0358,
    H=4.4100,
    D=0,
    Xd=1.2200,
    Xq=0.76000,
    Xpd=0.29700,
    S10=0.18600,
    S12=0.802,
    M_b=100000000,
    P_0=39999950,
    Q_0=5416571,
    v_0=1) annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    VELM=0.02,
    G_MAX=0.415,
    R=0.05,
    r=0.3,
    T_r=5,
    T_f=0.05,
    T_g=0.5,
    G_MIN=0,
    T_w=1.25,
    A_t=1.2,
    D_turb=0.2,
    q_NL=0.08) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,50})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
    T_B=10,
    K=100,
    T_E=0.05,
    E_MIN=0,
    E_MAX=5,
    r_cr_fd=0,
    C_SWITCH=false,
    T_AT_B=0.1) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-70,-50})));
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={-34,-80})));
equation
  connect(sCRX.VOEL, zero.y) annotation (Line(
      points={{-70,-61},{-69.67,-61},{-69.67,-80},{-40.6,-80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sCRX.VOTHSG, zero.y) annotation (Line(
      points={{-59,-46},{-53.67,-46},{-53.67,-80},{-40.6,-80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(
      points={{-46,-10},{-38,-10},{-38,-54},{-59,-54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{-46,10},{-38,10},{-38,56},{-62,56}},
                                     color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{-46,14},{-42,14},{-42,44},{-62,44}},
                                  color={0,0,127}));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{-81,50.2},{-100,50.2},{-100,10},{-92,10}},
                                      color={0,0,127}));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(points={{-81,-50},{-100,-50},{-100,-10},{-92,-10}},
                                              color={0,0,127}));
  connect(gENSAL.ETERM, sCRX.ECOMP) annotation (Line(points={{-46,-6},{-34,-6},{-34,-50},{-59,-50}},
                                          color={0,0,127}));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(points={{-46,-18},{-42,-18},{-42,-68},{-78,-68},{-78,-61}},
                                              color={0,0,127}));
  connect(gENSAL.p, GEN1.p)
    annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
  connect(sCRX.VUEL, zero.y) annotation (Line(points={{-66,-61},{-66,-80},{-40.6,-80}}, color={0,0,127}));
  annotation (
experiment(StopTime=10));
end HYGOV;
