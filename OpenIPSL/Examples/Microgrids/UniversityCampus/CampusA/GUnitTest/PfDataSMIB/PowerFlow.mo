within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GUnitTest.PfDataSMIB;
record PowerFlow
  extends Modelica.Icons.Record;

  replaceable record PowerFlow =
      PowerFlowTemplate constrainedby PowerFlowTemplate "Replaceable power flow record"
                                                  annotation (
      choicesAllMatching);

  PowerFlow powerflow;

end PowerFlow;
