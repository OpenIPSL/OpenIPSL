within OpenIPSL.DataSets.IEEE421.PSS_Data;
record PSS2B_2
  "PSS2B Data for Type ST1A Sample Data (Table H.13 in IEEE Std 421.5-2005 / Table H.24 in IEEE Std 421.5-2016)"
  extends PSS_Data.PSS2B_Template(
    T_w1 = 10,
    T_w2 = 10,
    T_6 = 0,
    T_w3 = 10,
    T_w4 = 0,
    T_7 = 10,
    K_S2 = 1.13,
    K_S3 = 1,
    T_8 = 0.3,
    T_9 = 0.15,
    K_S1 = 20,
    T_1 = 0.16,
    T_2 = 0.02,
    T_3 = 0.16,
    T_4 = 0.02,
    T_10 = 0,
    T_11 = 0,
    V_S1MAX = 2,
    V_S1MIN = -2,
    V_S2MAX = 2,
    V_S2MIN = -2,
    V_STMAX = 0.2,
    V_STMIN = -0.066,
    M = 2,
    N = 4);
end PSS2B_2;
