within OpenIPSL.DataSets.IEEE421.PSS_Data;
record PSS2B_3
  "PSS2B Data for Type ST4B Sample Data (Table H.16 in IEEE Std 421.5-2005)"
  extends PSS_Data.PSS2B_Template(
    T_w1 = 10,
    T_w2 = 10,
    T_6 = 0,
    T_w3 = 10,
    T_w4 = 0,
    T_7 = 10,
    K_S2 = 0.99,
    K_S3 = 1,
    T_8 = 0.5,
    T_9 = 0.1,
    K_S1 = 20,
    T_1 = 0.15,
    T_2 = 0.025,
    T_3 = 0.15,
    T_4 = 0.02,
    T_10 = 0,
    T_11 = 0.033,
    V_S1MAX = 2,
    V_S1MIN = -2,
    V_S2MAX = 2,
    V_S2MIN = -2,
    V_STMAX = 0.1,
    V_STMIN = -0.1,
    M = 5,
    N = 1);
end PSS2B_3;
