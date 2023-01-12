within OpenIPSL.Examples.Tutorial.Example_4.Instructions;
model AutomatingAnalysis "Automating Analysis"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
  <h5>Automating Analysis with Modelica functions</h5>
  <ol>
    <li>Open the diagram layer of the <font color=\"blue\"><code>SMIBPartial</code></font> model. Remember that this model is located in the following path: <font color=\"blue\"><code>SMIB.BaseModels.BaseNetwork</code></font>. </li>
    <li>Double-click the load component and go to the Attributes tab. In the <em>Properties</em> group select the <em>Replaceable</em> option. Then click the Constraining clause checkbox and browse for class by pressing the button <img src=\"modelica://OpenIPSL/Resources/images/example_4/AutomatingAnalysis/ExpandButton.png\" alt=\"ExpandButton\" />. From the package tree select <font color=\"blue\"><code>OpenIPSL.Electrical.Loads.PSSE.BaseClasses.baseLoad</code></font> as shown in the figure below.
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/AutomatingAnalysis/ReplaceableLoad.png\" alt=\"ReplaceableLoad\" />
    </p>
    </li>
    <li>In the package browser, go to the <font color=\"blue\"><code>Experiments</code></font> package, create a new model by duplicating <font color=\"blue\"><code>SMIB</code></font> and name it <font color=\"blue\"><code>SMIBVarLoad</code></font>.
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/AutomatingAnalysis/CreateSMIBVarLoadModel.png\" alt=\"CreateSMIBVarLoadModel\" />
    </p>
    </li>
    <li>Now right-click the load component of the <font color=\"blue\"><code>SMIBVarLoad</code></font> model and change the class to <em><font color=\"blue\"><code>PSS/E Load with variation</code></font></em> as indicated in the following picture:
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/AutomatingAnalysis/ChangeClassToLoadWithVariation.png\" alt=\"ChangeClassToLoadWithVariation\" />
    </p>
    </li>
    <li>Double-click the load component to update its power flow parameters. You can either use the button to insert a component reference or type directly each value according to the following settings:
      <p>&nbsp;</p>
      <ul>
        <li>P_0: <em>pf.powerflow.loads.PL1</em></li>
        <li>Q_0: <em>pf.powerflow.loads.QL1</em></li>
        <li>v_0: <em>pf.powerflow.bus.V3</em></li>
        <li>angle_0: <em>pf.powerflow.bus.A3</em></li>
      </ul>
      <p>&nbsp;</p>
    </li>
    <li>Specify a load drop of 0.1 pu starting at t = 10 sec and for a duration of 60 sec.
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/AutomatingAnalysis/SettingVariableLoadParameters.png\" alt=\"SettingVariableLoadParameters\" />
    </p>
    </li>
    <li>This time we want to see the effect of a perturbation on the load. Therefore, double-click the fault component and change its time parameters so that the fault event occurs after the new simulation stop time (100 sec).
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/AutomatingAnalysis/SettingFaultParameters.png\" alt=\"SettingFaultParameters\" />
    </p>
    </li>
    <li>Change the class of the genunit component of the <font color=\"blue\"><code>SMIBVarLoad</code></font> model to the <font color=\"blue\"><code>GeneratorTurbGovAVRPSS</code></font> model. You will find it as &quot;<em>Machine with Turbine, Governor, Excitation System and PSS</em>&quot;.
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/AutomatingAnalysis/ChangeClassToMachineWithTurbGovernorPSS.png\" alt=\"ChangeClassToMachineWithTurbGovernorPSS\" />
    </p>
    </li>
    <li>Go to the Simulation view and close all the results by right-clicking any of the results from the Variable Browser and then selecting the <em>Close All Results</em> option.
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/AutomatingAnalysis/CloseAllResults.png\" alt=\"CloseAllResults\" />
    </p>
    <p>We would like to automatically simulate the <font color=\"blue\"><code>SMIB</code></font> and <font color=\"blue\"><code>SMIBVarLoad</code></font> models and plot their results for comparative purposes. For this to be done we are going to create and call a Modelica function that includes the right sequence of steps. </p>
    </li>
    <li>Create a new Modelica function inside of the <font color=\"blue\"><code>Experiments</code></font> package. For this to be done you can go to <em>File &gt; New &gt; Function</em> after selecting the package, or alternatively, you can right-click the package and then click on <em>New &gt; Function</em>. Name the function <em><font color=\"blue\"><code>RunAndCompare</code></font></em>. The <font color=\"blue\"><code>Experiments</code></font> package should now look like this:
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/AutomatingAnalysis/RunAndCompareFunction.png\" alt=\"RunAndCompareFunction\" />
    </p>
    </li>
    <li>Go to the Modelica text of the <font color=\"blue\"><code>RunAndCompare</code></font> function and create 6 input variables as indicated below:
    <blockquote><pre>
<strong>function</strong> RunAndCompare
  \"Runs different instances of the SMIB model to compare their results\"

  // INPUTS TO THE FUNCTION
  <strong>input</strong> <em>Modelica.Units.SI.Time</em> tsim=100 \"Simulation time\";
  <strong>input</strong> <em>Integer</em> numberOfIntervalsin=10000 \"No. of intervals\";
  <strong>input</strong> <em>String</em> methodin = \"Dassl\" \"Solver\";
  <strong>input</strong> <em>Real</em> fixedstepsizein= 1e-3 \"Time step - needed only for fixed time step solvers\";

  // MODELS TO SIMULATE
  <strong>input</strong> <em>String</em> modelA=\"SMIB.Experiments.SMIB\";
  <strong>input</strong> <em>String</em> modelB=\"SMIB.Experiments.SMIBVarLoad\";
  ...
    </pre></blockquote>
    </li>
    <li>Add the following code inside of the algorithm section of the function to define the simulation and plotting instructions:
    <blockquote><pre>
<strong>algorithm </strong>
  simulateModel(
    modelA,
    stopTime=tsim,
    numberOfIntervals=numberOfIntervalsin,
    method = methodin,
    fixedstepsize=fixedstepsizein,
    resultFile=\"res_casea\");
  simulateModel(
    modelB,
    stopTime=tsim,
    numberOfIntervals=numberOfIntervalsin,
    method = methodin,
    fixedstepsize=fixedstepsizein,
    resultFile=\"res_caseb\");

  <em>removePlots</em>(true);
  Advanced.FilesToKeep :=10;
  <em>createPlot</em>(id=1, position={15, 15, 678, 703}, y={\"B01.V\"},
    range={0.0, 10.0, 0.4, 1.4}, grid=true, filename=\"res_casea.mat\",
    colors={{28,108,200}}, displayUnits={\"1\"});
  <em>createPlot</em>(id=1, position={15, 15, 678, 703}, y={\"genunit.P\"},
    range={0.0, 10.0, -1.5, 2.0}, grid=true, subPlot=102,
    colors={{28,108,200}}, displayUnits={\"1\"});
  <em>createPlot</em>(id=1, position={15, 15, 678, 703}, y={\"genunit.Q\"},
    range={0.0, 10.0, -0.5, 2.0}, grid=true, subPlot=103,
    colors={{28,108,200}}, displayUnits={\"1\"});
  <em>createPlot</em>(id=1, position={15, 15, 678, 703}, y={\"B01.V\"},
    range={0.0, 10.0, 0.4, 1.4}, erase=false, grid=true,
    filename=\"res_caseb.mat\", colors={{238,46,47}}, displayUnits={\"1\"},
    axes={2});
  <em>createPlot</em>(id=1, position={15, 15, 678, 703}, y={\"genunit.P\"},
    range={0.0, 10.0, -1.5, 2.0}, erase=false, grid=true, subPlot=102,
    colors={{238,46,47}}, displayUnits={\"1\"},
    axes={2});
  <em>createPlot</em>(id=1, position={15, 15, 678, 703}, y={\"genunit.Q\"},
    range={0.0, 10.0, -0.5, 2.0}, erase=false, grid=true, subPlot=103,
    colors={{238,46,47}}, displayUnits={\"1\"},
    axes={2});

<strong>end</strong> RunAndCompare;
  </pre></blockquote>
    </li>
    <li>Right-click the <font color=\"blue\"><code>RunAndCompare</code></font> function, select the <em>Call Function...</em> option and then press OK. If everything goes well you will get the plots shown below.
    <p>
      <img src=\"modelica://OpenIPSL/Resources/images/example_4/AutomatingAnalysis/GeneratedPowerAndBusVoltagePlots.png\" alt=\"GeneratedPowerAndBusVoltagePlots\" />
    </p>
        </li>
  </ol>
</html>"));
end AutomatingAnalysis;
