within OpenIPSL.Tests.Loads.PSAT;
model LoadTestMixed "Simple system to test functionality of mixed-type load model"
  extends BaseClasses.LoadTestBase;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Loads.PSAT.Mixed mixed(
    Sn=10000000,
    Tpv=0.1,
    Tqv=0.1,
    Tfv=0.1,
    Tft=0.1,
    Kpf=1,
    Kqf=1,
    alpha=1,
    beta=1,
    angle_0=-0.00746932024404292,
    P_0=800000,
    Q_0=600000,
    v_0=0.993325452568749) annotation (Placement(transformation(origin={80,-30}, extent={{-10,-10},{10,10}})));
equation
  connect(bus3.p, mixed.p) annotation (Line(points={{70,0},{80,0},{80,-20}}, color={0,0,255}));
  annotation (experiment(
      StopTime=15,
      Interval=0.03,
      Tolerance=1e-05));
end LoadTestMixed;
