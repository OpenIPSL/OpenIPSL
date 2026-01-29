within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters;
model CurrentLimitValue
  "Determines the current limit value by taking into account the virtual resistance, maximum current magnitude, internal and terminal voltage"
    Modelica.Blocks.Interfaces.RealInput V(start=1.0)
    "Input to vary the voltage magnitude of the voltage source" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,60}), iconTransformation(extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,60})));
  Modelica.Blocks.Interfaces.RealInput anglev(start=0.0)
    "Input to vary the angle of the voltage source" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,-60}), iconTransformation(extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,-60})));
  Modelica.Blocks.Interfaces.RealInput Emag(start=1.1)
    "Input to vary the voltage magnitude of the voltage source" annotation (
      Placement(transformation(extent={{-140,40},{-100,80}}),
        iconTransformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput Eang(start=0.01)
    "Input to vary the angle of the voltage source" annotation (Placement(
        transformation(extent={{-140,-80},{-100,-40}}), iconTransformation(
          extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealOutput ImaxRe(start=0) "Maximum current real part"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,110})));
  Modelica.Blocks.Interfaces.RealOutput ImaxIm(start=0) "Maximum current imaginary part"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-40,110})));
  Modelica.Blocks.Interfaces.RealOutput ImaxAng(start=0) "Maximum current angle"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,110})));
  Modelica.Blocks.Interfaces.RealOutput ImaxMag(start=0) "Maximum current magnitude"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,110})));
  Modelica.Blocks.Interfaces.RealInput R_e(start=0)
    "Input Value of the Virtual Resistance" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
  parameter Real R_a=1e-3 "Internal source resistance, pu, system base"
    annotation (Dialog(group="Voltage Source parameters"));
  parameter Real X_d=0.2 "Internal source d-axis reactance, pu, system base"
    annotation (Dialog(group="Voltage Source parameters"));
  parameter Real Imax = 2.0 "Inverter allowable maximum output current"
    annotation (Dialog(group="Current Limiter Setting"));

  // Auxiliary variables for internal computations

  protected
  Real ire(start=Imax);
  Real iim(start=0);
  Real R = R_a + R_e;

equation
  // Solve for the real and imaginary parts of the currents
  ire*R - iim*X_d = Emag*cos(Eang) - V*cos(anglev);
  ire*X_d + iim*R = Emag*sin(Eang) - V*sin(anglev);
  // Compute the limited current variables
  ImaxMag = Imax;
  ImaxAng = atan2(iim, ire);
  ImaxRe = Imax*cos(ImaxAng);
  ImaxIm = Imax*sin(ImaxAng);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(points={{-80,0},{-60,0}}, color={28,108,200},
          thickness=1),
        Line(points={{60,0},{80,0}}, color={28,108,200},
          thickness=1),
        Line(
          points={{-60,-80},{-40,-80},{40,80},{60,80}},
          color={28,108,200},
          thickness=1),
        Rectangle(
          extent={{-90,10},{-70,-10}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{70,10},{90,-10}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Ellipse(extent={{-60,60},{60,-60}},lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-40,0},{0,0}},   color={28,108,200},
          thickness=1),
        Polygon(
          points={{0,20},{40,0},{0,-20},{0,20}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          lineThickness=1)}), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CurrentLimitValue;
