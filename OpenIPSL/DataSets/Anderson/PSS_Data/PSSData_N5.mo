within OpenIPSL.DataSets.Anderson.PSS_Data;
record PSSData_N5
  extends PSSData_Template(
                       PSS = "F",
    K_QV = 0.000,
    K_QS = 10.000,
    T_Q = 10.000,
    Tp_Q1 = 0.080,
    T_Q1 = 0.020,
    Tp_Q2 = 0.080,
    T_Q2 = 0.020,
    Tp_Q3 = 0.000,
    T_Q3 = 0.000,
    V_SLIM = 0.100);
end PSSData_N5;
