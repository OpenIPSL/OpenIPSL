within OpenIPSL.DataSets.Anderson.TurbGov_Data;
record TurbGovernorData_CT1G
  extends TurbGovernorData_Template(GOV = "G",
    R = 0.050,
    P_MAX = 17.55,
    T_1 = 0.000,
    T_2 = 0.000,
    T_3 = 0.100,
    T_4 = 0.000,
    T_5 = 0.100,
    F = 0.0);
end TurbGovernorData_CT1G;
