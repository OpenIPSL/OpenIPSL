within OpenIPSL.UsersGuide;
model Conventions "Conventions"
  extends Modelica.Icons.Information;

  annotation(DocumentationClass=true, Documentation(info="<html>
<p>
The team behind <strong><code>OpenIPSL</code></strong> strives to achieve a harmonized development of the library to facilitate its usability and integration into other services.
</p>
<p>
Here are some naming conventions that we try to obey:
</p>
<ul>
<li> Names of the parameters and variables should correspond to those found in the respective documentation.</li>
<li> Subscript should be denoted in Modelica with underscore, e.g., <code>T_r</code>
or <code>K_1</code>. <strong>Note:</strong> some parameter names have first upper case letters and others lower case.</li>
<li> Deviation signals such as &delta;&omega;, should be written as <code>domega</code> in Modelica.</li>
<li> Parameters which are not to be entered by user and variables which are not to be seen by users should be <strong>protected</strong>.</li>
<li> Parameters and variables should be declared as their specific type such as <code>Types.ApparentPower</code>
for variables that are declared in MVA. <strong>Note:</strong> if the proper unit is not represented in
<a href=\"modelica://OpenIPSL.Types\">Types</a>, units available in Modelica&apos;s SI (Systeme Internationale) should be used.</li>
</ul>
</html>"));
end Conventions;
