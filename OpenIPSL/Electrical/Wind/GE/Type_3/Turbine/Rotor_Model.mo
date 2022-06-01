within OpenIPSL.Electrical.Wind.GE.Type_3.Turbine;
model Rotor_Model "Model with wind machine's rotor equations"
  Modelica.Blocks.Interfaces.RealInput Pm "Mechanical Power Input" annotation (
      Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-66.2513,-29.0}),
      iconTransformation(
        origin={2.0,-138.6259},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealInput Pe "Electrical Power Input" annotation (
      Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-65.7168,-104.0}),
      iconTransformation(
        origin={2.0,-1.6523},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealOutput omega_gen
    "Engine shaft angular velocity" annotation (Placement(
      transformation(
        extent={{102.0,54.0},{62.0,94.0}},
        origin={-144.7168,-169.0}),
      iconTransformation(
        origin={-2.0,-4.0},
        extent={{102.0,54.0},{62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealOutput omega_turb
    "engine shaft angular velocity" annotation (Placement(
      transformation(
        origin={-142.0,21.0},
        extent={{102.0,54.0},{62.0,94.0}}),
      iconTransformation(
        origin={-2.0,-140.0376},
        extent={{102.0,54.0},{62.0,94.0}})));
  parameter Types.Time H=0.3 "inertia";
  parameter Types.Time Hg=0.3;
  parameter Real wbase=1;
  parameter Real Dtg=1;
  parameter Real Ktg=1;
  parameter Types.PerUnit wt_x6_0=1;
  parameter Types.PerUnit wt_x7_0=1;
  parameter Types.PerUnit wt_x8_0=1;
  parameter Types.PerUnit wt_x9_0=1;
  parameter Real wndtge_ang0=1;
  parameter Real wndtge_spd0=1;
protected
  Modelica.Blocks.Continuous.Integrator integrator1(y_start=wt_x6_0)
    annotation (Placement(transformation(
        origin={-27.2938,51.715},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Continuous.Integrator integrator2(y_start=wt_x8_0)
    annotation (Placement(transformation(
        origin={-25.0,-38.4407},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Continuous.Integrator integrator3(y_start=wt_x7_0)
    annotation (Placement(transformation(
        origin={35.0,51.7151},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Continuous.Integrator integrator4(y_start=wt_x9_0)
    annotation (Placement(transformation(
        origin={35.0,-38.3965},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add3 add31 annotation (Placement(transformation(
        origin={-77.9503,51.6035},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Division division1 annotation (Placement(transformation(
        origin={-105.0,51.7929},
        extent={{-10.0,10.0},{10.0,-10.0}})));
  Modelica.Blocks.Math.Division division2 annotation (Placement(transformation(
        origin={-105.0,-37.9398},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add3 add32(
    k1=-1,
    k2=-1,
    k3=-1) annotation (Placement(transformation(
        origin={-75.0,-38.2071},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Gain i2H(k=1/(2*H)) annotation (Placement(transformation(
        origin={-51.5025,51.5804},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Gain Gain_i2Hg(k=1/(2*Hg)) annotation (Placement(transformation(
        origin={-52.0335,-38.3327},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Gain Gain1_wbase(k=wbase) annotation (Placement(transformation(
        origin={7.1416,51.7326},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Gain Gain_wbase(k=wbase) annotation (Placement(transformation(
        origin={6.8708,-38.4743},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add add1(k1=-1) annotation (Placement(transformation(
        origin={-30.0,8.0513},
        extent={{10.0,-10.0},{-10.0,10.0}})));
  Modelica.Blocks.Math.Gain Gain_Dtg(k=Dtg) annotation (Placement(transformation(
        origin={-60.0,7.5203},
        extent={{10.0,-10.0},{-10.0,10.0}})));
  Modelica.Blocks.Math.Add add2(k1=-1) annotation (Placement(transformation(
        origin={95.0,10.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Gain Gain_Ktg(k=Ktg) annotation (Placement(transformation(
        origin={122.4495,10.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add add3 annotation (Placement(transformation(
        origin={67.5947,-20.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add add4 annotation (Placement(transformation(
        origin={-25.0,-80.0},
        extent={{10.0,-10.0},{-10.0,10.0}})));
  Modelica.Blocks.Math.Add add5 annotation (Placement(transformation(
        origin={-25.0,80.0},
        extent={{10.0,-10.0},{-10.0,10.0}})));
  Modelica.Blocks.Sources.Constant Const1_wndtge_spd0(k=wndtge_spd0)
    annotation (Placement(transformation(
        origin={22.1822,-90.0},
        extent={{10.0,-10.0},{-10.0,10.0}})));
  Modelica.Blocks.Sources.Constant Const_wndtge_spd0(k=wndtge_spd0) annotation (
     Placement(transformation(
        origin={15.0,90.0},
        extent={{10.0,-10.0},{-10.0,10.0}})));
  Modelica.Blocks.Sources.Constant Const_wndtge_ang0(k=wndtge_ang0) annotation (
     Placement(transformation(
        origin={25.0,-2.4551},
        extent={{-10.0,-10.0},{10.0,10.0}})));
equation
  connect(Const_wndtge_spd0.y, add5.u1) annotation (Line(
      origin={-7.25,88.0},
      points={{11.25,2.0},{-2.75,2.0},{-2.75,-2.0},{-5.75,-2.0}},
      color={0,0,127}));
  connect(Const1_wndtge_spd0.y, add4.u2) annotation (Line(
      origin={-5.4544,-88.0},
      points={{16.6366,-2},{-4.5456,-2},{-4.5456,2},{-7.5456,2}},
      color={0,0,127}));
  connect(omega_gen, add4.y) annotation (Line(
      origin={-72.1792,-87.5},
      points={{9.4624,-7.5},{7.1792,-7.5},{7.1792,7.5},{36.1792,7.5}},
      color={0,0,127}));
  connect(omega_turb, add5.y) annotation (Line(
      origin={-65.5,87.5},
      points={{5.5,7.5},{5.5,7.5},{5.5,-7.5},{29.5,-7.5}},
      color={0,0,127}));
  connect(Const_wndtge_ang0.y, add3.u1) annotation (Line(
      origin={49.196,-8.2276},
      points={{-13.196,5.7725},{3.3987,5.7725},{3.3987,-5.7724},{6.3987,-5.7724}},
      color={0,0,127}));

  connect(Pe, division2.u1) annotation (Line(
      origin={-126.1792,-30.9699},
      points={{-21.5376,0.9699},{6.1792,0.9699},{6.1792,-0.9699},{9.1792,-0.9699}},
      color={0,0,127}));

  connect(Pm, division1.u1) annotation (Line(
      origin={-126.3128,45.3965},
      points={{-21.9385,-0.3965},{6.3128,-0.3965},{6.3128,0.3964},{9.3128,
          0.3964}},
      color={0,0,127}));
  connect(integrator2.y, Gain_wbase.u) annotation (Line(
      origin={-8.8469,-38.4575},
      points={{-5.1531,0.0168},{0.7177,0.0168},{0.7177,-0.0168},{3.7177,-0.0168}},
      color={0,0,127}));

  connect(Gain_wbase.y, integrator4.u) annotation (Line(
      origin={21.2177,-38.4354},
      points={{-3.3469,-0.0389},{0.7823,-0.0389},{0.7823,0.0389},{1.7823,0.0389}},
      color={0,0,127}));

  connect(integrator1.y, Gain1_wbase.u) annotation (Line(
      origin={-9.2172,51.7238},
      points={{-7.0766,-0.0088},{1.3589,-0.0088},{1.3589,0.0088},{4.3588,0.0088}},
      color={0,0,127}));

  connect(Gain1_wbase.y, integrator3.u) annotation (Line(
      origin={21.2854,51.7238},
      points={{-3.1438,0.0088},{0.7146,0.0088},{0.7146,-0.0087},{1.7146,-0.0087}},
      color={0,0,127}));

  connect(Gain_Ktg.y, add31.u1) annotation (Line(
      origin={21.7313,46.5345},
      points={{111.7182,-36.5345},{114.7181,-36.5345},{114.7181,23.4655},{-114.7364,
          23.4655},{-114.7364,13.069},{-111.6816,13.069}},
      color={0,0,127}));
  connect(Gain_Ktg.y, add32.u3) annotation (Line(
      origin={22.2231,-34.3404},
      points={{111.2264,44.3404},{114.2264,44.3404},{114.2264,-32.4736},{-115.2281,
          -32.4736},{-115.2281,-11.8667},{-109.2231,-11.8667}},
      color={0,0,127}));
  connect(add2.y, Gain_Ktg.u) annotation (Line(
      origin={108.2248,10.0},
      points={{-2.2248,0},{2.2247,0}},
      color={0,0,127}));
  connect(add32.y, Gain_i2Hg.u) annotation (Line(
      origin={-64.0112,-38.2908},
      points={{0.0112,0.0837},{0.0112,-0.0419},{-0.0223,-0.0419}},
      color={0,0,127}));
  connect(Gain_i2Hg.y, integrator2.u) annotation (Line(
      origin={-38.5084,-38.3867},
      points={{-2.5251,0.054},{0.5084,0.054},{0.5084,-0.054},{1.5084,-0.054}},
      color={0,0,127}));
  connect(add1.y, Gain_Dtg.u) annotation (Line(
      origin={-44.75,7.7858},
      points={{3.75,0.2655},{-0.25,0.2655},{-0.25,-0.2655},{-3.25,-0.2655}},
      color={0,0,127}));
  connect(Gain_Dtg.y, add32.u1) annotation (Line(
      origin={-84.5,-11.3434},
      points={{13.5,18.8637},{-5.5,18.8637},{-5.5,-18.8637},{-2.5,-18.8637}},
      color={0,0,127}));
  connect(Gain_Dtg.y, add31.u3) annotation (Line(
      origin={-80.1801,15.7288},
      points={{9.1801,-8.2085},{5.1801,-8.2085},{5.1801,-5.7288},{-9.7702,-5.7288},
          {-9.7702,27.8747}},
      color={0,0,127}));
  connect(i2H.y, integrator1.u) annotation (Line(
      origin={-40.0996,51.6702},
      points={{-0.4029,-0.0898},{-0.4029,0.0448},{0.8058,0.0448}},
      color={0,0,127}));
  connect(add31.y, i2H.u) annotation (Line(
      origin={-64.8645,51.5919},
      points={{-2.0858,0.0116},{0.362,0.0116},{0.362,-0.0115},{1.362,-0.0115}},
      color={0,0,127}));

  connect(integrator2.y, add4.u1) annotation (Line(
      origin={-11.75,-56.2203},
      points={{-2.25,17.7796},{1.75,17.7796},{1.75,-17.7797},{-1.25,-17.7797}},
      color={0,0,127}));

  connect(add5.u2, integrator1.y) annotation (Line(
      origin={-12.3235,62.8575},
      points={{-0.6765,11.1425},{2.3235,11.1425},{2.3235,-11.1425},{-3.9703,-11.1425}},
      color={0,0,127}));

  connect(add1.u1, integrator1.y) annotation (Line(
      origin={-15.2204,32.8832},
      points={{-2.7796,-18.8319},{1.9265,-18.8319},{1.9265,18.8318},{-1.0734,
          18.8318}},
      color={0,0,127}));
  connect(add1.u2, integrator2.y) annotation (Line(
      origin={-13.5,-18.1947},
      points={{-4.5,20.246},{2.5,20.246},{2.5,-20.246},{-0.5,-20.246}},
      color={0,0,127}));
  connect(add3.u2, integrator4.y) annotation (Line(
      origin={49.8987,-32.1982},
      points={{5.696,6.1982},{-0.8987,6.1982},{-0.8987,-6.1983},{-3.8987,-6.1983}},
      color={0,0,127}));

  connect(add3.y, add2.u2) annotation (Line(
      origin={80.7973,-7.6625},
      points={{-2.2026,-12.3375},{0.7973,-12.3375},{0.7973,0.675},{-0.7973,
          0.675},{-0.7973,11.6625},{2.2027,11.6625}},
      color={0,0,127}));
  connect(integrator3.y, add2.u1) annotation (Line(
      origin={72.25,33.8575},
      points={{-26.25,17.8576},{7.75,17.8576},{7.75,-17.8575},{10.75,-17.8575}},
      color={0,0,127}));

  connect(division2.u2, add4.y) annotation (Line(
      origin={-98.25,-61.9699},
      points={{-18.75,18.0301},{-21.75,18.0301},{-21.75,-18.0301},{62.25,-18.0301}},
      color={0,0,127}));

  connect(division1.u2, add5.y) annotation (Line(
      origin={-98.25,68.8965},
      points={{-18.75,-11.1036},{-21.75,-11.1036},{-21.75,11.1035},{62.25,
          11.1035}},
      color={0,0,127}));
  connect(division2.y, add32.u2) annotation (Line(
      origin={-90.25,-38.0734},
      points={{-3.75,0.1336},{0.25,0.1336},{0.25,-0.1337},{3.25,-0.1337}},
      color={0,0,127}));
  connect(division1.y, add31.u2) annotation (Line(
      origin={-91.4627,51.6982},
      points={{-2.5373,0.0947},{0.5124,0.0947},{0.5124,-0.0947},{1.5124,-0.0947}},
      color={0,0,127}));

  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        grid={10,10}), graphics={Rectangle(
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}}),Text(
          origin={-1.9109,6.1667},
          fillPattern=FillPattern.Solid,
          extent={{-49.8299,-36.1667},{49.8299,36.1667}},
          textString="Rotor",
          fontName="Arial")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        grid={5,5})));
end Rotor_Model;
