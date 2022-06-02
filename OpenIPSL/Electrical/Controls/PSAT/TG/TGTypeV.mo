within OpenIPSL.Electrical.Controls.PSAT.TG;
model TGTypeV
  "Hydro Turbine (Nonlinear model) and Governor (PI controller combined with servomotor)- control scheme Type 5"
  parameter Types.PerUnit Tg "Servomotor droop";
  parameter Types.PerUnit gmax "Maximum gate opening";
  parameter Types.PerUnit gmin "Minimum gate opening";
  parameter Types.PerUnit vmax "Maximum gate opening rate";
  parameter Types.PerUnit vmin "Minimum gate opening rate";
  parameter Types.Time Tp "Pilot valve time constant";
  parameter Types.Time Tw "Water starting time";
  parameter Real Kp "Proportional droop [pu/pu]";
  parameter Real Ki "Integral droop [pu/pu]";
  parameter Real sigma "Permanent speed droop [pu/pu]";
  parameter Types.PerUnit Pref;
  Types.PerUnit G "Gate opening";
  Modelica.Blocks.Continuous.Integrator integrator(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=Pref)
    annotation (Placement(transformation(extent={{64,-6},{76,6}})));
  Modelica.Blocks.Math.Gain gain(k=1/Tg, y(start=0))
    annotation (Placement(transformation(extent={{24,-6},{36,6}})));
  Modelica.Blocks.Continuous.Integrator integrator3(initType=Modelica.Blocks.Types.Init.SteadyState,
      y_start=Pref) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        origin={190,0})));
  Modelica.Blocks.Math.Gain gain7(k=1/Tw)
    annotation (Placement(transformation(extent={{164,-6},{176,6}})));
  Modelica.Blocks.Math.MultiSum multiSum3(k={-1,1}, nu=2)
    annotation (Placement(transformation(extent={{144,-6},{156,6}})));
  Modelica.Blocks.Interfaces.RealInput w "Rotor speed [pu]" annotation (
      Placement(transformation(extent={{-180,-10},{-160,10}}),
                                                            iconTransformation(
          extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput Pm "Power Pm [pu]" annotation (
      Placement(transformation(extent={{220,-6},{232,6}}),iconTransformation(
          extent={{100,-10},{120,10}})));
  Modelica.Blocks.Continuous.Integrator integrator4(initType=Modelica.Blocks.Types.Init.SteadyState,
      y_start=Pref)
    annotation (Placement(transformation(extent={{-36,-6},{-24,6}})));
  Modelica.Blocks.Math.Gain Integral(k=Ki)
    annotation (Placement(transformation(extent={{-56,-6},{-44,6}})));
  Modelica.Blocks.Math.Gain gain9(k=1/Tp)
    annotation (Placement(transformation(extent={{-116,-6},{-104,6}})));
  Modelica.Blocks.Math.MultiSum multiSum6( k={-1,1}, nu=2)
    annotation (Placement(transformation(extent={{-136,-6},{-124,6}})));
  Modelica.Blocks.Math.Gain gain6(k=sigma) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-110,20})));
  Modelica.Blocks.Continuous.Integrator integrator5(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=0)
    annotation (Placement(transformation(extent={{-76,-6},{-64,6}})));
  Modelica.Blocks.Math.Gain Proportional(k=Kp)
    annotation (Placement(transformation(extent={{-46,-26},{-34,-14}})));
  Modelica.Blocks.Math.Gain gain8(k=1/Tp) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-80,-20})));
  Modelica.Blocks.Math.Division division(y(start=1))
    annotation (Placement(transformation(extent={{108,-6},{120,6}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{204,-6},{216,6}})));
  Modelica.Blocks.Math.MultiProduct square(nu=2) annotation (Placement(transformation(extent={{124,-6},{136,6}})));
  Modelica.Blocks.Sources.Constant one(k=1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        origin={130,-20})));
  Modelica.Blocks.Interfaces.RealInput pref "Reference power [pu]" annotation (Placement(transformation(extent={{-180,20},{-160,40}}), iconTransformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Math.Feedback p_feedback annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-80,20})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax=vmax, uMin=vmin)
    annotation (Placement(transformation(extent={{44,-6},{56,6}})));
  Modelica.Blocks.Nonlinear.Limiter limiter3(uMax=gmax, uMin=gmin)
    annotation (Placement(transformation(extent={{84,-6},{96,6}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-15,-5},{-5,5}})));
  Modelica.Blocks.Math.Add add2(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{4,-6},{16,6}})));
  Modelica.Blocks.Math.Add add3(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{-95,-5},{-85,5}})));
  Modelica.Blocks.Interfaces.RealInput wref "Reference rotor speed [pu]"
    annotation (Placement(transformation(extent={{-180,-30},{-160,-10}}),
        iconTransformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Math.Feedback w_feedback annotation (Placement(transformation(extent={{-152,6},{-140,-6}})));
equation
  G = limiter3.y;
  connect(division.y, square.u[1]) annotation (Line(
      points={{120.6,0},{122,0},{122,2},{124,2},{124,2.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(division.y, square.u[2]) annotation (Line(
      points={{120.6,0},{122,0},{122,-2},{124,-2},{124,-2.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(square.y, product1.u1) annotation (Line(
      points={{137.02,0},{140,0},{140,12},{200,12},{200,3.6},{202.8,3.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(square.y, multiSum3.u[1]) annotation (Line(
      points={{137.02,0},{144,0},{144,2.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(one.y, multiSum3.u[2]) annotation (Line(
      points={{136.6,-20},{140,-20},{140,-2.1},{144,-2.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator3.y, division.u1) annotation (Line(
      points={{196.6,0},{200,0},{200,-30},{102,-30},{102,3.6},{106.8,3.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter3.y, division.u2) annotation (Line(
      points={{96.6,0},{100,0},{100,-3.6},{106.8,-3.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, p_feedback.u1) annotation (Line(
      points={{-4.5,0},{0,0},{0,20},{-75.2,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Proportional.y, add1.u2) annotation (Line(
      points={{-33.4,-20},{-20,-20},{-20,-3},{-16,-3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator4.y, add1.u1) annotation (Line(
      points={{-23.4,0},{-20,0},{-20,3},{-16,3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain8.y, add3.u2) annotation (Line(
      points={{-86.6,-20},{-99,-20},{-99,-3},{-96,-3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3.y, integrator5.u) annotation (Line(
      points={{-84.5,0},{-77.2,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, add2.u1) annotation (Line(points={{-4.5,0},{0,0},{0,3.6},{2.8,3.6}}, color={0,0,127}));
  connect(pref, p_feedback.u2) annotation (Line(points={{-170,30},{-80,30},{-80,24.8}}, color={0,0,127}));
  connect(wref, w_feedback.u1) annotation (Line(points={{-170,-20},{-154,-20},{-154,0},{-150.8,0}}, color={0,0,127}));
  connect(w, w_feedback.u2) annotation (Line(points={{-170,0},{-156,0},{-156,10},{-146,10},{-146,4.8}}, color={0,0,127}));
  connect(gain6.y, multiSum6.u[1]) annotation (Line(points={{-116.6,20},{-140,20},{-140,2.1},{-136,2.1}}, color={0,0,127}));
  connect(w_feedback.y, multiSum6.u[2]) annotation (Line(points={{-140.6,0},{-136,0},{-136,-2.1}}, color={0,0,127}));
  connect(multiSum6.y, gain9.u) annotation (Line(points={{-122.98,0},{-117.2,0}}, color={0,0,127}));
  connect(gain9.y, add3.u1) annotation (Line(points={{-103.4,0},{-100,0},{-100,3},{-96,3}}, color={0,0,127}));
  connect(gain6.u, p_feedback.y) annotation (Line(points={{-102.8,20},{-85.4,20}}, color={0,0,127}));
  connect(integrator5.y, gain8.u) annotation (Line(points={{-63.4,0},{-60,0},{-60,-20},{-72.8,-20}}, color={0,0,127}));
  connect(integrator5.y, Proportional.u) annotation (Line(points={{-63.4,0},{-60,0},{-60,-20},{-47.2,-20}}, color={0,0,127}));
  connect(integrator5.y, Integral.u) annotation (Line(points={{-63.4,0},{-57.2,0}}, color={0,0,127}));
  connect(Integral.y, integrator4.u) annotation (Line(points={{-43.4,0},{-37.2,0}}, color={0,0,127}));
  connect(limiter3.y, add2.u2) annotation (Line(points={{96.6,0},{100,0},{100,-20},{0,-20},{0,-3.6},{2.8,-3.6}}, color={0,0,127}));
  connect(gain.y, limiter2.u) annotation (Line(points={{36.6,0},{42.8,0}}, color={0,0,127}));
  connect(limiter2.y, integrator.u) annotation (Line(points={{56.6,0},{62.8,0}}, color={0,0,127}));
  connect(integrator.y, limiter3.u) annotation (Line(points={{76.6,0},{82.8,0}}, color={0,0,127}));
  connect(add2.y, gain.u) annotation (Line(points={{16.6,0},{22.8,0}}, color={0,0,127}));
  connect(gain7.y, integrator3.u) annotation (Line(points={{176.6,0},{182.8,0}}, color={0,0,127}));
  connect(multiSum3.y, gain7.u) annotation (Line(points={{157.02,0},{162.8,0}}, color={0,0,127}));
  connect(integrator3.y, product1.u2) annotation (Line(points={{196.6,0},{200,0},{200,-4},{202,-4},{202,-3.6},{202.8,-3.6}}, color={0,0,127}));
  connect(product1.y, Pm) annotation (Line(points={{216.6,0},{226,0}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(extent={{-100,-100},{100,100}},preserveAspectRatio=
            false), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,0}),
                               Text(
          extent={{-60,0},{62,-82}},
          lineColor={0,0,255},
          textString="TGTypeV"),Text(
          origin={-80,0},
          extent={{-20,-10},{20,10}},
          textString="w",
          lineColor={0,0,0}),
                            Text(
          origin={80,0},
          extent={{-20,-10},{20,10}},
          lineColor={0,0,0},
          textString="pm"), Text(
          origin={-80,62},
          extent={{-20,-10},{20,10}},
          lineColor={0,0,0},
          textString="pref"),Text(
          origin={-80,-60},
          extent={{-20,10},{20,-10}},
          lineColor={0,0,0},
          textString="wref"),
        Text(
          extent={{-60,80},{60,20}},
          lineColor={0,0,0},
          textString="%name")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,-40},{220,40}})),
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
</html>"));
end TGTypeV;
