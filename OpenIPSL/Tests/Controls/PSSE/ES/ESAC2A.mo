within OpenIPSL.Tests.Controls.PSSE.ES;
model ESAC2A "SMIB system to test functionality of ESAC2A model"
  extends OpenIPSL.Tests.BaseClasses.SMIB;
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    Xppd=0.2,
    Xppq=0.2,
    Xpp=0.2,
    Xl=0.12,
    angle_0=0.070620673811799,
    Tpd0=5,
    Tppd0=0.50000E-01,
    Tppq0=0.1,
    H=4.0000,
    D=0,
    Xd=1.41,
    Xq=1.3500,
    Xpd=0.3,
    S10=0.1,
    S12=0.5,
    Xpq=0.6,
    Tpq0=0.7,
    M_b=100000000,
    P_0=39999952.912331,
    Q_0=5416571.3489056,
    v_0=1) annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.ESAC2A eSAC2A(
    V_RMAX=4,
    V_RMIN=-4,
    V_FEMAX=10)
    annotation (Placement(transformation(extent={{-60,-60},{-80,-40}})));
  Modelica.Blocks.Sources.Constant minusInf(k=-Modelica.Constants.inf) annotation (Placement(transformation(extent={{-32,-78},{-40,-70}})));
  Modelica.Blocks.Sources.Constant plusInf(k=Modelica.Constants.inf) annotation (Placement(transformation(extent={{-32,-92},{-40,-84}})));
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(extent={{-14,-52},{-26,-40}})));
equation
  connect(eSAC2A.EFD0, gENROU.EFD0) annotation (Line(
      points={{-59,-54},{-38,-54},{-38,-10},{-46,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.XADIFD, eSAC2A.XADIFD) annotation (Line(
      points={{-46,-18},{-42,-18},{-42,-66},{-78,-66},{-78,-61}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(eSAC2A.ECOMP, gENROU.ETERM) annotation (Line(points={{-59,-50},{-34,-50},{-34,-6},{-46,-6}},
                                                                       color={0,
          0,127}));
  connect(gENROU.PMECH0, gENROU.PMECH) annotation (Line(
      points={{-46,10},{-40,10},{-40,30},{-100,30},{-100,12},{-92,12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(eSAC2A.EFD, gENROU.EFD) annotation (Line(points={{-81,-50},{-100,-50},
          {-100,-12},{-92,-12}},                      color={0,0,127}));
  connect(gENROU.p, GEN1.p) annotation (Line(points={{-48,0},{-30,0}},
                       color={0,0,255}));
  connect(zero.y, eSAC2A.VOTHSG) annotation (Line(points={{-26.6,-46},{-59,-46}}, color={0,0,127}));
  connect(plusInf.y, eSAC2A.VOEL) annotation (Line(points={{-40.4,-88},{-70,-88},{-70,-61}}, color={0,0,127}));
  connect(minusInf.y, eSAC2A.VUEL) annotation (Line(points={{-40.4,-74},{-66,-74},{-66,-61}}, color={0,0,127}));
  annotation (
experiment(StopTime=10));
end ESAC2A;
