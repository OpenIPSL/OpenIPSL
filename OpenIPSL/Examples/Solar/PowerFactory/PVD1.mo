within OpenIPSL.Examples.Solar.PowerFactory;

model PVD1
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Step frequency(height = -0.05, offset = 1, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {70, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step voltage(height = -0.05, offset = 1, startTime = 0.5) annotation(
    Placement(visible = true, transformation(origin = {70, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Electrical.Solar.PowerFactory.General.ElmVac elmVac(angle_0 = 0, v_0 = 1) annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Electrical.Solar.PowerFactory.WECC.PVD1.Plant_PVD1 pvd1_plant(M_b(displayUnit = "V.A") = 0.5e6, P_0 = 300000, Q_0 = 100000)  annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Electrical.SystemBase SysData annotation(
    Placement(visible = true, transformation(origin = {-70.5, 90}, extent = {{-29.5, -10}, {29.5, 10}}, rotation = 0)));
equation
  connect(voltage.y, elmVac.v) annotation(
    Line(points = {{60, -20}, {50, -20}, {50, -6}, {40, -6}, {40, -4}}, color = {0, 0, 127}));
  connect(frequency.y, elmVac.f0) annotation(
    Line(points = {{60, 30}, {50, 30}, {50, 6}, {40, 6}, {40, 6}}, color = {0, 0, 127}));
  connect(pvd1_plant.p, elmVac.p) annotation(
    Line(points = {{-18, 0}, {18, 0}, {18, 0}, {20, 0}}, color = {0, 0, 255}));
annotation(
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.001),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "rungekutta"));
end PVD1;
