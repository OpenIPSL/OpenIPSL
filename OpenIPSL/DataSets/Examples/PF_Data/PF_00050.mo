within OpenIPSL.DataSets.Examples.PF_Data;
record PF_00050
  extends DataSets.Examples.PF_Data.Power_Flow_Template;

  replaceable record Bus =
      DataSets.Examples.PF_Data.Bus_Data.PF_Bus_00050 constrainedby
    DataSets.Examples.PF_Data.Bus_Data.Bus_Template
    "Bus power flow results";
  Bus bus;

  replaceable record Loads =
      DataSets.Examples.PF_Data.Loads_Data.PF_Loads_00050 constrainedby
    DataSets.Examples.PF_Data.Loads_Data.Loads_Template
    "Loads power flow results";
  Loads loads;

  replaceable record Machines =
      DataSets.Examples.PF_Data.Machines_Data.PF_Machines_00050 constrainedby
    DataSets.Examples.PF_Data.Machines_Data.Machines_Template
    "Machine power flow results";
  Machines machines;

  replaceable record Trafos =
      DataSets.Examples.PF_Data.Trafos_Data.PF_Trafos_00050 constrainedby
    DataSets.Examples.PF_Data.Trafos_Data.Trafos_Template
    "Trafos power flow results";
  Trafos trafos;

end PF_00050;
