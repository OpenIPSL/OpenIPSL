within OpenIPSL.NonElectrical.Continuous;
block LeadLagLim "Lead-Lag filter with a non-windup limiter"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real K "Gain";
  parameter Types.Time T1 "Lead time constant";
  parameter Types.Time T2 "Lag time constant";
  parameter Real outMax "Maximum output value";
  parameter Real outMin "Minimum output value";
  parameter Real y_start "Output start value"
    annotation (Dialog(group="Initialization"));
  Modelica.Blocks.Math.Add add2(k2=1)
    annotation (Placement(transformation(extent={{-40,-16},{-20,4}})));
  Modelica.Blocks.Math.Gain gain(k=T1/T2)
    annotation (Placement(transformation(extent={{0,-16},{20,4}})));
  Modelica.Blocks.Math.Add add3(k2=-1)
    annotation (Placement(transformation(extent={{40,-66},{20,-46}})));
  Modelica.Blocks.Continuous.Integrator integrator(
    y_start=y_start,
    k=1/T1,
    initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{0,-66},{-20,-46}})));
  Modelica.Blocks.Math.Gain gain1(k=T2/T1 - 1)
    annotation (Placement(transformation(extent={{-50,-66},{-70,-46}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=outMax, uMin=outMin)
    annotation (Placement(transformation(extent={{42,-16},{62,4}})));
equation
  connect(add2.y, gain.u)
    annotation (Line(points={{-19,-6},{-10.5,-6},{-2,-6}}, color={0,0,127}));
  connect(integrator.u, add3.y)
    annotation (Line(points={{2,-56},{19,-56}}, color={0,0,127}));
  connect(integrator.y, add3.u2) annotation (Line(points={{-21,-56},{-40,-56},{
          -40,-86},{66,-86},{66,-62},{42,-62}}, color={0,0,127}));
  connect(gain1.u, add3.u2) annotation (Line(points={{-48,-56},{-40,-56},{-40,-86},
          {66,-86},{66,-62},{42,-62}}, color={0,0,127}));
  connect(gain1.y, add2.u2) annotation (Line(points={{-71,-56},{-80,-56},{-80,-12},
          {-42,-12}}, color={0,0,127}));
  connect(u, add2.u1)
    annotation (Line(points={{-120,0},{-42,0}}, color={0,0,127}));
  connect(gain.y, limiter.u)
    annotation (Line(points={{21,-6},{30.5,-6},{40,-6}}, color={0,0,127}));
  connect(limiter.y, y) annotation (Line(points={{63,-6},{82,-6},{82,0},{110,0}},
        color={0,0,127}));
  connect(add3.u1, y) annotation (Line(points={{42,-50},{72,-50},{72,-6},{82,-6},
          {82,0},{110,0}}, color={0,0,127}));
  annotation (
    Icon(graphics={Line(points={{38,100},{58,140},{98,140}}, color={0,0,0}),
          Line(points={{-102,-140},{-62,-140},{-42,-100}}, color={0,0,0}),Text(
          extent={{-50,82},{70,22}},
          textColor={0,0,255},
          textString="1+sT"),Text(
          extent={{56,44},{76,24}},
          textColor={0,0,255},
          textString="1"),Line(
          points={{-52,0},{76,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=0.5),Text(
          extent={{-50,-20},{70,-80}},
          textColor={0,0,255},
          textString="1+sT"),Text(
          extent={{58,-58},{78,-78}},
          textColor={0,0,255},
          textString="2"),Text(
          extent={{-106,28},{-46,-32}},
          textColor={0,0,255},
          textString="K")}),
    Documentation(info="<html>
</html>"));
end LeadLagLim;
