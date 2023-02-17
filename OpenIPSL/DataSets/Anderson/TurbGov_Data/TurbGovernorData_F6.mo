within OpenIPSL.DataSets.Anderson.TurbGov_Data;
record TurbGovernorData_F6
  extends TurbGovernorData_Template(GOV = "G",
    R = 0.050,
    P_MAX = 132.00/125,
    T_1 = 0.083,
    T_2 = 0.000,
    T_3 = 0.200,
    T_4 = 0.050,
    T_5 = 5.000,
    F = 0.280);
end TurbGovernorData_F6;
