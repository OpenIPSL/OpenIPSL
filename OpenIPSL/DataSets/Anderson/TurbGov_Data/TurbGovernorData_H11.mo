within OpenIPSL.DataSets.Anderson.TurbGov_Data;
record TurbGovernorData_H11
  extends TurbGovernorData_Template(GOV = "G",
    R = 0.051,
    P_MAX = 115.00/115,
    T_1 = Modelica.Constants.small,
    T_2 = Modelica.Constants.small,
    T_3 = Modelica.Constants.small,
    T_4 = Modelica.Constants.small,
    T_5 = Modelica.Constants.small,
    F = -2.000);
end TurbGovernorData_H11;
