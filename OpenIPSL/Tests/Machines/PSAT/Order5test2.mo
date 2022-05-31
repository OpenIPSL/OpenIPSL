within OpenIPSL.Tests.Machines.PSAT;
model Order5test2 "Simple system with line opening to test functionality of order 5 machine from PSAT"
  extends OpenIPSL.Tests.BaseClasses.MachineTestBase;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Machines.PSAT.Order5_Type1 order5Type1_Inputs_Outputs(
    D=0,
    M=10,
    P_0=16035269.8692006,
    Q_0=11859436.505981,
    Sn= 370000000,
    T1d0=8,
    T1q0=0.8,
    T2q0=0.02,
    V_b=400000,
    Vn= 200000,
    angle_0=0, delta(fixed = true),ra=0.001,
    v_0=1, w(fixed = true),
    x1d=0.302,
    x1q=0.5,
    xd=1.9,
    xq=1.7) annotation (Placement(transformation(extent={{-32,-10},{-12,10}})));

equation
  connect(order5Type1_Inputs_Outputs.vf, order5Type1_Inputs_Outputs.vf0)
    annotation (Line(points={{-34,5},{-37,5},{-37,15},{-30,15},{-30,11}},color=
          {0,0,127}));
  connect(order5Type1_Inputs_Outputs.pm, order5Type1_Inputs_Outputs.pm0)
    annotation (Line(points={{-34,-5},{-37,-5},{-37,-15},{-30,-15},{-30,-11}},
        color={0,0,127}));
  connect(order5Type1_Inputs_Outputs.p, bus1.p) annotation (Line(points={{-12,0},{-6,0},{-6,0},{0,0}}, color={0,0,255}));
  annotation (
    experiment(StopTime=20));
end Order5test2;
