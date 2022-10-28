within OpenIPSL.DataSets.Anderson.TurbGov_Data;
record TurbGovernorData_CF1_LP
  extends TurbGovernorData_Template(GOV = "G",
    R = 0.050,
    P_MAX = 107.50,
    T_1 = 0.100,
    T_2 = 0.000,
    T_3 = 0.150,
    T_4 = 0.300,
    T_5 = 10.000,
    F = 0.000);
end TurbGovernorData_CF1_LP;
