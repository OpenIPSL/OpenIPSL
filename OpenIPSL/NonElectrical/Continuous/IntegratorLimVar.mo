within OpenIPSL.NonElectrical.Continuous;
block IntegratorLimVar
  "Integrator with a non windup limiter and variable limits"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real K "Gain" annotation (Evaluate=false);
  parameter Real y_start "Output start value"
    annotation (Dialog(group="Initialization"));
  Modelica.Blocks.Interfaces.RealInput outMax annotation (Placement(
        transformation(extent={{98,106},{138,146}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={80,140})));
  Modelica.Blocks.Interfaces.RealInput outMin annotation (Placement(
        transformation(extent={{-90,-6},{-50,34}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-80,-140})));
protected
  Real x "Dummy variable for input";
  Real w "Dummy variable for output";
  Real initVar "Dummy variable to be used as setting quantity";
  Boolean ReachUpper "Flag for reaching upper limit";
  Boolean ReachLower "Flag for reaching lower limit";
  Boolean Rising "Flag to know if input is positive";
  Boolean Falling "Flag to know if input is negative";
  Boolean Reinit "Flag to reset state variable";
initial equation
  if y_start >= outMax then
    w = outMax;
  elseif y_start<= outMin then
    w = outMin;
  else
    w = y_start;
  end if;
algorithm
  if u>Modelica.Constants.eps then
    Rising := true;
    Falling := false;
  elseif u<-Modelica.Constants.eps then
    Rising := false;
    Falling := true;
  else
    Rising := false;
    Falling := false;
  end if;
  // Flags for reaching limits and setting inputs and outputs:
  if w > outMax then
    ReachUpper := true;
    ReachLower := false;
  elseif w < outMin then
    ReachLower := true;
    ReachUpper := false;
  else
    ReachUpper := false;
    ReachLower := false;
  end if;
  // Updating flag for resetting state variable:
  if ReachUpper and Falling then
    Reinit := true;
    initVar := outMax;
  elseif ReachLower and Rising then
    Reinit := true;
    initVar := outMin;
  end if;
equation
  assert(
    outMax > outMin,
    "Upper limit must be greater than lower limit",
    AssertionLevel.error);
  // Equations depending on flags:
  if ReachUpper then
    x = 0;
    y = outMax;
  elseif ReachLower then
    x = 0;
    y = outMin;
  else
    x = u;
    y = w;
  end if;
  // Differential equation for integration block:
  der(w) = K*x;
  // Restarting state variable depending on flag:
  when Reinit then
    reinit(w,initVar);
  end when;
  annotation (
    Icon(graphics={Line(points={{40,100},{60,140},{100,140}}, color={0,0,0}),
          Text(
          extent={{-20,68},{20,8}},
          textColor={0,0,255},
          textString="K"),Line(
          points={{-80,0},{78,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=0.5),Text(
          extent={{-70,-20},{70,-80}},
          textColor={0,0,255},
          textString="s"),Line(points={{-100,-140},{-60,-140},{-40,-100}},
          color={0,0,0})}),
    Diagram);
end IntegratorLimVar;
