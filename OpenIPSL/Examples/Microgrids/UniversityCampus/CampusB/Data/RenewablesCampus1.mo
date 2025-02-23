within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusB.Data;
record RenewablesCampus1 "Data record for renewable generation"
  extends Modelica.Icons.Record;

  // Photovoltaic 1
  parameter Real PPV1=0.31e6;
  parameter Real QPV1=0.1279e6;

  // Photovoltaic 2
  parameter Real PPV2=0.0108e6;
  parameter Real QPV2=0.0051e6;

  // Photovoltaic 3
  parameter Real PPV3=0.007e6;
  parameter Real QPV3=0.0024e6;

  // Photovoltaic 4
  parameter Real PPV4=0.009e6;
  parameter Real QPV4=0.0323e6;

  // Photovoltaic 5
  parameter Real PPV5=0.6e6;
  parameter Real QPV5=0.2793e6;

  annotation (Documentation(info="<html>
This data record has the active and reactive powers in VA and Var, respectively, that are delivered by the generation units to the system. The data is used to initialized the network in a certain operating point.
</html>"));
end RenewablesCampus1;
