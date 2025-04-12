within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusB.PfData.TrafoData;
partial record TrafoTemplate

  parameter Real t1_trafo_1 "BI1" annotation (Dialog(enable=false));
  parameter Real t2_trafo_1 "BI1" annotation (Dialog(enable=false));

  parameter Real t1_trafo_2 "BI2" annotation (Dialog(enable=false));
  parameter Real t2_trafo_2 "BI2" annotation (Dialog(enable=false));

  parameter Real t1_trafo_3 "HT1W" annotation (Dialog(enable=false));
  parameter Real t2_trafo_3 "HT1W" annotation (Dialog(enable=false));

  parameter Real t1_trafo_4 "HT2E" annotation (Dialog(enable=false));
  parameter Real t2_trafo_4 "HT2E" annotation (Dialog(enable=false));

  parameter Real t1_trafo_5 "HT3N" annotation (Dialog(enable=false));
  parameter Real t2_trafo_5 "HT3N" annotation (Dialog(enable=false));

  parameter Real t1_trafo_6 "HT4S" annotation (Dialog(enable=false));
  parameter Real t2_trafo_6 "HT4S" annotation (Dialog(enable=false));

end TrafoTemplate;
