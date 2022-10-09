within OpenIPSL.Electrical.Controls.Simulink.PSS;
model PSS "Power system stabilizer"
  parameter Real Kp "Washout gain";
  parameter Real Tw "Washout time constant";
  parameter Real T1 "Lead-lag filter time constant";
  parameter Real T2 "Lead-lag filter time constant";
  parameter Real C "PSS output limiation";
  parameter Real init_PSS_Leadlag1=0 "initial output value";
  parameter Real init_PSS_Leadlag2=0 "initial output value";
  Modelica.Blocks.Interfaces.RealInput omega "Speed" annotation (Placement(
        transformation(extent={{-106,12},{-94,24}}), iconTransformation(extent=
            {{-100,8},{-88,20}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag Leadlag1(
    K=1,
    T1=T1,
    T2=T2,
    y_start=init_PSS_Leadlag1)
    annotation (Placement(transformation(extent={{-22,4},{-4,22}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag Leadlag2(
    K=1,
    T1=T1,
    T2=T2,
    y_start=init_PSS_Leadlag2)
    annotation (Placement(transformation(extent={{4,4},{22,22}})));
  Modelica.Blocks.Interfaces.RealOutput Upss "PSS output" annotation (Placement(
        transformation(extent={{56,6},{68,18}}), iconTransformation(extent={{56,
            6},{68,18}})));
  Modelica.Blocks.Nonlinear.Limiter limit(uMin=-C, uMax=C)
    annotation (Placement(transformation(extent={{30,4},{48,22}})));
  Modelica.Blocks.Math.Gain imGain(k=Kp/Tw)
    annotation (Placement(transformation(extent={{-90,12},{-78,24}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=1,
    T=Tw,
    y_start=0)
    annotation (Placement(transformation(extent={{-68,10},{-52,26}})));
  Modelica.Blocks.Math.Add add(k1=-1)
    annotation (Placement(transformation(extent={{-46,4},{-28,22}})));
equation
  connect(limit.y, Upss) annotation (Line(points={{48.9,13},{51.45,13},{51.45,
          12},{62,12}}, color={0,0,127}));
  connect(Leadlag2.y, limit.u)
    annotation (Line(points={{22.9,13},{22.9,13},{28.2,13}}, color={0,0,127}));
  connect(Leadlag1.y, Leadlag2.u)
    annotation (Line(points={{-3.1,13},{-3.1,13},{2.2,13}}, color={0,0,127}));
  connect(add.y, Leadlag1.u) annotation (Line(points={{-27.1,13},{-25.55,13},{-23.8,
          13}}, color={0,0,127}));
  connect(omega, imGain.u)
    annotation (Line(points={{-100,18},{-96,18},{-91.2,18}}, color={0,0,127}));
  connect(imSimpleLag.y, add.u1) annotation (Line(points={{-51.2,18},{-47.8,18},
          {-47.8,18.4}}, color={0,0,127}));
  connect(imGain.y, imSimpleLag.u) annotation (Line(points={{-77.4,18},{-69.6,
          18},{-69.6,18}}, color={0,0,127}));
  connect(add.u2, imSimpleLag.u) annotation (Line(points={{-47.8,7.6},{-74,7.6},
          {-74,18},{-69.6,18}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(extent={{-88,44},{56,-18}}, lineColor={
          0,0,255}),Text(
          extent={{-44,28},{22,-2}},
          textColor={0,0,255},
          textString="PSS"),Text(
          extent={{-86,24},{-62,4}},
          textColor={0,0,255},
          textString="omega"),Text(
          extent={{34,20},{54,0}},
          textColor={0,0,255},
          textString="Upss")}));
end PSS;
