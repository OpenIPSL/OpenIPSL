within OpenIPSL.DataSets.IEEE421.ES_Data.ST;
record ESST1A_2
  "Type ST1A ES Sample Data (Table H.13 in IEEE Std 421.5-2005 / Table H.25 in IEEE Std 421.5-2016)"
  extends ES_Data.ST.ESSTxA_Template(
    Type = "ESST1A",
    T_R = 0.04,
    V_IMAX = 99,
    V_IMIN = -99,
    T_C = 1,
    T_B = 10,
    T_C1 = 0,
    T_B1 = 0,
    K_A = 190,
    T_A = 0,
    V_AMAX = 6.43,
    V_AMIN = -6,
    V_RMAX = 7.8,
    V_RMIN = -6.7,
    K_C = 0,
    K_F = 0,
    T_F = 1,
    K_LR = 4.54,
    I_LR = 4.4,
    K_P = 0,
    K_I = 0,
    K_E = 0,
    T_E = 0,
    EFD_MAX = 99);
end ESST1A_2;
