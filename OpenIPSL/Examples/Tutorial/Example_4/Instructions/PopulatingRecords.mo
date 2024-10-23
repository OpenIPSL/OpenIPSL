within OpenIPSL.Examples.Tutorial.Example_4.Instructions;
model PopulatingRecords "Populating PF Records"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
  <h5>Populating Power Flows with GridCal</h5>
  <p>The next step is to populate our model with power flow results generated from GridCal. For simplicity, we will create a power flow model from an accompanying PSS/E <font color=\"blue\"><code>.raw</code></font>. However, it is possible to run the power flows from a native GridCal model. </p>
  <ol>
    <li>Create a new <a href=\"modelica://OpenIPSL/Resources/utils/pfRecordCreator/models/_new/SMIB\">PSSE_Files</a> folder within <font color=\"blue\"><code>SMIB_Example/models/SMIB</code></font> folder.
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/PopulatingRecords/PSSEFilesFolder.png\" alt=\"PSSEFilesFolder\" />
    </p>
    </li>
    <li>Create a new PSS/E raw file called <font color=\"blue\"><code>SMIB_Base_Case.raw</code></font> within the <font color=\"blue\"><code>PSSE_Files</code></font> folder. Copy and paste the following text inside the file and save it:
    <blockquote><pre>
0,   100.00, 33, 0, 1, 50.00     / PSS(R)E-33.4    FRI, FEB 26 2021  16:31
SMIB

     1,'B01         ', 100.0000,2,   1,   1,   1,1.00000,   4.0463,1.10000,0.90000,1.10000,0.90000
     2,'B02         ', 100.0000,3,   1,   1,   1,1.00000,   0.0000,1.10000,0.90000,1.10000,0.90000
     3,'B03         ', 100.0000,1,   1,   1,   1,0.99598,  -0.2870,1.10000,0.90000,1.10000,0.90000
     4,'B04         ', 100.0000,1,   1,   1,   1,0.99199,  -0.5763,1.10000,0.90000,1.10000,0.90000
0 / END OF BUS DATA, BEGIN LOAD DATA
     4,'1 ',1,   1,   1,    50.000,    10.000,     0.000,     0.000,     0.000,     0.000,   1,1,0
0 / END OF LOAD DATA, BEGIN FIXED SHUNT DATA
0 / END OF FIXED SHUNT DATA, BEGIN GENERATOR DATA
     1,'1 ',    40.000,     5.417,    60.000,     0.000,1.00000,     0,   100.000, 0.00000E+0, 2.00000E-1, 0.00000E+0, 0.00000E+0,1.00000,1,  100.0,    80.000,     0.000,   1,1.0000
     2,'1 ',    10.017,     8.007,    60.000,     0.000,1.00000,     0,   100.000, 0.00000E+0, 2.00000E-1, 0.00000E+0, 0.00000E+0,1.00000,1,  100.0,    80.000,     0.000,   1,1.0000
0 / END OF GENERATOR DATA, BEGIN BRANCH DATA
     1,     4,'1 ', 1.00000E-3, 2.00000E-1,   0.00000,    0.00,    0.00,    0.00,  0.00000,  0.00000,  0.00000,  0.00000,1,1,   0.00,   1,1.0000
     2,     3,'1 ', 5.00000E-4, 1.00000E-1,   0.00000,    0.00,    0.00,    0.00,  0.00000,  0.00000,  0.00000,  0.00000,1,2,   0.00,   1,1.0000
     2,     4,'1 ', 1.00000E-3, 2.00000E-1,   0.00000,    0.00,    0.00,    0.00,  0.00000,  0.00000,  0.00000,  0.00000,1,2,   0.00,   1,1.0000
     3,     4,'1 ', 5.00000E-4, 1.00000E-1,   0.00000,    0.00,    0.00,    0.00,  0.00000,  0.00000,  0.00000,  0.00000,1,2,   0.00,   1,1.0000
0 / END OF BRANCH DATA, BEGIN TRANSFORMER DATA
0 / END OF TRANSFORMER DATA, BEGIN AREA DATA
0 / END OF AREA DATA, BEGIN TWO-TERMINAL DC DATA
0 / END OF TWO-TERMINAL DC DATA, BEGIN VSC DC LINE DATA
0 / END OF VSC DC LINE DATA, BEGIN IMPEDANCE CORRECTION DATA
0 / END OF IMPEDANCE CORRECTION DATA, BEGIN MULTI-TERMINAL DC DATA
0 / END OF MULTI-TERMINAL DC DATA, BEGIN MULTI-SECTION LINE DATA
0 / END OF MULTI-SECTION LINE DATA, BEGIN ZONE DATA
0 / END OF ZONE DATA, BEGIN INTER-AREA TRANSFER DATA
0 / END OF INTER-AREA TRANSFER DATA, BEGIN OWNER DATA
0 / END OF OWNER DATA, BEGIN FACTS DEVICE DATA
0 / END OF FACTS DEVICE DATA, BEGIN SWITCHED SHUNT DATA
0 / END OF SWITCHED SHUNT DATA, BEGIN GNE DATA
0 / END OF GNE DATA, BEGIN INDUCTION MACHINE DATA
0 / END OF INDUCTION MACHINE DATA
Q
    </pre></blockquote>
    </li>
    <li>Execute <font color=\"blue\"><code>run_pf.py</code></font> from a terminal.
    <blockquote><pre>
<strong>python</strong> run_pf.py SMIB

(openipsl_tutorial) c:\\Users\\Miguel\\SMIB_Example><strong>python</strong> run_pf.py SMIB
It 0, error 0.5, converged False, x [0. 0. 0. 1. 1.], dx not computed yet
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Iter: 1
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
It 1, error 0.016918884074426793, converged False, x [ 0.07000175 -0.00498304 -0.00996608  0.99658333  0.99316667], dx [ 0.07000175 -0.00498304 -0.00996608 -0.00341667 -0.00683333]
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Iter: 2
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
It 2, error 2.1358057256101737e-05, converged False, x [ 0.07061997 -0.00500866 -0.01005764  0.99598493  0.99199502], dx [ 0.00061822 -0.00002562 -0.00009156 -0.00059841 -0.00117164]
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Iter: 3
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
It 3, error 3.453681785003937e-11, converged False, x [ 0.0706208  -0.00500868 -0.01005778  0.99598418  0.99199354], dx [ 0.00000083 -0.00000002 -0.00000014 -0.00000075 -0.00000148]
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Iter: 4
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
It 4, error 3.802513859341161e-15, converged True, x [ 0.0706208  -0.00500868 -0.01005778  0.99598418  0.99199354], dx [ 0. -0. -0. -0. -0.]

(openipsl_tutorial) c:\\Users\\Miguel\\SMIB_Example>

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
    <p>&#x1F4CC; You can alternatively modify the <strong>Modelica Text</strong> of the <font color=\"blue\"><code>SMIB</code></font> Experiment model as follows: </p>
    <blockquote><pre>
model SMIB
  extends Modelica.Icons.Example;
  <strong>extends BaseModels.BaseNetwork.SMIBPartial(pf(redeclare record PowerFlow = PFData.PF00000));</strong>
  replaceable BaseModels.GeneratingUnits.GeneratorOnly       genunit...
equation 
  ...
  annotation ...
end SMIB;
    </pre></blockquote>
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
