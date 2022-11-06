within OpenIPSL.DataSets.Anderson.TurbGov_Data;
record TurbGovernorData_F19
  extends TurbGovernorData_Template(GOV = "G",
    R = 0.050,
    P_MAX = 766.29/835,
    T_1 = 0.180,
    T_2 = 0.030,
    T_3 = 0.200,
    T_4 = 0.000,
    T_5 = 8.000,
    F = 0.300);
end TurbGovernorData_F19;
