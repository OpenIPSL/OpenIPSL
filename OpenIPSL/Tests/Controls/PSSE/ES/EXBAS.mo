within OpenIPSL.Tests.Controls.PSSE.ES;
model EXBAS
  "SMIB system to test functionality of Basler Static Voltage Regulator Feeding DC or AC Rotating Exciter"
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60));
  OpenIPSL.Electrical.Controls.PSSE.ES.EXBAS eXBAS(
    T_R=0,
    K_PR=140,
    K_IR=20,
    K_A=7,
    T_A=0,
    T_B=0.03,
    T_C=0.214,
    V_RMAX=12.536,
    V_RMIN=-11.282,
    K_F=0,
    T_F=1,
    T_F1=0,
    T_F2=0,
    K_E=1,
    T_E=4.5,
    K_C=0.254,
    K_D=0.463,
    E_1=2.9250,
    S_EE_1=0.5300,
    E_2=3.9,
    S_EE_2=0.6700)
    annotation (Placement(transformation(extent={{-76,-48},{-56,-28}})));
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    P_0=39999952.912331,
    Q_0=5416571.3489056,
    v_0=1,
    angle_0=0.070620673811798,
    M_b=160000000,
    Tpd0=14.4,
    Tppd0=0.07,
    Tppq0=0.07,
    H=4.376,
    D=0,
    Xd=2.58,
    Xq=2.23,
    Xpd=0.219,
    Xppd=0.16,
    Xppq=0.16,
    Xl=0.123,
    S10=0.1684,
    S12=0.5132,
    R_a=0,
    w0=0,
    Xpq=0.36,
    Tpq0=3.9,
    Xpp=0.16)
    annotation (Placement(transformation(extent={{-74,-10},{-54,10}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-66,-74})));
equation
  connect(gENROU.PMECH0, gENROU.PMECH) annotation (Line(points={{-53,5},{-48,5},
          {-48,14},{-82,14},{-82,6},{-76,6}}, color={0,0,127}));
  connect(eXBAS.EFD, gENROU.EFD) annotation (Line(points={{-55,-38},{-50,-38},{
          -50,-14},{-82,-14},{-82,-6},{-76,-6}}, color={0,0,127}));
  connect(gENROU.p, GEN1.p)
    annotation (Line(points={{-54,0},{-30,0}}, color={0,0,255}));
  connect(gENROU.EFD0, eXBAS.EFD0) annotation (Line(points={{-53,-5},{-44,-5},{
          -44,-54},{-80,-54},{-80,-42},{-77,-42}}, color={0,0,127}));
  connect(gENROU.ETERM, eXBAS.ECOMP) annotation (Line(points={{-53,-3},{-42,-3},
          {-42,-56},{-86,-56},{-86,-38},{-77,-38}}, color={0,0,127}));
  connect(eXBAS.VUEL, const.y) annotation (Line(points={{-70,-49},{-70,-58},{
          -66,-58},{-66,-63}}, color={0,0,127}));
  connect(const.y, eXBAS.VOEL)
    annotation (Line(points={{-66,-63},{-66,-49}}, color={0,0,127}));
  connect(gENROU.XADIFD, eXBAS.XADIFD) annotation (Line(points={{-53,-9},{-46,
          -9},{-46,-52},{-58,-52},{-58,-49}}, color={0,0,127}));
  connect(eXBAS.VOTHSG, const.y) annotation (Line(points={{-77,-34},{-88,-34},{
          -88,-58},{-66,-58},{-66,-63}}, color={0,0,127}));
  annotation (
    experiment(
      StopTime=10,
      Interval=0.001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Rkfix2"));
end EXBAS;
