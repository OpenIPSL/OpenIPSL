within OpenIPSL.Data.PowerPlant.Anderson.MachineData;
partial record MachineDataTemplate "Synchronous Machine Dynamic Data Record Template"
  extends Modelica.Icons.Record;
  parameter Types.ApparentPower M_b "Machine base power";
  parameter Types.Voltage V_b "Base voltage";
  parameter Types.PerUnit P_f "Rated power factor";
  parameter Types.PerUnit SCR "Machine short circuit ratio";
  parameter Types.PerUnit Xppd "d-axis sub-transient reactance";
  parameter Types.PerUnit Xpd "d-axis transient reactance";
  parameter Types.PerUnit Xd "d-axis reactance";
  parameter Types.PerUnit Xppq "q-axis sub-transient reactance";
  parameter Types.PerUnit Xpq "q-axis transient reactance";
  parameter Types.PerUnit Xq "q-axis reactance";
  parameter Types.PerUnit R_a "Armature resistance";
  parameter Types.PerUnit Xl "leakage reactance";
  parameter Types.Time Tppd0 "d-axis sub-transient open-circuit time constant";
  parameter Types.Time Tpd0 "d-axis transient open-circuit time constant";
  parameter Types.Time Tppq0 "q-axis sub-transient open-circuit time constant";
  parameter Types.Time Tpq0 "q-axis transient open-circuit time constant";
  parameter Types.Time H "Inertia constant";
  parameter Types.PerUnit S10 "Saturation factor at 1.0 pu";
  parameter Types.PerUnit S12 "Saturation factor at 1.2 pu";
  parameter Types.PerUnit Efdfl "Machine full load excitation in pu";
  parameter Real D "Speed damping";

end MachineDataTemplate;
