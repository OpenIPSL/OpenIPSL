within OpenIPSL.Examples.SevenBus;
package Data "Power flow data records for network initialization"
  record SevenBus_voltages "Data record for voltage magnitude and angle"
    extends Modelica.Icons.Record;
    // Bus number 1
    parameter Real V1=1.069590;
    parameter Real A1=0.00030194196;
    // Bus number 2
    parameter Real V2=1.069600;
    parameter Real A2=0.00163188285;
    // Bus number 3
    parameter Real V3=1.069580;
    parameter Real A3=-0.00006108652;
    // Bus number 4
    parameter Real V4=1.069590;
    parameter Real A4=-0.00030368728;
    // Bus number 5
    parameter Real V5=1.069570;
    parameter Real A5=0.00005934119;
    // Bus number 6
    parameter Real V6=1.069600;
    parameter Real A6=0.00054279739;
    // Bus number 7
    parameter Real V7=1.069600;
    parameter Real A7=0.000000;
    // Bus number 71
    parameter Real V71=0.980300;
    parameter Real A71=-0.00001745329;
    // Bus number 21
    parameter Real V21=0.989880;
    parameter Real A21=0.1275678429;
    // Bus number 61
    parameter Real V61=1.005950;
    parameter Real A61=0.04456523712;
    annotation (Documentation(info="<html>
This data record has the voltage magnitude, in per unit, and angle, in radians, that are used to initialized the network in a certain operating point.
</html>"));
  end SevenBus_voltages;

  record SevenBus_loads "Data record for load power consumption"
    extends Modelica.Icons.Record;
    // Load 3_1
    parameter Real PL3_1=240000015.00;
    parameter Real QL3_1=2400000.00;
    // Load 5_1
    parameter Real PL5_1=480000031.00;
    parameter Real QL5_1=4800000.00;
    // Load 4_1
    parameter Real PL4_1=480000031.00;
    parameter Real QL4_1=4800000.00;
    // Load 1_1
    parameter Real PL1_1=240000015.00;
    parameter Real QL1_1=2400000.00;
    annotation (Documentation(info="<html>
This data record has the active and reactive powers in VA and Var, respectively, that are consumed by the system's loads. The data is used to initialized the network in a certain operating point.
</html>"));
  end SevenBus_loads;

  record SevenBus_machines "Data record for power generation"
    extends Modelica.Icons.Record;
    // Machine 21_1
    parameter Real P21_1=962199951.00;
    parameter Real Q21_1=124763000.00;
    // Machine 71_1
    parameter Real P71_1=0.000000;
    parameter Real Q71_1=7038000.00;
    // Machine 61_1
    parameter Real P61_1=480428040.00;
    parameter Real Q61_1=27608999.00;
    annotation (Documentation(info="<html>
This data record has the active and reactive powers in VA and Var, respectively, that are delivered by the generation units to the system. The data is used to initialized the network in a certain operating point.
</html>"));
  end SevenBus_machines;

  record SevenBus_trafos "Data record fortransformer tap position"
    extends Modelica.Icons.Record;
    // 2WindingTrafo 1_4
    parameter Real t1_1_4=1.000000;
    parameter Real t2_1_4=1.000000;
    // 2WindingTrafo 7_71
    parameter Real t1_7_71=1.000000;
    parameter Real t2_7_71=1.092110;
    // 2WindingTrafo 6_61
    parameter Real t1_6_61=1.000000;
    parameter Real t2_6_61=1.065790;
    // 2WindingTrafo 2_21
    parameter Real t1_2_21=1.000000;
    parameter Real t2_2_21=1.092110;
    annotation (Documentation(info="<html>
This data record has the tap position for the different transformers in the system. The data is used to initialized the network in a certain operating point.
</html>"));
  end SevenBus_trafos;

  record PF_results "Collection of records that characterize the equilibrium point"
    extends Modelica.Icons.Record;
    replaceable record Voltages = SevenBus.Data.SevenBus_voltages
      constrainedby SevenBus.Data.SevenBus_voltages "Voltage data record template"
                                                    annotation (
        choicesAllMatching);
    Voltages voltages;
    replaceable record Machines = SevenBus.Data.SevenBus_machines
      constrainedby SevenBus.Data.SevenBus_machines "Power data record template for machines"
                                                    annotation (
        choicesAllMatching);
    Machines machines;
    replaceable record Trafos = SevenBus.Data.SevenBus_trafos constrainedby
      SevenBus.Data.SevenBus_trafos "Transformer tap data record template"
                                    annotation (choicesAllMatching);
    Trafos trafos;
    replaceable record Loads = SevenBus.Data.SevenBus_loads constrainedby
      SevenBus.Data.SevenBus_loads "Power data record template for loads"
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
  annotation (Documentation(info="<html>
<p>This package contains a set of data records that are used to initialize the power network on a determined operating point.</p>
<p>The user is also encouraged to duplicate this system and to add other initial conditions, if stability under other operating conditions need to be assessed or understood.</p>
</html>"));
end Data;
