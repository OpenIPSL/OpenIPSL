within OpenIPSL.DataSets.IEEE421.ES_Data.ST;
record ESST2A_1
  "Type ST2A ES Sample Data (Table H.14 in IEEE Std 421.5-2005 / Table H.27 in IEEE Std 421.5-2016)"
  extends ES_Data.ST.ESSTxA_Template(
    Type = "ESST2A",
    T_R = 0,
    V_IMAX = 99,
    V_IMIN = -99,
    T_C = 1,
    T_B = 10,
    T_C1 = 0,
    T_B1 = 0,
    K_A = 120,
    T_A = 0.15,
    V_AMAX = 99,
    V_AMIN = -99,
    V_RMAX = 1,
    V_RMIN = 0,
    K_C = 0.1,
    K_F = 0.05,
    T_F = 1,
    K_LR = 0,
    I_LR = 0,
    K_P = 4.88,
    K_I = 8,
    K_E = 1,
    T_E = 0.5,
    EFD_MAX = 4.4);
end ESST2A_1;
