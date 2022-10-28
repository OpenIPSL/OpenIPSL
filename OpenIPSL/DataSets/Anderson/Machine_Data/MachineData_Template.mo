within OpenIPSL.DataSets.Anderson.Machine_Data;
partial record MachineData_Template "Machine Data"
  parameter OpenIPSL.Types.ApparentPower M_b "Machine base power";
  parameter OpenIPSL.Types.Voltage V_b "Base voltage";
  parameter OpenIPSL.Types.PerUnit P_f "Rated power factor";
  parameter OpenIPSL.Types.PerUnit SCR "Machine short circuit ratio";
  parameter OpenIPSL.Types.PerUnit Xppd "d-axis sub-transient reactance";
  parameter OpenIPSL.Types.PerUnit Xpd "d-axis transient reactance";
  parameter OpenIPSL.Types.PerUnit Xd "d-axis reactance";
  parameter OpenIPSL.Types.PerUnit Xppq "q-axis sub-transient reactance";
  parameter OpenIPSL.Types.PerUnit Xpq "q-axis transient reactance";
  parameter OpenIPSL.Types.PerUnit Xq "q-axis reactance";
  parameter OpenIPSL.Types.PerUnit R_a "Armature resistance";
  parameter OpenIPSL.Types.PerUnit Xl "leakage reactance";
  parameter OpenIPSL.Types.Time Tppd0 "d-axis sub-transient open-circuit time constant";
  parameter OpenIPSL.Types.Time Tpd0 "d-axis transient open-circuit time constant";
  parameter OpenIPSL.Types.Time Tppq0 "q-axis sub-transient open-circuit time constant";
  parameter OpenIPSL.Types.Time Tpq0 "q-axis transient open-circuit time constant";
  parameter OpenIPSL.Types.Time H "Inertia constant";
  parameter OpenIPSL.Types.PerUnit S10 "Saturation factor at 1.0 pu";
  parameter OpenIPSL.Types.PerUnit S12 "Saturation factor at 1.2 pu";
  parameter OpenIPSL.Types.PerUnit Efdfl "Machine full load excitation in pu";
  parameter Real D "Speed damping";

end MachineData_Template;
