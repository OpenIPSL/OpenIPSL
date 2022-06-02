within OpenIPSL.UsersGuide;
model Testing "Testing and Verification"
  extends Modelica.Icons.Information;

  annotation(DocumentationClass=true, Documentation(info="<html>
<h4>Continuous Integration</h4>
<p>The <strong><code>OpenIPSL</code></strong> repository uses <a href=\"https://github.com/features/actions\">GitHub Actions</a>
for <strong>Continuous Integration</strong> services to the repository.
In the current implementation, Modelica syntax and HTML documentation checking for all classes in the OpenIPSL is implemented</p>

<h4>Regression Testing</h4>
<p>These tests are used to ensure the validation status of models that are based on PSSE implementations.
The models undergo simulations with different events such as faults, reference changes and load variations.
The main idea is to try to capture different responses from the model being verified. If a model has a very small error if compared to PSSE base result for that simulation, it passes a test.
A model is considered to be verified if it passes all tests. Models that pass the verification procedure have a green dashed line around them.</p>

<p>The regression testing is done separately in different Modelica-compliant tools (<a href=\"https://www.openmodelica.org/\">OpenModelica</a> and <a href=\"http://www.3ds.com/products-services/catia/products/dymola\">Dymola</a>, for now) so models can be independently verified.
A detailed view of all models that undergo the verification process can be found
in the <a href=\"https://alsetlab.github.io/NYPAModelTransformation/reports\">NYPA Model Transformation
reports</a>.
The entire result verification procedure is done using <a href=\"https://github.com/modelica-tools/csv-compare\">CSV-Compare</a>.</p>

<p>Automatic regression testing is not yet configured in our Travis CI routine.</p>

</html>"));
end Testing;
