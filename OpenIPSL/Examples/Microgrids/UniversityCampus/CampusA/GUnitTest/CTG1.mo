within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GUnitTest;
model CTG1 "SMIB test model for CTG1"
  extends OpenIPSL.Tests.BaseClasses.SMIB(
    SysData(fn=60),
    constantLoad(
      P_0=powerFlow.powerflow.loads.PL1,
      Q_0=powerFlow.powerflow.loads.QL1,
      v_0=powerFlow.powerflow.bus.v3,
      angle_0=powerFlow.powerflow.bus.A3),
    gENCLS(
      P_0=powerFlow.powerflow.machines.PG2,
      Q_0=powerFlow.powerflow.machines.QG2,
      v_0=powerFlow.powerflow.bus.v2,
      angle_0=powerFlow.powerflow.bus.A2));
              GenerationGroups.CTG1.CTG1MachineESVC genUnit(
    P_0=powerFlow.powerflow.machines.PG1,
    Q_0=powerFlow.powerflow.machines.QG1,
    v_0=powerFlow.powerflow.bus.v1,
    angle_0=powerFlow.powerflow.bus.A1,
    displayPF=true)
    annotation (Placement(transformation(rotation=0, extent={{-66,-10},{-46,10}})),
      choicesAllMatching=true);
  GUnitTest.PfDataSMIB.PowerFlow powerFlow(redeclare record PowerFlow =
        OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GUnitTest.PfDataSMIB.PfCTG1)
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
equation
  connect(genUnit.pwPin, GEN1.p)
    annotation (Line(points={{-45,0},{-30,0}}, color={0,0,255}));
  annotation (
experiment(
      StopTime=15,
      Interval=0.001,
      __Dymola_Algorithm="Dassl"));
end CTG1;
