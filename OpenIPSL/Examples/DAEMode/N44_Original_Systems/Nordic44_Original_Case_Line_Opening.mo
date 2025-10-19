within OpenIPSL.Examples.DAEMode.N44_Original_Systems;
model Nordic44_Original_Case_Line_Opening
    "Line opening test case, no state events triggered"
    extends OpenIPSL.Examples.N44.Original.Nordic44_Original_Case;
    annotation (
        experiment(
        StopTime=10,
        Tolerance=1e-06),
        __Dymola_experimentFlags(
        Advanced(Define(DAEsolver=true))),
    Documentation(info="<html>
<p>Simulation of the Nordic 44 test system with line opening, which does not trigger a state event. Please note that the system is simulated using the DAE mode when in Dymola.</p>
<p>Simulate the system for 10 seconds. If you are using Dymola, use the DAE mode. Variables of interest are:</p>
<ul>
<li><code>bus_7020.v</code></li>
<li><code>G1_bus6500.gENSAL.SPEED</code></li>
</ul>
<p>Compare with the results obtained in <strong>Nordic44_Original_Case_Bus_Fault</strong>.</p>
</html>"),
__OpenModelica_commandLineOptions = "--daeMode");
end Nordic44_Original_Case_Line_Opening;
