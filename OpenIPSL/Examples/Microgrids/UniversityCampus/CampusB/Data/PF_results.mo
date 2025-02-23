within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusB.Data;
record PF_results
  "Collection of records that characterize the equilibrium point"
  extends Modelica.Icons.Record;
  replaceable record Voltages =
      VoltagesCampus1 constrainedby VoltagesCampus1                  "Voltage data record template"
                                                  annotation (
      choicesAllMatching);
  Voltages voltages;

  replaceable record Machines = MachinesCampus1 constrainedby MachinesCampus1
                                                                     "Power data record template for machines"
                                                  annotation (
      choicesAllMatching);
  Machines machines;

  replaceable record Loads = LoadsCampus1 constrainedby LoadsCampus1
                                                    "Power data record template for loads"
                                 annotation (choicesAllMatching);
  Loads loads;

  replaceable record Photovoltaic =
                               RenewablesCampus1 constrainedby
    RenewablesCampus1
    "Power data record template for PV"     annotation (
      choicesAllMatching);
  Photovoltaic photovoltaic;
  annotation (
    defaultComponentName="PF_results",
    defaultComponentPrefixes="inner",
    missingInnerMessage="
    No 'PF_results' data is defined.",
    Documentation(info="<html>
This record collects all the information that is used to initialized the network in a certain operating point.
</html>"));
end PF_results;
