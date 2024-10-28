within OpenIPSL.Tests.Sources.SourcesBehindImpedance;
model VSourceIO
  "Tests the voltage source behind an impedance component that includes inputs"
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
    useEphasorInternalAsInput=true)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Sources.Ramp DEang(
    height=Modelica.Units.Conversions.from_deg(20),
    duration=3,
    startTime=6)
    annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
  Modelica.Blocks.Sources.Ramp DEm(
    height=0.3,
    duration=1,
    startTime=4)
    annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
equation
  connect(VSIO.p, GEN1.p)
    annotation (Line(points={{-39,0},{-30,0}}, color={0,0,255}));
  connect(DEm.y, VSIO.uDEmag) annotation (Line(points={{-79,30},{-70,30},{-70,6},
          {-62,6}}, color={0,0,127}));
  connect(DEang.y, VSIO.uDEang) annotation (Line(points={{-79,-30},{-72,-30},{
          -72,-6},{-62,-6}}, color={0,0,127}));
annotation(preferredView="diagram", experiment(StopTime=10));

end VSourceIO;
