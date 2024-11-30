within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords.ESData;
partial record ESSTxBTemplate "Type ST-B Excitation System Data"
  parameter Types.Time T_R "Regulator input filter time constant";
  parameter Types.PerUnit K_PR "Voltage regulator proportional gain";
  parameter Types.TimeAging K_IR "Voltage regulator integral gain";
  parameter Types.PerUnit V_RMAX "Maximum regulator output";
  parameter Types.PerUnit V_RMIN "Minimum regulator output";
  parameter Types.Time T_A
    "Thyristor bridge firing control equivalent time constant";
  parameter Types.PerUnit K_PM
    "Forward proportional gain of inner loop field regulator";
  parameter Types.TimeAging K_IM
    "Forward integral gain of inner loop field regulator";
  parameter Types.PerUnit V_MMAX "Maximum output of field current regulator";
  parameter Types.PerUnit V_MMIN "Minimum output of field current regulator";
  parameter Types.PerUnit K_G "Feedback gain of field current regulator";
  parameter Types.PerUnit K_P "Potential circuit (voltage) gain coefficient";
  parameter Types.PerUnit K_I "Compound circuit (current) gain coefficient";
  parameter Types.PerUnit V_BMAX "Maximum available exciter voltage";
  parameter Types.PerUnit K_C
    "Rectifier loading factor proportional to commutating reactance";
  parameter Types.PerUnit X_L "Reactance associated with potential source";
  parameter Types.Angle THETAP "Potential circuit phase angle";

end ESSTxBTemplate;
