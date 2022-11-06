within OpenIPSL.DataSets.Anderson.TurbGov_Data;
record TurbGovernorData_H5
  extends TurbGovernorData_Template(GOV = "G",
    R = 0.056,
    P_MAX = 40.00/40,
    T_1 = 0.000,
    T_2 = 0.000,
    T_3 = 0.500,
    T_4 = 0.000,
    T_5 = 0.430,
    F = -2.000);
end TurbGovernorData_H5;
