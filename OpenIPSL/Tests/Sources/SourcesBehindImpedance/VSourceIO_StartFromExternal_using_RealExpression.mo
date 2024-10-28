within OpenIPSL.Tests.Sources.SourcesBehindImpedance;
model VSourceIO_StartFromExternal_using_RealExpression
  "Tests the voltage source behind an impedance component that includes inputs, this example starts from the value provided externally."
  extends OpenIPSL.Tests.BaseClasses.SMIB(pwFault(
      R=1e-6,
      X=1e-3,
      t1=2,
      t2=2.05));
  Electrical.Sources.SourceBehindImpedance.VoltageSources.VSourceIO VSIO(
    P_0=40000000,
    Q_0=5416582,
    v_0=1.0,
    angle_0=0.070492225331847,
    M_b=SysData.S_b,
    useEphasorInternalAsInput=false)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Sources.Ramp DEm(
    height=0.3,
    duration=1,
    startTime=4)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-90,70})));
  Modelica.Blocks.Math.Add addE0_DE annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,30})));
  Modelica.Blocks.Sources.RealExpression E0(y=VSIO.Emag0) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-64,68})));
  Modelica.Blocks.Math.Add addEang_DEang annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,-30})));
  Modelica.Blocks.Sources.RealExpression delta0(y=VSIO.Eang0) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-64,-70})));
  Modelica.Blocks.Sources.Ramp DEang(
    height=Modelica.Units.Conversions.from_deg(20),
    duration=3,
    startTime=6)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-90,-70})));
equation
  connect(VSIO.p, GEN1.p)
    annotation (Line(points={{-39,0},{-30,0}}, color={0,0,255}));
  connect(addE0_DE.y, VSIO.uDEmag)
    annotation (Line(points={{-70,19},{-70,6},{-62,6}}, color={0,0,127}));
  connect(addEang_DEang.y, VSIO.uDEang)
    annotation (Line(points={{-70,-19},{-70,-6},{-62,-6}}, color={0,0,127}));
  connect(DEm.y, addE0_DE.u2) annotation (Line(points={{-90,59},{-90,50},{-76,
          50},{-76,42}}, color={0,0,127}));
  connect(DEang.y, addEang_DEang.u1) annotation (Line(points={{-90,-59},{-90,
          -50},{-76,-50},{-76,-42}}, color={0,0,127}));
  connect(delta0.y, addEang_DEang.u2)
    annotation (Line(points={{-64,-59},{-64,-42}}, color={0,0,127}));
  connect(E0.y, addE0_DE.u1)
    annotation (Line(points={{-64,57},{-64,42}}, color={0,0,127}));
annotation(preferredView="diagram", experiment(StopTime=10));

end VSourceIO_StartFromExternal_using_RealExpression;
