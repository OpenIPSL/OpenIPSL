within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords.TGData;
record TGOV1Template "Template for TGOV1 motor model"
  parameter Types.PerUnit R "Inverse of governor gain (the actual gain is 1/R)";
  parameter Types.PerUnit D_t "Turbine damping factor (on Machine Base)";
  parameter Types.Time T_1 "Regulator time constant. It must be greater than 0";
  parameter Types.Time T_2 "High-pressure reheater time constant";
  parameter Types.Time T_3 "Reheater time constant. It must be greater than 0";
  parameter Types.PerUnit V_MAX "Maximum valve position (on Machine Base)";
  parameter Types.PerUnit V_MIN "Minimum valve position (on Machine Base)";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end TGOV1Template;
