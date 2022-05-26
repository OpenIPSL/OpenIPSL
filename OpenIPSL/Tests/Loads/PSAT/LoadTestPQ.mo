within OpenIPSL.Tests.Loads.PSAT;
model LoadTestPQ "Simple system to test functionality of constant PQ load model"
  extends BaseClasses.LoadTestBase;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Loads.PSAT.PQ pQ(
    Sn=10000000,
    P_0=800000,
    Q_0=600000) annotation (Placement(transformation(origin={80,-30}, extent={{-10,-10},{10,10}})));
equation
  connect(bus3.p, pQ.p) annotation (Line(points={{70,0},{80,0},{80,-20}}, color={0,0,255}));
  annotation (experiment(
      StopTime=15,
      Interval=0.03,
      Tolerance=1e-05));
end LoadTestPQ;
