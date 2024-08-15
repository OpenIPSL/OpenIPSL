within OpenIPSL.Tests.Controls.PSSE.ES;
model AC8B "SMIB model example of GENROU with Excitation System AC8B"
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
    v_0=1) annotation (Placement(transformation(extent={{-108,-14},{-80,16}})));
  Modelica.Blocks.Sources.Constant const5(k=0)     annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={-41,-37})));
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
    annotation (Placement(transformation(extent={{-80,-70},{-110,-40}})));
equation
  connect(aC8B.EFD0, gENROU.EFD0) annotation (Line(
      points={{-78.5,-61},{-74,-61},{-74,-18},{-72,-18},{-72,-6.5},{-78.6,-6.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.XADIFD, aC8B.XADIFD) annotation (Line(
      points={{-78.6,-12.5},{-78.6,-42},{-76,-42},{-76,-65.5},{-78.5,-65.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(aC8B.ECOMP, gENROU.ETERM) annotation (Line(points={{-78.5,-55},{-72,
          -55},{-72,-20},{-70,-20},{-70,-3.5},{-78.6,-3.5}},          color={0,
          0,127}));
  connect(gENROU.PMECH0, gENROU.PMECH) annotation (Line(
      points={{-78.6,8.5},{-74,8.5},{-74,20},{-110,20},{-110,10},{-110.8,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(aC8B.EFD, gENROU.EFD) annotation (Line(points={{-111.5,-55},{-118,-55},
          {-118,-8},{-110.8,-8}},                    color={0,0,127}));
  connect(gENROU.p, GEN1.p) annotation (Line(points={{-80,1},{-58.3,1},{-58.3,0},
          {-30,0}},    color={0,0,255}));
  connect(const5.y, aC8B.VOTHSG) annotation (Line(points={{-46.5,-37},{-52,-37},
          {-52,-49},{-78.5,-49}},                 color={0,0,127}));
  connect(aC8B.VUEL, const5.y) annotation (Line(points={{-89,-71.5},{-89,-76},{
          -52,-76},{-52,-37},{-46.5,-37}},             color={0,0,127}));
  connect(aC8B.VOEL, const5.y) annotation (Line(points={{-95,-71.5},{-95,-76},{
          -52,-76},{-52,-37},{-46.5,-37}},              color={0,0,127}));
  annotation (
experiment(
      StopTime=10,
      Interval=0.0001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-160,-100},{120,100}})),
    Icon(coordinateSystem(extent={{-160,-100},{120,100}})),
    conversion(noneFromVersion=""));
end AC8B;
