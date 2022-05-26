within OpenIPSL.Tests.Loads.PSAT;
model LoadTestExpRecovery "Simple system to test functionality of eponential recovery load model"
  extends BaseClasses.LoadTestBase;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Loads.PSAT.ExponentialRecovery exponentialRecovery(
    alpha_t=1.5,
    beta_t=1.5,
    Sn=10000000,
    P_0=800000,
    Q_0=600000,
    v_0=0.993325452568749) annotation (Placement(transformation(origin={80,-30}, extent={{-10,-10},{10,10}})));
equation
  connect(bus3.p, exponentialRecovery.p) annotation (Line(points={{70,0},{80,0},{80,-20}}, color={0,0,255}));
  annotation (experiment(
      StopTime=15,
      Interval=0.03,
      Tolerance=1e-05));
end LoadTestExpRecovery;
