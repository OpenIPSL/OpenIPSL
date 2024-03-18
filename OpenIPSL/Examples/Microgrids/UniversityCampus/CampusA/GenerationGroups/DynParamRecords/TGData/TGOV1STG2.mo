within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords.TGData;
record TGOV1STG2 "Type TGOV1 TG for STG2"
  extends TGOV1Template(
  R=0.05,
  D_t=0,
  T_1=0.2,
  T_2=0,
  T_3=0.3,
  V_MAX=1,
  V_MIN=0.3);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end TGOV1STG2;
