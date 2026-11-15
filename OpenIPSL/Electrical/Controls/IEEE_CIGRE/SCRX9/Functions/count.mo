within OpenIPSL.Electrical.Controls.IEEE_CIGRE.SCRX9.Functions;
function count "Scalar counts of the DLL model: 0 inputs, 1 outputs, 2 parameters, 3 double states"
  input Integer what "0 scalar inputs, 1 scalar outputs, 2 scalar parameters, 3 double states";
  output Integer n "Count, or -1 for an unknown selector";
  external "C" n = SCRX9_oipsl_count(what)
    annotation (Library="SCRX9", LibraryDirectory="modelica://OpenIPSL/Resources/Library");
  annotation (Documentation(info="<html>
<p>
Reads the counts from <code>Model_GetInfo()</code>: 7 inputs, 1 output, 8 parameters and 6 double states for
<code>SCRX9</code> 1.1.0.0. The exciter model asserts on the input and output counts in an
<code>initial algorithm</code>, so that a library built from a different model version is caught before the first
step.
</p>
</html>"));
end count;
