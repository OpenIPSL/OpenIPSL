within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM;
class Instance "Handle to one instance of the GFM_GFL_IBR DLL (IEEE/CIGRE DLL model GFM-GFL-IBR-PWM-Model 1.1.0.0)"
  extends ExternalObject;

  function constructor "Create one DLL instance: write parameters, initial inputs and initial outputs, run Model_CheckParameters and Model_Initialize"
    input Real parameters[41] "The 41 DLL parameters in the order of ParametersInfo (see Records.ParameterSet)";
    input Real initialInputs[12] "The 12 inputs at time zero in the DLL's units (kV, kA, MW, Mvar, pu)";
    input Real initialOutputs[12] "The 12 outputs at time zero in the DLL's units (kV, pu, Hz, MW, Mvar)";
    input Integer simToolMode "SimTool_EMT_RMS_Mode of the standard: 1 for EMT, 2 for RMS";
    output Instance dll "Opaque handle; the adapter returns NULL when the DLL refuses the data and writes the reason to the standard error stream";
    external "C" dll = GFM_GFL_IBR_oipsl_create(parameters, size(parameters, 1), initialInputs, size(initialInputs, 1), initialOutputs, size(initialOutputs, 1), simToolMode)
      annotation (Library="GFM_GFL_IBR", LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    annotation (Documentation(info="<html>
<p>
Calls <code>GFM_GFL_IBR_oipsl_create</code> of the OpenIPSL adapter compiled into the DLL. The adapter allocates the
instance and its signal blocks, writes the parameters, the initial inputs and the initial outputs, sets
<code>SimTool_EMT_RMS_Mode</code>, and calls <code>Model_CheckParameters</code> and <code>Model_Initialize</code> of the
IEEE/CIGRE model. The EPRI model seeds its power-measurement and power-controller states from the initial outputs
<code>Pout</code> (MW) and <code>Qout</code> (Mvar); all other states start at zero.
</p>
</html>"));
  end constructor;

  function destructor "Release the DLL instance (Model_Terminate, then free)"
    input Instance dll "DLL instance";
    external "C" GFM_GFL_IBR_oipsl_free(dll)
      annotation (Library="GFM_GFL_IBR", LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    annotation (Documentation(info="<html>
<p>
Calls <code>GFM_GFL_IBR_oipsl_free</code>, which runs <code>Model_Terminate</code> and frees every block the
constructor allocated. A NULL handle is a no-op.
</p>
</html>"));
  end destructor;

  annotation (
    Icon(graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-90,40},{90,-40}},
          textColor={28,108,200},
          textString="DLL"),
        Text(
          extent={{-100,-50},{100,-90}},
          textColor={0,0,0},
          textString="GFM_GFL_IBR")}),
    Documentation(info="<html>
<p>
External object holding one instance of the IEEE/CIGRE DLL <strong>GFM-GFL-IBR-PWM-Model</strong> (version 1.1.0.0,
Deepak Ramasubramanian, EPRI). The shared library is <code>GFM_GFL_IBR.dll</code> (win64, MSVC) or
<code>libGFM_GFL_IBR.so</code> (linux64, gcc) in <code>OpenIPSL/Resources/Library/&lt;platform&gt;/</code>, built from
<code>OpenIPSL/Resources/C-Sources/IEEE_CIGRE/</code>. Every external function of this package binds to it through
<code>annotation(Library=&quot;GFM_GFL_IBR&quot;, LibraryDirectory=&quot;modelica://OpenIPSL/Resources/Library&quot;)</code>.
</p>
<p>
The standard's own entry points (<code>Model_GetInfo</code>, <code>Model_Outputs</code>, ...) are never called from
Modelica because every IEEE/CIGRE DLL exports the same names; the DLL also exports a small OpenIPSL adapter with the
prefix <code>GFM_GFL_IBR_oipsl_</code> that drives the model through the standard API. Use one <code>Instance</code> per
converter; instances are independent.
</p>
<p>
Cite EPRI report [EPRI2023] and D. Ramasubramanian, EPSR 205 (2022) 107739 (EPRI's condition for the redistribution);
see the documentation of <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM\">the GFM package</a> and
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.Provenance\">IEEE_CIGRE.Provenance</a>.
</p>
</html>"));
end Instance;
