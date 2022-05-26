within OpenIPSL.Tests.Loads.PSAT;
model LoadTestThLoad "Simple system to test functionality of thermostatically controlled load model"
  extends OpenIPSL.Tests.BaseClasses.LoadTestBase;
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant Tref(k=70)
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  Modelica.Blocks.Sources.Constant T_a(k=10)
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
  Electrical.Loads.PSAT.ThermostaticallyControlled thLoad(
    Sn=10000000,
    P_0=800000,
    Q_0=600000,
    Ti=12,
    Kl=1) annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
equation
  connect(Tref.y, thLoad.t_ref) annotation (Line(points={{41,-30},{50,-30},{50,-22},{68,-22}}, color={0,0,127}));
  connect(T_a.y, thLoad.t_a) annotation (Line(points={{41,-70},{60,-70},{60,-30},{68,-30}}, color={0,0,127}));
  connect(bus3.p, thLoad.p) annotation (Line(points={{70,0},{80,0},{80,-20}}, color={0,0,255}));
  annotation (experiment(StopTime=15, Interval=0.003));
end LoadTestThLoad;
