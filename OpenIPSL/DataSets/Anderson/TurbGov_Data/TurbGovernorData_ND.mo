within OpenIPSL.DataSets.Anderson.TurbGov_Data;
record TurbGovernorData_ND
  extends TurbGovernorData_Template(GOV = "N",
    R = Modelica.Constants.small,
    P_MAX = Modelica.Constants.small,
    T_1 = Modelica.Constants.small,
    T_2 = Modelica.Constants.small,
    T_3 = Modelica.Constants.small,
    T_4 = Modelica.Constants.small,
    T_5 = Modelica.Constants.small,
    F = Modelica.Constants.small);
end TurbGovernorData_ND;
