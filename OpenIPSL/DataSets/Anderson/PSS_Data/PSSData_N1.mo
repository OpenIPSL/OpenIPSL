within OpenIPSL.DataSets.Anderson.PSS_Data;
record PSSData_N1
  extends PSSData_Template(
                       PSS = "S",
    K_QV = 0.000,
    K_QS = 0.200,
    T_Q = 10.000,
    Tp_Q1 = 1.330,
    T_Q1 = 0.020,
    Tp_Q2 = 1.330,
    T_Q2 = 0.020,
    Tp_Q3 = 0.000,
    T_Q3 = 0.000,
    V_SLIM = 0.100);
end PSSData_N1;
