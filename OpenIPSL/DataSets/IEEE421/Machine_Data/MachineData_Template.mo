within OpenIPSL.DataSets.IEEE421.Machine_Data;
partial record MachineData_Template "Machine Parameters"
  parameter OpenIPSL.Types.ApparentPower M_b "Machine base power";
  parameter OpenIPSL.Types.Time Tpd0 "d-axis transient open-circuit time constant";
  parameter OpenIPSL.Types.Time Tppd0 "d-axis sub-transient open-circuit time constant";
  parameter OpenIPSL.Types.Time Tppq0 "q-axis sub-transient open-circuit time constant";
  parameter OpenIPSL.Types.Time H "Inertia constant";
  parameter Real D "Speed damping";
  parameter OpenIPSL.Types.PerUnit Xd "d-axis reactance";
  parameter OpenIPSL.Types.PerUnit Xq "q-axis reactance";
  parameter OpenIPSL.Types.PerUnit Xpd "d-axis transient reactance";
  parameter OpenIPSL.Types.PerUnit Xppd "d-axis sub-transient reactance";
  parameter OpenIPSL.Types.PerUnit Xppq "q-axis sub-transient reactance";
  parameter OpenIPSL.Types.PerUnit Xl "leakage reactance";
  parameter OpenIPSL.Types.PerUnit S10 "Saturation factor at 1.0 pu";
  parameter OpenIPSL.Types.PerUnit S12 "Saturation factor at 1.2 pu";
  parameter OpenIPSL.Types.PerUnit R_a "Armature resistance";
end MachineData_Template;
