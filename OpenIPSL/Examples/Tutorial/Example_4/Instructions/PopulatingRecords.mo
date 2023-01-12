within OpenIPSL.Examples.Tutorial.Example_4.Instructions;
model PopulatingRecords "Populating PF Records"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
  <h5>Populating Power Flows with GridCal</h5>
  <p>The next step is to populate our model with power flow results generated from GridCal. For simplicity, we will create a power flow model from an accompanying PSS/E <font color=\"blue\"><code>.raw</code></font>. However, it is possible to run the power flows from a native GridCal model. </p>
  <ol>
    <li><a href=\"https://github.com/ALSETLab/SMIB_Tutorial/tree/master/models/_old/SMIB/PSSE_Files\">Download</a> the accompanying PSS/E <font color=\"blue\"><code>.raw</code></font> file (<font color=\"blue\"><code>SMIB_Base_Case.raw</code></font>) and save it in your model directory under <font color=\"blue\"><code>PSSE_Files</code></font>. The <font color=\"blue\"><code>.dyr</code></font> file is not required for power flow computations.
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/PopulatingRecords/PSSEFilesFolder.png\" alt=\"PSSEFilesFolder\" />
    </p>
    </li>
      <li>Create a new Python script called <font color=\"blue\"><code>run_pf.py</code></font>. Copy and paste the following code inside it.
    <blockquote><pre>
<strong>from</strong> pf2rec <strong>import</strong> *

<strong>import</strong> numpy <strong>as</strong> np
<strong>import</strong> pandas <strong>as</strong> pd
<strong>import</strong> matplotlib.pyplot <strong>as</strong> plt
<strong>import</strong> datetime
<strong>import</strong> random

<strong>from</strong> GridCal.Engine <strong>import</strong> *
<strong>from</strong> GridCal.Engine.IO.file_handler <strong>import</strong> FileOpen
<strong>from</strong> GridCal.Engine.Devices.shunt <strong>import</strong> Shunt
<strong>from</strong> GridCal.Engine.Simulations.PowerFlow.time_series_driver <strong>import</strong> TimeSeries
<strong>from</strong> GridCal.Engine.Simulations.PowerFlow.power_flow_driver <strong>import</strong> PowerFlowDriver

LIST_OF_MODELS = [<em>'AVRI'</em>, <em>'IEEE9'</em>, <em>'IEEE14'</em>, <em>'SMIB'</em>, <em>'TwoAreas'</em>]

<strong>import</strong> argparse
<strong>import</strong> os

parser = argparse.ArgumentParser()

parser.add_argument(<em>\"model\"</em>, help = <em>\"Model for which the power flow structure will be created\"</em>)
parser.add_argument(<em>\"--version\"</em>, help = <em>\"OpenIPSL version for which the model has been created. Defaults to '1.5.0'\"</em>)

args = parser.parse_args()

<strong>if</strong> __name__ == <em>'__main__'</em>:

    _model = args.model
    <strong>if</strong> _model <strong>not in</strong> LIST_OF_MODELS:
        <strong>raise</strong> ValueError(<em>'Model not available'</em>)

# Absolute path to the data directory of the model
data_path = os.path.abspath(os.path.join(os.getcwd(), <em>\"models\"</em>, _model))

grid = None

# Grid model in GridCal
file_handler = FileOpen(os.path.abspath(os.path.join(data_path,
                                                    <em>\"PSSE_Files\"</em>,
                                                    <em>f\"</em>{_model}<em>_Base_Case.raw\"</em>)))

# Creating grid object
grid = file_handler.open()

# Power flow options
options = PowerFlowOptions(SolverType.NR,
                    verbose = True,
                    initialize_with_existing_solution = False,
                    multi_core = False,
                    tolerance = 1e-12,
                    max_iter = 99,
                    control_q = ReactivePowerControlMode.Direct)

pf = PowerFlowDriver(grid, options)

pf.run()

gridcal2rec(grid = grid, pf = pf, model_name = _model,
    data_path = data_path,
    pf_num = 0, export_pf_results = False,
    is_time_series = False, openipsl_version = '2.0.0')
  </pre></blockquote>
    </li>
    <li>Execute <font color=\"blue\"><code>run_pf.py</code></font> from a terminal.
    <blockquote><pre>
<strong>python</strong> run_pf.py SMIB --version 2.0.0
    </pre></blockquote>
    <hr>
    <p>&#x1F4CC; A new power flow record called <font color=\"blue\"><code>PF00000</code></font> should be generated inside the <font color=\"blue\"><code>PFData</code></font> subfolder. </p>
  <hr>
    </li>
    <li>Refresh your model. You should get a new file called <font color=\"blue\"><code>PF0000.mo</code></font> inside your <font color=\"blue\"><code>PFData</code></font> folder. In fact, there should be a new file in every subfolder too.
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/PopulatingRecords/FilesAfterPFPopulation.png\" alt=\"FilesAfterPFPopulation\" />
    </p>
    </li>
    <li>In the diagram layer of your SMIB model, double click the power flow component <font color=\"blue\"><code>pf</code></font>. Select the newly created power flow <font color=\"blue\"><code>PF00000</code></font> as the value for the <font color=\"blue\"><code>PowerFlow</code></font> field. By doing so, we are specifying that the model will initialize using the power flow results in that specific container.
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/PopulatingRecords/ChoosePopulatedPFRecord.png\" alt=\"ChoosePopulatedPFRecord\" />
    </p>
    <p>To see the power flow values in Dymola, click on the <em>square button</em>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/PopulatingRecords/EditButton.png\" alt=\"EditButton\" /> on the left of the <font color=\"blue\"><code>PowerFlow</code></font> selection menu.
    </p>
    <p>You should see that the power flow record is composed of four fields: <em>bus</em>, <em>load</em>, <em>machine </em>and <em>transformer</em>. </p>
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/PopulatingRecords/InspectPFRecordValues.png\" alt=\"InspectPFRecordValues\" />
    </p>
    <p>Inside each field, we can detail the power flow results</p>
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/PopulatingRecords/BusVoltageAndAngleValuesExample.png\" alt=\"BusVoltageAndAngleValuesExample\" />
    </p>
    </li>
    <li>Simulate the SMIB model for 2 seconds. Plot the voltage buses. Notice that the power flow solution initializes the dynamical simulation in an equilibrium (i.e., flat) so that the states of the system are not changing.
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/PopulatingRecords//SimulationResultsWithInitialSSResponse.png\" alt=\"SimulationResultsWithInitialSSResponse\" />
    </p>
        </li>
  </ol>
</html>"));
end PopulatingRecords;
