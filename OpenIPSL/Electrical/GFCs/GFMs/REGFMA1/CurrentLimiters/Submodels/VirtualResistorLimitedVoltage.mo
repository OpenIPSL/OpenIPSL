within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters.Submodels;
model VirtualResistorLimitedVoltage
  "The internal voltage for which Edroop drives the current through R_a + R_e + jX_d, the droop command when not limited"
  extends Base.PartialLimitedVoltage;
  Modelica.Blocks.Interfaces.RealInput R_e(start=0)
    "Virtual resistance (pu, machine base)"
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}}),
        iconTransformation(extent={{-120,-10},{-100,10}})));
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
        Line(
          points={{-52,-40},{-30,-40},{30,80},{52,80}},
          color={28,108,200},
          thickness=1),
        Ellipse(extent={{-40,60},{40,-20}},lineColor={28,108,200},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-18,10},{0,30}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.None,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Ellipse(
          extent={{0,30},{20,10}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={229,244,255},
          fillPattern=FillPattern.Solid,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Text(
          extent={{-140,0},{-100,-40}},
          textColor={28,108,200},
          fontName="Geist",
          textString="R_e"),
        Rectangle(
          extent={{-52,-74},{-40,-86}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-40,-80},{-20,-80}},
                                       color={28,108,200},
          thickness=1),
        Rectangle(
          extent={{-20,-74},{20,-86}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineThickness=1),
        Line(points={{20,-80},{40,-80}},
                                     color={28,108,200},
          thickness=1),
        Rectangle(
          extent={{40,-76},{50,-86}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-16,-52},{16,-82}},
          textColor={170,213,255},
          textStyle={TextStyle.Bold},
          textString="V"),
        Text(
          extent={{-16,-56},{16,-86}},
          textColor={28,108,200},
          textString="V",
          textStyle={TextStyle.Bold})}),
    Documentation(info="<html>
<p>
Gives the internal voltage to apply with the virtual resistor <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2024]</a>.
Above <code>Imax</code> it is the voltage behind <code>R_a + jX_d</code> when <code>Edroop</code> drives the current through <code>R_a + R_e + jX_d</code>,
<code>E = V + c (Edroop - V)</code> with <code>c = (R_a + jX_d)/(R_a + R_e + jX_d)</code>; below it, the droop command. The resistance <code>R_e</code> comes from <code>VRe</code>.
Used in <code>VirtualResistor</code>.
</p>
</html>"));
end VirtualResistorLimitedVoltage;
