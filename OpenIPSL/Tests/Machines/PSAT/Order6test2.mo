within OpenIPSL.Tests.Machines.PSAT;
model Order6test2 "Simple system with line opening to test functionality of order 6 machine from PSAT"
  extends OpenIPSL.Tests.BaseClasses.MachineTestBase;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Machines.PSAT.Order6 order6Type2_1(
    D=0,
    M=10,
    P_0=16035269.8692006,
    Q_0=11859436.505981,
    Sn= 100000000,
    T1d0=8,
    T1q0=0.8,
    T2d0=0.04,
    T2q0=0.02,
    Taa=2e-3,
    V_b=400000,
    Vn= 20000,angle_0=0, delta(fixed = true),
    ra=0.001,
    v_0=1, w(fixed = true),
    x1d=0.302,
    x1q=0.5,
    x2d=0.204,
    x2q=0.3,
    xd=1.9,
    xq=1.7) annotation (Placement(transformation(extent={{-61,-20},{-21,20}})));

equation
  connect(order6Type2_1.vf0, order6Type2_1.vf) annotation (Line(points={{-57,22},
          {-57,25},{-71,25},{-71,10},{-65,10}}, color={0,0,127}));
  connect(order6Type2_1.pm, order6Type2_1.pm0) annotation (Line(points={{-65,-10},
          {-71,-10},{-71,-25},{-57,-25},{-57,-22}}, color={0,0,127}));
  connect(order6Type2_1.p, bus1.p) annotation (Line(points={{-21,0},{-10,0},{-10,0},{0,0}}, color={0,0,255}));
  annotation (
    experiment(StopTime=20));
end Order6test2;
