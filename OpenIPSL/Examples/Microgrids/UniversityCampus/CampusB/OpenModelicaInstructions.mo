within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusB;
class OpenModelicaInstructions "OpenModelica Instructions"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
<h4>OpenModelica Instructions</h4>
<p>Tested with OpenModelica 1.27.1 (64-bit) and Modelica 4.1.0.</p>
<p>This example requires minimal tearing in the tested OpenModelica version. This is a tool setting, not a change to the model equations. No additional nonlinear-solver flag was needed in this test.</p>
<p>After loading Modelica and OpenIPSL, use the following commands in the OpenModelica scripting interface. Apply the translation option before translating the model.</p>
<pre>
setCommandLineOptions(\"--tearingMethod=minimalTearing\");
simulate(OpenIPSL.Examples.Microgrids.UniversityCampus.CampusB.CampusGridB, stopTime=10, tolerance=1e-6, numberOfIntervals=1000, method=\"dassl\");
getErrorString();
</pre>
<p>These settings completed the full 10 s experiment and the trajectories were compared with Dymola 2026x Refresh 1. Dymola does not require these OpenModelica options. Settings for newer OpenModelica versions should be checked again.</p>
<p>See <a href=\"https://github.com/OpenIPSL/OpenIPSL/issues/418\">OpenIPSL issue #418</a> for the investigation and tool-specific limitations.</p>
</html>"));
end OpenModelicaInstructions;
