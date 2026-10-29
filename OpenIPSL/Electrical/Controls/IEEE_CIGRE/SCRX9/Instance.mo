within OpenIPSL.Electrical.Controls.IEEE_CIGRE.SCRX9;
class Instance "Handle to one instance of the SCRX9 DLL model"
  extends ExternalObject;

  function constructor "Create one DLL instance: write parameters, initial inputs and initial outputs, run Model_CheckParameters and Model_Initialize"
    input Real parameters[8] "The 8 DLL parameters in the order of ParametersInfo: TAdTB, TB, K, TE, EMin, EMax, CSwitch, RCdRFD";
    input Real initialInputs[7] "The 7 DLL inputs at time zero: VRef, Ec, Vs, IFD, VT, VUEL, VOEL (pu)";
    input Real initialOutputs[1] "The DLL output at time zero: EFD (pu)";
    input Integer simToolMode "SimTool_EMT_RMS_Mode of the standard: 1 for EMT, 2 for RMS";
    output Instance dll "Opaque handle; NULL when the DLL refuses the data, the reason is written to the standard error stream";
    external "C" dll = SCRX9_oipsl_create(parameters, size(parameters, 1), initialInputs, size(initialInputs, 1), initialOutputs, size(initialOutputs, 1), simToolMode)
      annotation (Library="SCRX9", LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    annotation (Documentation(info="<html>
<p>
Calls <code>SCRX9_oipsl_create</code> of the OpenIPSL adapter compiled into the DLL. The adapter allocates the
instance and its signal blocks, converts the parameters to the data types of <code>ParametersInfo</code>
(<code>CSwitch</code> is an <code>int32_T</code>), writes the initial inputs and the initial output, sets
<code>SimTool_EMT_RMS_Mode</code> and calls <code>Model_CheckParameters</code> and <code>Model_Initialize</code> of the
IEEE/CIGRE model. <code>Model_Initialize</code> works back from the initial output <code>EFD</code> and the initial
input <code>VT</code> to the internal states; see the documentation of
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.SCRX9.SCRX9\">SCRX9</a> for the derivation.
</p>
</html>"));
  end constructor;

  function destructor "Release the DLL instance (Model_Terminate, then free)"
    input Instance dll "DLL instance";
    external "C" SCRX9_oipsl_free(dll)
      annotation (Library="SCRX9", LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    annotation (Documentation(info="<html>
<p>
Calls <code>SCRX9_oipsl_free</code>, which runs <code>Model_Terminate</code> and frees every block the constructor
allocated. A NULL handle is a no-op.
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
          textString="SCRX9")}),
    Documentation(info="<html>
<p>
External object holding one instance of the IEEE/CIGRE DLL model <strong>SCRX9</strong> (version 1.1.0.0, API V2).
The shared library is <code>SCRX9.dll</code> (win64, MSVC) or <code>libSCRX9.so</code> (linux64, gcc) in
<code>OpenIPSL/Resources/Library/&lt;platform&gt;/</code>, built from
<code>OpenIPSL/Resources/C-Sources/IEEE_CIGRE/</code>. Every external function of this package binds to it through
<code>annotation(Library=&quot;SCRX9&quot;, LibraryDirectory=&quot;modelica://OpenIPSL/Resources/Library&quot;)</code>.
</p>
<p>
The standard's own entry points (<code>Model_GetInfo</code>, <code>Model_Outputs</code>, ...) are never called from
Modelica, because every IEEE/CIGRE DLL exports the same names; the library also exports a small OpenIPSL adapter with
the prefix <code>SCRX9_oipsl_</code> that drives the model through the standard API. Use one <code>Instance</code> per
exciter; instances are independent of each other.
</p>
</html>"));
end Instance;
