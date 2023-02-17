within OpenIPSL.DataSets.Anderson.TurbGov_Data;
record TurbGovernorData_H7
  extends TurbGovernorData_Template(GOV = "G",
    R = 0.050,
    P_MAX = 65.50/65.79,
    T_1 = 25.600,
    T_2 = 2.800,
    T_3 = 0.500,
    T_4 = 0.000,
    T_5 = 0.350,
    F = -2.000);
end TurbGovernorData_H7;
