within OpenIPSL.Data.PowerPlant.IEEE421.ESData.AC;
partial record ACxATemplate "Type AC-A Excitation System Data"
  extends Modelica.Icons.Record;
  parameter String Type "Type of AC excitation system model";
  parameter Types.Time T_R "Regulator input filter time constant";
  parameter Types.Time T_B "Regulator denominator (lag) time constant";
  parameter Types.Time T_C "Regulator numerator (lead) time constant";
  parameter Types.PerUnit K_A "Regulator output gain";
  parameter Types.Time T_A "Regulator output time constant";
  parameter Types.PerUnit V_AMAX "Maximum regulator output";
  parameter Types.PerUnit V_AMIN "Minimum regulator output";
  parameter Types.PerUnit K_B "Second stage regulator gain";
  parameter Types.Time T_E "Exciter field time constant";
  parameter Types.PerUnit V_FEMAX "Maximum exciter field current limit reference";
  parameter Types.PerUnit K_H "Exciter field current regulator feedback gain";
  parameter Types.PerUnit K_F "Rate feedback excitation system gain";
  parameter Types.Time T_F "Rate feedback time const";
  parameter Types.PerUnit K_C "Rectifier loading factor proportional to commutating reactance";
  parameter Types.PerUnit K_D "Demagnetizing factor, function of exciter alternator reactances";
  parameter Types.PerUnit K_E "Exciter field proportional constant";
  parameter Types.PerUnit E_1 "Exciter output voltage for saturation factor S_E(E_1)";
  parameter Types.PerUnit E_2 "Exciter output voltage for saturation factor S_E(E_2)";
  parameter Types.PerUnit S_EE_1 "Exciter saturation factor at exciter output voltage E1";
  parameter Types.PerUnit S_EE_2 "Exciter saturation factor at exciter output voltage E2";
  parameter Types.PerUnit V_RMAX "Maximum exciter field output";
  parameter Types.PerUnit V_RMIN "Minimum exciter field output";

end ACxATemplate;
