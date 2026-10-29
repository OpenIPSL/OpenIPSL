within OpenIPSL.Electrical.Controls.IEEE_CIGRE.SCRX9;
package Functions "External functions of the SCRX9 DLL adapter"
  extends Modelica.Icons.FunctionsPackage;

  annotation (Documentation(info="<html>
<p>
The three external functions of the OpenIPSL adapter exported by the <code>SCRX9</code> shared library:
<code>step</code> advances one instance by one base sample and returns the step's status code, <code>sampleTime</code>
returns the DLL's fixed base sample time, and <code>count</code> returns the scalar signal, parameter and state counts
of the model. The instance itself is created and freed by
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.SCRX9.Instance\">Instance</a>.
</p>
<p>
The adapter never calls Modelica runtime functions (a Windows DLL cannot import symbols from its future host), so
errors are reported as return codes and as messages on the standard error stream, and the calling model asserts on the
code.
</p>
</html>"));
end Functions;
