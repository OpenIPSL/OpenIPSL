within OpenIPSL.Electrical.Controls.IEEE_CIGRE.SCRX9.Functions;
function sampleTime "Fixed base sample time of the DLL (Model_Info.FixedStepBaseSampleTime)"
  output Modelica.Units.SI.Time Ts "Base sample time of the DLL";
  external "C" Ts = SCRX9_oipsl_sampleTime()
    annotation (Library="SCRX9", LibraryDirectory="modelica://OpenIPSL/Resources/Library");
  annotation (Documentation(info="<html>
<p>
Returns <code>FixedStepBaseSampleTime</code> of the model information structure, 0.005 s for the shipped
<code>SCRX9</code> library. The value is a compile-time constant of the DLL, so it is read rather than declared: the
exciter model binds <code>final parameter Ts = Functions.sampleTime()</code> and samples the DLL with that period.
</p>
</html>"));
end sampleTime;
