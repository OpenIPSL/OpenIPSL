within OpenIPSL.DataSets.Anderson.TurbGov_Data;
record TurbGovernorData_H18
  extends TurbGovernorData_Template(GOV = "G",
    R = 0.050,
    P_MAX = 603.30/615,
    T_1 = 36.000,
    T_2 = 6.000,
    T_3 = 0.000,
    T_4 = 0.000,
    T_5 = 0.900,
    F = -2.000);
end TurbGovernorData_H18;
