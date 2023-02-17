within OpenIPSL.DataSets.Anderson.TurbGov_Data;
partial record TurbGovernorData_Template "Turbine-Governor Data"
  parameter String GOV "Governor type (G = general, H = hydraulic, C = cross-compound)";
  parameter OpenIPSL.Types.PerUnit R "Turbine steady-state regulation setting or droop";
  parameter OpenIPSL.Types.PerUnit P_MAX "Maximum Turbine Output";
  parameter OpenIPSL.Types.Time T_1 "Control time constant (governor delay) or governor response time (type H)";
  parameter OpenIPSL.Types.Time T_2 "Hydro reset time constant (type G) or pilot valve time (type H)";
  parameter OpenIPSL.Types.Time T_3 "Servo time constant (type G or C), or hydro gate time constant (type G) or dashput time constant (type H)";
  parameter OpenIPSL.Types.Time T_4 "Steam valve bowl time constant (zero for type G hydrogovernor) or (T_W/2 for type H)";
  parameter OpenIPSL.Types.Time T_5 "Steam reheat time constant or 1/2 hydro water setting time constant (type C or G) or minimum gate velocity in MW/s (type H)";
  parameter OpenIPSL.Types.PerUnit F "Shaft output ahead of reheater or -2.0 for hydro units (types C or G), or maximum gate velocity in MW/s (type H)";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end TurbGovernorData_Template;
