within OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses;
model PIwithNoVariableLimiter "PI with no variable limiter controller for WECC electrical controllers"

  parameter Real K_P "Voltage regulator proportional gain";
  parameter Real K_I "Voltage regulator integral gain";
  parameter SI.PerUnit V_RMAX "Maximum regulator output";
  parameter SI.PerUnit V_RMIN "Minimum regulator output";
  parameter Real y_start "Starting output value for the integrator";
  parameter SI.Time T_aw=1e-4 "Time constant of the anti-windup: beyond a limit the outward rate of the integral state falls to zero over T_aw*|K_I*u| (must be positive)"
    annotation (Dialog(tab="Advanced"));
  Modelica.Blocks.Continuous.Integrator integral(
    k=1,
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
  Modelica.Blocks.Sources.RealExpression integralRate(y=min(max(K_I*u, min(0, K_I*u + (V_RMIN - PI_add.y)/T_aw)),
        max(0, K_I*u + (V_RMAX - PI_add.y)/T_aw)))
    "Rate of the integral state: K_I*u within the limits and towards them; beyond a limit an outward rate falls to zero over T_aw*|K_I*u|"
    annotation (Placement(transformation(extent={{-80,10},{-60,30}})));
  Modelica.Blocks.Interfaces.BooleanInput voltage_dip
    "Connector of first Boolean input signal"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
equation
  assert(T_aw > 0, "T_aw, the time constant of the anti-windup, must be positive");
  connect(proportional.y, PI_add.u2) annotation (Line(points={{21,-60},{30,-60},{30,-6},{36,-6}},
                            color={0,0,127}));
  connect(reset_switch.u1,realExpression. y)
    annotation (Line(points={{-42,48},{-54,48},{-54,80},{-59,80}},
                                                 color={0,0,127}));
  connect(integralRate.y, reset_switch.u3)
    annotation (Line(points={{-59,20},{-50,20},{-50,32},{-42,32}}, color={0,0,127}));
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
  connect(voltage_dip, reset_switch.u2)
    annotation (Line(points={{-120,60},{-98,60},{-98,40},{-42,40}}, color={255,0,255}));
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
<p>
The limit is a non-windup limit, as in the PI blocks of PSS&reg;E's WECC renewable models: the output
<code>y</code> is the sum <code>x + K_P*u</code> of the integral state <code>x</code> and the proportional part, limited to
<code>V_RMIN &le; y &le; V_RMAX</code>, and the integral state stops while the sum is beyond a limit and the input drives it further out. The state
moves again as soon as the input reverses, or as soon as the sum is back within the limits. When the proportional
part moves the sum back inside while the input still drives it out, the state follows the limit as fast as its
rate <code>K_I*u</code> allows: the sum stays on the limit while that rate keeps up. During a voltage dip (<code>voltage_dip = true</code>) the state is held.
</p>
<p>
The rate of the integral state is <code>K_I*u</code> while the sum is within the limits, and whenever it drives the
sum back towards them. Beyond a limit an outward rate falls linearly to zero over a band of width
<code>T_aw*|K_I*u|</code> (5e-3 pu with <code>K_I*u</code> = 50 pu/s and the default <code>T_aw = 1e-4</code> s), within
which the slope of the rate with respect to the state is <code>-1/T_aw</code>. The state is not pulled back: when the
limit or the proportional part moves, the sum can lie further beyond the limit than the band, and the state is then
held. The rate is a continuous function of the state, the input and the limits, so the anti-windup has no switch of
its own; the output limiter and the freeze during a voltage dip still switch, a finite number of times.
<code>T_aw</code> must be positive. A freeze switched by a condition - the earlier implementation, which
froze the state when the output was at a limit and <code>der(integral.y)</code> pointed outwards - changes the
condition it is decided on: at a limit the switch went on and off without end (OpenIPSL issue #467).
</p>
<p>The modelling of such component is based, mainly, on the following reference:</p>
<ul>
<li>Mohammed, M., Federico, M.: \"Modeling and Simulation of PI-Controllers Limiters for the Dynamic Analysis of VSC-Based Devices\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[Mohammed2019]</a>,</li>
</ul>
</html>"));
end PIwithNoVariableLimiter;
