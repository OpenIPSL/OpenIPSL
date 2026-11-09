within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters;
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
          points={{-24,78},{44,78}},
          color={238,46,47},
          pattern=LinePattern.Dash,
          thickness=1),
        Text(
          extent={{-90,98},{-30,62}},
          textColor={238,46,47},
          fontName="Geist",
          textString="Imax"),
        Text(
          extent={{-96,54},{-48,26}},
          textColor={28,108,200},
          fontName="Geist",
          textString="Re"),
        Text(
          extent={{-96,-26},{-48,-54}},
          textColor={28,108,200},
          fontName="Geist",
          textString="Im")}),
    Documentation(info="<html>
<p>
Gives the internal voltage to apply with the clamp of PSS/E's REGFMA1 <a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-MODELS]</a>.
Above <code>Imax</code> it is the voltage that drives the clamped current <code>ImaxRe + jImaxIm</code> (from <code>CurrentLimitValue</code>) through the source impedance,
<code>E = V + (R_a + jX_d) Iclamp</code>; below it, the droop command. Used in <code>Clamp</code>.
</p>
</html>"));
end ClampLimitedVoltage;
