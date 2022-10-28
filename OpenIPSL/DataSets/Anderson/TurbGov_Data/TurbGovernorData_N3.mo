within OpenIPSL.DataSets.Anderson.TurbGov_Data;
record TurbGovernorData_N3
  extends TurbGovernorData_Template(GOV = "G",
    R = 0.050,
    P_MAX = 450.00,
    T_1 = 0.250,
    T_2 = 0.000,
    T_3 = 0.000,
    T_4 = 0.300,
    T_5 = 5.000,
    F = 0.320);
end TurbGovernorData_N3;
