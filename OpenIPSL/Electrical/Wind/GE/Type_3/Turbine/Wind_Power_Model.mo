within OpenIPSL.Electrical.Wind.GE.Type_3.Turbine;
model Wind_Power_Model "Model for wind power in a type 3 machine"
  Modelica.Blocks.Interfaces.RealInput Wind_Speed "Wind speed" annotation (
      Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-68.0,-46.4927}),
      iconTransformation(
        origin={2.0,-2.4053},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealInput Theta "Pitch angle" annotation (
      Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={62.0,-34.0}),
      iconTransformation(
        origin={2.0,-76.5688},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealInput omega "Turbine speed" annotation (
      Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-68.0,21.0}),
      iconTransformation(
        origin={2.0,-146.3226},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealOutput Pm "Mechanical power" annotation (
      Placement(
      transformation(
        extent={{102.0,54.0},{62.0,94.0}},
        origin={43.0,-74.0}),
      iconTransformation(
        origin={-2.0,-71.3573},
        extent={{102.0,54.0},{62.0,94.0}})));
  import Modelica.Constants.inf;
  parameter Real KI=1;
  parameter Real wndtge_kp=1;
protected
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=inf, uMin=0.1) annotation (
      Placement(transformation(
        origin={-106.8708,27.782},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Division division1 annotation (Placement(transformation(
        origin={-80.0,75.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Gain Gain_KI(k=KI) annotation (Placement(transformation(
        origin={-55.0,75.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax=inf, uMin=0.1) annotation (
      Placement(transformation(
        origin={-23.2941,73.1292},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Gain Gain_wndtge_kp(k=wndtge_kp) annotation (Placement(
        transformation(
        origin={107.9503,-0.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(
        origin={-27.4053,-6.6035},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Product product3 annotation (Placement(transformation(
        origin={-65.0,-20.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Product product4 annotation (Placement(transformation(
        origin={80.0,-1.6035},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Cp_function cp_function1 annotation (Placement(transformation(
        origin={30.0,58.3965},
        extent={{-10.0,-10.0},{10.0,10.0}})));
equation
  connect(limiter1.y, division1.u2) annotation (Line(
      origin={-93.9354,45.8588},
      points={{-1.9354,-18.0768},{1.0646,-18.0768},{1.0646,-5.0643},{-1.0646,-5.0643},
          {-1.0646,23.1412},{1.9354,23.1412}},
      color={0,0,127}));
  connect(Wind_Speed, limiter1.u) annotation (Line(
      origin={-128.1531,27.6446},
      points={{-21.8469,-0.1373},{6.2823,-0.1373},{6.2823,0.1374},{9.2823,
          0.1374}},
      color={0,0,127}));
  connect(omega, division1.u1) annotation (Line(
      origin={-108.0,88.0},
      points={{-42.0,7.0},{13.0,7.0},{13.0,-7.0},{16.0,-7.0}},
      color={0,0,127}));
  connect(division1.y, Gain_KI.u) annotation (Line(
      origin={-68.0,75.0},
      points={{-1.0,0.0},{1.0,0.0}},
      color={0,0,127}));
  connect(Wind_Speed, product2.u1) annotation (Line(
      origin={-148.4635,14.0554},
      points={{-1.5365,13.4519},{26.1487,14.0554},{26.1487,-14.0554},{109.0582,
          -14.6589}},
      color={0,0,127}));
  connect(Wind_Speed, product3.u1) annotation (Line(
      origin={-139.5109,5.7536},
      points={{-10.4891,21.7537},{16.75,21.7537},{16.75,-19.7536},{62.5109,-19.7536}},
      color={0,0,127}));

  connect(Wind_Speed, product3.u2) annotation (Line(
      origin={-139.2437,-0.0},
      points={{-10.7563,27.5073},{16.75,26.7536},{16.75,-26.7536},{62.2437,-26.0}},
      color={0,0,127}));

  connect(Theta, cp_function1.Theta) annotation (Line(
      origin={7.0,46.1983},
      points={{-27,-6.1983},{8,-6.1983},{8,6.1982},{11,6.1982}},
      color={0,0,127}));
  connect(product4.y, Gain_wndtge_kp.u) annotation (Line(
      origin={94.2128,-0.8018},
      points={{-3.2128,-0.8017},{0.7376,-0.8017},{0.7376,0.8018},{1.7375,0.8018}},
      color={0,0,127}));

  connect(Gain_wndtge_kp.y, Pm) annotation (Line(
      origin={122.1088,0.0},
      points={{-3.1585,-0.0},{2.8912,0.0}},
      color={0,0,127}));
  connect(product2.y, product4.u2) annotation (Line(
      origin={8.5,-5.5},
      points={{-24.9053,-1.1035},{-18.5,0.5},{-18.5,-0.5},{59.5,-2.1035}},
      color={0,0,127}));
  connect(cp_function1.y, product4.u1) annotation (Line(
      origin={59.75,31.3965},
      points={{-18.75,27.0},{5.25,27.0},{5.25,-27.0},{8.25,-27.0}},
      color={0,0,127}));
  connect(limiter2.y, cp_function1.Lambda) annotation (Line(
      origin={8.9265,68.7628},
      points={{-21.2206,4.3664},{6.0735,4.3664},{6.0735,-4.3663},{9.0735,-4.3663}},
      color={0,0,127}));

  connect(Gain_KI.y, limiter2.u) annotation (Line(
      origin={-38.9706,74.0646},
      points={{-5.0294,0.9354},{0.6765,0.9354},{0.6765,-0.9354},{3.6765,-0.9354}},
      color={0,0,127}));

  connect(product3.y, product2.u2) annotation (Line(
      origin={-44.554,-16.3018},
      points={{-9.446,-3.6982},{2.1487,-3.6982},{2.1487,3.6983},{5.1487,3.6983}},
      color={0,0,127}));

  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        grid={10,10}), graphics={Rectangle(
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}}),Text(
          origin={5.2917,-1.4606},
          fillPattern=FillPattern.Solid,
          extent={{-39.3935,-41.4606},{39.3935,41.4606}},
          textString="wind",
          fontName="Arial")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        grid={5,5})));
end Wind_Power_Model;
