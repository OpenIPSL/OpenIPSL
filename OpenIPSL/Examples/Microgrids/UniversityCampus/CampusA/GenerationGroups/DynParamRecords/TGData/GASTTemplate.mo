within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords.TGData;
record GASTTemplate "Template for GAST motor model"
  parameter Types.PerUnit R "Speed droop gain";
  parameter Types.Time T_1 "Valve response time constant";
  parameter Types.Time T_2 "Turbine response time constant";
  parameter Types.Time T_3 "Load limit response time constant";
  parameter Types.PerUnit AT "Ambient temperature load limit";
  parameter Types.PerUnit K_T "Load-limited feedback path adjustment gain";
  parameter Types.PerUnit V_MAX "Operational control high limit on fuel valve opening";
  parameter Types.PerUnit V_MIN "Low output control limit on fuel valve opening";
  parameter Types.PerUnit D_turb "Turbine damping";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end GASTTemplate;
