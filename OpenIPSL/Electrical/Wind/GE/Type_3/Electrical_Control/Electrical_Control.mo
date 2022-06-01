within OpenIPSL.Electrical.Wind.GE.Type_3.Electrical_Control;
model Electrical_Control "Type 3 wind machine electrical control"
  import Modelica.Constants.inf;
  parameter Types.PerUnit qmax=1;
  parameter Types.PerUnit qmin=0;
  parameter Real KQi=1;
  parameter Types.PerUnit ex_x0_0=1;
  parameter Types.PerUnit ex_x1_0=1;
  parameter Real KVi=1;
  parameter Types.PerUnit xiqmax=1;
  parameter Types.PerUnit xiqmin=1;
  Modelica.Blocks.Interfaces.RealInput Qgen
    "Reactive Power produced by the Generator" annotation (Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-148.0,42.372}),
      iconTransformation(
        origin={2.0,-154.0},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealInput Qord "Reactive power command"
    annotation (Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-148.0,-25.5774}),
      iconTransformation(
        origin={2.0,6.0},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealInput Pord "Active power command" annotation (
      Placement(
      transformation(
        origin={-148.0,-136.6369},
        extent={{-102.0,54.0},{-62.0,94.0}}),
      iconTransformation(
        origin={2.0,-47.414},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealInput Vterm "Terminal voltage" annotation (
      Placement(
      transformation(
        origin={-148.0,-174.0},
        extent={{-102.0,54.0},{-62.0,94.0}}),
      iconTransformation(
        origin={2.0,-94.0},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealOutput Ipcmd "Current command" annotation (
      Placement(
      transformation(
        origin={128.0,-154.0},
        extent={{102.0,54.0},{62.0,94.0}}),
      iconTransformation(
        origin={-2.0,1.3917},
        extent={{102.0,54.0},{62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealOutput Efd "Excitation voltage" annotation (
      Placement(
      transformation(
        extent={{102.0,54.0},{62.0,94.0}},
        origin={128.0,-2.1101}),
      iconTransformation(
        origin={-2.0,-61.4483},
        extent={{102.0,54.0},{62.0,94.0}})));
protected
  Modelica.Blocks.Math.Division division1 annotation (Placement(transformation(
        origin={-166.6875,-80.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=1.1, uMin=-inf) annotation (
      Placement(transformation(
        origin={-135.6935,-80.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax=qmax, uMin=qmin) annotation (
      Placement(transformation(
        origin={-186.1796,47.2887},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add add1(k1=-1) annotation (Placement(transformation(
        origin={-150.0,80.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator1(
    k=KQi,
    y_start=ex_x0_0,
    outMax=99999,
    outMin=-99999) annotation (Placement(transformation(
        origin={-114.9137,80.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add add2(k2=-1) annotation (Placement(transformation(
        origin={-80.0,73.0337},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Gain gain1(k=KVi) annotation (Placement(transformation(
        origin={-51.7827,73.3274},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  lim_exc_s1 lim_exc_s11(
    typpe=1,
    xiqmax=xiqmax,
    xiqmin=xiqmin) annotation (Placement(transformation(
        origin={-14.0506,73.3274},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  lim_exc_s1 lim_exc_s12(
    typpe=2,
    xiqmax=xiqmax,
    xiqmin=xiqmin) annotation (Placement(transformation(
        origin={61.5119,72.4087},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Continuous.Integrator integrator1(y_start=ex_x1_0)
    annotation (Placement(transformation(
        origin={15.875,72.9494},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(
        origin={19.4593,103.9435},
        extent={{-10.0,-10.0},{10.0,10.0}})));
equation
  connect(const.y, lim_exc_s12.Efd) annotation (Line(
      origin={43.2488,91.1761},
      points={{-12.7895,12.7674},{3.2632,12.7674},{3.2632,-12.7674},{6.2631,-12.7674}},
      color={0,0,127}));

  connect(integrator1.y, lim_exc_s12.Vref) annotation (Line(
      origin={42.3527,72.7755},
      points={{-15.4777,0.1739},{4.1592,0.1739},{4.1592,-0.17397},{7.1592,-0.17397}},
      color={0,0,127}));

  connect(lim_exc_s11.Efd, lim_exc_s12.y) annotation (Line(
      origin={28.4241,91.1481},
      points={{-54.4747,-11.8207},{-58.9866,-12.1987},{-58.9866,31.3162},{
          65.692,31.3162},{65.692,-19.1174},{44.0878,-18.7394}},
      color={0,0,127}));
  connect(lim_exc_s12.Vt, Vterm) annotation (Line(
      origin={-86.5355,-18.5464},
      points={{136.0474,84.9551},{119.0414,84.5771},{119.0414,68.9244},{-10.9824,
          68.9244},{-10.9824,-35.1262},{-108.1222,-35.1262},{-108.1222,-78.2155},
          {-143.4645,-78.2155},{-143.4645,-81.4536}},
      color={0,0,127}));
  connect(lim_exc_s12.y, Efd) annotation (Line(
      origin={164.128,72.1493},
      points={{-91.6161,0.2594},{22.872,0.2594},{22.872,-0.2594},{45.872,-0.2594}},
      color={0,0,127}));

  connect(gain1.y, lim_exc_s11.Vref) annotation (Line(
      origin={-31.2336,73.4238},
      points={{-9.5491,-0.0964},{2.183,-0.0964},{2.183,0.09643},{5.183,0.09643}},
      color={0,0,127}));

  connect(lim_exc_s11.y, integrator1.u) annotation (Line(
      origin={0.6436,73.1384},
      points={{-3.6942,0.189},{0.2314,0.189},{0.2314,-0.189},{3.2314,-0.189}},
      color={0,0,127}));
  connect(lim_exc_s11.Vt, Vterm) annotation (Line(
      origin={-127.081,-18.8882},
      points={{101.0304,86.2156},{91.9292,85.8376},{91.9292,68.8882},{29.1852,
          68.8882},{29.1852,-35.5403},{-67.9547,-35.5403},{-67.9547,-78.6296},{
          -102.919,-78.6296},{-102.919,-81.1118}},
      color={0,0,127}));
  connect(Qgen, add1.u1) annotation (Line(
      origin={-180.5,101.186},
      points={{-49.5,15.186},{15.5,15.186},{15.5,-15.186},{18.5,-15.186}},
      color={0,0,127}));
  connect(Qord, limiter2.u) annotation (Line(
      origin={-207.6347,47.8557},
      points={{-22.3653,0.5669},{6.4551,0.567},{6.4551,-0.567},{9.4551,-0.567}},
      color={0,0,127}));

  connect(limiter1.y, Ipcmd) annotation (Line(
      origin={42.6532,-80.0},
      points={{-167.3467,0.0},{167.3468,0.0}},
      color={0,0,127}));
  connect(Vterm, division1.u2) annotation (Line(
      origin={-193.0156,-93.0},
      points={{-36.9844,-7.0},{11.3281,-7.0},{11.3281,7.0},{14.3281,7.0}},
      color={0,0,127}));
  connect(add2.u2, Vterm) annotation (Line(
      origin={-162.3359,-38.3305},
      points={{70.3359,105.3642},{64.818,105.3642},{64.818,-15.7201},{-32.3219,
          -15.7201},{-32.3219,-58.8094},{-67.6641,-58.8094},{-67.6641,-61.6695}},
      color={0,0,127}));

  connect(Pord, division1.u1) annotation (Line(
      origin={-193.0156,-68.3185},
      points={{-36.9844,5.6816},{11.3281,5.6815},{11.3281,-5.6815},{14.3281,-5.6815}},
      color={0,0,127}));

  connect(add2.y, gain1.u) annotation (Line(
      origin={-65.5871,73.1805},
      points={{-3.4129,-0.1468},{0.8043,-0.1468},{0.8043,0.1469},{1.8044,0.1469}},
      color={0,0,127}));

  connect(limIntegrator1.y, add2.u1) annotation (Line(
      origin={-96.4784,79.5168},
      points={{-7.4353,0.4832},{1.4784,0.4832},{1.4784,-0.4831},{4.4784,-0.4831}},
      color={0,0,127}));

  connect(add1.y, limIntegrator1.u) annotation (Line(
      origin={-132.9568,80.0},
      points={{-6.0432,0},{6.0431,0}},
      color={0,0,127}));
  connect(limiter2.y, add1.u2) annotation (Line(
      origin={-166.7949,60.6443},
      points={{-8.3847,-13.3556},{1.7949,-13.3556},{1.7949,13.3557},{4.7949,
          13.3557}},
      color={0,0,127}));
  connect(division1.y, limiter1.u) annotation (Line(
      origin={-151.6905,-80.0},
      points={{-3.997,0.0},{3.997,0.0}},
      color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-210.0,-148.5},{210.0,148.5}},
        preserveAspectRatio=true,
        grid={10,10}), graphics),
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        grid={10,10}), graphics={Rectangle(
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100.0,-100.0},{100.0,100.0}}),Text(
          origin={-2.5076,2.901},
          fillPattern=FillPattern.Solid,
          extent={{-67.4924,-47.099},{67.4924,47.099}},
          textString="Electrical Control",
          fontName="Arial")}));
end Electrical_Control;
