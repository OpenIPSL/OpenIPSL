within OpenIPSL.NonElectrical.Continuous;
model PI_No_Windup
  import Modelica.Units.SI;
  parameter SI.PerUnit K_P "Voltage regulator proportional gain (pu)";
  parameter SI.PerUnit K_I "Voltage regulator integral gain (pu)";
  parameter SI.PerUnit V_RMAX "Maximum regulator output (pu)";
  parameter SI.PerUnit V_RMIN "Minimum regulator output (pu)";
  parameter Real y_start;
  Modelica.Blocks.Continuous.Integrator    integral(
    k=K_I,
    use_reset=false,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=y_start)
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
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  reset_switch.u2 =
  if (abs(V_RMAX - y) <= Modelica.Constants.eps and der(integral.y)>0) then true
  else if (abs(V_RMIN - y) <= Modelica.Constants.eps and der(integral.y)<0) then true
  else false;
  connect(integral.y, PI_add.u1) annotation (Line(points={{3,40},{30,40},{30,6},
          {36,6}}, color={0,0,127}));
  connect(proportional.y, PI_add.u2) annotation (Line(points={{-5,-40},{30,-40},
          {30,-6},{36,-6}}, color={0,0,127}));
  connect(y,limiter. y)
    annotation (Line(points={{110,0},{89,0}}, color={0,0,127}));
  connect(PI_add.y, limiter.u)
    annotation (Line(points={{59,0},{66,0}}, color={0,0,127}));
  connect(reset_switch.u1,realExpression. y)
    annotation (Line(points={{-58,48},{-69,48}}, color={0,0,127}));
  connect(reset_switch.u3,u)  annotation (Line(points={{-58,32},{-70,32},{-70,0},
          {-120,0}}, color={0,0,127}));
  connect(reset_switch.y,integral. u)
    annotation (Line(points={{-35,40},{-20,40}}, color={0,0,127}));
  connect(proportional.u,u)
    annotation (Line(points={{-28,-40},{-70,-40},{-70,0},{-120,0}},
                                                color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{100,100}}),
        graphics={Rectangle(extent={{-120,100},{100,-100}}, lineColor={28,108,
              200})}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}})));
end PI_No_Windup;
