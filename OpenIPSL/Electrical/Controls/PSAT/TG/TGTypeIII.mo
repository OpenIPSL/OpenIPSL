within OpenIPSL.Electrical.Controls.PSAT.TG;
model TGTypeIII
  "Hydro Turbine (Linear model) and Governor (Standard model)- control scheme Type 3"
  parameter Types.PerUnit P_0 "Active power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit wref=1 "Reference speed";
  parameter Types.PerUnit Tg "Pilot valve droop";
  parameter Types.PerUnit gmax "Maximum gate opening";
  parameter Types.PerUnit gmin "Minimum gate opening";
  parameter Types.PerUnit vmax "Maximum gate opening rate";
  parameter Types.PerUnit vmin "Minimum gate opening rate";
  parameter Types.Time Tp "Pilot valve time constant";
  parameter Types.Time Tr "Dashpot time constant";
  parameter Real delta "Transient speed droop [pu/pu]";
  parameter Real sigma "Permanent speed droop [pu/pu]";
  parameter Types.Time Tw "Water starting time";
  parameter Real a11 "Deriv. of flow rate vs. turbine head";
  parameter Real a13 "Deriv. of flow rate vs. gate position";
  parameter Real a21 "Deriv. of torque vs. turbine head";
  parameter Real a23 "Deriv. of torque vs. gate position";
  parameter Real int3;
  Types.PerUnit deltaG "Gate position variation";
  Types.PerUnit G "Gate position";
  Modelica.Blocks.Continuous.Integrator integrator(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=0) annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Math.Gain gain(k=1/(Tg*Tp))
    annotation (Placement(transformation(extent={{-140,-10},{-120,10}})));
  Modelica.Blocks.Math.Gain gain1(k=1/Tp) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-76,-30})));
  Modelica.Blocks.Continuous.Integrator integrator1(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=0)
    annotation (Placement(transformation(extent={{-86,-10},{-66,10}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-116,-10},{-96,10}})));
  Modelica.Blocks.Math.Gain gain2(k=delta + sigma) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-76,30})));
  Modelica.Blocks.Math.Gain gain3(k=sigma/Tr) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-130,-60})));
  Modelica.Blocks.Math.Gain gain5(k=1/Tr) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={-74,-90})));
  Modelica.Blocks.Continuous.Integrator integrator2(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=0) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-76,-60})));
  Modelica.Blocks.Math.Feedback feedback1 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-40,-60})));
  Modelica.Blocks.Math.Gain gain4(k=1/(a11*Tw)) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={140,-70})));
  Modelica.Blocks.Continuous.Integrator integrator3(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=int3) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={150,-40})));
  Modelica.Blocks.Math.Feedback feedback2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={120,-40})));
  Modelica.Blocks.Math.Gain G6(k=(a11*a23 - a13*a21)/a11)
    annotation (Placement(transformation(extent={{84,-10},{104,10}})));
  Modelica.Blocks.Math.Gain gain7(k=a13*a21/(a11*a11*Tw))
    annotation (Placement(transformation(extent={{84,-50},{104,-30}})));
  Modelica.Blocks.Interfaces.RealInput w "Rotor speed [pu]" annotation (
      Placement(transformation(extent={{-280,-20},{-240,20}}), iconTransformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput pm "Mechanical power [pu]" annotation (
      Placement(transformation(extent={{200,-10},{220,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=vmax, uMin=vmin)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=gmax, uMin=gmin)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Blocks.Math.Add add(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{-200,-10},{-180,10}})));
  Modelica.Blocks.Math.Add3 add3_1(
    k1=-1,
    k2=1,
    k3=1) annotation (Placement(transformation(extent={{-170,-10},{-150,10}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Blocks.Math.Add add2
    annotation (Placement(transformation(extent={{172,-10},{192,10}})));
  Modelica.Blocks.Sources.Constant const(k=P_0)
    annotation (Placement(transformation(extent={{10,40},{30,60}})));
  Modelica.Blocks.Sources.Constant const1(k=wref)
    annotation (Placement(transformation(extent={{-240,10},{-220,30}})));
equation
  deltaG = limiter1.y;
  G = add1.y;
  connect(gain1.y, feedback.u2) annotation (Line(
      points={{-87,-30},{-106,-30},{-106,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback.y, integrator1.u) annotation (Line(
      points={{-97,0},{-88,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, feedback.u1) annotation (Line(
      points={{-119,0},{-114,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain5.y, feedback1.u2) annotation (Line(
      points={{-63,-90},{-40,-90},{-40,-68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback1.y, integrator2.u) annotation (Line(
      points={{-49,-60},{-64,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator2.y, gain3.u) annotation (Line(
      points={{-87,-60},{-118,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain4.y, feedback2.u2) annotation (Line(
      points={{129,-70},{120,-70},{120,-48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback2.y, integrator3.u) annotation (Line(
      points={{129,-40},{138,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain7.y, feedback2.u1) annotation (Line(
      points={{105,-40},{112,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain1.u, integrator1.y) annotation (Line(
      points={{-64,-30},{-58.6,-30},{-58.6,0},{-65,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator2.y, gain5.u) annotation (Line(
      points={{-87,-60},{-93.7,-60},{-93.7,-90},{-86,-90}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator3.y, gain4.u) annotation (Line(
      points={{161,-40},{166,-40},{166,-70},{152,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator1.y, limiter.u) annotation (Line(
      points={{-65,0},{-52,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter.y, integrator.u) annotation (Line(
      points={{-29,0},{-22,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator.y, limiter1.u) annotation (Line(
      points={{1,0},{8,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback1.u1, limiter1.y) annotation (Line(
      points={{-32,-60},{36,-60},{36,0},{31,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter1.y, gain2.u) annotation (Line(
      points={{31,0},{36,0},{36,30},{-64,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(w, add.u2) annotation (Line(
      points={{-260,0},{-219,0},{-219,-6},{-202,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain2.y, add3_1.u1) annotation (Line(
      points={{-87,30},{-175.7,30},{-175.7,8},{-172,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, add3_1.u2) annotation (Line(
      points={{-179,0},{-172,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain3.y, add3_1.u3) annotation (Line(
      points={{-141,-60},{-176.7,-60},{-176.7,-8},{-172,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3_1.y, gain.u) annotation (Line(
      points={{-149,0},{-142,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter1.y, add1.u2) annotation (Line(
      points={{31,0},{36,0},{36,-6},{48,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, G6.u) annotation (Line(
      points={{71,0},{82,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, gain7.u) annotation (Line(
      points={{71,0},{74.3,0},{74.3,-40},{82,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(G6.y, add2.u1) annotation (Line(
      points={{105,0},{160.9,0},{160.9,6},{170,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator3.y, add2.u2) annotation (Line(
      points={{161,-40},{166,-40},{166,-6},{170,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, add1.u1) annotation (Line(points={{31,50},{43.3,50},{43.3,6},{48,6}},
                                  color={0,0,127}));
  connect(const1.y, add.u1) annotation (Line(points={{-219,20},{-210,20},{-210,6},{-202,6}},
                  color={0,0,127}));
  connect(add2.y, pm) annotation (Line(points={{193,0},{210,0}}, color={0,0,127}));
  annotation (
    Icon(graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,0}),
                               Text(
          extent={{-60,0},{60,-80}},
          lineColor={0,0,255},
          textString="TGTypeIII"),Text(
          extent={{-100,10},{-60,-10}},
          lineColor={0,0,0},
          textString="w"), Text(
          extent={{60,10},{100,-10}},
          lineColor={0,0,0},
          textString="pm"),
        Text(
          extent={{-80,80},{80,20}},
          lineColor={0,0,0},
          textString="%name")}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSAT Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tetiana Bogodorova</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"),
    Diagram(coordinateSystem(extent={{-240,-120},{200,80}})));
end TGTypeIII;
