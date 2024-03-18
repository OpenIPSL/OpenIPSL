within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords.TGData;
record GASTCTG2 "Type GAST TG for CTG2"
  extends GASTTemplate(
  R=0.05,
  T_1=0.4,
  T_2=0.1,
  T_3=3,
  AT=0.9,
  K_T=2,
  V_MAX=1.0,
  V_MIN=0,
  D_turb=0);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end GASTCTG2;
