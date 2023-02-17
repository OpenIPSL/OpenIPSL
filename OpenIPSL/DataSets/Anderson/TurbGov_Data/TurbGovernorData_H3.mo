within OpenIPSL.DataSets.Anderson.TurbGov_Data;
record TurbGovernorData_H3
  extends TurbGovernorData_Template(GOV = "G",
    R = 0.050,
    P_MAX = 23.80/25,
    T_1 = 16.000,
    T_2 = 2.400,
    T_3 = 0.920,
    T_4 = 0.000,
    T_5 = 0.300,
    F = -2.000);
end TurbGovernorData_H3;
