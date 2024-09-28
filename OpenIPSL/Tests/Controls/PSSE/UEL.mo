within OpenIPSL.Tests.Controls.PSSE;
package UEL
extends Modelica.Icons.ExamplesPackage;

  model MNLEX2 "Simple Machine Infinite Bus with Machine and Exciter"
    extends OpenIPSL.Tests.BaseClasses.SMIB(pwFault(t1=2, t2=2.7), SysData(fn=50));
    OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
      P_0=40000000,
      Q_0=5415812,
      angle_0=0.070619983433093,
      M_b=118000000,
      Tpd0=7.045,
      Tppd0=0.042,
      Tppq0=0.074,
      H=6.204,
      D=1,
      Xd=1.36,
      Xq=1.31,
      Xpd=0.18,
      Xppd=0.15,
      Xppq=0.15,
      Xl=0.13,
      S10=0.1,
      S12=0.55,
      Xpq=0.31,
      Tpq0=0.783)
      annotation (Placement(transformation(extent={{-90,-4},{-60,28}})));
    OpenIPSL.Electrical.Controls.PSSE.ES.EXAC1
         eXAC1_1(
      T_R=0,
      V_RMAX=12.4,
      V_RMIN=-11.2,
      T_E=0.42,
      K_C=0.53,
      K_D=2.06,
      K_E=0.42,
      E_1=3.6,
      S_EE_1=0.06,
      E_2=4.8,
      S_EE_2=0.22)
                  annotation (Placement(transformation(
          extent={{-20,18},{20,-18}},
          rotation=180,
          origin={-76,-36})));
    Modelica.Blocks.Sources.Constant const(k=0)
      annotation (Placement(transformation(extent={{-28,-68},{-40,-56}})));
    Electrical.Controls.PSSE.UEL.MNLEX2 mNLEX2_1(
      K_M=100,
      T_M=0.05,
      MEL_MAX=18,
      Q_0=1.3,
      Radius=1.92)
      annotation (Placement(transformation(extent={{-100,-96},{-70,-70}})));
  equation
    connect(eXAC1_1.EFD, gENROU.EFD) annotation (Line(points={{-98,-36},{-100,-36},
            {-100,2.4},{-93,2.4}},
                               color={0,0,127}));
    connect(const.y, eXAC1_1.VOEL) annotation (Line(points={{-40.6,-62},{-76,-62},
            {-76,-55.8}}, color={0,0,127}));
    connect(gENROU.XADIFD, eXAC1_1.XADIFD) annotation (Line(points={{-58.5,-2.4},
            {-46,-2.4},{-46,-68},{-92,-68},{-92,-55.8}}, color={0,0,127}));
    connect(gENROU.EFD0, eXAC1_1.EFD0) annotation (Line(points={{-58.5,4},{-50,4},
            {-50,-43.2},{-54,-43.2}}, color={0,0,127}));
    connect(mNLEX2_1.VUEL, eXAC1_1.VUEL) annotation (Line(points={{-68.8462,-83},
            {-62,-83},{-62,-60},{-68,-60},{-68,-55.8}}, color={0,0,127}));
    connect(gENROU.QELEC, mNLEX2_1.QELEC) annotation (Line(points={{-63,29.6},{
            -63,38},{-108,38},{-108,-83},{-102.308,-83}},
                                  color={0,0,127}));
    connect(gENROU.p, GEN1.p) annotation (Line(points={{-60,12},{-46,12},{-46,0},
            {-30,0}}, color={0,0,255}));
    connect(gENROU.PMECH0, gENROU.PMECH) annotation (Line(points={{-58.5,20},{-54,
            20},{-54,44},{-100,44},{-100,21.6},{-93,21.6}},
                                                        color={0,0,127}));
    connect(eXAC1_1.VOTHSG, const.y) annotation (Line(points={{-54,-28.8},{-40.6,
            -28.8},{-40.6,-62}}, color={0,0,127}));
    connect(gENROU.PELEC, mNLEX2_1.PELEC) annotation (Line(points={{-58.5,16.8},
            {-54,16.8},{-54,16},{-48,16},{-48,48},{-112,48},{-112,-89.5},{
            -102.308,-89.5}},
                     color={0,0,127}));
    connect(gENROU.ETERM, mNLEX2_1.Eterm) annotation (Line(points={{-58.5,7.2},
            {-40,7.2},{-40,52},{-116,52},{-116,-76.5},{-102.308,-76.5}},color={0,
            0,127}));
    connect(eXAC1_1.ECOMP, mNLEX2_1.Eterm) annotation (Line(points={{-54,-36},{
            -44,-36},{-44,7.2},{-40,7.2},{-40,52},{-116,52},{-116,-76.5},{
            -102.308,-76.5}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,
              -100},{120,100}})),                                  Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,
              100}})),
      experiment(
        StopTime=10,
        Interval=0.001,
        Tolerance=1e-06,
        __Dymola_fixedstepsize=0.001,
        __Dymola_Algorithm="Rkfix2"),
      conversion(noneFromVersion=""));
  end MNLEX2;
end UEL;
