within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters;
model VRe "Virtual Resistor Computation"
  Modelica.Blocks.Interfaces.RealInput Emag
    "Input to vary the voltage magnitude of the voltage source" annotation (
      Placement(transformation(extent={{-140,42},{-100,82}}),
        iconTransformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput Eang
    "Input to vary the angle of the voltage source" annotation (Placement(
        transformation(extent={{-140,-80},{-100,-40}}), iconTransformation(
          extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealInput V
    "Input to vary the voltage magnitude of the voltage source" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,60}), iconTransformation(extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,60})));
  Modelica.Blocks.Interfaces.RealInput anglev
    "Input to vary the angle of the voltage source" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,-60}), iconTransformation(extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,-60})));
  Modelica.Blocks.Interfaces.RealOutput R_e
    "Output Value of the Virtual Resistance" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,110})));
  parameter Real R_a=1e-3 "Internal source resistance, pu, system base"
    annotation (Dialog(group="Voltage Source parameters"));
  parameter Real X_d=0.2 "Internal source d-axis reactance, pu, system base"
    annotation (Dialog(group="Voltage Source parameters"));
  parameter Real Imax = 2.0 "Inverter allowable maximum output current"
    annotation (Dialog(group="Current Limiter Setting"));
  Real numval(start=0) "Numerator of the expression within the division of R_e computation";
  Real Ra2pXd2(start=0) "Square sume of the voltage source resistance and reactance";
  Real divres(start=0) "Result of the division in the R_e computation";
  Real subsval(start=0) "Result of substraction in the R_e computation";
equation
  numval = Emag^2 + V^2 - 2*Emag*V*cos(Eang-anglev);
  divres =   numval/Imax^2;
  Ra2pXd2 = R_a^2+X_d^2;
  subsval = divres - Ra2pXd2;
  if subsval > 0.0 then
    R_e = sqrt(max(subsval,Modelica.Constants.eps));
  elseif subsval < 0.0 then
    R_e = 0.0;
  else
    R_e = 0.0;
  end if;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          lineThickness=1),
        Rectangle(
          extent={{-80,10},{-60,-10}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-60,0},{-40,0}}, color={28,108,200},
          thickness=1),
        Rectangle(
          extent={{-40,20},{40,-20}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineThickness=1),
        Line(points={{40,0},{60,0}}, color={28,108,200},
          thickness=1),
        Rectangle(
          extent={{60,10},{80,-10}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-60,-20},{60,-100}},
          textColor={28,108,200},
          textString="R_e"),
        Text(
          extent={{-80,92},{80,-40}},
          textColor={170,213,255},
          textStyle={TextStyle.Bold},
          textString="V"),
        Text(
          extent={{-80,88},{80,-72}},
          textColor={28,108,200},
          textString="V",
          textStyle={TextStyle.Bold})}),
                                       Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end VRe;
