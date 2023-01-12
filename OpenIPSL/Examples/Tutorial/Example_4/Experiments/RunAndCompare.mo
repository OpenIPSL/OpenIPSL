within OpenIPSL.Examples.Tutorial.Example_4.Experiments;
function RunAndCompare
  "Runs different instances of the SMIB model to compares their results"
   extends Modelica.Icons.Function;

  // INPUTS TO THE FUNCTION
  input Modelica.Units.SI.Time tsim=100 "Simulation time";
  input Integer numberOfIntervalsin=10000 "No. of intervals";
  input String methodin = "Dassl" "Solver";
  input Real fixedstepsizein= 1e-3 "Time step - needed only for fixed time step solvers";

  // MODELS TO SIMULATE
  input String modelA="OpenIPSL.Examples.Tutorial.Example_4.Experiments.SMIB";
  input String modelB="OpenIPSL.Examples.Tutorial.Example_4.Experiments.SMIBVarLoad";

algorithm
  removePlots(true);
  //Advanced.FilesToKeep :=10 annotation(__Dymola_interactive=true);
  simulateModel(
    modelA,
    stopTime=tsim,
    numberOfIntervals=numberOfIntervalsin,
    method = methodin,
    fixedstepsize=fixedstepsizein,
    resultFile="res_casea");
  simulateModel(
    modelB,
    stopTime=tsim,
    numberOfIntervals=numberOfIntervalsin,
    method = methodin,
    fixedstepsize=fixedstepsizein,
    resultFile="res_caseb");
  createPlot(id=1, position={15, 15, 678, 703}, y={"B01.v"},
    range={0.0, 10.0, 0.4, 1.4}, grid=true, filename="res_casea.mat",
    colors={{28,108,200}}, displayUnits={"1"});
  createPlot(id=1, position={15, 15, 678, 703}, y={"genunit.P"},
    range={0.0, 10.0, -1.5, 2.0}, grid=true, subPlot=102,
    colors={{28,108,200}}, displayUnits={"1"});
  createPlot(id=1, position={15, 15, 678, 703}, y={"genunit.Q"},
    range={0.0, 10.0, -0.5, 2.0}, grid=true, subPlot=103,
    colors={{28,108,200}}, displayUnits={"1"});
  createPlot(id=1, position={15, 15, 678, 703}, y={"B01.v"},
    range={0.0, 10.0, 0.4, 1.4}, erase=false, grid=true,
    filename="res_caseb.mat", colors={{238,46,47}}, displayUnits={"1"},
    axes={2});
  createPlot(id=1, position={15, 15, 678, 703}, y={"genunit.P"},
    range={0.0, 10.0, -1.5, 2.0}, erase=false, grid=true, subPlot=102,
    colors={{238,46,47}}, displayUnits={"1"},
    axes={2});
  createPlot(id=1, position={15, 15, 678, 703}, y={"genunit.Q"},
    range={0.0, 10.0, -0.5, 2.0}, erase=false, grid=true, subPlot=103,
    colors={{238,46,47}}, displayUnits={"1"},
    axes={2});

end RunAndCompare;
