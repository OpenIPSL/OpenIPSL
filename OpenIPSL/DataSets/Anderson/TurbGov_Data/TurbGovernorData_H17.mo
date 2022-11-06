within OpenIPSL.DataSets.Anderson.TurbGov_Data;
record TurbGovernorData_H17
  extends TurbGovernorData_Template(GOV = "G",
    R = 0.050,
    P_MAX = 250.00/250,
    T_1 = 30.000,
    T_2 = 3.500,
    T_3 = 0.520,
    T_4 = 0.000,
    T_5 = 0.415,
    F = -2.000);
end TurbGovernorData_H17;
