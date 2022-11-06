within OpenIPSL.DataSets.Anderson.TurbGov_Data;
record TurbGovernorData_CT1O
  extends TurbGovernorData_Template(GOV = "G",
    R = 0.050,
    P_MAX = 17.55/20.65,
    T_1 = 0.000,
    T_2 = 0.000,
    T_3 = 0.025,
    T_4 = 0.000,
    T_5 = 0.025,
    F = 0.5);
end TurbGovernorData_CT1O;
