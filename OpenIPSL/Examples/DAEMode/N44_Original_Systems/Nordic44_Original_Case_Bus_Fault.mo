within OpenIPSL.Examples.DAEMode.N44_Original_Systems;
model Nordic44_Original_Case_Bus_Fault
  "Bus 3100 bus fault test case, several state events triggered"
  extends OpenIPSL.Examples.N44.Original.Nordic44_Original_Case(bus_3100(np=3));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=C.eps,
    X=C.eps,
    t1=2,
    t2=2.2) annotation (Placement(transformation(extent={{-164,66},{-152,78}})));
equation
  connect(bus_3100.p[3], pwFault.p) annotation (Line(points={{-176,46},{-170,46},
          {-170,72},{-165,72}}, color={0,0,255}));
  annotation (
      experiment(
      StopTime=10,
      Tolerance=1e-04),
      __Dymola_experimentFlags(Advanced(Define(DAEsolver=true))),
    Documentation(info="<html>
<p>Simulation of the Nordic 44 test system with a fault on bus 3100 to trigger several state events. Please note that the system is simulated using the DAE mode when in Dymola.</p>
<p>Simulate the system for 10 seconds. If you are using Dymola, use the DAE mode. Variables of interest are:</p>
<ul>
<li><code>bus_7020.v</code></li>
<li><code>G1_bus6500.gENSAL.SPEED</code></li>
</ul>
<p>Compare with the results obtained in <strong>Nordic44_Original_Case_Line_Opening</strong>.</p>
</html>"));
end Nordic44_Original_Case_Bus_Fault;
