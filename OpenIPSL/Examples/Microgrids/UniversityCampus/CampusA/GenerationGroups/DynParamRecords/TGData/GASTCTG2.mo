within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords.TGData;
record GASTCTG2 "Type GAST TG for CTG2"
  extends GASTTemplate(
  R=20.00,
  T_1=0.2,
  T_2=0.3,
  T_3=0.0001,
  AT=10,
  K_T=0,
  V_MAX=1.05,
  V_MIN=0.2,
  D_turb=0);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end GASTCTG2;
