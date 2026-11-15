within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA;
class OpenModelicaInstructions "OpenModelica Instructions"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
<h4>OpenModelica Instructions</h4>
<p>Tested with OpenModelica 1.27.1 (64-bit) and Modelica 4.1.0.</p>
<p>The example supplies constant, non-fixed start guesses for selected exciter variables. These guesses do not add initial equations or fix additional states. They avoid invalid generated start-value metadata observed with this OpenModelica version. The simulation flag below disables automatic sparse nonlinear solver selection, which otherwise fails for this example.</p>
<p>After loading Modelica and OpenIPSL, use the following commands in the OpenModelica scripting interface. Apply the translation option before translating the model.</p>
<pre>
setCommandLineOptions(\"--tearingMethod=minimalTearing\");
simulate(OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.CampusGridA, stopTime=15, tolerance=1e-6, numberOfIntervals=1500, method=\"dassl\", simflags=\"-nlssMaxDensity=0\");
getErrorString();
</pre>
<p>These settings completed the full 15 s experiment and the trajectories were compared with Dymola 2026x Refresh 1. Dymola does not require these OpenModelica options. Settings for newer OpenModelica versions should be checked again.</p>
<p>See <a href=\"https://github.com/OpenIPSL/OpenIPSL/issues/418\">OpenIPSL issue #418</a> for the investigation and tool-specific limitations.</p>
</html>"));
end OpenModelicaInstructions;
