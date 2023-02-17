within OpenIPSL.DataSets;
record GU_Dynamics

  extends Modelica.Icons.Record;

  replaceable record GUnitDynamics = DataSets.GU_Dynamics_Template
    constrainedby DataSets.GU_Dynamics_Template
  annotation(choicesAllMatching);

  GUnitDynamics guDynamics;

end GU_Dynamics;
