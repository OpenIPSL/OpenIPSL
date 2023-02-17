within OpenIPSL.DataSets.Anderson.TurbGov_Data;
record TurbGovernorData_H6
  extends TurbGovernorData_Template(GOV = "G",
    R = 0.050,
    P_MAX = 52.50/54,
    T_1 = 0.000,
    T_2 = 0.000,
    T_3 = 0.000,
    T_4 = 0.000,
    T_5 = 0.785,
    F = -2.000);
end TurbGovernorData_H6;
