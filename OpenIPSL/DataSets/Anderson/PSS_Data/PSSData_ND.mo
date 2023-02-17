within OpenIPSL.DataSets.Anderson.PSS_Data;
record PSSData_ND
  extends PSSData_Template(
                       PSS = "N",
    K_QV = Modelica.Constants.small,
    K_QS = Modelica.Constants.small,
    T_Q = Modelica.Constants.small,
    Tp_Q1 = Modelica.Constants.small,
    T_Q1 = Modelica.Constants.small,
    Tp_Q2 = Modelica.Constants.small,
    T_Q2 = Modelica.Constants.small,
    Tp_Q3 = Modelica.Constants.small,
    T_Q3 = Modelica.Constants.small,
    V_SLIM = Modelica.Constants.small);
end PSSData_ND;
