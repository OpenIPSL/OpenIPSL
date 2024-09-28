within OpenIPSL.NonElectrical.Continuous;
model PID_No_Windup_AC8B
  import Modelica.Units.SI;
  parameter SI.PerUnit K_P "Voltage regulator proportional gain (pu)";
  parameter SI.TimeAging K_I "Voltage regulator integral gain (pu)";
  parameter SI.PerUnit K_D "Voltage regulator derivative gain (pu)";
  parameter SI.Time T_D "Voltage regulator derivative channel time constant (sec)";
  parameter SI.PerUnit V_RMAX "Maximum regulator output (pu)";
  parameter SI.PerUnit V_RMIN "Minimum regulator output (pu)";
//  parameter SI.PerUnit K_PA "Voltage regulator gain (pu)";
  parameter Real VPID0;
  Modelica.Blocks.Continuous.Integrator    integral(
    k=K_I,
    use_reset=false,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=VPID0)
    annotation (Placement(transformation(extent={{-44,30},{-24,50}})));
  Modelica.Blocks.Math.Gain proportional(k=K_P)
    annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
  Modelica.Blocks.Math.Gain gain1(k=K_D/T_D)
    annotation (Placement(transformation(extent={{-42,-44},{-22,-24}})));
  Modelica.Blocks.Math.Add3 add3_1
    annotation (Placement(transformation(extent={{32,-10},{52,10}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{-4,-50},{16,-30}})));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-160,-20},{-120,20}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Continuous.Integrator derivative(initType=Modelica.Blocks.Types.Init.InitialOutput,
      y_start=0)
    annotation (Placement(transformation(extent={{-44,-80},{-24,-60}})));
  Modelica.Blocks.Math.Gain gain2(k=1/T_D)
    annotation (Placement(transformation(extent={{-82,-80},{-62,-60}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN)
    annotation (Placement(transformation(extent={{68,-10},{88,10}})));
  Modelica.Blocks.Logical.Switch reset_switch
    annotation (Placement(transformation(extent={{-82,30},{-62,50}})));
  Modelica.Blocks.Sources.RealExpression realExpression
    annotation (Placement(transformation(extent={{-116,38},{-96,58}})));
equation
  reset_switch.u2 =
  if (abs(V_RMAX - y) <= Modelica.Constants.eps and der(integral.y)>0)
    then true
  else if (abs(V_RMIN - y) <= Modelica.Constants.eps and der(integral.y)<0)
    then true
  else false;
  connect(integral.y, add3_1.u1)
    annotation (Line(points={{-23,40},{6,40},{6,8},{30,8}}, color={0,0,127}));
  connect(proportional.y, add3_1.u2) annotation (Line(points={{-21,0},{30,0}},
                           color={0,0,127}));
  connect(gain1.y, add.u1) annotation (Line(points={{-21,-34},{-6,-34}},
                     color={0,0,127}));
  connect(add.y, add3_1.u3) annotation (Line(points={{17,-40},{22,-40},{22,-8},{
          30,-8}}, color={0,0,127}));
  connect(derivative.y, add.u2) annotation (Line(points={{-23,-70},{-14,-70},{-14,
          -46},{-6,-46}}, color={0,0,127}));
  connect(gain2.y,derivative. u)
    annotation (Line(points={{-61,-70},{-46,-70}}, color={0,0,127}));
  connect(gain2.u, add3_1.u3) annotation (Line(points={{-84,-70},{-92,-70},{-92,
          -92},{22,-92},{22,-8},{30,-8}}, color={0,0,127}));
  connect(y, limiter.y)
    annotation (Line(points={{110,0},{89,0}}, color={0,0,127}));
  connect(add3_1.y, limiter.u)
    annotation (Line(points={{53,0},{60,0},{60,0},{66,0}}, color={0,0,127}));
  connect(reset_switch.u1, realExpression.y)
    annotation (Line(points={{-84,48},{-95,48}}, color={0,0,127}));
  connect(reset_switch.u3, u) annotation (Line(points={{-84,32},{-96,32},{-96,0},
          {-140,0}}, color={0,0,127}));
  connect(reset_switch.y, integral.u)
    annotation (Line(points={{-61,40},{-46,40}}, color={0,0,127}));
  connect(proportional.u, u)
    annotation (Line(points={{-44,0},{-140,0}}, color={0,0,127}));
  connect(gain1.u, u) annotation (Line(points={{-44,-34},{-96,-34},{-96,0},{-140,
          0}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{100,60}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{100,
            60}})),
    conversion(noneFromVersion=""));
end PID_No_Windup_AC8B;
