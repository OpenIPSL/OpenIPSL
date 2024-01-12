within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords;
record GUDynamics "Instantiable Record for Generation Unit Dynamic Parameters"
  extends Modelica.Icons.Record;

  replaceable record GUnitDynamics = GUDynamicsTemplate
    constrainedby GUDynamicsTemplate
  annotation(choicesAllMatching);

  GUnitDynamics guDynamics;

  annotation (Documentation(info="<html>
<p>Instantiable Record for Generation Unit Dynamic Parameters</p>
</html>"));
end GUDynamics;
