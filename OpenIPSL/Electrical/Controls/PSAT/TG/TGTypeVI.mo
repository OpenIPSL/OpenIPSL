within OpenIPSL.Electrical.Controls.PSAT.TG;
model TGTypeVI
  "Hydro Turbine (Nonlinear model) and Governor (PID controller combined with servomotor)- control scheme Type 6"
  parameter Types.PerUnit gmax "Maximum gate opening";
  parameter Types.PerUnit gmin "Minimum gate opening";
  parameter Types.PerUnit vmax "Maximum gate opening rate";
  parameter Types.PerUnit vmin "Minimum gate opening rate";
  parameter Types.Time Ta "Pilot valve time constant";
  parameter Types.Time Tw "Water starting time";
  parameter Real beta "Transient speed droop [pu/pu]";
  parameter Real Kp "Proportional droop [pu/pu]";
  parameter Types.TimeAging Ki "Integral droop";
  parameter Types.Time Kd "Derivative droop";
  parameter Types.Time Td "Derivative droop time constant";
  parameter Real Rp "Permanent droop [pu/pu]";
  parameter Real Ka "Pilot valve gain [pu/pu]";
  parameter Types.PerUnit dref;
  parameter Types.PerUnit po;
  Types.PerUnit G "Gate opening [pu]";
  Modelica.Blocks.Continuous.Integrator integrator(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=po*(gmax - gmin))
    annotation (Placement(transformation(extent={{-8,14},{4,26}})));
  Modelica.Blocks.Sources.Constant one(k=1) annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=180,
        origin={110,0})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-176,-36},{-164,-24}})));
  Modelica.Blocks.Continuous.Integrator integrator3(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=po) annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=180,
        origin={170,20})));
  Modelica.Blocks.Math.MultiSum multiSum3(nu=2, k={1,-1})
    annotation (Placement(transformation(extent={{104,14},{116,26}})));
  Modelica.Blocks.Interfaces.RealOutput Pm "Mechanical power [pu]" annotation (
      Placement(transformation(extent={{200,10},{220,30}}),iconTransformation(
          extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.Gain gain9(k=Kp)
    annotation (Placement(transformation(extent={{-116,34},{-104,46}})));
  Modelica.Blocks.Math.MultiSum multiSum5( k={1,1,1}, nu=3)
    annotation (Placement(transformation(extent={{-76,14},{-64,26}})));
  Modelica.Blocks.Math.Feedback feedback1
    annotation (Placement(transformation(extent={{-146,14},{-134,26}})));
  Modelica.Blocks.Math.Gain gain6(k=Rp) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-140,0})));
  Modelica.Blocks.Math.Feedback w_fb annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        origin={-160,20})));
  Modelica.Blocks.Continuous.Integrator integrator5(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=po*(gmax - gmin))
    annotation (Placement(transformation(extent={{-96,14},{-84,26}})));
  Modelica.Blocks.Math.Gain Proportional(k=beta)
    annotation (Placement(transformation(extent={{64,44},{76,56}})));
  Modelica.Blocks.Math.Gain gain8(k=Ki) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        origin={-110,20})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=vmax, uMin=vmin)
    annotation (Placement(transformation(extent={{-26,14},{-14,26}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=gmax, uMin=gmin)
    annotation (Placement(transformation(extent={{10,14},{22,26}})));
  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{64,14},{76,26}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{184,14},{196,26}})));
  Modelica.Blocks.Math.MultiProduct square(nu=2) annotation (Placement(transformation(extent={{84,14},{96,26}})));
  Modelica.Blocks.Interfaces.RealInput pe "Active power [pu]" annotation (
      Placement(transformation(extent={{-200,-40},{-180,-20}}),
        iconTransformation(extent={{-140,-50},{-100,-10}})));
  Modelica.Blocks.Continuous.Derivative derivative(k=Kd, T=Td)
    annotation (Placement(transformation(extent={{-106,-6},{-94,6}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction(a={Ta,1}, b={Ka})
    annotation (Placement(transformation(extent={{-44,14},{-32,26}})));
  Modelica.Blocks.Math.Feedback servo_fb
    annotation (Placement(transformation(extent={{-60,14},{-48,26}})));
  Modelica.Blocks.Math.Gain Gain10(k=1/(gmax - gmin))
    annotation (Placement(transformation(extent={{42,14},{54,26}})));
  Modelica.Blocks.Math.MultiSum multiSum4(nu=2, k={-1,1}) annotation (Placement(
        transformation(
        extent={{6,6},{-6,-6}},
        rotation=180,
        origin={130,20})));
  Modelica.Blocks.Math.Gain gain7(k=1/Tw) annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=180,
        origin={150,20})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(
        extent={{-4,4},{4,-4}},
        rotation=90,
        origin={-140,-16})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean(threshold=0.5) annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-130,-40})));
  Modelica.Blocks.Sources.Constant const(k=dref) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-110,-40})));
  Modelica.Blocks.Interfaces.RealInput pref "Active power reference [pu]"
    annotation (Placement(transformation(extent={{-200,-60},{-180,-40}}),
        iconTransformation(extent={{-140,-100},{-100,-60}})));
  Modelica.Blocks.Interfaces.RealInput wref "Rotor speed reference [pu]"
    annotation (Placement(transformation(extent={{-200,10},{-180,30}}),
        iconTransformation(extent={{-140,100},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput we "Rotor speed [pu]" annotation (
      Placement(transformation(extent={{-200,-10},{-180,10}}),
                                                             iconTransformation(
          extent={{-140,10},{-100,50}})));
equation
  G = Gain10.y;
  connect(division.y, square.u[1]) annotation (Line(
      points={{76.6,20},{80,20},{80,22},{84,22},{84,22.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(division.y, square.u[2]) annotation (Line(
      points={{76.6,20},{80,20},{80,18},{84,18},{84,17.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(square.y, multiSum3.u[1]) annotation (Line(
      points={{97.02,20},{104,20},{104,22.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product1.y, Pm) annotation (Line(
      points={{196.6,20},{210,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain8.y, integrator5.u) annotation (Line(
      points={{-103.4,20},{-97.2,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback1.y, gain9.u) annotation (Line(
      points={{-134.6,20},{-129,20},{-129,40},{-117.2,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback1.y, gain8.u) annotation (Line(
      points={{-134.6,20},{-117.2,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback1.y, derivative.u) annotation (Line(
      points={{-134.6,20},{-129,20},{-129,0},{-107.2,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter1.y, Gain10.u) annotation (Line(
      points={{22.6,20},{40.8,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Proportional.y, multiSum3.u[2]) annotation (Line(
      points={{76.6,50},{100,50},{100,22},{104,22},{104,17.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiSum3.y, multiSum4.u[1]) annotation (Line(
      points={{117.02,20},{124,20},{124,22.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(one.y, multiSum4.u[2]) annotation (Line(
      points={{116.6,0},{120,0},{120,18},{124,18},{124,17.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiSum4.y, gain7.u) annotation (Line(
      points={{137.02,20},{142.8,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain7.y, integrator3.u) annotation (Line(
      points={{156.6,20},{162.8,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(multiSum3.y, product1.u1) annotation (Line(
      points={{117.02,20},{120.09,20},{120.09,34},{180,34},{180,23.6},{182.8,23.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y, gain6.u) annotation (Line(
      points={{-140,-11.6},{-140,-7.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter1.y, switch1.u1) annotation (Line(
      points={{22.6,20},{30,20},{30,-26},{-136.8,-26},{-136.8,-20.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(w_fb.y, Proportional.u) annotation (Line(
      points={{-154.6,20},{-150,20},{-150,50},{62.8,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator3.y, division.u1) annotation (Line(points={{176.6,20},{180,20},{180,-10},{60,-10},{60,23.6},{62.8,23.6}},
                                                                                                                            color={0,0,127}));
  connect(limiter1.y, servo_fb.u2) annotation (Line(points={{22.6,20},{30,20},{30,6},{-54,6},{-54,15.2}},
                                                                                                        color={0,0,127}));
  connect(we, w_fb.u2) annotation (Line(points={{-190,0},{-160,0},{-160,15.2}}, color={0,0,127}));
  connect(wref, w_fb.u1) annotation (Line(points={{-190,20},{-164.8,20}}, color={0,0,127}));
  connect(feedback.y, switch1.u3) annotation (Line(points={{-164.6,-30},{-143.2,-30},{-143.2,-20.8}}, color={0,0,127}));
  connect(pe, feedback.u1) annotation (Line(points={{-190,-30},{-174.8,-30}}, color={0,0,127}));
  connect(pref, feedback.u2) annotation (Line(points={{-190,-50},{-170,-50},{-170,-34.8}}, color={0,0,127}));
  connect(switch1.u2, realToBoolean.y) annotation (Line(points={{-140,-20.8},{-140,-40},{-136.6,-40}}, color={255,0,255}));
  connect(realToBoolean.u, const.y) annotation (Line(points={{-122.8,-40},{-116.6,-40}}, color={0,0,127}));
  connect(feedback1.u2, gain6.y) annotation (Line(points={{-140,15.2},{-140,6.6}}, color={0,0,127}));
  connect(w_fb.y, feedback1.u1) annotation (Line(points={{-154.6,20},{-144.8,20}}, color={0,0,127}));
  connect(gain9.y, multiSum5.u[1]) annotation (Line(points={{-103.4,40},{-80,40},{-80,22},{-76,22},{-76,22.8}}, color={0,0,127}));
  connect(integrator5.y, multiSum5.u[2]) annotation (Line(points={{-83.4,20},{-80,20},{-80,20},{-76,20}}, color={0,0,127}));
  connect(derivative.y, multiSum5.u[3]) annotation (Line(points={{-93.4,0},{-80,0},{-80,18},{-76,18},{-76,17.2}}, color={0,0,127}));
  connect(multiSum5.y, servo_fb.u1) annotation (Line(points={{-62.98,20},{-58.8,20}}, color={0,0,127}));
  connect(servo_fb.y, transferFunction.u) annotation (Line(points={{-48.6,20},{-45.2,20}}, color={0,0,127}));
  connect(transferFunction.y, limiter.u) annotation (Line(points={{-31.4,20},{-27.2,20}}, color={0,0,127}));
  connect(limiter.y, integrator.u) annotation (Line(points={{-13.4,20},{-9.2,20}}, color={0,0,127}));
  connect(integrator.y, limiter1.u) annotation (Line(points={{4.6,20},{8.8,20}}, color={0,0,127}));
  connect(Gain10.y, division.u2) annotation (Line(points={{54.6,20},{58,20},{58,16.4},{62.8,16.4}}, color={0,0,127}));
  connect(integrator3.y, product1.u2) annotation (Line(points={{176.6,20},{180,20},{180,16.4},{182.8,16.4}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(extent={{-100,-100},{100,100}},preserveAspectRatio=
            false), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,0}),
                               Text(
          extent={{-60,-20},{60,-80}},
          lineColor={0,0,255},
          textString="TGTypeVI"),Text(
          extent={{-100,90},{-60,70}},
          lineColor={0,0,0},
          textString="wref"),Text(
          extent={{-100,40},{-60,20}},
          lineColor={0,0,0},
          textString="we"),Text(
          extent={{-100,-20},{-60,-40}},
          lineColor={0,0,0},
          textString="pe"), Text(
          extent={{-100,-70},{-60,-90}},
          lineColor={0,0,0},
          textString="pref"),Text(
          extent={{60,10},{100,-10}},
          lineColor={0,0,0},
          textString="pm"),
        Text(
          extent={{-60,80},{60,20}},
          lineColor={0,0,0},
          textString="%name")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-180,-60},{200,60}})),
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
end TGTypeVI;
