within OpenIPSL.DataSets.Anderson.TurbGov_Data;
record TurbGovernorData_CF4_LP
  extends TurbGovernorData_Template(GOV = "G",
    R = 0.050,
    P_MAX = 339.00/375,
    T_1 = 0.100,
    T_2 = 0.000,
    T_3 = 0.200,
    T_4 = 0.100,
    T_5 = 8.720,
    F = 0.000);
end TurbGovernorData_CF4_LP;
