within OpenIPSL.Tests.Machines.PSAT;
model Order4test2_TG "Simple system with line opening to test functionality of order 4 machine connected to turbine governor type II from PSAT"
  extends OpenIPSL.Tests.BaseClasses.MachineTestBase;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Controls.PSAT.TG.TGTypeII TGTypeII1 annotation (Placement(
        transformation(
        origin={-72.5,-7.5},
        extent={{-12.5,-12.5},{12.5,12.5}})));
  OpenIPSL.Electrical.Machines.PSAT.Order4 Generator(
    D=0,
    M=10,
    P_0=16035269.8692006,
    Q_0=11859436.505981,
    Sn= 370000000,
    V_b=200000,
    Vn= 200000,angle_0=0, delta(fixed = true),
    ra=0.001,
    v_0=1, w(fixed = true),
    x1d=0.302) annotation (Placement(transformation(extent={{-40,-15},{-10,15}})));

equation
  connect(Generator.p, bus1.p) annotation (Line(points={{-10,0},{-4.25,0},{-4.25,0},{0,0}}, color={0,0,255}));
  connect(TGTypeII1.pm, Generator.pm) annotation (Line(points={{-58.75,-7.5},{-43,-7.5}},
                             color={0,0,127}));
  connect(Generator.pm0, TGTypeII1.pm0) annotation (Line(points={{-37,-16.5},{-37,-25},{-50,-25},{-50,15},{-72.5,15},{-72.5,7.5}},
                                                           color={0,0,127}));
  connect(Generator.vf0, Generator.vf) annotation (Line(points={{-37,16.5},{-37,
          20},{-45,20},{-45,7.5},{-43,7.5}}, color={0,0,127}));
  connect(Generator.w, TGTypeII1.w) annotation (Line(points={{-8.5,13.5},{-4,13.5},{-4,26},{-92,26},{-92,-7.5},{-87.5,-7.5}}, color={0,0,127}));
  annotation (experiment(StopTime=20));
end Order4test2_TG;
