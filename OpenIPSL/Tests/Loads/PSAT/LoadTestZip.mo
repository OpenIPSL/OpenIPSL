within OpenIPSL.Tests.Loads.PSAT;
model LoadTestZip "Simple system to test functionality of ZIP (constant impedance, current and power) load model"
  extends BaseClasses.LoadTestBase;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Loads.PSAT.ZIP zIP(
    Sn=10000000,
    Pz=0.5,
    Pi=0.3,
    Qz=0.5,
    Qi=0.3,
    P_0=800000,
    Q_0=600000,
    v_0=0.993325452568749) annotation (Placement(transformation(origin={80,-30}, extent={{-10,-10},{10,10}})));
equation
  connect(bus3.p, zIP.p) annotation (Line(points={{70,0},{80,0},{80,-20}}, color={0,0,255}));
  annotation (experiment(
      StopTime=15,
      Interval=0.03,
      Tolerance=1e-05));
end LoadTestZip;
