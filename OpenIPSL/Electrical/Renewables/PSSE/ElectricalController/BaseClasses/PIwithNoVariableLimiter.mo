within OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses;
model PIwithNoVariableLimiter "PI with no variable limiter controller for WECC electrical controllers"

  parameter Real K_P "Voltage regulator proportional gain";
  parameter Real K_I "Voltage regulator integral gain";
  parameter SI.PerUnit V_RMAX "Maximum regulator output";
  parameter SI.PerUnit V_RMIN "Minimum regulator output";
  parameter Real y_start "Starting output value for the integrator";
  Modelica.Blocks.Continuous.Integrator integral(
    k=K_I,
    use_reset=false,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=y_start)
    annotation (Placement(transformation(extent={{0,30},{20,50}})));
  Modelica.Blocks.Math.Gain proportional(k=K_P)
    annotation (Placement(transformation(extent={{0,-70},{20,-50}})));
  Modelica.Blocks.Math.Add PI_add
    annotation (Placement(transformation(extent={{38,-10},{58,10}})));
  Modelica.Blocks.Logical.Switch reset_switch
    annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  Modelica.Blocks.Sources.RealExpression realExpression
    annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN)
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  Modelica.Blocks.Logical.Or or1
    annotation (Placement(transformation(extent={{-92,30},{-72,50}})));
  Modelica.Blocks.Interfaces.BooleanInput voltage_dip
    "Connector of first Boolean input signal"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
equation
  or1.u2 =
  if (abs(V_RMAX - y) <= Modelica.Constants.eps and der(integral.y)>0) then true
  else if (abs(V_RMIN - y) <= Modelica.Constants.eps and der(integral.y)<0) then true
  else false;
  connect(proportional.y, PI_add.u2) annotation (Line(points={{21,-60},{30,-60},{30,-6},{36,-6}},
                            color={0,0,127}));
  connect(reset_switch.u1,realExpression. y)
    annotation (Line(points={{-42,48},{-54,48},{-54,80},{-59,80}},
                                                 color={0,0,127}));
  connect(reset_switch.u3,u) annotation (Line(points={{-42,32},{-60,32},{-60,-60},{-120,-60}},
                     color={0,0,127}));
  connect(reset_switch.y,integral. u)
    annotation (Line(points={{-19,40},{-2,40}}, color={0,0,127}));
  connect(proportional.u,u)
    annotation (Line(points={{-2,-60},{-120,-60}},
                                                color={0,0,127}));
  connect(PI_add.y, limiter.u)
    annotation (Line(points={{59,0},{68,0}}, color={0,0,127}));
  connect(limiter.y, y)
    annotation (Line(points={{91,0},{110,0}}, color={0,0,127}));
  connect(integral.y, PI_add.u1)
    annotation (Line(points={{21,40},{30,40},{30,6},{36,6}},color={0,0,127}));
  connect(or1.u1,voltage_dip)
    annotation (Line(points={{-94,40},{-98,40},{-98,60},{-120,60}},
                                                  color={255,0,255}));
  connect(or1.y, reset_switch.u2)
    annotation (Line(points={{-71,40},{-42,40}}, color={255,0,255}));
  annotation (
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}),
        graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}), Text(
          extent={{-80,40},{80,-40}},
          textColor={0,0,255},
          textString="PI WECC Renewables")}),
    Documentation(info="<html>
<p>
Specific PI with no variable limiter component for the WECC-based renewable energy controller models.
</p>
<p>The modelling of such component is based, mainly, on the following reference:</p>
<ul>
<li>Mohammed, M., Federico, M.: \"Modeling and Simulation of PI-Controllers Limiters for the Dynamic Analysis of VSC-Based Devices\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[Mohammed2019]</a>,</li>
</ul>
</html>"));
end PIwithNoVariableLimiter;
