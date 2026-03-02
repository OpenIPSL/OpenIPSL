within OpenIPSL.Data.PowerPlant.Anderson.TurbGovData;
partial record TurbGovernorDataTemplate "Turbine-Governor Data Record Template"
  extends Modelica.Icons.Record;
  parameter String GOV "Governor type (G = general, H = hydraulic, C = cross-compound)";
  parameter Types.PerUnit R "Turbine steady-state regulation setting or droop";
  parameter Types.PerUnit P_MAX "Maximum Turbine Output";
  parameter Types.Time T_1 "Control time constant (governor delay) or governor response time (type H)";
  parameter Types.Time T_2 "Hydro reset time constant (type G) or pilot valve time (type H)";
  parameter Types.Time T_3 "Servo time constant (type G or C), or hydro gate time constant (type G) or dashput time constant (type H)";
  parameter Types.Time T_4 "Steam valve bowl time constant (zero for type G hydrogovernor) or (T_W/2 for type H)";
  parameter Types.Time T_5 "Steam reheat time constant or 1/2 hydro water setting time constant (type C or G) or minimum gate velocity in MW/s (type H)";
  parameter Types.PerUnit F "Shaft output ahead of reheater or -2.0 for hydro units (types C or G), or maximum gate velocity in MW/s (type H)";

end TurbGovernorDataTemplate;
