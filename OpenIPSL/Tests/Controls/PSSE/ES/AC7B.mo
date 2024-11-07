within OpenIPSL.Tests.Controls.PSSE.ES;
model AC7B "SMIB system to test functionality of exciter AC7B"
  extends OpenIPSL.Tests.BaseClasses.SMIB(pwFault(t1=2, t2=2.15));
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    P_0=40000000,
    Q_0=5415812,
    angle_0=0.070619983433093,
    M_b=100000000,
    Tpd0=6.9,
    Tppd0=0.06,
    Tppq0=0.3,
    H=7.79,
    D=0,
    Xd=1.18,
    Xq=1.27,
    Xpd=0.15,
    Xppd=0.083,
    Xppq=0.083,
    Xl=0.064,
    S10=0.155,
    S12=0.58,
    Xpq=0.407,
    Tpq0=1.5)
    annotation (Placement(transformation(extent={{-88,-16},{-58,16}})));
  Electrical.Controls.PSSE.ES.AC7B aC7B(
    T_R=0,
    K_PR=9,
    K_IR=1.5,
    K_DR=2.2,
    T_DR=0.0167,
    V_RMAX=5.5,
    V_RMIN=-5.5,
    K_PA=1,
    K_IA=0.005,
    VA_MIN=-5.5,
    VA_MAX=5.5,
    K_P=1,
    K_L=99,
    T_E=0.8,
    K_C=0,
    K_D=0,
    K_E=1,
    K_F1=0,
    K_F2=0,
    K_F3=0,
    T_F3=1,
    VE_MIN=0,
    VFEMAX=5.5,
    E_1=2.75,
    S_EE_1=0.08,
    E_2=3.8,
    S_EE_2=0.3) annotation (Placement(transformation(
        extent={{-15,15},{15,-15}},
        rotation=180,
        origin={-73,-49})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-28,-88},{-40,-76}})));
equation
  connect(gENROU.p, GEN1.p)
    annotation (Line(points={{-58,0},{-30,0}}, color={0,0,255}));
  connect(gENROU.PMECH0, gENROU.PMECH) annotation (Line(points={{-56.5,8},{-50,8},
          {-50,22},{-98,22},{-98,9.6},{-91,9.6}},color={0,0,127}));
  connect(const.y, aC7B.VOEL) annotation (Line(points={{-40.6,-82},{-73,-82},{-73,
          -65.5}}, color={0,0,127}));
  connect(aC7B.VUEL, aC7B.VOEL) annotation (Line(points={{-67,-65.5},{-66,-65.5},
          {-66,-82},{-73,-82},{-73,-65.5}}, color={0,0,127}));
  connect(gENROU.ETERM, aC7B.ECOMP) annotation (Line(points={{-56.5,-4.8},{-44,
          -4.8},{-44,-49},{-56.5,-49}}, color={0,0,127}));
  connect(gENROU.XADIFD, aC7B.XADIFD) annotation (Line(points={{-56.5,-14.4},{-52,
          -14.4},{-52,-74},{-85,-74},{-85,-65.5}}, color={0,0,127}));
  connect(gENROU.EFD0, aC7B.EFD0) annotation (Line(points={{-56.5,-8},{-48,-8},
          {-48,-55},{-56.5,-55}}, color={0,0,127}));
  connect(aC7B.VT, aC7B.ECOMP) annotation (Line(points={{-56.35,-37.15},{-44,-37.15},
          {-44,-49},{-56.5,-49}}, color={0,0,127}));
  connect(aC7B.VOTHSG, aC7B.VOEL) annotation (Line(points={{-56.5,-43},{-46,-43},
          {-46,-82},{-73,-82},{-73,-65.5}}, color={0,0,127}));
  connect(aC7B.EFD, gENROU.EFD) annotation (Line(points={{-89.5,-49},{-98,-49},
          {-98,-9.6},{-91,-9.6}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}})),                                        Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}})),
    experiment(
      StopTime=10,
      Interval=0.0001,
      Tolerance=1e-06,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Dassl"),
    conversion(noneFromVersion=""));
end AC7B;
