within OpenIPSL.NonElectrical.Continuous;
model PID_No_Windup "PID controller with no wind-up"
  extends PI_No_Windup(add(nu=3));
  parameter Types.PerUnit K_D "Voltage regulator derivative gain";
  parameter Types.Time T_D "Voltage regulator derivative channel time constant";

  Modelica.Blocks.Math.Gain gain1(k=K_D*kd)
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Blocks.Math.Add derivative_add(k2=-1)
    annotation (Placement(transformation(extent={{0,-46},{20,-26}})));
  Modelica.Blocks.Continuous.Integrator derivative(initType=Modelica.Blocks.Types.Init.InitialOutput, y_start=0)
    annotation (Placement(transformation(extent={{-40,-80},{-20,-60}})));
  Modelica.Blocks.Math.Gain gain2(k=kd)
    annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));
protected
  parameter Real kd = if T_D <= Modelica.Constants.eps then 1 else 1/T_D;
equation
  connect(gain1.y,derivative_add. u1)
    annotation (Line(points={{-19,-30},{-2,-30}}, color={0,0,127}));
  connect(derivative.y,derivative_add. u2) annotation (Line(points={{-19,-70},{-10,-70},{-10,-42},{-2,-42}},
                                    color={0,0,127}));
  connect(gain2.y,derivative. u)
    annotation (Line(points={{-59,-70},{-42,-70}}, color={0,0,127}));
  connect(u,gain1. u) annotation (Line(points={{-120,0},{-90,0},{-90,-30},{-42,-30}},
                 color={0,0,127}));
  connect(gain2.u, derivative_add.y) annotation (Line(points={{-82,-70},{-90,-70},{-90,-92},{30,-92},{30,-36},{21,-36}}, color={0,0,127}));
  connect(derivative_add.y, add.u[3]) annotation (Line(points={{21,-36},{30,-36},{30,0},{38,0}}, color={0,0,127}));
end PID_No_Windup;
