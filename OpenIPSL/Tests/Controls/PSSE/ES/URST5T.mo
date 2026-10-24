within OpenIPSL.Tests.Controls.PSSE.ES;
model URST5T "SMIB system to test functionality of URST5T model"
  extends OpenIPSL.Tests.BaseClasses.SMIB;
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    Xppd=0.2,
    Xppq=0.2,
    Xpp=0.2,
    Xl=0.12,
    angle_0=0.070620673811798,
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
    P_0=39999952.9123306,
    Q_0=5416571.34890556,
    v_0=1) annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
  Modelica.Blocks.Sources.Constant const2(k=0)
    annotation (Placement(transformation(extent={{-110,166},{-94,182}})));
  Modelica.Blocks.Sources.Constant VOEL(k=1000) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        origin={-86,-72})));
  OpenIPSL.Electrical.Controls.PSSE.ES.URST5T uRST5T
    annotation (Placement(transformation(extent={{-60,-60},{-80,-40}})));
  Modelica.Blocks.Sources.Constant VUEL(k=-1000) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        origin={-86,-90})));
  Modelica.Blocks.Sources.Constant VOTHSG(k=0) annotation (Placement(
        transformation(
        extent={{4,-4},{-4,4}},
        origin={-24,-46})));
equation
  connect(VUEL.y, uRST5T.VUEL) annotation (Line(
      points={{-79.4,-90},{-66.25,-90},{-66.25,-61},{-66,-61}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOEL.y, uRST5T.VOEL) annotation (Line(
      points={{-79.4,-72},{-70,-72},{-70,-61}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOTHSG.y, uRST5T.VOTHSG) annotation (Line(
      points={{-28.4,-46},{-59,-46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.XADIFD, uRST5T.XADIFD) annotation (Line(
      points={{-46,-18},{-42,-18},{-42,-66},{-78,-66},{-78,-61}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.EFD0, uRST5T.EFD0) annotation (Line(
      points={{-46,-10},{-38,-10},{-38,-54},{-59,-54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.PMECH0, gENROU.PMECH) annotation (Line(
      points={{-46,10},{-40,10},{-40,30},{-100,30},{-100,10},{-92,10}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(gENROU.PELEC, uRST5T.ECOMP) annotation (Line(
      points={{-46,6},{-34,6},{-34,-50},{-59,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(uRST5T.EFD, gENROU.EFD) annotation (Line(
      points={{-81,-50},{-100,-50},{-100,-10},{-92,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.p, GEN1.p) annotation (Line(points={{-48,0},{-30,0}},
                       color={0,0,255}));
  connect(uRST5T.VT, uRST5T.ECOMP) annotation (Line(points={{-59,-42},{-34,-42},{-34,-50},{-59,-50}},
                                                                        color={
          0,0,127}));
  annotation (
experiment(StopTime=10));
end URST5T;
