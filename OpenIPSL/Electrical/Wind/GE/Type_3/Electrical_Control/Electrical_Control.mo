within OpenIPSL.Electrical.Wind.GE.Type_3.Electrical_Control;
model Electrical_Control "Type 3 wind machine electrical control"
  import Modelica.Constants.inf;
  parameter Types.PerUnit qmax=1 "pu";
  parameter Types.PerUnit qmin=0 "pu";
  parameter Real KQi=1;
  parameter Real Qbase_VAr=50000000 "Reactive power base for droop";
  parameter Types.PerUnit ex_x0_0=1 "pu";
  parameter Types.PerUnit ex_x1_0=1 "pu";
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
        origin={-148,-224},
        extent={{-102,54},{-62,94}}),
      iconTransformation(
        origin={2,-94},
        extent={{-102,54},{-62,94}})));
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
  Modelica.Blocks.Math.Division division annotation(
    Placement(transformation(origin = {-170, 10}, extent = {{-10, -10}, {10, 10}})));
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
        origin={-176.18,97.2887},
        extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Add add1(k1=-1) annotation (Placement(transformation(
        origin={-140,100},
        extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator1(
    k=KQi,
    y_start=ex_x0_0,
    outMax=99999,
    outMin=-99999) annotation (Placement(transformation(
        origin={-104.914,90},
        extent={{-10,-10},{10,10}})));
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
public
  Modelica.Blocks.Sources.Constant const1(k = Qbase_VAr) annotation(
    Placement(transformation(origin = {-200.541, -16.056}, extent = {{-10, -10}, {10, 10}})));
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
      points = {{49.5115, 66.4087}, {49.5115, 66.0307}, {32.5055, 66.0307}, {32.5055, 50.378}, {-97.5179, 50.378}, {-97.5179, -53.6726}, {-194.657, -53.6726}, {-194.657, -96.7619}, {-230, -96.7619}, {-230, -150}},
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
      points = {{-26.051, 67.3274}, {-26.051, 66.9494}, {-35.1518, 66.9494}, {-35.1518, 50}, {-97.8958, 50}, {-97.8958, -54.4285}, {-195.036, -54.4285}, {-195.036, -97.5178}, {-230, -97.5178}, {-230, -150}},
      color={0,0,127}));

  connect(limiter1.y, Ipcmd) annotation (Line(
      origin={42.6532,-80.0},
      points={{-167.3467,0.0},{167.3468,0.0}},
      color={0,0,127}));
  connect(Vterm, division1.u2) annotation (Line(
      points = {{-230, -150}, {-181.688, -150}, {-181.688, -86}, {-178.688, -86}},
      color={0,0,127}));
  connect(add2.u2, Vterm) annotation (Line(
      points = {{-92.0001, 67.0335}, {-97.518, 67.0335}, {-97.518, -54.0506}, {-194.658, -54.0506}, {-194.658, -150}, {-230, -150}},
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
      points = {{-94, 90}, {-95, 90}, {-95, 79.0337}, {-92, 79.0337}},
      color={0,0,127}));

  connect(add1.y, limIntegrator1.u) annotation (Line(
      points = {{-129, 100}, {-132.957, 100}, {-132.957, 90}, {-117, 90}},
      color={0,0,127}));
  connect(limiter2.y, add1.u2) annotation (Line(
      points = {{-165, 97}, {-165, 94}, {-152, 94}},
      color={0,0,127}));
  connect(division1.y, limiter1.u) annotation (Line(
      origin={-151.6905,-80.0},
      points={{-3.997,0.0},{3.997,0.0}},
      color={0,0,127}));
  connect(division.u2, const1.y) annotation(
    Line(points = {{-182, 4}, {-186, 4}, {-186, -16}, {-190, -16}}, color = {0, 0, 127}));
  connect(Qgen, add1.u1) annotation(
    Line(points = {{-230, 120}, {-170, 120}, {-170, 110}, {-150, 110}}, color = {0, 0, 127}));
  connect(Qord, division.u1) annotation(
    Line(points = {{-230, 50}, {-200, 50}, {-200, 20}, {-180, 20}}, color = {0, 0, 127}));
  connect(division.y, limiter2.u) annotation(
    Line(points = {{-160, 10}, {-150, 10}, {-150, 70}, {-200, 70}, {-200, 100}, {-190, 100}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-210,-148.5},{210,148.5}},
        preserveAspectRatio=true,
        grid={10,10}), graphics= {Text(origin = {-135, 120}, extent = {{-25, 10}, {25, -10}}, textString = "This needs to be scaled by Q base...")}),
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        grid={10,10}), graphics={Rectangle(
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100.0,-100.0},{100.0,100.0}}),Text(
          origin={-2.5076,2.901},
          extent={{-67.4924,-47.099},{67.4924,47.099}},
          textString="Electrical Control",
          fontName="Arial")}));
end Electrical_Control;