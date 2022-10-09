within OpenIPSL.Electrical.Controls.PSAT.TG;
model TGTypeIV
  "Hydro Turbine (Linear model) and Governor (Standard model with PI controller)- control scheme Type 4"
  parameter Types.PerUnit wref "Reference speed";
  parameter Types.PerUnit Tg "Pilot valve droop";
  parameter Types.PerUnit gmax "Maximum gate opening";
  parameter Types.PerUnit gmin "Minimum gate opening";
  parameter Types.PerUnit vmax "Maxmimum gate opening rate";
  parameter Types.PerUnit vmin "Maximum gate opening rate";
  parameter Types.Time Tp "Pilot valve time constant";
  parameter Types.Time Tr "Dashpot time constant";
  parameter Real sigma "Permanent speed droop [pu/pu]";
  parameter Real delta "Transient speed droop [pu/pu]";
  parameter Types.Time Tw "Water starting time";
  parameter Real a11 "Deriv. of flow rate vs. turbine head";
  parameter Real a13 "Deriv. of flow rate vs. gate position";
  parameter Real a21 "Deriv. of torque vs. turbine head";
  parameter Real a23 "Deriv. of torque vs. gate position";
  parameter Real Kp "Proportional droop";
  parameter Real Ki "Integral droop";
  parameter Real Pref;
  Types.PerUnit deltaG "Gate position variation";
  Types.PerUnit v "Gate opening rate";
  Modelica.Blocks.Continuous.Integrator integrator3(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=int3)
    annotation (Placement(transformation(extent={{34,-6},{46,6}})));
  Modelica.Blocks.Math.Gain gain(k=1/(Tg*Tp))
    annotation (Placement(transformation(extent={{-56,-6},{-44,6}})));
  Modelica.Blocks.Math.Gain gain1(k=1/Tp) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-10,-20})));
  Modelica.Blocks.Continuous.Integrator integrator2(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=int2)
    annotation (Placement(transformation(extent={{-16,-6},{-4,6}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-36,-6},{-24,6}})));
  Modelica.Blocks.Math.Gain gain2(k=delta + sigma) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-12,20})));
  Modelica.Blocks.Math.Gain gain3(k=delta/Tr) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-44,-40})));
  Modelica.Blocks.Math.Gain gain5(k=1/Tr) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        origin={-10,-60})));
  Modelica.Blocks.Continuous.Integrator integrator4(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=int4) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={-10,-40})));
  Modelica.Blocks.Math.Feedback feedback1 annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={10,-40})));
  Modelica.Blocks.Math.Gain gain4(k=1/(a11*Tw)) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={110,-40})));
  Modelica.Blocks.Continuous.Integrator integrator5(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=int5) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        origin={120,-20})));
  Modelica.Blocks.Math.Feedback feedback2 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        origin={100,-20})));
  Modelica.Blocks.Math.Gain G6(k=(a11*a23 - a13*a21)/a11)
    annotation (Placement(transformation(extent={{74,-6},{86,6}})));
  Modelica.Blocks.Math.Gain gain7(k=a13*a21/(a11*a11*Tw))
    annotation (Placement(transformation(extent={{74,-26},{86,-14}})));
  Modelica.Blocks.Interfaces.RealInput w "Rotor speed [pu]" annotation (
      Placement(transformation(extent={{-240,-20},{-200,20}}),
                                                          iconTransformation(
          extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput Pm "Mechanical power [pu]" annotation (
      Placement(transformation(extent={{160,-10},{180,10}}),
                                                         iconTransformation(
          extent={{100,-10},{120,10}})));
  Modelica.Blocks.Continuous.Integrator integrator1(initType=Modelica.Blocks.Types.Init.NoInit,
      y_start=int1)
    annotation (Placement(transformation(extent={{-126,-6},{-114,6}})));
  Modelica.Blocks.Math.Gain gain6(k=Ki)
    annotation (Placement(transformation(extent={{-146,-6},{-134,6}})));
  Modelica.Blocks.Math.Gain gain8(k=Kp)
    annotation (Placement(transformation(extent={{-146,14},{-134,26}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=vmax, uMin=vmin)
    annotation (Placement(transformation(extent={{14,-6},{26,6}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=gmax, uMin=gmin)
    annotation (Placement(transformation(extent={{54,-6},{66,6}})));
  Modelica.Blocks.Math.Add add1(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{-177,-7},{-163,7}})));
  Modelica.Blocks.Math.Add add2
    annotation (Placement(transformation(extent={{-101,-7},{-87,7}})));
  Modelica.Blocks.Math.Add3 add3_1(
    k1=-1,
    k2=+1,
    k3=+1) annotation (Placement(transformation(extent={{-77,-7},{-63,7}})));
  Modelica.Blocks.Math.Add add3
    annotation (Placement(transformation(extent={{144,-6},{156,6}})));
  Modelica.Blocks.Sources.Constant const1(k=wref)
    annotation (Placement(transformation(extent={{-196,4},{-184,16}})));
protected
  parameter Real int1=sigma*Pref;
  parameter Real int2=0;
  parameter Real int3=Pref;
  parameter Real int4=Tr*Pref;
  parameter Real int5=a13*a21/a11*Pref;
equation
  deltaG = limiter1.y;
  v = limiter.y;
  connect(gain1.y, feedback.u2) annotation (Line(
      points={{-16.6,-20},{-30,-20},{-30,-4.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback.y, integrator2.u) annotation (Line(
      points={{-24.6,0},{-17.2,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain.y, feedback.u1) annotation (Line(
      points={{-43.4,0},{-34.8,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain5.y, feedback1.u2) annotation (Line(
      points={{-3.4,-60},{10,-60},{10,-44.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback1.y, integrator4.u) annotation (Line(
      points={{4.6,-40},{-2.8,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator4.y, gain3.u) annotation (Line(
      points={{-16.6,-40},{-36.8,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain4.y, feedback2.u2) annotation (Line(
      points={{103.4,-40},{100,-40},{100,-24.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback2.y, integrator5.u) annotation (Line(
      points={{105.4,-20},{112.8,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain7.y, feedback2.u1) annotation (Line(
      points={{86.6,-20},{95.2,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain1.u, integrator2.y) annotation (Line(
      points={{-2.8,-20},{2,-20},{2,0},{-3.4,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator4.y, gain5.u) annotation (Line(
      points={{-16.6,-40},{-26,-40},{-26,-60},{-17.2,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator5.y, gain4.u) annotation (Line(
      points={{126.6,-20},{131.4,-20},{131.4,-40},{117.2,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain6.y, integrator1.u) annotation (Line(
      points={{-133.4,0},{-127.2,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter.y, integrator3.u) annotation (Line(
      points={{26.6,0},{32.8,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator2.y, limiter.u) annotation (Line(
      points={{-3.4,0},{12.8,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator3.y, limiter1.u) annotation (Line(
      points={{46.6,0},{52.8,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter1.y, gain2.u) annotation (Line(
      points={{66.6,0},{70,0},{70,20},{-4.8,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter1.y, feedback1.u1) annotation (Line(
      points={{66.6,0},{70,0},{70,-40},{14.8,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, gain8.u) annotation (Line(
      points={{-162.3,8.88178e-16},{-153.65,8.88178e-16},{-153.65,20},{-147.2,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.y, gain6.u) annotation (Line(
      points={{-162.3,8.88178e-16},{-147.2,8.88178e-16},{-147.2,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.u2, w) annotation (Line(
      points={{-178.4,-4.2},{-180,-4.2},{-180,0},{-220,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator1.y, add2.u2) annotation (Line(
      points={{-113.4,0},{-105.4,0},{-105.4,-4.2},{-102.4,-4.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add2.u1, gain8.y) annotation (Line(
      points={{-102.4,4.2},{-106,4.2},{-106,20},{-133.4,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gain2.y, add3_1.u1) annotation (Line(
      points={{-18.6,20},{-84,20},{-84,5.6},{-78.4,5.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add2.y, add3_1.u2) annotation (Line(
      points={{-86.3,8.88178e-16},{-78.4,8.88178e-16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3_1.u3, gain3.y) annotation (Line(
      points={{-78.4,-5.6},{-84,-5.6},{-84,-40},{-50.6,-40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(G6.y, add3.u1) annotation (Line(
      points={{86.6,0},{120,0},{120,3.6},{142.8,3.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(integrator5.y, add3.u2) annotation (Line(
      points={{126.6,-20},{131.3,-20},{131.3,-3.6},{142.8,-3.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3.y, Pm) annotation (Line(
      points={{156.6,0},{170,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter1.y, G6.u) annotation (Line(
      points={{66.6,0},{72.8,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(limiter1.y, gain7.u) annotation (Line(
      points={{66.6,0},{70,0},{70,-20},{72.8,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const1.y, add1.u1) annotation (Line(points={{-183.4,10},{-182,10},{-182,4},{-178,4},{-178,4.2},{-178.4,4.2}},
                         color={0,0,127}));
  connect(add3_1.y, gain.u) annotation (Line(points={{-62.3,0},{-57.2,0}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,0}),
                               Text(
          extent={{-60,0},{60,-80}},
          textColor={0,0,255},
          textString="TGTypeIV"),Text(
          origin={-80,0},
          extent={{-20,10},{20,-10}},
          fontName="Arial",
          textString="w",
          textColor={0,0,0}),
                            Text(
          origin={80,0},
          extent={{-20,10},{20,-10}},
          fontName="Arial",
          textColor={0,0,0},
          textString="pm"),
        Text(
          extent={{-80,80},{80,20}},
          textColor={0,0,0},
          textString="%name")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,-80},{160,40}})),
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
end TGTypeIV;
