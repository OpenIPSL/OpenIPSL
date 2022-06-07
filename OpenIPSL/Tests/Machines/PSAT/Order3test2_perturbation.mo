within OpenIPSL.Tests.Machines.PSAT;
model Order3test2_perturbation "Simple system with perturbation to test functionality of order 3 machine from PSAT"
  extends OpenIPSL.Tests.BaseClasses.MachineTestBase;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Machines.PSAT.Order3 order3_Inputs_Outputs1(
    angle_0=0,
    ra=0.01,
    x1d=0.302,
    M=10,
    D=0,
    xd=1.9,
    T1d0=8,
    xq=1.7,
    P_0=16035269.8692006,
    Q_0=11859436.505981,
    Sn=20000000,
    v_0=1,
    V_b=400000,
    Vn=400000) annotation (Placement(transformation(
        origin={-18.3443,-0.375609},
        extent={{-9.6557,-9.62439},{9.6557,9.62439}})));
  Modelica.Blocks.Math.Add3 add31 annotation (Placement(transformation(
        origin={-45,25},
        extent={{-5,-5},{5,5}})));
  Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(
        origin={-74.9999,35},
        extent={{-4.99992,-5.00001},{4.99991,5.00002}})));
  Modelica.Blocks.Sources.Step step1(height=0.0005, startTime=2) annotation (
      Placement(transformation(
        origin={-95,55},
        extent={{-5,-5},{5,5}})));
  Modelica.Blocks.Sources.Step step2(height=-0.0005, startTime=2.1) annotation (
     Placement(transformation(
        origin={-95,35},
        extent={{-5,-5},{5,5}})));
  Modelica.Blocks.Sources.Sine sine1(amplitude=0.001, f=0.2) annotation (Placement(transformation(origin={-95,20}, extent={{-5,-5},{5,5}})));
  Modelica.Blocks.Math.Add add2(k2=-1) annotation (Placement(transformation(
        origin={-75,15},
        extent={{-5,-5},{5,5}})));
  Modelica.Blocks.Sources.Sine sine2(
    amplitude=0.001,
    f=0.2,
    startTime=5) annotation (Placement(transformation(origin={-95,5}, extent={{-5,-5},{5,5}})));
  Modelica.Blocks.Sources.Sine sine3(
    amplitude=0.001,
    f=0.2,
    startTime=10) annotation (Placement(transformation(origin={-95,-75}, extent={{-5,-5},{5,5}})));
  Modelica.Blocks.Math.Add add3(k2=-1) annotation (Placement(transformation(
        origin={-75,-65},
        extent={{-4.99999,-4.99999},{4.99999,4.99999}})));
  Modelica.Blocks.Sources.Sine sine4(
    amplitude=0.001,
    f=0.2,
    startTime=5) annotation (Placement(transformation(origin={-95,-55}, extent={{-5,-5},{5,5}})));
  Modelica.Blocks.Sources.Step step3(height=-0.0005, startTime=7.1) annotation (
     Placement(transformation(
        origin={-95,-35},
        extent={{-5,-5},{5,5}})));
  Modelica.Blocks.Sources.Step step4(height=0.0005, startTime=7) annotation (
      Placement(transformation(
        origin={-95,-15},
        extent={{-5,-5},{5,5}})));
  Modelica.Blocks.Math.Add add4 annotation (Placement(transformation(
        origin={-75,-25},
        extent={{-5,-5},{5,5}})));
  Modelica.Blocks.Math.Add3 add32 annotation (Placement(transformation(
        origin={-45,-25},
        extent={{-5.00007,-5.00012},{5.00001,4.99999}})));
equation
  connect(step3.y, add4.u2) annotation (Line(
      origin={-86.308,-30.9083},
      points={{-3.192,-4.0917},{2.3974,-4.0917},{2.3974,2.9083},{5.308,2.9083}},
      color={0,0,127}));

  connect(step4.y, add4.u1) annotation (Line(
      origin={-86.308,-19.6146},
      points={{-3.192,4.6146},{2.3974,4.6146},{2.3974,-2.3854},{5.308,-2.3854}},
      color={0,0,127}));

  connect(add1.y, add31.u1) annotation (Line(points={{-69.5,35},{-60,35},{-60,
          29},{-51,29}}, color={0,0,127}));
  connect(add2.y, add31.u2) annotation (Line(points={{-69.5,15},{-60,15},{-60,
          25},{-51,25}}, color={0,0,127}));
  connect(step2.y, add1.u2) annotation (Line(points={{-89.5,35},{-87,35},{-87,
          32},{-80.9998,32}}, color={0,0,127}));
  connect(step1.y, add1.u1) annotation (Line(points={{-89.5,55},{-87,55},{-87,
          38},{-80.9998,38}}, color={0,0,127}));
  connect(sine2.y, add2.u2) annotation (Line(points={{-89.5,5},{-86,5},{-86,12},
          {-81,12}}, color={0,0,127}));
  connect(sine1.y, add2.u1) annotation (Line(points={{-89.5,20},{-86,20},{-86,
          18},{-81,18}}, color={0,0,127}));
  connect(add4.y, add32.u2) annotation (Line(points={{-69.5,-25},{-60,-25},{-60,
          -25.0001},{-51.0001,-25.0001}}, color={0,0,127}));
  connect(sine4.y, add3.u1) annotation (Line(points={{-89.5,-55},{-85,-55},{-85,
          -62},{-81,-62}}, color={0,0,127}));
  connect(sine3.y, add3.u2) annotation (Line(points={{-89.5,-75},{-85,-75},{-85,
          -68},{-81,-68}}, color={0,0,127}));
  connect(add3.y, add32.u3) annotation (Line(points={{-69.5,-65},{-60,-65},{-60,
          -29.0001},{-51.0001,-29.0001}}, color={0,0,127}));
  connect(order3_Inputs_Outputs1.p, bus1.p) annotation (Line(points={{-8.6886,-0.375609},{-3.86151,-0.375609},{-3.86151,0},{0,0}}, color={0,0,255}));
  connect(add31.y, order3_Inputs_Outputs1.vf) annotation (Line(points={{-39.5,
          25},{-34,25},{-34,4.43659},{-29.9311,4.43659}}, color={0,0,127}));
  connect(add32.y, order3_Inputs_Outputs1.pm) annotation (Line(points={{-39.5,-25.0001},
          {-34,-25.0001},{-34,-5.1878},{-29.9311,-5.1878}}, color={0,0,127}));
  connect(order3_Inputs_Outputs1.vf0, add31.u3) annotation (Line(points={{-26.0689,
          10.2112},{-26.0689,14},{-56,14},{-56,21},{-51,21}}, color={0,0,127}));
  connect(order3_Inputs_Outputs1.pm0, add32.u1) annotation (Line(points={{-26.0689,
          -10.9624},{-26.0689,-16},{-56,-16},{-56,-21},{-51.0001,-21}}, color={
          0,0,127}));
  annotation (experiment(StopTime=20));
end Order3test2_perturbation;
