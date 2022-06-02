within OpenIPSL.Tests.Machines.PSAT;
model Order3test2_AVR "Simple system with line opening to test functionality of order 3 machine connected to an AVR type III from PSAT"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Tests.BaseClasses.MachineTestBase;
  OpenIPSL.Electrical.Machines.PSAT.Order3 order3_Inputs_Outputs1(
    D=0,
    M=10,
    P_0=16035269.8692006,
    Q_0=11859436.505981,
    Sn= 20000000,
    T1d0=8,
    V_b=400000,
    Vn= 400000,angle_0=0, delta(fixed = true),
    ra=0.01,
    v_0=1, w(fixed = true),
    x1d=0.302,
    xd=1.9,
    xq=1.7) annotation (Placement(transformation(
        origin={-30,0},
        extent={{-9.99992,-10},{10,10}})));

  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII AVRtypeIII1 annotation (
      Placement(transformation(
        origin={-68,0},
        extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-98,-4},{-90,4}})));
equation
  connect(order3_Inputs_Outputs1.p, bus1.p) annotation (Line(points={{-20,0},{-20,0},{0,0}}, color={0,0,255}));
  connect(AVRtypeIII1.vf, order3_Inputs_Outputs1.vf) annotation (Line(points={{
          -57.1667,0},{-50.5,0},{-50.5,5},{-41.9999,5}}, color={0,0,127}));
  connect(AVRtypeIII1.v, order3_Inputs_Outputs1.v) annotation (Line(points={{
          -77.1667,5},{-88,5},{-88,22},{-15,22},{-15,3},{-19,3}},
                                                         color={0,0,127}));
  connect(order3_Inputs_Outputs1.pm0, order3_Inputs_Outputs1.pm) annotation (
      Line(points={{-37.9999,-11},{-37.9999,-14},{-47,-14},{-47,-5},{-41.9999,
          -5}},
        color={0,0,127}));
  connect(AVRtypeIII1.vf0, order3_Inputs_Outputs1.vf0) annotation (Line(points={{-68,
          9.16667},{-68,16},{-37.9999,16},{-37.9999,11}}, color={0,0,127}));
  connect(AVRtypeIII1.vs, const.y) annotation (Line(points={{-77.1667,-5},{-86,
          -5},{-86,0},{-89.6,0}}, color={0,0,127}));
  annotation (experiment(StopTime=20));
end Order3test2_AVR;
