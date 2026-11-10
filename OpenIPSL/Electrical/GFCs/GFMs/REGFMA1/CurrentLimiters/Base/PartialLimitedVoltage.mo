within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters.Base;
partial model PartialLimitedVoltage
  "Interface of the blocks that give the internal voltage to apply: the droop command while the unlimited current is within Imax, the limited internal voltage above it"
  Modelica.Blocks.Interfaces.RealInput Emag(start=1)
    "Magnitude of the droop voltage command, Edroop (pu)"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,-110})));
  Modelica.Blocks.Interfaces.RealInput Eang(start=0)
    "Angle of the droop voltage command, delta_droop (rad)"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-20,-110})));
  Modelica.Blocks.Interfaces.RealInput V(start=1)
    "Terminal voltage magnitude (pu)"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,-110})));
  Modelica.Blocks.Interfaces.RealInput anglev(start=0)
    "Terminal voltage angle (rad)"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,-110})));
  Modelica.Blocks.Interfaces.RealOutput ElimMag(start=1)
    "Magnitude of the internal voltage to apply behind R_a + jX_d (pu)"
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput ElimAng(start=0)
    "Angle of the internal voltage to apply behind R_a + jX_d (rad)"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
  parameter OpenIPSL.Types.PerUnit R_a=1e-3 "Internal source resistance, pu, machine base"
    annotation (Dialog(group="Voltage Source parameters"));
  parameter OpenIPSL.Types.PerUnit X_d=0.2 "Internal source d-axis reactance, pu, machine base"
    annotation (Dialog(group="Voltage Source parameters"));
  parameter OpenIPSL.Types.PerUnit Imax=2.0 "Maximum transient current magnitude, pu, machine base"
    annotation (Dialog(group="Current Limiter Setting"));
protected
  parameter OpenIPSL.Types.PerUnit Z_a=sqrt(R_a^2 + X_d^2) "Magnitude of the source impedance, pu, machine base";
  Real dEr "Real part of Edroop - V";
  Real dEi "Imaginary part of Edroop - V";
  Real dE2 "Squared magnitude of Edroop - V";
  Real Elr "Real part of the limited internal voltage behind R_a + jX_d";
  Real Eli "Imaginary part of the limited internal voltage behind R_a + jX_d";
equation
  dEr = Emag*cos(Eang) - V*cos(anglev) "Edroop - V, real part";
  dEi = Emag*sin(Eang) - V*sin(anglev) "Edroop - V, imaginary part";
  dE2 = dEr^2 + dEi^2 "Squared voltage across the source impedance without limiting";
  if initial() or noEvent(dE2 <= (Imax*Z_a)^2) then
    ElimMag = Emag "Not limited: the droop command";
    ElimAng = Eang "Not limited: the droop command";
  else
    ElimMag = sqrt(Elr^2 + Eli^2) "Limited: the magnitude of the internal voltage";
    ElimAng = Eang + atan2(Eli*cos(Eang) - Elr*sin(Eang), Elr*cos(Eang) + Eli*sin(Eang))
      "Limited: its angle, written relative to delta_droop so that it follows the droop angle beyond +-pi";
  end if;
  annotation (preferredView="text",Icon(coordinateSystem(preserveAspectRatio=false, grid={2,2}), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          lineThickness=1),
        Text(
          extent={{-100,128},{100,104}},
          textColor={28,108,200},
          textString="%name"),
        Text(
          extent={{-100,-100},{-68,-120}},
          textColor={28,108,200},
          fontName="Geist",
          textString="Edrp"),
        Text(
          extent={{-60,-100},{-20,-120}},
          textColor={28,108,200},
          fontName="Geist",
          textString="δ"),
        Text(
          extent={{-20,-100},{20,-120}},
          textColor={28,108,200},
          fontName="Geist",
          textString="V"),
        Text(
          extent={{20,-100},{60,-120}},
          textColor={28,108,200},
          fontName="Geist",
          textString="∡V"),
        Text(
          extent={{100,72},{120,52}},
          textColor={28,108,200},
          fontName="Geist",
          textString="|E|"),
        Text(
          extent={{100,-12},{120,-32}},
          textColor={28,108,200},
          fontName="Geist",
          textString="∡E")}),
    Documentation(info="<html>
<p>
Interface of the blocks that give the internal voltage to apply behind the source impedance <code>R_a + jX_d</code> (pu, machine base).
Inputs: the droop command <code>Edroop</code> at the angle <code>delta_droop</code> and the terminal voltage <code>V</code> at the angle <code>anglev</code>;
the extending blocks add what the limiter needs and give the limited internal voltage <code>Elr + jEli</code>.
</p>
<p>
While the unlimited current <code>(Edroop - V)/(R_a + jX_d)</code> is within <code>Imax</code>, the output is the droop command. Above it, it is the limited internal voltage.
The test is made on the unlimited current, so the limiter releases by itself when a fault is cleared; it is inactive at initialization and evaluated without an event
(see <code>Clamp</code> for why).
</p>
</html>"),
    Diagram(coordinateSystem(grid={2,2})));
end PartialLimitedVoltage;
