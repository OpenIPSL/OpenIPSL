within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords.ESData;
partial record EXAC1Template "Type ST-A Excitation System Data"
  parameter Types.Time T_R "Regulator input filter time constant";
  parameter Types.Time T_B "Regulator denominator (lag) time constant";
  parameter Types.Time T_C "Regulator numerator (lead) time constant";
  parameter Types.PerUnit K_A "Regulator output gain";
  parameter Types.Time T_A "Regulator output time constant";
  parameter Types.PerUnit V_RMAX "Maximum regulator output";
  parameter Types.PerUnit V_RMIN "Minimum regulator output";
  parameter Types.Time T_E "Exciter field time constant";
  parameter Types.PerUnit K_F "Rate feedback excitation system stabilizer gain";
  parameter Types.Time T_F "Rate feedback time constant";
  parameter Types.PerUnit K_C "Rectifier loading factor proportional to commutating reactance";
  parameter Types.PerUnit K_D "Demagnetizing factor, function of exciter alternator reactances";
  parameter Types.PerUnit K_E "Exciter field proportional constant";
  parameter Types.PerUnit E_1 "Exciter output voltage for saturation factor S_E(E_1)";
  parameter Types.PerUnit E_2 "Exciter output voltage for saturation factor S_E(E_2)";
  parameter Types.PerUnit S_EE_1 "Exciter saturation factor at exciter output voltage E1";
  parameter Types.PerUnit S_EE_2 "Exciter saturation factor at exciter output voltage E2";


end EXAC1Template;
