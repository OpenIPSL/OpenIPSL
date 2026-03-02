within OpenIPSL.Data.PowerPlant.IEEE421.ESData.DC;
partial record DCxATemplate "Type DCxA Excitation System Data Record Template"
  extends Modelica.Icons.Record;
  parameter String Type "Type of DC excitation system model";
  parameter Types.Time T_R "Regulator input filter time constant";
  parameter Types.PerUnit K_A "Regulator output gain";
  parameter Types.Time T_A "Regulator time constant";
  parameter Types.Time T_B "Regulator denominator (lag) time constant";
  parameter Types.Time T_C "Regulator numerator (lead) time constant";
  parameter Types.PerUnit V_RMAX "Maximum controller output";
  parameter Types.PerUnit V_RMIN "Minimum controller output";
  parameter Types.PerUnit K_E=1 "Exciter field proportional constant";
  parameter Types.Time T_E "Exciter field time constant";
  parameter Types.PerUnit K_F "Rate feedback gain";
  parameter Types.Time T_F1 "Rate feedback time constant";
  parameter Types.PerUnit E_1 "Exciter output voltage for saturation factor S_E(E_1)";
  parameter Types.PerUnit E_2 "Exciter output voltage for saturation factor S_E(E_2)";
  parameter Types.PerUnit S_EE_1 "Exciter saturation factor at exciter output voltage E_1";
  parameter Types.PerUnit S_EE_2 "Exciter saturation factor at exciter output voltage E_2";
  parameter Types.Time T_RH "Rheostat travel time";

end DCxATemplate;
