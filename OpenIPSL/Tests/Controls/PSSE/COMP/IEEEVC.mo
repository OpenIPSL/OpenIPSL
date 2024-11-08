within OpenIPSL.Tests.Controls.PSSE.COMP;
model IEEEVC
  "SMIB system to test functionality of compensator IEEEVC"
  extends OpenIPSL.Tests.BaseClasses.SMIB;
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Xppd=0.36,
    Xppq=0.36,
    Xl=0.136,
    angle_0=0.070620673811799,
    Tpd0=7,
    Tppd0=0.035,
    Tppq0=0.03,
    H=3,
    D=0,
    Xd=1.16,
    Xq=0.81,
    Xpd=0.42,
    S10=0.16,
    S12=0.61,
    M_b=110000000,
    P_0=39999952.912331,
    Q_0=5416571.3489056,
    v_0=1,
    R_a=0.00323)
           annotation (Placement(transformation(extent={{-86,-18},{-58,16}})));
  Electrical.Controls.PSSE.COMP.IEEEVC iEEEVC(RC=0, XC=0.08)
    annotation (Placement(transformation(extent={{-48,-18},{-34,-6}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-22,-90},{-42,-70}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.ESDC1A eSDC1A(
    T_R=0.01,
    K_A=50,
    V_RMAX=22.5,
    V_RMIN=-22.5,
    K_E=0,
    T_E=0.7,
    T_F1=0.45,
    E_1=2.322,
    E_2=3.096,
    S_EE_1=0.221,
    S_EE_2=0.549)
    annotation (Placement(transformation(extent={{-64,-52},{-84,-32}})));
  Modelica.Blocks.Sources.Constant const1(k=-Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-94,-90},{-74,-70}})));
equation
  connect(gENSAL.PMECH0, gENSAL.PMECH) annotation (Line(points={{-56.6,7.5},{-52,
          7.5},{-52,28},{-94,28},{-94,9.2},{-88.8,9.2}},     color={0,0,127}));
  connect(const.y, eSDC1A.VOTHSG)
    annotation (Line(points={{-43,-80},{-56,-80},{-56,-38},{-63,-38}},
                                                   color={0,0,127}));
  connect(eSDC1A.VOEL, eSDC1A.VOTHSG) annotation (Line(points={{-74,-53},{-74,-56},
          {-56,-56},{-56,-38},{-63,-38}},      color={0,0,127}));
  connect(const1.y, eSDC1A.VUEL)
    annotation (Line(points={{-73,-80},{-70,-80},{-70,-53}}, color={0,0,127}));
  connect(gENSAL.XADIFD, eSDC1A.XADIFD) annotation (Line(points={{-56.6,-16.3},{
          -50,-16.3},{-50,-58},{-82,-58},{-82,-53}},  color={0,0,127}));
  connect(gENSAL.EFD0, eSDC1A.EFD0) annotation (Line(points={{-56.6,-9.5},{-52,-9.5},
          {-52,-46},{-63,-46}},       color={0,0,127}));
  connect(gENSAL.p, iEEEVC.Gen_terminal) annotation (Line(points={{-58,-1},{-45.9,
          -1},{-45.9,-7.8}}, color={0,0,255}));
  connect(GEN1.p, iEEEVC.Bus) annotation (Line(points={{-30,0},{-36.1,0},{-36.1,
          -7.8}}, color={0,0,255}));
  connect(iEEEVC.VCT, eSDC1A.ECOMP) annotation (Line(points={{-32.88,-12},{-26,-12},
          {-26,-22},{-54,-22},{-54,-42},{-63,-42}}, color={0,0,127}));
  connect(eSDC1A.EFD, gENSAL.EFD) annotation (Line(points={{-85,-42},{-96,-42},{
          -96,-11.2},{-88.8,-11.2}},color={0,0,127}));
  annotation (
experiment(
      StopTime=10,
      Interval=0.0001,
      Tolerance=1e-06,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    conversion(noneFromVersion=""));
end IEEEVC;
