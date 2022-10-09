within OpenIPSL.NonElectrical.Continuous;
block SimpleLagRateLimVar
  "First order lag transfer function block with a non windup limiter, rate limits, variable output limits and blocking input"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Types.Time T "Lag time constant"
    annotation (Evaluate=false);
  parameter Real y_start "Output start value"
    annotation (Dialog(group="Initialization"));
  parameter Real rmin "Minimum rate limit";
  parameter Real rmax "Maximum rate limit";
  Real rate "Rate";
  Real x;
  Modelica.Blocks.Interfaces.RealInput outMin annotation (Placement(
        transformation(extent={{-90,-6},{-50,34}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-80,-140})));
  Modelica.Blocks.Interfaces.RealInput outMax annotation (Placement(
        transformation(extent={{98,106},{138,146}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={80,140})));
initial equation
  x = y_start;
  y = y_start;
equation
  assert(
    T >= 1e-10,
    "Time constant must be greater than 0",
    AssertionLevel.error);
  rate = if u > outMax then (outMax - x)/T elseif u < outMin then (outMin - x)/
    T else (u - x)/T;
  der(x) = if rate > rmax then rmax elseif rate < rmin then rmin else rate;
  y = if x > outMax then outMax elseif x < outMin then outMin else x;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Line(points={{-100,-140},{-60,-140},{-40,-100}},
          color={0,0,0}),Line(points={{40,100},{60,140},{100,140}}, color={0,0,
          0}),Text(
          extent={{-20,68},{20,8}},
          textColor={0,0,255},
          textString="K"),Line(
          points={{-80,0},{78,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=0.5),Text(
          extent={{-70,-20},{70,-80}},
          textColor={0,0,255},
          textString="1 + Ts"),Line(points={{-60,100},{-80,140},{-120,140}},
          color={255,0,0}),Line(points={{120,-140},{80,-140},{60,-100}}, color=
          {255,0,0})}));
end SimpleLagRateLimVar;
