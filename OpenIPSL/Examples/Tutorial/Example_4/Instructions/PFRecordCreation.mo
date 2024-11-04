within OpenIPSL.Examples.Tutorial.Example_4.Instructions;
model PFRecordCreation "Creating the PF Structure"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
  <h5>Creating and Integrating the Power Flow Structure</h5>
  <p>After completing the instructions in <a href=\"modelica://OpenIPSL.Examples.Tutorial.Example_4.Instructions.SMIBSystemAssembly\">Assembling a SMIB System</a>, you should have a <font color=\"blue\"><code>SMIB</code></font> folder inside your working directory. </p>
  <ol>
    <li>Create a directory called <font color=\"blue\"><code>SMIB_Example</code></font> at the same level where the <font color=\"blue\"><code>SMIB</code></font> folder is located. </li>
    <li>Create a directory called <font color=\"blue\"><code>models</code></font> below your new <font color=\"blue\"><code>SMIB_Example</code></font> folder. </li>
    <li>Move the <font color=\"blue\"><code>SMIB</code></font> folder below the previously added <font color=\"blue\"><code>models</code></font> folder. </li>
    <li>Copy the <font color=\"blue\"><code>pf2rec</code></font> folder from <a href=\"modelica://OpenIPSL/Resources/utils\">Resources</a> to the <font color=\"blue\"><code>SMIB_Example</code></font> folder. </li>
    <li>Move the <font color=\"blue\"><code>create_records.py</code></font> and <font color=\"blue\"><code>run_pf.py</code></font> Python files one level up (i.e., to the <font color=\"blue\"><code>SMIB_Example</code></font> folder). The tree below shows how your folder structure should look like:
    <blockquote><pre>
C:\\Users\\...>tree /f /a SMIB_Example
Folder PATH listing
Volume serial number is ...
C:\\USERS\\...\\SMIB_Example
|   create_records.py
|   run_pf.py
+---models
|   \\---SMIB
|       |   ...
|
\\---pf2rec
    |   create_pf_records.py
    |   generate_component_list.py
    |   gridcal2rec.py
    |   __init__.py
    |   ...
    </pre></blockquote>
    </li>
    <li>Reload your model or run Dymola, depending on what you did at the end of the previous section. Create a package inside the root package <font color=\"blue\"><code>SMIB</code></font> and name it <font color=\"blue\"><code>Utilities</code></font>. </li>
    <li>Add a new function inside <font color=\"blue\"><code>Utilities</code></font> called <font color=\"blue\"><code>saveTotalSMIBModel</code></font>. Remember that the procedure for creating functions is the same as for other kinds of classes such as <font color=\"blue\"><code>Package</code></font>, <font color=\"blue\"><code>Model</code></font> or <font color=\"blue\"><code>Record</code></font>. </li>
    <li>Go to the Modelica text of the function and type the following code:
    <blockquote><pre>
<strong>function</strong> saveTotalSMIBModel \"Save the SMIB package as a total model\"
  <strong>extends</strong> <em>Modelica.Icons.Function</em>;
  <strong>output</strong> <em>Boolean</em> ok \"= true if succesful\";
<strong>protected</strong>
  <em>String</em> targetDir = \"C:/Users/Miguel/SMIB_Example/models/SMIB\";
<strong>algorithm</strong>
  ok := <em>saveTotalModel</em>(targetDir + \"/\" + \"SMIBTotal.mo\", \"SMIB\", <strong>true</strong>);
<strong>end</strong> saveTotalSMIBModel;
    </pre></blockquote>
    <hr>
    <p>&#x1f528; <strong>Update</strong> the <em>targetDir</em> variable value with the appropriate path to reach the <font color=\"blue\"><code>SMIB</code></font> folder. </p>
    <p>&#x1F4CC; This function has no inputs and only one boolean output. The modelica standard function <em><font color=\"blue\"><code>saveTotalModel</code></font></em> is called inside the algorithm section with predefined arguments. You can check the information view of <em><font color=\"blue\"><code>saveTotalModel</code></font></em> to get to know the proper use of each of its parameters. To do that, make sure the <font color=\"blue\"><code>DymolaCommands</code></font> library is loaded within the Package Browser. Then navigate as shown in the picture below </p>
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/PFRecordCreation/SaveTotalModelFunction.png\" alt=\"SaveTotalModelFunction\" />
    </p>
    <hr>
    </li>
    <li>Right-click the <font color=\"blue\"><code>saveTotalSMIBModel</code></font> function from the Package Browser. Select the &quot; <em>Call Function...</em>&quot; option and then click the <font color=\"blue\"><code>OK</code></font> button. As a result, you should be able to see a new file called <em><font color=\"blue\"><code>SMIBTotal.mo</code></font></em> in the same folder where your model files are being stored. </li>
    <li>Go to the system terminal, change the current directory to the location where the <font color=\"blue\"><code>create_records</code></font> Python script is placed and execute it as indicated below.
    <blockquote><pre>
<strong>python</strong> create_records.py
    </pre></blockquote>
    </li>
    <li>Go back to Dymola and refresh ( <img src=\"modelica://OpenIPSL/Resources/images/example_4/PFRecordCreation/RefreshButton.png\" alt=\"RefreshButton\" />) the SMIB package.
    <hr>
    <p>
    &#x1F4CC; The Python script <font color=\"blue\"><code>create_records</code></font> should have created a new package inside your model that looks like this
    </p>
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/PFRecordCreation/PFDataPackageStructure.png\" alt=\"PFDataPackageStructure\" />
    </p>
    <hr>
    </li>
    <li>Double-click the <font color=\"blue\"><code>SMIBPartial</code></font> model to open its diagram view. From the new <font color=\"blue\"><code>PFData</code></font> package, drag and drop <strong>one</strong>
      <font color=\"blue\"><code>PowerFlow</code></font> element on your canvas. <strong>For convenience, rename it as</strong>
      <font color=\"blue\"><code>pf</code></font>.
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/PFRecordCreation/PowerFlowRecordInstantiation.png\" alt=\"PowerFlowRecordInstantiation\" />
    </p>
    </li>
    <li>Link the power flow variables to the different components as indicated below. <em>Yes, unfortunately you must type them!</em>
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/PFRecordCreation/ComponentReferenceToPFRecord.png\" alt=\"ComponentReferenceToPFRecord\" />
    </p>
  <table cellspacing=\"0\" cellpadding=\"1\" border=\"1\">
    <thead>
      <tr>
        <th bgcolor=\"#b3e6ff\">Component</th>
        <th bgcolor=\"#b3e6ff\">V_0</th>
        <th bgcolor=\"#b3e6ff\">A_0</th>
        <th bgcolor=\"#b3e6ff\">P_0</th>
        <th bgcolor=\"#b3e6ff\">Q_0</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>B01 (bus)</td>
        <td>pf.powerflow.bus.v1</td>
        <td>pf.powerflow.bus.A1</td>
        <td>N/A</td>
        <td>N/A</td>
      </tr>
      <tr>
        <td bgcolor=\"#e6e6e6\">B02 (bus)</td>
        <td bgcolor=\"#e6e6e6\">pf.powerflow.bus.v2</td>
        <td bgcolor=\"#e6e6e6\">pf.powerflow.bus.A2</td>
        <td bgcolor=\"#e6e6e6\">N/A</td>
        <td bgcolor=\"#e6e6e6\">N/A</td>
      </tr>
      <tr>
        <td>B03 (bus)</td>
        <td>pf.powerflow.bus.v3</td>
        <td>pf.powerflow.bus.A3</td>
        <td>N/A</td>
        <td>N/A</td>
      </tr>
      <tr>
        <td bgcolor=\"#e6e6e6\">B04 (bus)</td>
        <td bgcolor=\"#e6e6e6\">pf.powerflow.bus.v4</td>
        <td bgcolor=\"#e6e6e6\">pf.powerflow.bus.A4</td>
        <td bgcolor=\"#e6e6e6\">N/A</td>
        <td bgcolor=\"#e6e6e6\">N/A</td>
      </tr>
      <tr>
        <td>load (load)</td>
        <td>pf.powerflow.bus.v3</td>
        <td>pf.powerflow.bus.A3</td>
        <td>pf.powerflow.load.PL1</td>
        <td>pf.powerflow.load.QL1</td>
      </tr>
      <tr>
        <td bgcolor=\"#e6e6e6\">InfiniteBus (gen)</td>
        <td bgcolor=\"#e6e6e6\">pf.powerflow.bus.v2</td>
        <td bgcolor=\"#e6e6e6\">pf.powerflow.bus.A2</td>
        <td bgcolor=\"#e6e6e6\">pf.powerflow.machine.PG2</td>
        <td bgcolor=\"#e6e6e6\">pf.powerflow.machine.QG2</td>
      </tr>
    </tbody>
  </table>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If you check your model now, you should see an error because we have not defined the power flow values. We have just pointed to the container which will have it. Next, we generate the power flow results using <font color=\"blue\"><code>GridCal</code></font>.</p>
    </li>
    <li>Now open the diagram layer of your SMIB model inside the <font color=\"blue\"><code>Experiments</code></font> package. Link the power flow variables to <font color=\"blue\"><code>genunit</code></font> as specified in the following table:
  <table cellspacing=\"0\" cellpadding=\"0\" border=\"1\">
    <thead>
      <tr>
        <th bgcolor=\"#b3e6ff\">Component</th>
        <th bgcolor=\"#b3e6ff\">V_0</th>
        <th bgcolor=\"#b3e6ff\">A_0</th>
        <th bgcolor=\"#b3e6ff\">P_0</th>
        <th bgcolor=\"#b3e6ff\">Q_0</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>genunit (gen)</td>
        <td>pf.powerflow.bus.v1</td>
        <td>pf.powerflow.bus.A1</td>
        <td>pf.powerflow.machine.PG1</td>
        <td>pf.powerflow.machine.QG1</td>
      </tr>
    </tbody>
  </table>
    </li>
  </ol>
</html>"));
end PFRecordCreation;
