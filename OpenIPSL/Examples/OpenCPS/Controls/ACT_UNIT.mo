within OpenIPSL.Examples.OpenCPS.Controls;
model ACT_UNIT "Unit to check limits in voltage magnitude, frequency and angle for resynchronization"
  Controls.LimitCheck fi_limit_check(
    dt=5,
    upperLim=1,
    lowerLim=-1)
    annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
  Controls.LimitCheck v_limit_check(
    dt=5,
    upperLim=0.01,
    lowerLim=-0.01)
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  Controls.LimitCheck f_limit_check(
    dt=5,
    upperLim=5e-5,
    lowerLim=-5e-5)
    annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
  Modelica.Blocks.MathBoolean.And and1(nu=3)
    annotation (Placement(transformation(extent={{54,-6},{66,6}})));
  Modelica.Blocks.Interfaces.BooleanOutput START_FREQ annotation (Placement(
        transformation(extent={{100,40},{120,60}})));
  Modelica.Blocks.Interfaces.RealInput VOLT_DIFF annotation (Placement(
        transformation(extent={{-110,40},{-90,60}}),
        iconTransformation(extent={{-100,40},{-80,60}})));
  Modelica.Blocks.Interfaces.BooleanOutput START_FI annotation (Placement(
        transformation(extent={{100,-50},{120,-30}})));
  Modelica.Blocks.Interfaces.RealInput SPEED annotation (Placement(
        transformation(extent={{-110,-50},{-90,-30}}),
        iconTransformation(extent={{-100,-10},{-80,10}})));
  Modelica.Blocks.Interfaces.RealInput FI_DIFF annotation (Placement(
        transformation(extent={{-110,-80},{-90,-60}}),
        iconTransformation(extent={{-100,-60},{-80,-40}})));
  Modelica.Blocks.Interfaces.BooleanOutput TRIGGER annotation (Placement(
        transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Logical.RSFlipFlop rSFlipFlop(Qini=false) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={86,-6})));
  Modelica.Blocks.Sources.BooleanConstant disable(k=false)
    annotation (Placement(transformation(extent={{54,-26},{66,-14}})));
equation
  connect(START_FREQ, v_limit_check.START)
    annotation (Line(points={{110,50},{28,50},{1,50}}, color={255,0,255}));
  connect(VOLT_DIFF, v_limit_check.u)
    annotation (Line(points={{-100,50},{-100,50},{-20,50}}, color={0,0,127}));
  connect(START_FI, f_limit_check.START)
    annotation (Line(points={{110,-40},{42,-40},{1,-40}}, color={255,0,255}));
  connect(SPEED, f_limit_check.u)
    annotation (Line(points={{-100,-40},{-20,-40}}, color={0,0,127}));
  connect(FI_DIFF, fi_limit_check.u) annotation (Line(points={{-100,-70},{-30,-70},
          {-20,-70}}, color={0,0,127}));
  connect(and1.u[1], v_limit_check.START) annotation (Line(points={{54,-1.4},{
          40,-1.4},{40,50},{1,50}},
                                color={255,0,255}));
  connect(and1.u[2], f_limit_check.START) annotation (Line(points={{54,
          4.44089e-016},{40,4.44089e-016},{40,-40},{1,-40}}, color={255,0,255}));
  connect(fi_limit_check.START, and1.u[3]) annotation (Line(points={{1,-70},{22,
          -70},{48,-70},{48,1.4},{54,1.4}},   color={255,0,255}));
  connect(TRIGGER, rSFlipFlop.Q)
    annotation (Line(points={{110,0},{97,0}}, color={255,0,255}));
  connect(and1.y, rSFlipFlop.S)
    annotation (Line(points={{66.9,0},{74,0}}, color={255,0,255}));
  connect(disable.y, rSFlipFlop.R) annotation (Line(points={{66.6,-20},{68,-20},
          {68,-12},{74,-12}}, color={255,0,255}));
  annotation ( Icon(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-62,98},{58,78}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="ACTIVATION UNIT"),Text(
          extent={{-76,60},{-32,40}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="V_DIFF"),Text(
          extent={{-74,10},{-30,-10}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="SPEED"),Text(
          extent={{-74,-40},{-30,-60}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="FI_DIFF"),Text(
          extent={{14,60},{94,40}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="START_FREQ"),Text(
          extent={{38,10},{92,-10}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="TRIGGER"),Text(
          extent={{38,-30},{92,-50}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="START_FI")}));
end ACT_UNIT;
