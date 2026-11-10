within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.Components.CurrentLimiters.Submodels;
model CurrentLimitValue
  "Determines the current limit value by taking into account the virtual resistance, maximum current magnitude, internal and terminal voltage"
    Modelica.Blocks.Interfaces.RealInput V(start=1.0)
    "Input to vary the voltage magnitude of the voltage source" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,-20}),
                          iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,-20})));
  Modelica.Blocks.Interfaces.RealInput anglev(start=0.0)
    "Input to vary the angle of the voltage source" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,-80}),iconTransformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,-80})));
  Modelica.Blocks.Interfaces.RealInput Emag(start=1.1)
    "Input to vary the voltage magnitude of the voltage source" annotation (
      Placement(transformation(extent={{-120,70},{-100,90}}),
        iconTransformation(extent={{-120,70},{-100,90}})));
  Modelica.Blocks.Interfaces.RealInput Eang(start=0.01)
    "Input to vary the angle of the voltage source" annotation (Placement(
        transformation(extent={{-120,10},{-100,30}}),   iconTransformation(
          extent={{-120,10},{-100,30}})));
  Modelica.Blocks.Interfaces.RealOutput ImaxRe(start=0) "Maximum current real part"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,-40})));
  Modelica.Blocks.Interfaces.RealOutput ImaxIm(start=0) "Maximum current imaginary part"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,-80})));
  Modelica.Blocks.Interfaces.RealOutput ImaxAng(start=0) "Maximum current angle"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,40})));
  Modelica.Blocks.Interfaces.RealOutput ImaxMag(start=0) "Maximum current magnitude"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,80})));
  Modelica.Blocks.Interfaces.RealInput R_e(start=0)
    "Input Value of the Virtual Resistance" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-110})));
  parameter Real R_a=1e-3 "Internal source resistance, pu, machine base"
    annotation (Dialog(group="Voltage Source parameters"));
  parameter Real X_d=0.2 "Internal source d-axis reactance, pu, machine base"
    annotation (Dialog(group="Voltage Source parameters"));
  parameter Real Imax = 2.0 "Inverter allowable maximum output current, pu, machine base"
    annotation (Dialog(group="Current Limiter Setting"));

  protected
  Real ire(start=Imax) "Real part of the current (E - V)/(R_a + R_e + jX_d)";
  Real iim(start=0) "Imaginary part of the current (E - V)/(R_a + R_e + jX_d)";
  Real R = R_a + R_e "Total resistance in series with the source";

equation
  ire*R - iim*X_d = Emag*cos(Eang) - V*cos(anglev) "Real part of (R + jX_d)*i = E - V";
  ire*X_d + iim*R = Emag*sin(Eang) - V*sin(anglev) "Imaginary part of (R + jX_d)*i = E - V";
  ImaxMag = Imax "The magnitude of the limited current";
  ImaxAng = atan2(iim, ire) "The angle of the current through R_a + R_e + jX_d";
  ImaxRe = Imax*cos(ImaxAng) "Real part of the current of magnitude Imax at that angle";
  ImaxIm = Imax*sin(ImaxAng) "Imaginary part of the current of magnitude Imax at that angle";

  annotation (preferredView="text",Icon(coordinateSystem(preserveAspectRatio=false), graphics={
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
        Line(points={{-40,0},{0,0}}, color={28,108,200},
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
          lineThickness=1),
        Text(
          extent={{-142,70},{-102,50}},
          textColor={28,108,200},
          fontName="Geist",
          horizontalAlignment=TextAlignment.Right,
          textString="|E|"),
        Text(
          extent={{-142,50},{-102,30}},
          textColor={28,108,200},
          fontName="Geist",
          horizontalAlignment=TextAlignment.Right,
          textString="∡E"),
        Text(
          extent={{-142,-30},{-102,-50}},
          textColor={28,108,200},
          fontName="Geist",
          horizontalAlignment=TextAlignment.Right,
          textString="V"),
        Text(
          extent={{-142,-50},{-102,-70}},
          textColor={28,108,200},
          fontName="Geist",
          horizontalAlignment=TextAlignment.Right,
          textString="∡V"),
        Text(
          extent={{100,70},{140,50}},
          textColor={28,108,200},
          fontName="Geist",
          textString="|Imax|"),
        Text(
          extent={{100,30},{140,10}},
          textColor={28,108,200},
          fontName="Geist",
          textString="∡Imax"),
        Text(
          extent={{100,-12},{140,-32}},
          textColor={28,108,200},
          fontName="Geist",
          textString="Re(Imax)"),
        Text(
          extent={{100,-52},{140,-72}},
          textColor={28,108,200},
          fontName="Geist",
          textString="Im(Imax)")}),
    Documentation(info="<html>
<p>
The current phasor of magnitude <code>Imax</code> (pu, machine base) at the angle of the current that the internal voltage
<code>E</code> (inputs <code>Emag</code>, <code>Eang</code>) drives through <code>R_a + R_e + jX_d</code> into the terminal voltage
<code>V</code> (inputs <code>V</code>, <code>anglev</code>): <code>ImaxRe + j ImaxIm = Imax (E - V)/|E - V| e^(-j atan(X_d/(R_a + R_e)))</code>.
</p>
<p>
With <code>R_e = 0</code> the angle is that of the unlimited current, which is the current the clamp of PSS/E's REGFMA1 keeps while it
limits the magnitude (<code>CurrentLimiters.Clamp</code> uses this block so); with the virtual resistance of <code>VRe</code>
it is the angle of the current of the virtual-resistor limiter. The outputs are the limited current whether or not the limit is reached:
the block does not decide when to limit.
</p>
</html>"),
    Diagram(coordinateSystem(grid={2,2})));
end CurrentLimitValue;
