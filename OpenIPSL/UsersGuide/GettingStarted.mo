within OpenIPSL.UsersGuide;
model GettingStarted "Getting Started"
  extends Modelica.Icons.Information;

  annotation(DocumentationClass=true, Documentation(info="<html>
<p>
The <strong><code>OpenIPSL</code></strong> was developed to be a familiar alternative to traditional
power system analysis tools. Tutorials on OpenIPSL have been given at many conferences, and are available under the following links. We recommend you start from there:
</p>
<ul>
<li> Quick Start Guide: <a href=\"https://docs.google.com/presentation/d/10wueYbwWeVzYoGtiZYcWFWLDFbSEV3ruaTtkaMoGitU/edit?usp=sharing\"> Using OpenIPSL in OpenModelica </a> </li>
<li> Tutorial/Workshop: <a href=\"https://docs.google.com/presentation/d/1iI86uUUdOP_1XgMHs6A3zPffZDrP1N0RAE1EEYDbKfA/edit?usp=sharing\"> Getting Started with Power System Modeling using Modelica and the OpenIPSL </a> </li>
</ul>

<h4>Running Time Domain Simulations</h4>
<p>
The time domain simulations using OpenIPSL models require Modelica-compliant tools.
Users of the <strong><code>OpenIPSL</code></strong> are free to choose their tool of choice. However, note that the development of <strong><code>OpenIPSL</code></strong> has been carried out using <a href=\"https://www.openmodelica.org/\">OpenModelica</a>, <a href=\"http://www.3ds.com/products-services/catia/products/dymola\">Dymola</a>, <a href=\"https://www.modelon.com/modelon-impact/\">Modelon Impact</a> and <a href=\"https://www.wolfram.com/system-modeler/\">Wolfram SystemModeler</a>.
The library is, also, systematically checked using the two mentioned tools (see <a href=\"modelica://OpenIPSL.UsersGuide.LibraryTesting\">Library Testing</a>).
Nonetheless, it might be possible to face issues when using other <a href=\"https://modelica.org/tools\">Modelica Tools</a> that we have not fully tested.
</p>
<p>
There are many examples included in the library that can be used as a starting point for the users to run time domain simulations. They are located in the <a href=\"modelica://OpenIPSL.Examples\">Examples</a> package.
</p>
<h4>Power flow and Initialization</h4>
<p> When building models from scratch, the user will need to provide initial guess values for certain variables. This is a common requirement for all models in Modelica libraries, and it is not specific to <strong><code>OpenIPSL</code></strong>.
</p>
<p>
In the case of OpenIPSL, all models require initial guess values that should come from a solution of
the steady state of the overall model, i.e., a power flow solution. However, there is no power flow solver associated to the library as of the present time. The users are free to choose their power flow software of choice.
</p>
<p>
Almost all of our models have been developed to provide the same response than a reference power system
simulation tool, e.g., <a href=\"https://faraday1.ucd.ie/psat.html\">PSAT</a> and
<a href=\"https://www.siemens.com/global/en/products/energy/grid-software/planning/pss-software/pss-e.html\">PSS&reg;E</a>.
You can use these tools to create a power flow solution for your network.
If you do not have access to these tools or do not want to use them, there are several power flow solvers
available on GitHub.
Examples on how to generate Modelica records from open source and proprietary power flow solvers, specifically
<a href=\"https://github.com/SanPen/VeraGrid\">VeraGrid</a> (formerly GridCal) and
<a href=\"https://www.siemens.com/global/en/products/energy/grid-software/planning/pss-software/pss-e.html\">PSS&reg;E</a>
can be found in <a href=\"https://doi.org/10.3384/ecp21181147\">this paper</a> and in <a href=\"https://github.com/ALSETLab/SMIB_Tutorial\">this GitHub repository</a>.
</p>
<p>
From these values, a Modelica tool solves the initialization problem for all algebraic and differential - state variables.
All models in <strong><code>OpenIPSL</code></strong> are programmed in such way that by introducing a <a href=\"https://github.com/ALSETLab/SMIB_Tutorial\">power flow solution</a> (from another tool), the <strong>initial guesses</strong> are computed as parameters within each model and are provided into the initial equations that are used as an initial guess to solve the overall initialization problem.
See <a href=\"https://doi.org/10.3384/ecp21181147\">this paper</a> for a more detailed explanation.
</p>
<p>
As we have just mentioned, the full initialization of the components&apos; internal variables and states is achieved by a set of internal <strong>initial equations</strong> that are to be derived by the developer of the model.
In a effort to harmonized the presentation of the power flow parameters, a model should extend <strong>pfComponent</strong> that will provide all the necessary parameters for data coming from power flow solutions to be used in the initialization of the model.
The <strong>pfComponent</strong> also provide the support for the common <strong>SystemBase</strong> component that provides a single instance of the system's common parameters, i.e., frequency and base power.
</p>
<p>
A specific tutorial for the user's to adopt the use power flow records is included in the library and can be found in <a href=\"modelica://OpenIPSL.Examples.Tutorial.Example_4\"> Examples.Tutorial.Example_4</a>,
along with the Python utilities to generate the records from PSS&reg;E and VeraGrid, which are distributed with this library under <a href=\"modelica://OpenIPSL.Resources.utils/pf2rec\"> Resources.utils.pf2rec</a>.
</p>
</html>"));
end GettingStarted;
