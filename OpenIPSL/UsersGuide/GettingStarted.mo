within OpenIPSL.UsersGuide;
model GettingStarted "Getting Started"
  extends Modelica.Icons.Information;

  annotation(DocumentationClass=true, Documentation(info="<html>
<p>
The <strong><code>OpenIPSL</code></strong> was developed to be a familiar alternative to traditional 
power system analysis tools.
There are, however, some particularities to the nature of the library, presented in this Section.
</p>
<h4>Power flow and Initialization</h4>
<p>
All models in a Modelica library require initial guess values that should come from a solution of 
the steady state of the overall model. This initial guess in case of power system studies is commonly the result of the so-called power flow analysis.
However, there is no power flow solver associated to the library as of the present time. 
When building a use case, initialization of all variables must be performed with a power flow software.
The users are free to choose their power flow software of choice.
</p>
<p>
Almost all of our models have been developed to provide the same response than a reference power system 
simulation tool, e.g., <a href=\"http://faraday1.ucd.ie/psat.html\">PSAT</a> and 
<a href=\"https://new.siemens.com/global/en/products/energy/energy-automation-and-smart-grid/pss-software/pss-e.html\">PSS&reg;E</a>.
You can use these tools to create a power flow solution for your network.
If you do not have access to these tools or do not want to use them, there are several power flow solvers 
available on Github.
Future work in the <strong><code>OpenIPSL</code></strong> effort will include ways to generate Modelica records from open source power flow solvers 
such as <a href=\"https://github.com/SanPen/GridCal\">GridCal</a> or <a href=\"https://github.com/FRESNA/PyPSA\">PyPSA</a>.
</p>
<p>
From these values, a Modelica tool solves the initialization problem for all algebraic and differential - state variables.
All models in <strong><code>OpenIPSL</code></strong> are programmed in such way that by introducing a <a href=\"https://github.com/SmarTS-Lab/Raw2Record\">power flow solution</a> (from another tool), the <b>initial guesses</b> are computed as parameters within each model and are provided into the initial equations that are used to solve the overall initialization problem.
See <a href=\"http://www.ep.liu.se/ecp/article.asp?issue=119&article=010\">this paper</a> for a more detailed explanation.
</p>
<p>
As we have just mentioned, the full initialization of the components&apos; internal variables and states is achieved by a set of internal <b>initial equations</b> that are to be derived by the developer of the model.
In a effort to harmonize the presentation of the power flow parameters, a model should extend <b>pfComponent</b> that will provide all the necessary parameters for data coming from power flow solutions to be used in the initialization of the model.
The <b>pfComponent</b> also provides support for the common <b>SystemBase</b> component that in turn provides a single instance of the system's common parameters, i.e., frequency and base power.
</p>
<h4>Running Time Domain Simulations</h4>
<p>
The time domain simulations are prepared to work with Modelica-compliant tools.
Users of the <strong><code>OpenIPSL</code></strong> are free to choose their tool of choice. However, note that the development of <strong><code>OpenIPSL</code></strong> has been carried out using <a href=\"https://www.openmodelica.org/\">OpenModelica</a>  and <a href=\"http://www.3ds.com/products-services/catia/products/dymola\">Dymola</a>.
The library is, also, systematically checked using the two mentioned tools (see <a href=\"modelica://OpenIPSL.UsersGuide.LibraryTesting\">Library Testing</a>).
It might be possible to face issues when using other <a href=\"https://modelica.org/tools\">Modelica Tools</a> that we have not fully tested.
</p>
</html>"));
end GettingStarted;
