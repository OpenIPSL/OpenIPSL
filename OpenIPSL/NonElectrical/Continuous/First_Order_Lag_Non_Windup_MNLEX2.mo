within OpenIPSL.NonElectrical.Continuous;
model First_Order_Lag_Non_Windup_MNLEX2
  "First Order (Lag) Block with Non-Windup Limits"
  import Modelica.Units.SI;
  parameter SI.PerUnit K_I "Integrator gain (pu)";
  parameter SI.Time T_I "Integrator time constant (sec)";
  parameter Real y_start = 0 "Output start value";
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.Gain gain(k=K_I)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Continuous.Integrator integrator(initType=Modelica.Blocks.Types.Init.InitialOutput,
      y_start=y_start)
    annotation (Placement(transformation(extent={{64,-10},{84,10}})));
  Modelica.Blocks.Math.Gain time_constant(k=1/T_I)
    annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
  Modelica.Blocks.Interfaces.RealInput V_RMIN annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-80,-120})));
  Modelica.Blocks.Interfaces.RealInput V_RMAX annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={80,120})));
  Modelica.Blocks.Sources.RealExpression realExpression
    annotation (Placement(transformation(extent={{-10,32},{10,52}})));
  Modelica.Blocks.Logical.Switch reset_switch
    annotation (Placement(transformation(extent={{28,10},{48,30}})));
equation
  reset_switch.u2 =
    if (abs(V_RMAX - y) <= Modelica.Constants.eps and integrator.u > Modelica.Constants.eps)
      then true
    else if (abs(V_RMIN - y) <= Modelica.Constants.eps and integrator.u < -Modelica.Constants.eps)
      then true
    else false;
  y =
  if T_I <= Modelica.Constants.eps
    then
      if (abs(V_RMAX - y) <= Modelica.Constants.eps and der(integrator.y)>0)
        then V_RMAX
      else if (abs(V_RMIN - y) <= Modelica.Constants.eps and der(integrator.y)<0)
        then V_RMIN
      else gain.y
  else max(min(integrator.y,V_RMAX),V_RMIN);
  connect(feedback.u2,y);
  connect(u, gain.u)
    annotation (Line(points={{-120,0},{-82,0}}, color={0,0,127}));
  connect(gain.y, feedback.u1)
    annotation (Line(points={{-59,0},{-38,0}}, color={0,0,127}));
  connect(feedback.y, time_constant.u)
    annotation (Line(points={{-21,0},{-10,0}}, color={0,0,127}));
  connect(realExpression.y, reset_switch.u1)
    annotation (Line(points={{11,42},{18,42},{18,28},{26,28}},
                                               color={0,0,127}));
  connect(time_constant.y, reset_switch.u3)
    annotation (Line(points={{13,0},{18,0},{18,12},{26,12}}, color={0,0,127}));
  connect(reset_switch.y, integrator.u)
    annotation (Line(points={{49,20},{54,20},{54,0},{62,0}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(
            extent={{-100,100},{100,-100}}, lineColor={28,108,200})}),
    Diagram(coordinateSystem(preserveAspectRatio=false)));
end First_Order_Lag_Non_Windup_MNLEX2;
