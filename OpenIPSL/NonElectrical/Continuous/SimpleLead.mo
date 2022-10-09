within OpenIPSL.NonElectrical.Continuous;
block SimpleLead "First order lead transfer function block"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real K "Gain" annotation (Evaluate=false);
  parameter Types.Time T "Lead time constant"
    annotation (Evaluate=false);
  parameter Real y_start "Output start value"
    annotation (Dialog(group="Initialization"));
equation
  assert(
    T >= 1e-10,
    "Time constant must be greater than 0",
    AssertionLevel.error);
  T*der(u) = K*y - u;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Text(
          extent={{-56,68},{58,8}},
          textColor={0,0,255},
          textString="1+Ts"),Line(
          points={{-76,0},{82,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=0.5),Text(
          extent={{-66,-20},{74,-80}},
          textColor={0,0,255},
          textString="K")}));
end SimpleLead;
