within OpenIPSL.NonElectrical.Continuous;
model PI_No_Windup "PI controller with no wind-up"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Types.PerUnit K_P "Voltage regulator proportional gain";
  parameter Types.PerUnit K_I "Voltage regulator integral gain";
  parameter Types.PerUnit V_RMAX "Maximum regulator output";
  parameter Types.PerUnit V_RMIN "Minimum regulator output";
  parameter Types.PerUnit y_start_int "Initial output value";
  Modelica.Blocks.Continuous.Integrator    integral(
    k=K_I,
    use_reset=false,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=y_start_int)
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  Modelica.Blocks.Math.Gain proportional(k=K_P)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Math.MultiSum add(nu=2) annotation (Placement(transformation(extent={{38,-10},{58,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN)
    annotation (Placement(transformation(extent={{68,-10},{88,10}})));
  Modelica.Blocks.Logical.Switch reset_switch
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  Modelica.Blocks.Sources.RealExpression zero annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-70,80})));
equation
  reset_switch.u2 =
  if (abs(V_RMAX - y) <= Modelica.Constants.eps and der(integral.y)>0) then true
  else if (abs(V_RMIN - y) <= Modelica.Constants.eps and der(integral.y)<0) then true
  else false;
  connect(add.y, limiter.u) annotation (Line(points={{59.7,0},{66,0}}, color={0,0,127}));
  connect(reset_switch.u1, zero.y) annotation (Line(points={{-82,58},{-88,58},{-88,80},{-81,80}}, color={0,0,127}));
  connect(reset_switch.y,integral. u)
    annotation (Line(points={{-59,50},{-42,50}}, color={0,0,127}));
  connect(u, reset_switch.u3) annotation (Line(points={{-120,0},{-90,0},{-90,42},{-82,42}},
                     color={0,0,127}));
  connect(proportional.u, u) annotation (Line(points={{-42,0},{-120,0}},
                        color={0,0,127}));
  connect(limiter.y, y)
    annotation (Line(points={{89,0},{110,0}}, color={0,0,127}));
  connect(integral.y, add.u[1]) annotation (Line(points={{-19,50},{30,50},{30,3.5},{38,3.5}}, color={0,0,127}));
  connect(proportional.y, add.u[2]) annotation (Line(points={{-19,0},{26,0},{26,-3.5},{38,-3.5}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,
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
                   Line(points={{40,100},{60,140},{100,140}},color={0,0,0})}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}})));
end PI_No_Windup;
