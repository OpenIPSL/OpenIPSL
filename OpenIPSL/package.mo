package OpenIPSL "Open-Instance Power System Library"
  import Modelica.Units.SI;
  import C = Modelica.Constants;

annotation (preferredView="info",
  Protection(access = Access.packageDuplicate),
  uses(Complex(version="4.0.0"), Modelica(version="4.0.0")),
  version="3.1.0-dev",
  versionDate="202x-xx-xx",
  conversion(
    from(version={"0.8","0.8.1","1.0.0","1.5.0"}, to="2.0.0",
      script="modelica://OpenIPSL/Resources/scripts/ConvertOpenIPSL_from_1.5.0_to_2.0.0.mos"),
    from(version="2.0.0", to="3.0.0",
      script="modelica://OpenIPSL/Resources/scripts/ConvertOpenIPSL_from_2.0.0_to_3.0.0.mos")),
  Icon(graphics={Bitmap(extent={{-100,-100},{100,100}},
    fileName="modelica://OpenIPSL/Resources/images/OpenIPSL_Logo.png")}),
  Documentation(info="<html>
<p>
The <strong><code>OpenIPSL</code></strong> or Open-Instance Power System Library is a
<a href=\"https://www.modelica.org\">Modelica</a> library, fork of of the
<a href=\"https://github.com/itesla/ipsl\">iTesla Power System Library</a>
developed and maintained by the <a href=\"https://alsetlab.github.io/\">ALSETLab</a> research group,
collaborators and friends (contributions are welcome!).
The library contains a set of power system component models and test power system
networks adopting the phasor modeling approach.
<a href=\"https://build.openmodelica.org/Documentation/OpenModelica.Scripting.simulate.html\">Time domain simulations</a>
can be carried out using a Modelica-compliant tool,
which may also allow to do other computations on the model,
such as <a href=\"https://build.openmodelica.org/Documentation/OpenModelica.Scripting.linearize.html\">linearization</a>
for eigen-analysis and other purposes.
</p>
<p>
If you are looking for an introduction to the library, have especially a look at:
</p>
<ul>
<li><a href=\"modelica://OpenIPSL.UsersGuide\">User's Guide</a>
  and all its dependencies for general information about the library.
<ul>
<li><a href=\"modelica://OpenIPSL.Overview\">Overview</a></li>
<li><a href=\"modelica://OpenIPSL.Conventions\">Conventions</a></li>
<li><a href=\"modelica://OpenIPSL.GettingStarted\">Getting Started</a></li>
<li><a href=\"modelica://OpenIPSL.Testing\">Testing and Verification</a></li>
<li><a href=\"modelica://OpenIPSL.Publications\">Publications</a></li>
<li><a href=\"modelica://OpenIPSL.References\">References</a></li>
<li><a href=\"modelica://OpenIPSL.UsersGuide.ReleaseNotes\">Release Notes</a>
 for a summary of changes in the versions of the <strong><code>OpenIPSL</code></strong>.</li>
<li> <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">Contact</a>
  for a brief list of contributors and developers of the library.</li>
</ul>
</li>
<li><a href=\"modelica://OpenIPSL.Examples\">Examples</a> package for demonstration of power system examples that can be assembled using the library.</li>
<li>&hellip;</li>
<li><a href=\"modelica://OpenIPSL.Tests\">Tests</a> package for small test systems which show basic behavior of some of the many components of this library.</li>
</ul>
<p>
Please check the library's <a href=\"modelica://OpenIPSL.Copyright\">Copyright</a> disclaimer for information on license. See also the <strong><code>OpenIPSL</code></strong> organization website <a href=\"http://openipsl.org\">openipsl.org</a>
for additional information.
</p>
</html>"));
end OpenIPSL;
