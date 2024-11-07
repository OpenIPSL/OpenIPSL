within OpenIPSL.Tests.Controls.PSSE;
package UEL
extends Modelica.Icons.ExamplesPackage;

  model MNLEX2 "SMIB system to test functionality of Minimum Excitation Limiter MNLEX2"
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
      annotation (Placement(transformation(extent={{-82,-4},{-52,28}})));
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
          extent={{-13,13},{13,-13}},
          rotation=180,
          origin={-63,-39})));
    Modelica.Blocks.Sources.Constant const(k=0)
      annotation (Placement(transformation(extent={{-14,-68},{-26,-56}})));
    Electrical.Controls.PSSE.UEL.MNLEX2 mNLEX2(
      K_M=100,
      T_M=0.05,
      MEL_MAX=18,
      Q_0=1.3,
      Radius=1.92)
      annotation (Placement(transformation(extent={{-76,-88},{-60,-72}})));
  equation
    connect(gENROU.XADIFD, eXAC1_1.XADIFD) annotation (Line(points={{-50.5,-2.4},
            {-48,-2.4},{-48,-14},{-82,-14},{-82,-58},{-73.4,-58},{-73.4,-53.3}},
                                                         color={0,0,127}));
    connect(gENROU.EFD0, eXAC1_1.EFD0) annotation (Line(points={{-50.5,4},{-42,
            4},{-42,-44},{-46,-44},{-46,-44.2},{-48.7,-44.2}},
                                      color={0,0,127}));
    connect(gENROU.QELEC, mNLEX2.QELEC) annotation (Line(points={{-55,29.6},{
            -56,29.6},{-56,34},{-96,34},{-96,-80},{-77.6,-80}},
                                              color={0,0,127}));
    connect(gENROU.p, GEN1.p) annotation (Line(points={{-52,12},{-38,12},{-38,0},
            {-30,0}}, color={0,0,255}));
    connect(gENROU.PMECH0, gENROU.PMECH) annotation (Line(points={{-50.5,20},{
            -46,20},{-46,44},{-92,44},{-92,21.6},{-85,21.6}},
                                                        color={0,0,127}));
    connect(eXAC1_1.VOTHSG, const.y) annotation (Line(points={{-48.7,-33.8},{
            -30,-33.8},{-30,-62},{-26.6,-62}}, color={0,0,127}));
    connect(mNLEX2.VUEL, eXAC1_1.VUEL) annotation (Line(points={{-59.2,-80},{
            -57.8,-80},{-57.8,-53.3}}, color={0,0,127}));
    connect(gENROU.ETERM, eXAC1_1.ECOMP) annotation (Line(points={{-50.5,7.2},{
            -44,7.2},{-44,-39},{-48.7,-39}}, color={0,0,127}));
    connect(mNLEX2.Eterm, gENROU.ETERM) annotation (Line(points={{-77.6,-75.2},
            {-82,-75.2},{-82,-68},{-44,-68},{-44,7.2},{-50.5,7.2}}, color={0,0,
            127}));
    connect(eXAC1_1.EFD, gENROU.EFD) annotation (Line(points={{-77.3,-39},{-92,
            -39},{-92,2.4},{-85,2.4}}, color={0,0,127}));
    connect(gENROU.PELEC, mNLEX2.PELEC) annotation (Line(points={{-50.5,16.8},{
            -36,16.8},{-36,-90},{-82,-90},{-82,-84.8},{-77.6,-84.8}}, color={0,
            0,127}));
    connect(eXAC1_1.VOEL, const.y) annotation (Line(points={{-63,-53.3},{-63,
            -62},{-26.6,-62}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}})),                                  Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
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
