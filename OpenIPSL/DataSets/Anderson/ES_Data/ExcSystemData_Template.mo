within OpenIPSL.DataSets.Anderson.ES_Data;
partial record ExcSystemData_Template "Excitation System Data"
  parameter String VR_type "Excitation system type";
  parameter String IEEE_type "Similar to this IEEE type";
  parameter String Name "Excitation system name";
  parameter Real RR "Exciter response ratio";
  parameter OpenIPSL.Types.Time T_R "Regulator input filter time constant";
  parameter OpenIPSL.Types.PerUnit K_A "Regulator gain or fast raise-lower contact setting";
  parameter OpenIPSL.Types.Time T_A1 "Regulator time constant 1";
  parameter OpenIPSL.Types.Time T_A2 "Regulator time constant 2";
  parameter OpenIPSL.Types.PerUnit V_RMAX "Maximum regulator output";
  parameter OpenIPSL.Types.PerUnit V_RMIN "Minimum regulator output";
  parameter OpenIPSL.Types.PerUnit K_E "Exciter self-excitation at full load field voltage";
  parameter OpenIPSL.Types.Time T_E "Exciter time constant";
  parameter OpenIPSL.Types.PerUnit E_1 "Exciter output voltage for saturation factor S_E(E_1)";
  parameter OpenIPSL.Types.PerUnit E_2 "Exciter output voltage for saturation factor S_E(E_2)";
  parameter OpenIPSL.Types.PerUnit S_EE_1 "Exciter saturation factor at exciter output voltage E1";
  parameter OpenIPSL.Types.PerUnit S_EE_2 "Exciter saturation factor at exciter output voltage E2";
  parameter OpenIPSL.Types.PerUnit A_ex "Derived saturation constant for rotating exciters";
  parameter OpenIPSL.Types.PerUnit B_ex "Derived saturation constant for rotating exciters";
  parameter OpenIPSL.Types.PerUnit Efd_max "Maximum field voltage or ceiling voltage";
  parameter OpenIPSL.Types.PerUnit Efd_min "Minimum field voltage or ceiling voltage";
  parameter OpenIPSL.Types.PerUnit K_F "Regulator stabilizing circuit gain";
  parameter OpenIPSL.Types.Time T_F1 "Regulator stabilizing circuit time constant 1";
  parameter OpenIPSL.Types.Time T_F2 "Regulator stabilizing circuit time constant 2";

end ExcSystemData_Template;
