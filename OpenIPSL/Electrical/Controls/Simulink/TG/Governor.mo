within OpenIPSL.Electrical.Controls.Simulink.TG;
model Governor "Speed governor model for hydro turbines"
  Modelica.Blocks.Interfaces.RealInput Omega "Rotor speed in p.u" annotation (
      Placement(transformation(extent={{-96,26},{-86,38}}), iconTransformation(
          extent={{-14,30},{-4,40}})));
  Modelica.Blocks.Sources.Constant Omega_n(k=1) "Nominal rotor speed in p.u"
    annotation (Placement(transformation(extent={{-94,6},{-82,18}})));
  Modelica.Blocks.Math.Gain Gain1(k=2)
    annotation (Placement(transformation(extent={{10,18},{24,32}})));
  Modelica.Blocks.Math.Gain Gain2(k=0.4)
    annotation (Placement(transformation(extent={{10,0},{24,14}})));
  Modelica.Blocks.Continuous.Integrator Integrator(
    k=1,
    y_start=p0,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{30,0},{44,14}})));
  Modelica.Blocks.Math.Gain Droop(k=D) "Permanent speed droop" annotation (
      Placement(transformation(
        extent={{5.5,-5.5},{-5.5,5.5}},
        rotation=270,
        origin={-53.5,6.5})));
  Modelica.Blocks.Math.Gain Gain3(k=5)
    annotation (Placement(transformation(extent={{92,10},{106,24}})));
  Modelica.Blocks.Nonlinear.Limiter Limited(uMin=-0.1, uMax=0.1)
    annotation (Placement(transformation(extent={{112,10},{126,24}})));
  Modelica.Blocks.Continuous.LimIntegrator imLimitedIntegrator(
    outMax=1,
    k=1,
    outMin=0,
    y_start=p0,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{132,10},{146,24}})));
  Modelica.Blocks.Interfaces.RealOutput z "Gate opening" annotation (Placement(
        transformation(extent={{156,12},{166,22}}), iconTransformation(extent={
            {148,12},{158,22}})));
  parameter Real D "Permanent speed droop, g19=g20=0.08, all others=0.04";
  parameter Real p0 "Initialization, initial electrical power";
  Modelica.Blocks.Interfaces.RealInput Pm_set annotation (Placement(
        transformation(
        extent={{5,-6},{-5,6}},
        rotation=180,
        origin={-90,-17}), iconTransformation(
        extent={{5,-6},{-5,6}},
        rotation=180,
        origin={-10,14})));
  Modelica.Blocks.Interfaces.RealInput Pe annotation (Placement(transformation(
        extent={{5,-6},{-5,6}},
        rotation=180,
        origin={-90,-33}), iconTransformation(
        extent={{5,-6},{-5,6}},
        rotation=180,
        origin={-10,-8})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag SimpleLag1(
    K=1,
    T=2,
    y_start=p0)
    annotation (Placement(transformation(extent={{-72,-40},{-58,-26}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{68,6},{88,26}})));
  Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-53,-9})));
  Modelica.Blocks.Math.Add add1 annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        origin={-41,25})));
  Modelica.Blocks.Math.Add add2(k1=-1) annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        origin={-65,29})));
  Modelica.Blocks.Math.Add add3 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        origin={58,16})));
equation
  connect(Gain3.y, Limited.u) annotation (Line(points={{106.7,17},{106.7,17},{
          110.6,17}}, color={0,0,127}));
  connect(Limited.y, imLimitedIntegrator.u) annotation (Line(points={{126.7,17},
          {128.35,17},{128.35,17},{130.6,17}}, color={0,0,127}));
  connect(imLimitedIntegrator.y, z) annotation (Line(points={{146.7,17},{153.35,
          17},{153.35,17},{161,17}}, color={0,0,127}));
  connect(feedback.y, Gain3.u) annotation (Line(points={{87,16},{88,16},{88,17},
          {90.6,17}}, color={0,0,127}));
  connect(feedback.u2, z) annotation (Line(points={{78,8},{78,-6},{152,-6},{152,
          17},{153.35,17},{161,17}}, color={0,0,127}));
  connect(Pe, SimpleLag1.u) annotation (Line(points={{-90,-33},{-81,-33},{-73.4,
          -33}}, color={0,0,127}));
  connect(add.y, Droop.u) annotation (Line(points={{-53,-3.5},{-53,-0.1},{-53.5,
          -0.1}}, color={0,0,127}));
  connect(add.u2, SimpleLag1.y) annotation (Line(points={{-50,-15},{-50,-33},{-57.3,
          -33}}, color={0,0,127}));
  connect(Pm_set, add.u1)
    annotation (Line(points={{-90,-17},{-56,-17},{-56,-15}}, color={0,0,127}));
  connect(Droop.y, add1.u2) annotation (Line(points={{-53.5,12.55},{-53.5,22},{
          -47,22}}, color={0,0,127}));
  connect(add2.u1, Omega)
    annotation (Line(points={{-71,32},{-82,32},{-91,32}}, color={0,0,127}));
  connect(Omega_n.y, add2.u2) annotation (Line(points={{-81.4,12},{-78,12},{-78,
          26},{-71,26}}, color={0,0,127}));
  connect(add2.y, add1.u1) annotation (Line(points={{-59.5,29},{-53.75,29},{-53.75,
          28},{-47,28}}, color={0,0,127}));
  connect(Gain1.u, add1.y) annotation (Line(points={{8.6,25},{-13.7,25},{-35.5,
          25}}, color={0,0,127}));
  connect(Gain2.u, add1.y) annotation (Line(points={{8.6,7},{0,7},{0,25},{-13.7,
          25},{-35.5,25}}, color={0,0,127}));
  connect(Gain2.y, Integrator.u) annotation (Line(points={{24.7,7},{26.35,7},{
          26.35,7},{28.6,7}}, color={0,0,127}));
  connect(add3.y, feedback.u1)
    annotation (Line(points={{64.6,16},{67.3,16},{70,16}}, color={0,0,127}));
  connect(Integrator.y, add3.u2) annotation (Line(points={{44.7,7},{48,7},{48,
          12.4},{50.8,12.4}}, color={0,0,127}));
  connect(Gain1.y, add3.u1) annotation (Line(points={{24.7,25},{44,25},{44,19.6},
          {50.8,19.6}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            160,100}}), graphics={Text(
          extent={{90,-6},{128,-10}},
          textColor={0,0,127},
          textString="Servomotor"),Text(
          extent={{14,34},{52,30}},
          textColor={0,0,127},
          textString="PI Control"),Text(
          extent={{-102,36},{-78,34}},
          textColor={0,0,127},
          textString="w (rotor speed)"),Text(
          extent={{-100,-40},{-76,-42}},
          textColor={0,0,127},
          textString="P (active power)"),Text(
          extent={{-98,-8},{-74,-10}},
          textColor={0,0,127},
          textString="P0 (power set point)"),Text(
          extent={{-50,6},{-32,8}},
          textColor={0,0,127},
          textString="Speed drop")}),
    Icon(coordinateSystem(extent={{-100,-100},{160,100}}, preserveAspectRatio=
            false), graphics={Rectangle(extent={{-4,46},{150,-20}}, lineColor={
          0,0,255}),Text(
          extent={{24,30},{126,6}},
          textColor={0,0,255},
          textString="Speed Governor"),Text(
          extent={{0,42},{20,26}},
          textColor={0,0,255},
          textString="Omega"),Text(
          extent={{136,24},{152,12}},
          textColor={0,0,255},
          textString="z"),Text(
          extent={{0,20},{20,4}},
          textColor={0,0,255},
          textString="Pmset"),Text(
          extent={{0,-2},{20,-18}},
          textColor={0,0,255},
          textString="Pe")}));
end Governor;
