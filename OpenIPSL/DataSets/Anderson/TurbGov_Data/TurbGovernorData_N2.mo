within OpenIPSL.DataSets.Anderson.TurbGov_Data;
record TurbGovernorData_N2
  extends TurbGovernorData_Template(GOV = "G",
    R = 0.050,
    P_MAX = 208.675,
    T_1 = Modelica.Constants.small,
    T_2 = Modelica.Constants.small,
    T_3 = Modelica.Constants.small,
    T_4 = Modelica.Constants.small,
    T_5 = Modelica.Constants.small,
    F = Modelica.Constants.small);
end TurbGovernorData_N2;
