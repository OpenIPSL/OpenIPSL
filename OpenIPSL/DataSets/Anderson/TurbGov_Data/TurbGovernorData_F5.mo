within OpenIPSL.DataSets.Anderson.TurbGov_Data;
record TurbGovernorData_F5
  extends TurbGovernorData_Template(GOV = "G",
    R = 0.050,
    P_MAX = 105.00,
    T_1 = 0.090,
    T_2 = 0.000,
    T_3 = 0.200,
    T_4 = 0.300,
    T_5 = 0.000,
    F = 1.000);
end TurbGovernorData_F5;
