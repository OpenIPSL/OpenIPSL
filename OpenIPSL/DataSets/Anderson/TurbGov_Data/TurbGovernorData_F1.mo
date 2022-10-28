within OpenIPSL.DataSets.Anderson.TurbGov_Data;
record TurbGovernorData_F1
  extends TurbGovernorData_Template(GOV = "G",
    R = 0.050,
    P_MAX = 22.50,
    T_1 = 0.200,
    T_2 = 0.000,
    T_3 = 0.300,
    T_4 = 0.090,
    T_5 = 0.000,
    F = 1.000);
end TurbGovernorData_F1;
