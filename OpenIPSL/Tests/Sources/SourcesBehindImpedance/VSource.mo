within OpenIPSL.Tests.Sources.SourcesBehindImpedance;
model VSource
  "Tests the voltage source behind an impedance component"
  extends OpenIPSL.Tests.BaseClasses.SMIB(pwFault(
      R=1e-6,
      X=1e-3,
      t1=2,
      t2=2.05));
  Electrical.Sources.SourceBehindImpedance.VoltageSources.VSource VS(
    P_0=40000000,
    Q_0=5416582,
    v_0=1.0,
    angle_0=0.070492225331847,
    M_b=SysData.S_b)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(VS.p, GEN1.p)
    annotation (Line(points={{-39,0},{-30,0}}, color={0,0,255}));
annotation(preferredView="diagram", Documentation(info="<html>
</html>"),experiment(StopTime=10));
end VSource;
