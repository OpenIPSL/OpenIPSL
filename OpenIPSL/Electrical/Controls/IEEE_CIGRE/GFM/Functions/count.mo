within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Functions;
function count "Counts of the DLL model: 0 scalar inputs, 1 scalar outputs, 2 parameters, 3 double states (more selectors in oipsl_cigre_adapter.h)"
  input Integer what "0 scalar inputs, 1 scalar outputs, 2 scalar parameters, 3 double states";
  output Integer n "Count, or -1 for an unknown selector";
  external "C" n = GFM_GFL_IBR_oipsl_count(what)
    annotation (Library="GFM_GFL_IBR", LibraryDirectory="modelica://OpenIPSL/Resources/Library");
  annotation (Documentation(info="<html>
<p>
Reads the counts from <code>Model_GetInfo()</code> (12 inputs, 12 outputs, 41 parameters and 36 double states for
<code>GFM-GFL-IBR-PWM-Model</code> 1.1.0.0). The converter model asserts on them in an <code>initial algorithm</code>
so that a library built from a different model version is caught before the first step.
</p>
</html>"));
end count;
