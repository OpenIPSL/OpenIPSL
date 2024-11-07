within OpenIPSL.Tests.Controls.PSSE.ES;
model AC8B "SMIB system to test functionality of exciter AC8B"
  extends OpenIPSL.Tests.BaseClasses.SMIB;
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    Xppd=0.2059,
    Xppq=0.2059,
    Xpp=0.2059,
    Xl=0.129,
    angle_0=0.070620673811798,
    Tpd0=6.27,
    Tppd0=0.059,
    Tppq0=0.096,
    H=4.4710,
    D=0,
    Xd=2.014,
    Xq=1.96,
    Xpd=0.331,
    S10=0.14,
    S12=0.56,
    Xpq=0.466,
    Tpq0=0.7,
    M_b=100000000,
    P_0=39999952.912331,
    Q_0=5416571.3489056,
    v_0=1) annotation (Placement(transformation(extent={{-88,-16},{-58,16}})));
  Modelica.Blocks.Sources.Constant const5(k=0)     annotation (Placement(
        transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={-28,-48})));
  Electrical.Controls.PSSE.ES.AC8B aC8B(
    TR=0.02,
    KPR=160,
    KIR=6,
    KDR=8,
    TDR=0.08,
    VPIDMAX=Modelica.Constants.inf,
    VPIDMIN=-Modelica.Constants.inf,
    KA=1,
    TA=0.01,
    VRMAX=7.76,
    VRMIN=-6.96,
    TE=1,
    KC=0.2,
    KD=0.2,
    KE=1,
    E1=1,
    SE1=0.05,
    E2=2,
    SE2=0.5,
    VFEMAX=8,
    VEMIN=0)
    annotation (Placement(transformation(extent={{-60,-66},{-86,-40}})));

equation
  connect(aC8B.EFD0, gENROU.EFD0) annotation (Line(
      points={{-58.7,-58.2},{-56,-58.2},{-56,-58},{-48,-58},{-48,-8},{-56.5,-8}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(gENROU.XADIFD, aC8B.XADIFD) annotation (Line(
      points={{-56.5,-14.4},{-58,-14.4},{-58,-14},{-52,-14},{-52,-62},{-58,-62},
          {-58,-62.1},{-58.7,-62.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(aC8B.ECOMP, gENROU.ETERM) annotation (Line(points={{-58.7,-53},{-42,-53},
          {-42,-4.8},{-56.5,-4.8}}, color={0,0,127}));
  connect(gENROU.PMECH0, gENROU.PMECH) annotation (Line(
      points={{-56.5,8},{-48,8},{-48,28},{-98,28},{-98,10},{-94,10},{-94,9.6},{-91,
          9.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(aC8B.EFD, gENROU.EFD) annotation (Line(points={{-87.3,-53},{-98,-53},{
          -98,-9.6},{-91,-9.6}}, color={0,0,127}));
  connect(gENROU.p, GEN1.p) annotation (Line(points={{-58,0},{-30,0}},
                       color={0,0,255}));
  connect(const5.y, aC8B.VOTHSG) annotation (Line(points={{-36.8,-48},{-46,-48},
          {-46,-47.8},{-58.7,-47.8}}, color={0,0,127}));
  connect(aC8B.VUEL, const5.y) annotation (Line(points={{-67.8,-67.3},{-70,-67.3},
          {-70,-76},{-40,-76},{-40,-48},{-36.8,-48}}, color={0,0,127}));
  connect(aC8B.VOEL, const5.y) annotation (Line(points={{-73,-67.3},{-73,-76},{-40,
          -76},{-40,-48},{-36.8,-48}}, color={0,0,127}));
  annotation (
experiment(
      StopTime=10,
      Interval=0.0001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-100,-80},{100,100}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
    conversion(noneFromVersion=""));
end AC8B;
