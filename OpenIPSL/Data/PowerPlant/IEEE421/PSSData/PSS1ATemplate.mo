within OpenIPSL.Data.PowerPlant.IEEE421.PSSData;
partial record PSS1ATemplate "Type PSS-A Power System Stabilizer"
  extends Modelica.Icons.Record;
  parameter Types.PerUnit K_S "PSS gain";
  parameter Types.Time T_1 "Lead-lag time constant 1";
  parameter Types.Time T_2 "Lead-lag time constant 2";
  parameter Types.Time T_3 "Lead-lag time constant 3";
  parameter Types.Time T_4 "Lead-lag time constant 4";
  parameter Types.Time T_5 "Washout time constant";
  parameter Types.Time T_6 "Transducer time constant";
  parameter Types.PerUnit V_STMAX "PSS output max. limit";
  parameter Types.PerUnit V_STMIN "PSS output min. limit";

end PSS1ATemplate;
