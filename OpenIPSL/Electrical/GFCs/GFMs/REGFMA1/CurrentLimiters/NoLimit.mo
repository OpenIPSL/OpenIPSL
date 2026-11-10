within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters;
model NoLimit "No current limiter: the droop voltage command is applied as it is"
  extends Base.PartialCurrentLimiter;
equation
  ElimMag = Emag "The magnitude of the droop voltage command";
  ElimAng = Eang "The angle of the droop voltage command";
  annotation (preferredView="text",Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(
          points={{-80,-80},{80,80}},
          color={28,108,200},
          thickness=1)}),
    Documentation(info="<html>
<p>
Variant to be used along the current limiter models to allow analysis without applying current limits.
The droop voltage command is passed to the voltage source as it is. With it,
<code>REGFMA1wPQLimitersAndReplaceableFCL</code> gives the trajectories of <code>REGFMA1wPQLimiters</code>.
The interface still reports the current <code>I_mag</code> and whether it exceeds <code>Imax</code> (<code>limited</code>).
</p>
</html>"),
    Diagram(coordinateSystem(extent={{-120,-120},{120,120}}, grid={2,2}), graphics={
        Line(
          points={{-120,80},{0,80},{0,60},{120,60}},
          color={28,108,200},
          thickness=1,
          pattern=LinePattern.Dash),
        Line(
          points={{-120,20},{-20,20},{-20,-60},{120,-60}},
          color={28,108,200},
          thickness=1,
          pattern=LinePattern.Dash),
        Text(
          extent={{-60,-80},{100,-96}},
          textColor={215,215,215},
          fontName="Geist",
          textString="Implemented in the Text Layer")}));
end NoLimit;
