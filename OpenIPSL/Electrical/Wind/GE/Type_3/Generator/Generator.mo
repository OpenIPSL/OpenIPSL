within OpenIPSL.Electrical.Wind.GE.Type_3.Generator;
model Generator "Implementation of type 3 wind generator"
  import Modelica.Constants.pi;
  parameter Types.Frequency freq=50;
  parameter Real omega_0=2*pi*freq;
  parameter Real Kpllp=1;
  parameter Types.PerUnit ge_x0_0=1;
  parameter Types.PerUnit ge_x1_0=1;
  parameter Types.PerUnit ge_x2_0=1;
  parameter Types.ApparentPower GEN_base=1;
  parameter Types.ApparentPower SYS_base=1;
  parameter Types.PerUnit Lpp=1;
  Modelica.Blocks.Interfaces.RealInput Efd "Excitation voltage" annotation (
      Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-86.1542,14.0368}),
      iconTransformation(
        origin={2.0,-130.6017},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealInput Ipcmd "Current command" annotation (
      Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-86.1542,-12.4057}),
      iconTransformation(
        origin={2.0,-22.352},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealOutput Vt "Terminal voltage" annotation (
      Placement(
      transformation(
        origin={68.0,-29.8146},
        extent={{102.0,54.0},{62.0,94.0}}),
      iconTransformation(
        origin={-2.0,0.2537},
        extent={{102.0,54.0},{62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealOutput Pgen "Active power" annotation (
      Placement(
      transformation(
        origin={68.0,-114.0},
        extent={{102.0,54.0},{62.0,94.0}}),
      iconTransformation(
        origin={-2.0,-94.0},
        extent={{102.0,54.0},{62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealOutput Qgen "Reactive power" annotation (
      Placement(
      transformation(
        origin={68.0,-151.9188},
        extent={{102.0,54.0},{62.0,94.0}}),
      iconTransformation(
        origin={-2.0,-134.0},
        extent={{102.0,54.0},{62.0,94.0}})));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(
      transformation(
        origin={-158.1542,-62.9104},
        extent={{-10.0,-10.0},{10.0,10.0}}),
      iconTransformation(
        origin={0.0,-110.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Types.Angle Anglet;
protected
  Types.PerUnit Vt_re;
  Types.PerUnit Vt_im;
  Modelica.Blocks.Continuous.Integrator integrator1(k=omega_0, y_start=ge_x2_0)
    annotation (Placement(transformation(
        origin={-67.1876,-70.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=0.1, uMin=-0.1) annotation (
      Placement(transformation(
        origin={-97.7647,-70.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Gain gain1(k=Kpllp/omega_0) annotation (Placement(
        transformation(
        origin={-125.925,-70.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Cos cos1 annotation (Placement(transformation(
        origin={-35.4375,-56.5604},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Sin sin1 annotation (Placement(transformation(
        origin={-35.4375,-81.75},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
        origin={-1.5708,-57.7032},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(
        origin={-1.3063,-82.2968},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(
        origin={27.0042,-63.4938},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Gain gain2(k=1/Lpp) annotation (Placement(transformation(
        origin={76.305,-30.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Gain gain3(k=1/Lpp) annotation (Placement(transformation(
        origin={70.0,-3.3186},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Continuous.Integrator integrator2(k=1/0.01, y_start=ge_x0_0)
    annotation (Placement(transformation(
        origin={-87.6272,90.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Continuous.Integrator integrator3(k=1/0.01, y_start=ge_x1_0)
    annotation (Placement(transformation(
        origin={-90.2646,56.35},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add add2(k2=-1) annotation (Placement(transformation(
        origin={-120.0,90.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add add3(k2=-1) annotation (Placement(transformation(
        origin={-120.3313,55.9354},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Gain gain4(k=-1/Lpp) annotation (Placement(transformation(
        origin={-54.097,90.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add add4(k2=-1) annotation (Placement(transformation(
        origin={28.575,84.2094},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Product product3 annotation (Placement(transformation(
        origin={0.2646,65.4063},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Product product4 annotation (Placement(transformation(
        origin={0.0,90.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Product product5 annotation (Placement(transformation(
        origin={0.0,40.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Product product6 annotation (Placement(transformation(
        origin={0.2646,15.4063},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add add5 annotation (Placement(transformation(
        origin={28.575,34.2094},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add add6 annotation (Placement(transformation(
        origin={105.9559,-23.9376},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add add7(k2=-1) annotation (Placement(transformation(
        origin={100.0,2.3228},
        extent={{-10.0,-10.0},{10.0,10.0}})));
equation
  connect(integrator2.y, gain4.u) annotation (Line(
      origin={-71.3621,90.0},
      points={{-5.2651,0.0},{5.2651,0.0}},
      color={0,0,127}));
  connect(gain4.y, product5.u1) annotation (Line(
      origin={-31.724,68.0},
      points={{-11.373,22.0},{6.1406,22.0},{6.1406,-22.0},{19.724,-22.0}},
      color={0,0,127}));
  connect(gain4.y, product3.u1) annotation (Line(
      origin={-31.7901,80.7032},
      points={{-11.3069,9.2968},{6.2068,9.2968},{6.2068,-9.2968},{20.0547,-9.2969}},
      color={0,0,127}));

  connect(add3.u1, Ipcmd) annotation (Line(
      origin={-147.4735,61.7648},
      points={{15.1422,0.1706},{2.7693,0.1706},{2.7693,-0.1705},{-20.6807,-0.1705}},
      color={0,0,127}));

  connect(Efd, add2.u1) annotation (Line(
      origin={-142.5385,92.0184},
      points={{-25.6157,-3.9816},{7.5385,-3.9816},{7.5385,3.9816},{10.5385,
          3.9816}},
      color={0,0,127}));
  connect(gain2.y, add6.u2) annotation (Line(
      origin={90.7932,-29.9688},
      points={{-3.4882,-0.0312},{0.1627,-0.0312},{0.1627,0.0312},{3.1627,0.0312}},
      color={0,0,127}));

  connect(add7.u1, add4.y) annotation (Line(
      origin={62.1454,46.0725},
      points={{25.8546,-37.7497},{-16.096,-37.676},{-16.096,37.676},{-22.5704,
          38.1369}},
      color={0,0,127}));
  connect(gain3.y, add7.u2) annotation (Line(
      origin={84.75,-3.4979},
      points={{-3.75,0.1793},{0.25,0.1793},{0.25,-0.1793},{3.25,-0.1793}},
      color={0,0,127}));
  connect(add6.u1, add5.y) annotation (Line(
      origin={44.1804,8.1359},
      points={{49.7755,-26.0735},{-1.6054,-26.0735},{-1.6054,26.0735},{-4.6054,
          26.0735}},
      color={0,0,127}));
  connect(integrator3.y, product6.u1) annotation (Line(
      origin={-52.0781,40.0},
      points={{-27.1865,16.35},{15.3823,17.4718},{15.3823,-17.4718},{40.3427,-18.5937}},
      color={0,0,127}));

  connect(integrator3.y, product4.u1) annotation (Line(
      origin={-51.7474,76.9688},
      points={{-27.5172,-20.6188},{15.3161,-20.6188},{15.3161,19.0312},{39.7474,
          19.0312}},
      color={0,0,127}));
  connect(product3.u2, sin1.y) annotation (Line(
      origin={-15.7932,-12.4948},
      points={{4.0578,71.9011},{-1.6755,70.5781},{-1.6755,-70.5781},{-8.6443,-69.2552}},
      color={0,0,127}));

  connect(product6.u2, sin1.y) annotation (Line(
      origin={-15.5286,-35.5782},
      points={{3.7932,44.9845},{-1.6755,45.5782},{-1.6755,-45.5782},{-8.9089,-46.1718}},
      color={0,0,127}));

  connect(product1.y, add1.u1) annotation (Line(
      origin={13.1104,-57.5985},
      points={{-3.6812,-0.1047},{0.8938,-0.1047},{0.8938,0.1047},{1.8938,0.1047}},
      color={0,0,127}));

  connect(product2.y, add1.u2) annotation (Line(
      origin={13.1766,-75.8953},
      points={{-3.4829,-6.4015},{0.8276,-6.4015},{0.8276,6.4015},{1.8276,6.4015}},
      color={0,0,127}));

  connect(cos1.y, product1.u2) annotation (Line(
      origin={-17.7875,-60.1318},
      points={{-6.65,3.5714},{1.2167,3.5714},{1.2167,-3.5714},{4.2167,-3.5714}},
      color={0,0,127}));

  connect(sin1.y, product2.u1) annotation (Line(
      origin={-17.5891,-79.0234},
      points={{-6.8484,-2.7266},{1.2828,-2.7266},{1.2828,2.7266},{4.2828,2.7266}},
      color={0,0,127}));

  connect(add1.y, gain1.u) annotation (Line(
      origin={-45.4625,-77.6549},
      points={{83.4667,14.1611},{85.4625,14.1611},{85.4625,-22.3451},{-95.4625,
          -22.3451},{-95.4625,7.6549},{-92.4625,7.6549}},
      color={0,0,127}));
  connect(cos1.y, product4.u2) annotation (Line(
      origin={-23.7531,13.9844},
      points={{-0.6844,-70.5448},{1.6094,-70.2802},{1.6094,70.2802},{11.7531,
          70.0156}},
      color={0,0,127}));
  connect(cos1.y, product5.u2) annotation (Line(
      origin={-23.4885,-11.5448},
      points={{-0.949,-45.0156},{1.6094,-45.0156},{1.6094,45.5448},{11.4885,
          45.5448}},
      color={0,0,127}));
  connect(product4.y, add4.u1) annotation (Line(
      origin={14.6813,90.1047},
      points={{-3.6813,-0.1047},{0.8938,-0.1047},{0.8938,0.1047},{1.8937,0.1047}},
      color={0,0,127}));

  connect(product3.y, add4.u2) annotation (Line(
      origin={14.7474,71.8078},
      points={{-3.4828,-6.4015},{0.8276,-6.4015},{0.8276,6.4016},{1.8276,6.4016}},
      color={0,0,127}));

  connect(product5.y, add5.u1) annotation (Line(
      origin={14.6813,40.1047},
      points={{-3.6813,-0.1047},{0.8938,-0.1047},{0.8938,0.1047},{1.8937,0.1047}},
      color={0,0,127}));

  connect(product6.y, add5.u2) annotation (Line(
      origin={14.7474,21.8078},
      points={{-3.4828,-6.4015},{0.8276,-6.4015},{0.8276,6.4016},{1.8276,6.4016}},
      color={0,0,127}));

  connect(integrator1.y, sin1.u) annotation (Line(
      origin={-51.125,-75.875},
      points={{-5.0626,5.875},{0.6875,5.875},{0.6875,-5.875},{3.6875,-5.875}},
      color={0,0,127}));
  connect(integrator1.y, cos1.u) annotation (Line(
      origin={-51.125,-63.2802},
      points={{-5.0626,-6.7198},{0.6875,-6.7198},{0.6875,6.7198},{3.6875,6.7198}},
      color={0,0,127}));

  connect(gain1.y, limiter1.u) annotation (Line(
      origin={-112.3448,-70.0},
      points={{-2.5802,0.0},{2.5801,0.0}},
      color={0,0,127}));
  connect(limiter1.y, integrator1.u) annotation (Line(
      origin={-82.9761,-70.0},
      points={{-3.7886,0.0},{3.7885,0.0}},
      color={0,0,127}));
  connect(integrator3.y, add3.u2) annotation (Line(
      origin={-105.7979,48.7618},
      points={{26.5333,7.5882},{29.5333,7.5882},{29.5333,-8.7618},{-29.5333,-8.7618},
          {-29.5333,1.1736},{-26.5334,1.1736}},
      color={0,0,127}));
  connect(integrator2.y, add2.u2) annotation (Line(
      origin={-108.1753,82.6179},
      points={{31.5481,7.3821},{34.5482,7.3821},{34.5482,-10.3866},{-26.4976,-10.3866},
          {-26.4976,2.3134},{-23.8247,2.3134},{-23.8247,1.3821}},
      color={0,0,127}));
  connect(add3.y, integrator3.u) annotation (Line(
      origin={-105.5312,56.1427},
      points={{-3.8001,-0.2073},{0.2667,-0.2073},{0.2667,0.2073},{3.2666,0.2073}},
      color={0,0,127}));

  connect(add2.y, integrator2.u) annotation (Line(
      origin={-104.3136,90.0},
      points={{-4.6864,0.0},{4.6864,0.0}},
      color={0,0,127}));
  Vt_re = p.vr;
  Vt_im = p.vi;
  add7.y*GEN_base/SYS_base = -p.ir;
  add6.y*GEN_base/SYS_base = -p.ii;
  Vt = sqrt(Vt_re^2 + Vt_im^2);
  Anglet = atan(Vt_im/Vt_re);
  product1.u1 = Vt_im;
  product2.u2 = Vt_re;
  gain2.u = Vt_re;
  gain3.u = Vt_im;
  Pgen = Vt_re*add7.y + Vt_im*add6.y;
  Qgen = Vt_im*add7.y - Vt_re*add6.y;
  annotation (
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        grid={10,10}), graphics),
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        grid={10,10}), graphics={Rectangle(
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100.0,-100.0},{100.0,100.0}}),Text(
          origin={0.0,-3.1866},
          fillPattern=FillPattern.Solid,
          extent={{-64.7389,-33.1866},{64.7389,33.1866}},
          textString="Generator",
          fontName="Arial")}));
end Generator;
