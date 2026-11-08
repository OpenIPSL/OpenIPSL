within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters;
model NoLimit "No current limiter: the droop voltage command is applied as it is"
  extends Base.PartialCurrentLimiter;
equation
  ElimMag = Emag "The mangitude of the droop voltage command";
  ElimAng = Eang "The angle angle of the droop voltage command";
  annotation (preferredView="text",Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Line(
          points={{-60,-40},{60,40}},
          color={28,108,200},
          thickness=1),
        Text(
          extent={{-80,-34},{80,-64}},
          textColor={28,108,200},
          textString="no limit")}),
    Documentation(info="<html>
<p>
Variant to be used along the current limiter models to allow analysis without applying current limits.
The droop voltage command is passed to the voltage source as it is. With it,
<code>REGFMA1wPQLimitersAndReplaceableFCL</code> gives the trajectories of <code>REGFMA1wPQLimiters</code>.
The interface still reports the current <code>I_mag</code> and whether it exceeds <code>Imax</code> (<code>limited</code>).
</p>
</html>"));
end NoLimit;
