within OpenIPSL.Examples.Microgrids.UniversityCampuses.Data;
record PF_results
  "Collection of records that characterize the equilibrium point"
  extends Modelica.Icons.Record;
  replaceable record Voltages =
      Microgrids.UniversityCampuses.Data.VoltagesCampus1
    constrainedby Microgrids.UniversityCampuses.Data.VoltagesCampus1 "Voltage data record template"
                                                  annotation (
      choicesAllMatching);
  Voltages voltages;

  replaceable record Machines =
      Microgrids.UniversityCampuses.Data.MachinesCampus1
    constrainedby Microgrids.UniversityCampuses.Data.MachinesCampus1 "Power data record template for machines"
                                                  annotation (
      choicesAllMatching);
  Machines machines;

  replaceable record Loads = Microgrids.UniversityCampuses.Data.LoadsCampus1 constrainedby
    Microgrids.UniversityCampuses.Data.LoadsCampus1 "Power data record template for loads"
                                 annotation (choicesAllMatching);
  Loads loads;
  annotation (
    defaultComponentName="PF_results",
    defaultComponentPrefixes="inner",
    missingInnerMessage="
    No 'PF_results' data is defined.",
    Documentation(info="<html>
This record collects all the information that is used to initialized the network in a certain operating point.
</html>"));
end PF_results;
