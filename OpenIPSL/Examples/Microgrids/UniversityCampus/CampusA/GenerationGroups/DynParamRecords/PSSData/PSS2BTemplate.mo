within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords.PSSData;
partial record PSS2BTemplate "Type PSS-B Power System Stabilizer"
  parameter Types.Time T_w1 "Washout time constant 1";
  parameter Types.Time T_w2 "Washout time constant 2";
  parameter Types.Time T_6 "Lag time constant 6";
  parameter Types.Time T_w3 "Washout time constant 3";
  parameter Types.Time T_w4 "Washout time constant 4";
  parameter Types.Time T_7 "Lag time constant 7";
  parameter Types.Time K_S2 "Lag gain 2, T_7/H";
  parameter Types.Time K_S3 "Lag gain 3";
  parameter Types.Time T_8 "Ramp-tracking filter time constant";
  parameter Types.Time T_9 "Ramp-tracking filter time constant";
  parameter Types.Time K_S1 "PSS gain";
  parameter Types.Time T_1 "Lead-lag time constant 1";
  parameter Types.Time T_2 "Lead-lag time constant 2";
  parameter Types.Time T_3 "Lead-lag time constant 3";
  parameter Types.Time T_4 "Lead-lag time constant 4";
  parameter Types.Time T_10 "Lead-lag time constant 10";
  parameter Types.Time T_11 "Lead-lag time constant 11";
  parameter Types.PerUnit V_S1MAX "PSS input 1 max. limit";
  parameter Types.PerUnit V_S1MIN "PSS input 1 min. limit";
  parameter Types.PerUnit V_S2MAX "PSS input 2 max. limit";
  parameter Types.PerUnit V_S2MIN "PSS input 2 min. limit";
  parameter Types.PerUnit V_STMAX "PSS output max. limit, 0.1 ~ 0.2";
  parameter Types.PerUnit V_STMIN "PSS output min. limit, -0.05 ~ -0.1";
  parameter Integer M "Ramp tracking filter coefficient";
  parameter Integer N "Ramp tracking filter coefficient";

end PSS2BTemplate;
