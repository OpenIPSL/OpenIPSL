within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords.TGData;
record GASTCTG1 "Type GAST TG for CTG1"
  extends GASTTemplate(
  R=25,
  T_1=0.5,
  T_2=0.7,
  T_3=0.0001,
  AT=10,
  K_T=0,
  V_MAX=1.3,
  V_MIN=0.2,
  D_turb=0);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end GASTCTG1;
