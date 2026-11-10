within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Functions;
function sampleTime "Fixed base sample time of the DLL (Model_Info.FixedStepBaseSampleTime)"
  output Modelica.Units.SI.Time Ts "Base sample time of the DLL";
  external "C" Ts = GFM_GFL_IBR_oipsl_sampleTime()
    annotation (Library="GFM_GFL_IBR", LibraryDirectory="modelica://OpenIPSL/Resources/Library");
  annotation (Documentation(info="<html>
<p>
Returns <code>FixedStepBaseSampleTime</code> of the model information structure, 1e-5 s for the shipped
<code>GFM_GFL_IBR</code> library. The value is a compile-time constant of the DLL, so it is read rather than declared:
the converter model binds <code>final parameter Ts = Functions.sampleTime()</code> and samples the DLL with that period.
</p>
</html>"));
end sampleTime;
