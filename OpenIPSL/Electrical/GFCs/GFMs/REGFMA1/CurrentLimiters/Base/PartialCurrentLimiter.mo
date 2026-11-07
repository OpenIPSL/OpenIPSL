within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters.Base;
partial model PartialCurrentLimiter
  "Interface of a current limiter: from the droop command and the terminal voltage to the internal voltage applied to the source"
  Modelica.Blocks.Interfaces.RealInput Emag(start=1)
    "Magnitude of the droop command, Edroop (pu)" annotation (
      Placement(transformation(extent={{-140,40},{-100,80}}),
        iconTransformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput Eang(start=0)
    "Angle of the droop command, delta_droop (rad)" annotation (Placement(
        transformation(extent={{-140,-80},{-100,-40}}), iconTransformation(
          extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealInput V(start=1)
    "Terminal voltage magnitude (pu)" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,60}), iconTransformation(extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,60})));
  Modelica.Blocks.Interfaces.RealInput anglev(start=0)
    "Terminal voltage angle (rad)" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,-60}), iconTransformation(extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,-60})));
  Modelica.Blocks.Interfaces.RealOutput ElimMag(start=1)
    "Magnitude of the internal voltage to apply behind R_a + jX_d (pu)" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-40,110})));
  Modelica.Blocks.Interfaces.RealOutput ElimAng(start=0)
    "Angle of the internal voltage to apply behind R_a + jX_d (rad)" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,110})));
  parameter OpenIPSL.Types.PerUnit R_a=1e-3 "Internal source resistance, pu, machine base"
    annotation (Dialog(group="Voltage Source parameters"));
  parameter OpenIPSL.Types.PerUnit X_d=0.2 "Internal source d-axis reactance, pu, machine base"
    annotation (Dialog(group="Voltage Source parameters"));
  parameter OpenIPSL.Types.PerUnit Imax=2.0 "Maximum transient current magnitude, pu, machine base"
    annotation (Dialog(group="Current Limiter Setting"));
  Boolean limited(start=false) "true while the unlimited current exceeds Imax";
  OpenIPSL.Types.PerUnit I_unlim(start=0.5) "Magnitude of the unlimited current (Edroop - V)/(R_a + jX_d), pu, machine base";
  OpenIPSL.Types.PerUnit I_mag(start=0.5) "Magnitude of the current with the applied internal voltage, (Elim - V)/(R_a + jX_d), pu, machine base";
protected
  parameter OpenIPSL.Types.PerUnit Z_a=sqrt(R_a^2 + X_d^2) "Magnitude of the source impedance, pu, machine base";
  Real dEr "Real part of Edroop - V";
  Real dEi "Imaginary part of Edroop - V";
equation
  dEr = Emag*cos(Eang) - V*cos(anglev) "Edroop - V, real part";
  dEi = Emag*sin(Eang) - V*sin(anglev) "Edroop - V, imaginary part";
  I_unlim = sqrt(dEr^2 + dEi^2)/Z_a "Unlimited current magnitude";
  I_mag = sqrt((ElimMag*cos(ElimAng) - V*cos(anglev))^2 + (ElimMag*sin(ElimAng) - V*sin(anglev))^2)/Z_a
    "Current magnitude with the internal voltage applied";
  limited = I_unlim > Imax "An output; the implementations test the same condition without an event";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-100,140},{100,110}},
          textColor={28,108,200},
          textString="%name"),
        Text(
          extent={{-96,74},{-40,46}},
          textColor={28,108,200},
          textString="Edroop"),
        Text(
          extent={{-96,-46},{-40,-74}},
          textColor={28,108,200},
          textString="delta"),
        Text(
          extent={{60,74},{96,46}},
          textColor={28,108,200},
          textString="V"),
        Text(
          extent={{50,-46},{96,-74}},
          textColor={28,108,200},
          textString="angle"),
        Text(
          extent={{-70,98},{-10,78}},
          textColor={28,108,200},
          textString="|E|"),
        Text(
          extent={{10,98},{70,78}},
          textColor={28,108,200},
          textString="angle E")}),
    Documentation(info="<html>
<p>
The interface of a current limiter of REGFM_A1. Inputs: the droop command <code>Edroop</code> at the angle <code>delta_droop</code>
(from the Q-V and P-f droop controls) and the terminal voltage <code>V</code> at the angle <code>anglev</code> (from the voltage source).
Outputs: the internal voltage that the voltage source applies behind its impedance <code>R_a + jX_d</code> (pu, machine base), which drives
a current of magnitude at most <code>Imax</code>.
</p>
<p>
While the unlimited current <code>(Edroop - V)/(R_a + jX_d)</code> is below <code>Imax</code>, every implementation passes the droop command
through unchanged. The interface computes the unlimited current <code>I_unlim</code>, the current <code>I_mag</code> that the applied voltage drives,
and the indicator <code>limited</code>. The inputs <code>V</code> and <code>anglev</code> close an algebraic loop through the source and the network;
see <code>Clamp</code> for why the implementations test the limit without an event.
</p>
</html>"));
end PartialCurrentLimiter;
