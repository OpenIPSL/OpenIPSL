within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords.TGData;
record GASTCTG1 "Type GAST TG for CTG1"
  extends GASTTemplate(
  R=0.04,
  T_1=0.4,
  T_2=0.1,
  T_3=2,
  AT=1,
  K_T=2,
  V_MAX=1,
  V_MIN=0,
  D_turb=0);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end GASTCTG1;
