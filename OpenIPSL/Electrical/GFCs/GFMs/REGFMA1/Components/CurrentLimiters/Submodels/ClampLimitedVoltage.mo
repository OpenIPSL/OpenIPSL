within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.Components.CurrentLimiters.Submodels;
model ClampLimitedVoltage
  "The internal voltage that drives the clamped current: V + (R_a + jX_d)*Iclamp above Imax, the droop command below it"
  extends Base.PartialLimitedVoltage;
  Modelica.Blocks.Interfaces.RealInput ImaxRe(start=0)
    "Real part of the clamped current (pu, machine base)"
    annotation (Placement(transformation(extent={{-120,30},{-100,50}})));
  Modelica.Blocks.Interfaces.RealInput ImaxIm(start=0)
    "Imaginary part of the clamped current (pu, machine base)"
    annotation (Placement(transformation(extent={{-120,-50},{-100,-30}})));
equation
  Elr = V*cos(anglev) + R_a*ImaxRe - X_d*ImaxIm
    "The internal voltage that drives the clamped current, real part";
  Eli = V*sin(anglev) + R_a*ImaxIm + X_d*ImaxRe
    "The internal voltage that drives the clamped current, imaginary part";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, grid={2,2}), graphics={
        Line(
          points={{0,80},{60,80}},
          color={238,46,47},
          pattern=LinePattern.Dash,
          thickness=1),
        Text(
          extent={{-140,70},{-100,50}},
          textColor={28,108,200},
          fontName="Geist",
          textString="Re(Imax)"),
        Text(
          extent={{-140,-10},{-100,-30}},
          textColor={28,108,200},
          fontName="Geist",
          textString="Im(Imax)"),
        Line(
          points={{-60,-80},{-40,-80},{40,80},{60,80}},
          color={28,108,200},
          thickness=1),
        Ellipse(extent={{-60,60},{60,-60}},lineColor={28,108,200},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-40,-20},{0,20}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.None,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Ellipse(
          extent={{0,20},{40,-20}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={229,244,255},
          fillPattern=FillPattern.Solid,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None)}),
    Documentation(info="<html>
<p>
Gives the internal voltage to apply with the clamp of PSS/E's REGFMA1 <a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-MODELS]</a>.
Above <code>Imax</code> it is the voltage that drives the clamped current <code>ImaxRe + jImaxIm</code> (from <code>CurrentLimitValue</code>) through the source impedance,
<code>E = V + (R_a + jX_d) Iclamp</code>; below it, the droop command. Used in <code>Clamp</code>.
</p>
</html>"));
end ClampLimitedVoltage;
