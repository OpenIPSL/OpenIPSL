within OpenIPSL.Electrical.Sources.SourceBehindImpedance.VoltageSources;
model VSourceIO
  "Generic voltage source behind an internal impedance with inputs that vary the internal source magnitude and angle from steady state"
  extends BaseClasses.baseVoltageSource;
  // Input ports and polar to rectangular conversion
  Modelica.Blocks.Interfaces.RealInput uDEmag(start=0)
    "Input to vary the voltage magnitude of the voltage source"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput uDEang(start=0)
    "Input to vary the angle of the voltage source"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Math.PolarToRectangular p2R
    "Convert from magnitude and angle to real and imaginary"
    annotation (Placement(transformation(extent={{-42,-22},{0,20}})));
  // Includes conditional option to set the input as a deviation from
  // the initialization value, or to use the input as a whole quantity.
  parameter Boolean useEphasorInternalAsInput = true
  "If true, the values of E0 and delta0 are computed internally and used
  as the start value of the input, requiring only a deviation \\Delta E and 
  \\Delta delta to be supplied. 
  If false, the magnitude E and angle delta must be supplied, including
  the correct value of E0 and delta0 needed for proper initialization.";
equation
  // Internal voltage source equations
  if useEphasorInternalAsInput then
    // Condition: true
    // This injects a signal that is a deviation from the inital value of
    // E0 and delta0, for the two variables, which are calculated in the base class.
    delta = delta0 + uDEang "Initial angle plus input increment";
    E = E0 + uDEmag "Initial magnitude plus input increment";
    Er = Er0 + p2R.y_re;
    Ei = Ei0 + p2R.y_im;

  else
    // Condition: false
    // This injects a voltage phasor to define the internal voltage of the
    // source, as the internally computed values that are needed to initialize
    // properly E and delta (E0 and delta0) are not included, they need to be
    // provided externally by the user.
    delta = uDEang   "Internal voltage angle, delta, provided by the graphical input uDEang";
    E = uDEmag   "Internal voltage magnitude, E, provided by the graphical input uDEmag";
    Er = p2R.y_re "Real part of phasor calculated with the p2R block on the diagram layer";
    Ei = p2R.y_im "Imaginary part of phasor calculated with the p2R block on the diagram layer";
  end if;
  connect(p2R.u_abs, uDEmag) annotation (Line(points={{-46.2,11.6},{-94,11.6},{
          -94,60},{-120,60}}, color={0,0,127}));
  connect(p2R.u_arg, uDEang) annotation (Line(points={{-46.2,-13.6},{-94,-13.6},
          {-94,-60},{-120,-60}}, color={0,0,127}));
  annotation (Diagram(graphics={ Rectangle(
          extent={{52,20},{80,-20}},
          lineColor={28,108,200},
          fillColor={217,67,180},
          fillPattern=FillPattern.Solid,
          radius=15), Text(
          extent={{-80,-18},{80,-98}},
          textColor={217,67,180},
          textString="Text Layer assigns p2R.y_re and p2R.y_im to uvre and uvim,
which are the real and imaginary input
 voltage deviations from the initial value")}), Icon(graphics={
        Ellipse(extent={{-100,100},{100,-100}},
                                           lineColor={215,215,215},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-100,60},{-60,60}},
          color={28,108,200},
          thickness=1),
        Polygon(
          points={{3,8},{7,-2},{-1,-2},{3,8}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          origin={-48,3},
          rotation=270),
        Line(
          points={{-60,60},{-60,0}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-100,-60},{-60,-60}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-60,-60},{-60,0}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-60,0},{-40,0}},
          color={28,108,200},
          thickness=1),
        Ellipse(extent={{-40,40},{40,-40}},lineColor={28,108,200},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-20,-10},{0,10}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Ellipse(
          extent={{0,10},{20,-10}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.None,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Line(
          points={{40,0},{100,0}},
          color={0,0,255},
          thickness=1),
        Text(
          extent={{-100,140},{100,100}},
          textColor={0,0,0},
          textString="%name")}),
    Documentation(info="<html>
<p>The purpose of this model is to support the development of Grid-Forming Inverter models as described in <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2021]</a>. The model provides a voltage source with an internal voltage source and internal impedance whose magnitude and angle can be varied via inputs starting from their initial values. </p>
<p>See the documentation of <a href=\"Modelica://OpenIPSL.Electrical.Sources.SourceBehindImpedance.BaseClasses.baseVoltageSource\">BaseClasses.baseVoltageSource</a> for more information. </p>
</html>"));
end VSourceIO;
