within OpenIPSL.Tests.Machines.PSAT;
model Order4test2_AVR "Simple system with line opening to test functionality of order 4 machine connected to an AVR type III from PSAT"
  extends OpenIPSL.Tests.BaseClasses.MachineTestBase;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII AVRtypeIII1(v(fixed = true))  annotation (
      Placement(transformation(
        origin={-67,5},
        extent={{-10,-10},{10,10}})));
  OpenIPSL.Electrical.Machines.PSAT.Order4 order4_Inputs_Outputs(
    D=0,
    M=10,
    P_0=16035269.8692006,
    Q_0=11859436.505981,
    Sn= 370000000,
    V_b=200000,
    Vn= 200000,angle_0=0, delta(fixed = true),
    ra=0.001,
    v_0=1, w(fixed = true),
    x1d=0.302) annotation (Placement(transformation(extent={{-37,-10},{-17,10}})));

  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-97,-4},{-87,6}})));
equation
  connect(AVRtypeIII1.vf, order4_Inputs_Outputs.vf) annotation (Line(
      points={{-56.1667,5},{-47,5},{-47,5},{-39,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, AVRtypeIII1.vs) annotation (Line(points={{-86.5,1},{-81,1},{
          -81,0},{-76.1667,0}}, color={0,0,127}));
  connect(AVRtypeIII1.v, order4_Inputs_Outputs.v) annotation (Line(points={{
          -76.1667,10},{-87,10},{-87,20},{-10,20},{-10,3},{-16,3}},
                                                           color={0,0,127}));
  connect(order4_Inputs_Outputs.pm0, order4_Inputs_Outputs.pm) annotation (Line(
        points={{-35,-11},{-35,-13},{-41,-13},{-41,-5},{-39,-5}}, color={0,0,
          127}));
  connect(order4_Inputs_Outputs.p, bus1.p) annotation (Line(points={{-17,0},{-8,0},{-8,0},{0,0}}, color={0,0,255}));
  connect(AVRtypeIII1.vf0, order4_Inputs_Outputs.vf0) annotation (Line(points={{-67,
          14.1667},{-67,23},{-35,23},{-35,11}},     color={0,0,127}));
  annotation (experiment(StopTime=20));
end Order4test2_AVR;
