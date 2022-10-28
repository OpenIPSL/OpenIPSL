within OpenIPSL.DataSets.Anderson.PSS_Data;
record PSSData_H10
  extends PSSData_Template(
                       PSS = "F",
    K_QV = 0.000,
    K_QS = 1.000,
    T_Q = 10.000,
    Tp_Q1 = 0.700,
    T_Q1 = 0.020,
    Tp_Q2 = 0.700,
    T_Q2 = 0.020,
    Tp_Q3 = 0.000,
    T_Q3 = 0.000,
    V_SLIM = 0.050);
end PSSData_H10;
