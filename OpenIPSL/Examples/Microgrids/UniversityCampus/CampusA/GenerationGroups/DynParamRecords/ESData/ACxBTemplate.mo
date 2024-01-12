within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords.ESData;
partial record ACxBTemplate "Type AC-B Excitation System Data"
  parameter String Type "Type of AC excitation system model";
  parameter Types.Time T_R "Regulator input filter time constant";
  parameter Types.PerUnit K_PR "Regulator proportional gain";
  parameter Types.PerUnit K_IR "Regulator integral gain";
  parameter Types.PerUnit K_DR "Regulator derivative gain";
  parameter Types.Time T_DR "Regulator derivative block time constant";
  parameter Types.PerUnit K_PA "Voltage regulator proportional gain";
  parameter Types.PerUnit K_IA "Voltage regulator integral gain";
  parameter Types.PerUnit V_AMAX "Maximum regulator output";
  parameter Types.PerUnit V_AMIN "Minimum regulator output";
  parameter Types.PerUnit K_P "Potential circuit gain coefficient";
  parameter Types.Time T_E "Exciter field time constant";
  parameter Types.PerUnit V_FEMAX
    "Maximum exciter field current limit reference";
  parameter Types.PerUnit K_L "Exciter field voltage lower limit parameter";
  parameter Types.PerUnit K_F1 "Rate feedback excitation system gain";
  parameter Types.PerUnit K_F2 "Rate feedback excitation system gain";
  parameter Types.PerUnit K_F3 "Rate feedback excitation system gain";
  parameter Types.Time T_F3 "Rate feedback time constant";
  parameter Types.PerUnit K_C
    "Rectifier loading factor proportional to commutating reactance";
  parameter Types.PerUnit K_D
    "Demagnetizing factor, function of exciter alternator reactances";
  parameter Types.PerUnit K_E "Exciter field proportional constant";
  parameter Types.PerUnit E_1
    "Exciter output voltage for saturation factor S_E(E_1)";
  parameter Types.PerUnit E_2
    "Exciter output voltage for saturation factor S_E(E_2)";
  parameter Types.PerUnit S_EE_1
    "Exciter saturation factor at exciter output voltage E1";
  parameter Types.PerUnit S_EE_2
    "Exciter saturation factor at exciter output voltage E2";
  parameter Types.PerUnit V_RMAX "Maximum exciter field output";
  parameter Types.PerUnit V_RMIN "Minimum exciter field output";
  parameter Types.PerUnit V_EMIN "Minimum exciter voltage output";
end ACxBTemplate;
