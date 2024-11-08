within OpenIPSL.NonElectrical.Continuous;
model PI_No_Windup "PI controller with no wind-up"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Types.PerUnit K_P "Voltage regulator proportional gain";
  parameter Types.PerUnit K_I "Voltage regulator integral gain";
  parameter Types.PerUnit V_RMAX "Maximum regulator output";
  parameter Types.PerUnit V_RMIN "Minimum regulator output";
  parameter Real y_start_int;
  Modelica.Blocks.Continuous.Integrator    integral(
    k=K_I,
    use_reset=false,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=y_start_int)
    annotation (Placement(transformation(extent={{-18,30},{2,50}})));
  Modelica.Blocks.Math.Gain proportional(k=K_P)
    annotation (Placement(transformation(extent={{-26,-50},{-6,-30}})));
  Modelica.Blocks.Math.Add PI_add
    annotation (Placement(transformation(extent={{38,-10},{58,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN)
    annotation (Placement(transformation(extent={{68,-10},{88,10}})));
  Modelica.Blocks.Logical.Switch reset_switch
    annotation (Placement(transformation(extent={{-56,30},{-36,50}})));
  Modelica.Blocks.Sources.RealExpression realExpression
    annotation (Placement(transformation(extent={{-90,38},{-70,58}})));
equation
  reset_switch.u2 =
  if (abs(V_RMAX - y) <= Modelica.Constants.eps and der(integral.y)>0) then true
  else if (abs(V_RMIN - y) <= Modelica.Constants.eps and der(integral.y)<0) then true
  else false;
  connect(integral.y, PI_add.u1) annotation (Line(points={{3,40},{30,40},{30,6},
          {36,6}}, color={0,0,127}));
  connect(proportional.y, PI_add.u2) annotation (Line(points={{-5,-40},{30,-40},
          {30,-6},{36,-6}}, color={0,0,127}));
  connect(PI_add.y, limiter.u)
    annotation (Line(points={{59,0},{66,0}}, color={0,0,127}));
  connect(reset_switch.u1,realExpression. y)
    annotation (Line(points={{-58,48},{-69,48}}, color={0,0,127}));
  connect(reset_switch.y,integral. u)
    annotation (Line(points={{-35,40},{-20,40}}, color={0,0,127}));
  connect(u, reset_switch.u3) annotation (Line(points={{-120,0},{-66,0},{-66,32},
          {-58,32}}, color={0,0,127}));
  connect(proportional.u, u) annotation (Line(points={{-28,-40},{-66,-40},{-66,
          0},{-120,0}}, color={0,0,127}));
  connect(limiter.y, y)
    annotation (Line(points={{89,0},{110,0}}, color={0,0,127}));
  annotation (
    Icon(graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,
              200}),                                                      Text(
          extent={{0,44},{94,0}},
          lineColor={0,0,255},
          textString="Ki"),
                          Text(
          extent={{-64,22},{-18,-18}},
          lineColor={0,0,255},
          textString="Kp"),
                          Line(
          points={{24,0},{68,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=0.5),Text(
          extent={{20,4},{72,-44}},
          lineColor={0,0,255},
          textString="s"),
        Text(
          extent={{-24,18},{22,-18}},
          textColor={0,0,255},
          textString="+"),
          Line(points={{-100,-140},{-60,-140},{-40,-100}}, color={0,0,0}),
                   Line(points={{40,100},{60,140},{100,140}},color={0,0,0})}));
end PI_No_Windup;
