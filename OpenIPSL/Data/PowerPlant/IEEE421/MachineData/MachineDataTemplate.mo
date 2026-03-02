within OpenIPSL.Data.PowerPlant.IEEE421.MachineData;
partial record MachineDataTemplate "Synchronous Machine Dynamic Data Record Template"
  extends Modelica.Icons.Record;
  parameter Types.ApparentPower M_b "Machine base power";
  parameter Types.Time Tpd0 "d-axis transient open-circuit time constant";
  parameter Types.Time Tppd0 "d-axis sub-transient open-circuit time constant";
  parameter Types.Time Tppq0 "q-axis sub-transient open-circuit time constant";
  parameter Types.Time H "Inertia constant";
  parameter Real D "Speed damping";
  parameter Types.PerUnit Xd "d-axis reactance";
  parameter Types.PerUnit Xq "q-axis reactance";
  parameter Types.PerUnit Xpd "d-axis transient reactance";
  parameter Types.PerUnit Xppd "d-axis sub-transient reactance";
  parameter Types.PerUnit Xppq "q-axis sub-transient reactance";
  parameter Types.PerUnit Xl "leakage reactance";
  parameter Types.PerUnit S10 "Saturation factor at 1.0 pu";
  parameter Types.PerUnit S12 "Saturation factor at 1.2 pu";
  parameter Types.PerUnit R_a "Armature resistance";

end MachineDataTemplate;
