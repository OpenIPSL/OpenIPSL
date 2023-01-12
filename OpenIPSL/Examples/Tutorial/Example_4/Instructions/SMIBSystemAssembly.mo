within OpenIPSL.Examples.Tutorial.Example_4.Instructions;
model SMIBSystemAssembly "Assembling a SMIB System"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
  <h5>Assembling a SMIB System</h5>
  <ol>
    <li>Open Dymola.</li>
    <li>Load the OpenIPSL library.</li>
    <li>Create a new package called <font color=\"blue\"><code>SMIB</code></font>. Make sure to unselect the option to save the contents of the package in one file.
        <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/SMIBSystemAssembly/SMIBPackageCreation.png\" alt=\"SMIBPackageCreation\" />
    </p>
    </li>
    <li>Inside <font color=\"blue\"><code>SMIB</code></font> create two sub-packages named <font color=\"blue\"><code>Experiments</code></font> and <font color=\"blue\"><code>BaseModels</code></font>. Then add two sub-packages inside <font color=\"blue\"><code>BaseModels</code></font> called <font color=\"blue\"><code>GenerationUnits</code></font> and <font color=\"blue\"><code>BaseNetwork</code></font>. Once again, remember to keep the option to &#34; <em>save the contents of the package in one file</em>&#34; unselected. </li>
    <li>To follow the structure and appearance convention of packages in Modelica, we can add an icon to the <font color=\"blue\"><code>Experiments</code></font> package. Double-click the <font color=\"blue\"><code>Experiments</code></font> package and go to the text layer to add the following line of class extension:
    <blockquote><pre>
<strong>package</strong> Experiments
   <strong>extends</strong> <em>Modelica.Icons.Example</em>;

<strong>end</strong> Experiments;
    </pre></blockquote>
    </li>
    <li>Inside <font color=\"blue\"><code>BaseNetwork</code></font>, create a new <em>partial</em> model called <font color=\"blue\"><code>SMIBPartial</code></font>. </li>
    <li>Go to the Package Browser, navigate to <font color=\"blue\"><code>OpenIPSL.Interfaces.Generator</code></font>, and right-click the icon to create a new model by class extension. Name the new model <font color=\"blue\"><code>InfiniteBus</code></font> and place it inside <font color=\"blue\"><code>GenerationUnits</code></font>.
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/SMIBSystemAssembly//InfiniteBusModelCreation.png\" alt=\"InfiniteBusModelCreation\" />
    </p>
    </li>
    <li>Repeat the procedure to create a new model called <font color=\"blue\"><code>GeneratorOnly</code></font>. Your package should look as follows:
        <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/SMIBSystemAssembly//InitialPackageStructure.png\" alt=\"InitialPackageStructure\" />
    </p>
        </li>
    <li>Inside <font color=\"blue\"><code>InfiniteBus</code></font>, drag and drop a <font color=\"blue\"><code>GENCLS</code></font> generator model from <font color=\"blue\"><code>OpenIPSL.Electrical.Machines.PSSE</code></font>. </li>
    <li>Connect the <strong><font color=\"blue\">blue pin</font></strong> of the <font color=\"blue\"><code>GENCLS</code></font> component to <font color=\"blue\"><code>pwPin</code></font>. </li>
    <li>Now drag and drop a <font color=\"blue\"><code>GENROE</code></font> generator model from <font color=\"blue\"><code>OpenIPSL.Electrical.Machines.PSSE</code></font> to <font color=\"blue\"><code>GeneratorOnly</code></font>.
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/SMIBSystemAssembly//AddingGENROEBlock.png\" alt=\"AddingGENROEBlock\" />
    </p>
    </li>
    <li>Connect the output pin <font color=\"blue\"><code>PMECH0</code></font> on the right to the input pin <font color=\"blue\"><code>PMECH</code></font> on the left of the <font color=\"blue\"><code>GENROE</code></font> block. Do the same for the <font color=\"blue\"><code>EFD0</code></font> output and input <font color=\"blue\"><code>EFD</code></font> on the bottom. Also, connect the blue pin to <font color=\"blue\"><code>pwPin</code></font>. Your connections should look as follows
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/SMIBSystemAssembly//DefaultGENROEConnections.png\" alt=\"DefaultGENROEConnections\" />
    </p>
    </li>
    <li>Double click the <font color=\"blue\"><code>GENCLS</code></font> block inside the <font color=\"blue\"><code>InfiniteBus</code></font> model. Be sure to enter all the machine parameters in the figure below:
        <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/SMIBSystemAssembly//GENCLSMachineParameters.png\" alt=\"GENCLSMachineParameters\" />
    </p>
        </li>
    <li>Switch to the Modelica Text of the <font color=\"blue\"><code>InfiniteBus</code></font> model. Propagate the power flow parameters one layer up as indicated in the highlighted text of the following code chunk:
    <blockquote><pre>
<strong>model</strong> InfiniteBus
  <strong>extends</strong> <em>OpenIPSL.Interfaces.Generator</em>;
  <em>OpenIPSL.Electrical.Machines.PSSE.GENCLS</em> gENCLS(P_0=P_0,
    Q_0=Q_0,
    v_0=v_0,
    angle_0=angle_0,
    M_b=100000000,
    H=5.0000,
    D=0.0000,
    R_a=0.0000,
    X_d=0.2000)
    a..;
<strong>equation</strong>
  connect(gENCLS.p, pwPin)
    a..;
<strong>end</strong> InfiniteBus;
    </pre></blockquote>
    </li>
    <li>Go to the diagram layer of the <font color=\"blue\"><code>GeneratorOnly</code></font> model, double click the <font color=\"blue\"><code>GENROE</code></font> component and fill in the power flow data fields. Notice that no explicit values should be passed to <font color=\"blue\"><code>v_0</code></font> ( <font color=\"blue\"><code>V_0</code></font> in OpenIPSL 1.5), <font color=\"blue\"><code>angle_0</code></font>, <font color=\"blue\"><code>P_0</code></font>, and <font color=\"blue\"><code>Q_0</code></font>. These values are propagated from an upper layer.
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/SMIBSystemAssembly//GENROEParameterPropagation.png\" alt=\"GENROEParameterPropagation\" />
    </p>
    </li>
    <li>Similarly, pass the dynamical machine parameters to the generator model
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/SMIBSystemAssembly//GENROEMachineParameters.png\" alt=\"GENROEMachineParameters\" />
    </p>
    </li>
    <li>Go now to the diagram layer of the <font color=\"blue\"><code>SMIBPartial</code></font> model. Drag and drop the following components:
          <ul>
        <li>four buses from <font color=\"blue\"><code>OpenIPSL.Buses.Bus</code></font> (you could also work with <font color=\"blue\"><code>OpenIPSL.Buses.BusExt</code></font>); </li>
        <li>four lines from <font color=\"blue\"><code>OpenIPSL.Branches.PwLine</code></font>; </li>
        <li>a <font color=\"blue\"><code>Load</code></font> from <font color=\"blue\"><code>OpenIPSL.Electrical.Loads.PSSE</code></font>; </li>
        <li>a <font color=\"blue\"><code>PwFault</code></font> from <font color=\"blue\"><code>OpenIPSL.Electrical.Events</code></font>; </li>
        <li>a <font color=\"blue\"><code>SystemBase</code></font> from <font color=\"blue\"><code>OpenIPSL.Electrical.SystemBase</code></font>. Set the base frequency to 50 Hz and the base to 100 MVA; </li>
        <li>an <font color=\"blue\"><code>InfiniteBus</code></font> generation unit. </li>
      </ul>
      <p><br></p>
    </li>
    <li>Connect and name the different components as shown below:
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/SMIBSystemAssembly//SMIBModelConnections.png\" alt=\"SMIBModelConnections\" />
    </p>
    </li>
    <li>Enter the parameters for each of the four lines, as indicated in the corresponding table at the beginning of this document. For example, lines 1 and 2 should have the following parameters:
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/SMIBSystemAssembly//LineParameters.png\" alt=\"LineParameters\" />
    </p>
    </li>
    <li>Click the <font color=\"blue\"><code>B01</code></font> component and select the option to display the power flow. Do the same for the remaining buses and the generation unit component. </li>
    <li>Double click the <font color=\"blue\"><code>pwFault</code></font> block and fill in the parameters as indicated below:
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/SMIBSystemAssembly//FaultBlockParameters.png\" alt=\"FaultBlockParameters\" />
    </p>
    </li>
    <li>Inside <font color=\"blue\"><code>Experiments</code></font> create a new model named SMIB by extending the <font color=\"blue\"><code>SMIBPartial</code></font> model. Although not entirely required, add the following line to the Modelica text to include an icon to the model:
    <blockquote><pre>
<strong>model</strong> SMIB
  <strong>extends</strong> <em>Modelica.Icons.Example</em>;
  <strong>extends</strong> <em>BaseModels.BaseNetwork.SMIBPartial</em>;
<strong>end</strong> SMIB;
    </pre></blockquote>
    <hr>
    <p>&#x1F4CC; You should have a package structure similar to this:</p>
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/SMIBSystemAssembly//UpdatedPackageStructure.png\" alt=\"UpdatedPackageStructure\" />
    </p>
    <hr>
    </li>
    <li>Drag-and-drop a <font color=\"blue\"><code>GeneratorOnly</code></font> component from the <font color=\"blue\"><code>GenerationUnits</code></font> package to the diagram layer of the SMIB model. Name it genunit and make sure that the <em>Display power flow</em> option inside its parameters window is checked. </li>
    <li>Connect <font color=\"blue\"><code>genunit</code></font> to bus <font color=\"blue\"><code>B01</code></font>. The model should look as follows:
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/SMIBSystemAssembly//FinalSMIBModel.png\" alt=\"FinalSMIBModel\" />
    </p>
    </li>
    <li>Save your models. You should see several .mo files accompanying the model inside a folder called <font color=\"blue\"><code>SMIB</code></font>. </li>
    <li>Close Dymola or unload your SMIB model.</li>
  </ol>
</html>"));
end SMIBSystemAssembly;
