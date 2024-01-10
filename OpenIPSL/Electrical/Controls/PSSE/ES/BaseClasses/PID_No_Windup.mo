within OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses;
model PID_No_Windup
  import Modelica.Units.SI;
  parameter SI.PerUnit K_PR "Voltage regulator proportional gain (pu)";
  parameter SI.TimeAging K_IR "Voltage regulator integral gain (pu)";
  parameter SI.PerUnit K_DR "Voltage regulator derivative gain (pu)";
  parameter SI.Time T_DR "Voltage regulator derivative channel time constant (sec)";
  parameter SI.PerUnit V_RMAX "Maximum regulator output (pu)";
  parameter SI.PerUnit V_RMIN "Minimum regulator output (pu)";
  parameter Real VR0;
  Modelica.Blocks.Continuous.Integrator    integral(
    k=K_IR,
    use_reset=false,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=VR0)
    annotation (Placement(transformation(extent={{-44,30},{-24,50}})));
  Modelica.Blocks.Math.Gain proportional(k=K_PR)
    annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
  Modelica.Blocks.Math.Gain gain1(k=K_DR*kd)
    annotation (Placement(transformation(extent={{-40,-44},{-20,-24}})));
  Modelica.Blocks.Math.Add3 PID_add
    annotation (Placement(transformation(extent={{32,-10},{52,10}})));
  Modelica.Blocks.Math.Add derivative_add(k2=-1)
    annotation (Placement(transformation(extent={{-2,-50},{18,-30}})));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-160,-20},{-120,20}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Continuous.Integrator derivative(initType=Modelica.Blocks.Types.Init.InitialOutput,
      y_start=0)
    annotation (Placement(transformation(extent={{-42,-80},{-22,-60}})));
  Modelica.Blocks.Math.Gain gain2(k=kd)
    annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN)
    annotation (Placement(transformation(extent={{68,-10},{88,10}})));
  Modelica.Blocks.Logical.Switch reset_switch
    annotation (Placement(transformation(extent={{-82,30},{-62,50}})));
  Modelica.Blocks.Sources.RealExpression realExpression
    annotation (Placement(transformation(extent={{-116,38},{-96,58}})));
protected
  parameter Real kd = if T_DR <= Modelica.Constants.eps then 1 else 1/T_DR;
equation
  reset_switch.u2 =
  if (abs(V_RMAX - y) <= Modelica.Constants.eps and der(integral.y)>0) then true
  else if (abs(V_RMIN - y) <= Modelica.Constants.eps and der(integral.y)<0) then true
  else false;
  connect(integral.y, PID_add.u1)
    annotation (Line(points={{-23,40},{6,40},{6,8},{30,8}}, color={0,0,127}));
  connect(proportional.y, PID_add.u2)
    annotation (Line(points={{-21,0},{30,0}}, color={0,0,127}));
  connect(gain1.y, derivative_add.u1)
    annotation (Line(points={{-19,-34},{-4,-34}}, color={0,0,127}));
  connect(derivative.y, derivative_add.u2) annotation (Line(points={{-21,-70},{-12,
          -70},{-12,-46},{-4,-46}}, color={0,0,127}));
  connect(gain2.y,derivative. u)
    annotation (Line(points={{-59,-70},{-44,-70}}, color={0,0,127}));
  connect(y, limiter.y)
    annotation (Line(points={{110,0},{89,0}}, color={0,0,127}));
  connect(PID_add.y, limiter.u)
    annotation (Line(points={{53,0},{60,0},{60,0},{66,0}}, color={0,0,127}));
  connect(reset_switch.u1, realExpression.y)
    annotation (Line(points={{-84,48},{-95,48}}, color={0,0,127}));
  connect(reset_switch.u3, u) annotation (Line(points={{-84,32},{-96,32},{-96,0},
          {-140,0}}, color={0,0,127}));
  connect(reset_switch.y, integral.u)
    annotation (Line(points={{-61,40},{-46,40}}, color={0,0,127}));
  connect(proportional.u, u)
    annotation (Line(points={{-44,0},{-140,0}}, color={0,0,127}));
  connect(gain1.u, u) annotation (Line(points={{-42,-34},{-96,-34},{-96,0},{-140,
          0}}, color={0,0,127}));
  connect(derivative_add.y, PID_add.u3) annotation (Line(points={{19,-40},{24,-40},
          {24,-8},{30,-8}}, color={0,0,127}));
  connect(gain2.u, PID_add.u3) annotation (Line(points={{-82,-70},{-90,-70},{-90,
          -90},{24,-90},{24,-8},{30,-8}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{100,60}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{100,
            60}})),
    conversion(noneFromVersion=""));
end PID_No_Windup;
