within OpenIPSL.DataSets.Anderson.TurbGov_Data;
record TurbGovernorData_F17
  extends TurbGovernorData_Template(GOV = "G",
    R = 0.050,
    P_MAX = 497.00/552,
    T_1 = 0.100,
    T_2 = 0.000,
    T_3 = 0.300,
    T_4 = 0.100,
    T_5 = 10.000,
    F = 0.300);
end TurbGovernorData_F17;
