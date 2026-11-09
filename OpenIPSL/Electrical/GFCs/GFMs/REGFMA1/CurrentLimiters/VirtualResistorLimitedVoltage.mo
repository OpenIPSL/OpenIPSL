within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters;
model VirtualResistorLimitedVoltage
  "The internal voltage for which Edroop drives the current through R_a + R_e + jX_d, the droop command when not limited"
  extends Base.PartialLimitedVoltage;
  Modelica.Blocks.Interfaces.RealInput R_e(start=0)
    "Virtual resistance (pu, machine base)"
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
protected
  Real cr "Real part of c = (R_a + jX_d)/(R_a + R_e + jX_d)";
  Real ci "Imaginary part of c = (R_a + jX_d)/(R_a + R_e + jX_d)";
equation
  cr = (R_a*(R_a + R_e) + X_d^2)/((R_a + R_e)^2 + X_d^2) "Real part of (R_a + jX_d)/(R_a + R_e + jX_d)";
  ci = X_d*R_e/((R_a + R_e)^2 + X_d^2) "Imaginary part of (R_a + jX_d)/(R_a + R_e + jX_d)";
  Elr = V*cos(anglev) + cr*dEr - ci*dEi
    "The voltage behind R_a + jX_d when Edroop drives the current through R_a + R_e + jX_d, real part";
  Eli = V*sin(anglev) + cr*dEi + ci*dEr
    "The voltage behind R_a + jX_d when Edroop drives the current through R_a + R_e + jX_d, imaginary part";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, grid={2,2}), graphics={
        Text(
          extent={{-98,20},{-48,-20}},
          textColor={238,46,47},
          fontName="Geist",
          textString="R_e")}),
    Documentation(info="<html>
<p>
Gives the internal voltage to apply with the virtual resistor <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2024]</a>.
Above <code>Imax</code> it is the voltage behind <code>R_a + jX_d</code> when <code>Edroop</code> drives the current through <code>R_a + R_e + jX_d</code>,
<code>E = V + c (Edroop - V)</code> with <code>c = (R_a + jX_d)/(R_a + R_e + jX_d)</code>; below it, the droop command. The resistance <code>R_e</code> comes from <code>VRe</code>.
Used in <code>VirtualResistorDiagram</code>.
</p>
</html>"));
end VirtualResistorLimitedVoltage;
