within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords.ESData;
partial record ESSTxATemplate "Type ST-A Excitation System Data"
  parameter String Type "Type of ESSST excitation system model";
  parameter Types.Time T_R "Regulator input filter time constant";
  parameter Types.PerUnit V_IMAX "Maximum voltage error (regulator input)";
  parameter Types.PerUnit V_IMIN "Minimum voltage error (regulator input)";
  parameter Types.Time T_C
    "Regulator numerator (lead) time constant. First lead-lag";
  parameter Types.Time T_B
    "Regulator denominator (lag) time constant. First lead-lag";
  parameter Types.Time T_C1
    "Regulator numerator (lead) time constant. Second lead-lag";
  parameter Types.Time T_B1
    "Regulator denominator (lag) time constant. Second lead-lag";
  parameter Types.PerUnit K_A "Voltage regulator gain";
  parameter Types.Time T_A "Voltage regulator time constant";
  parameter Types.PerUnit V_AMAX "Maximum regulator output";
  parameter Types.PerUnit V_AMIN "Minimum regulator output";
  parameter Types.PerUnit V_RMAX "Maximum exciter output";
  parameter Types.PerUnit V_RMIN "Minimum exciter output";
  parameter Types.PerUnit K_C
    "Rectifier loading factor proportional to commutating reactance";
  parameter Types.PerUnit K_F "Rate feedback gain";
  parameter Types.Time T_F "Rate feedback time constant";
  parameter Types.PerUnit K_LR "Exciter output current limiter gain";
  parameter Types.PerUnit I_LR "Exciter output current limit reference";
  parameter Types.PerUnit K_P "Potential circuit (voltage) gain coefficient";
  parameter Types.PerUnit K_I "Compound circuit (current) gain coefficient";
  parameter Types.PerUnit K_E "Excitation power source output gain";
  parameter Types.Time T_E "Excitation power source output time constant";
  parameter Types.PerUnit EFD_MAX "Maximum exciter output";

end ESSTxATemplate;
