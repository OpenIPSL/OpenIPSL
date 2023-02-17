within OpenIPSL.DataSets.IEEE421.ES_Data.ST;
record ESST4B_2
  "Type ST4B ES Sample Data (Table H.16 in IEEE Std 421.5-2005 / Table H.32 in IEEE Std 421.5-2016)"
  extends ES_Data.ST.ESSTxB_Template(
    T_R = 0,
    K_PR = 20,
    K_IR = 20,
    V_RMAX = 1,
    V_RMIN = -0.87,
    T_A = 0.02,
    K_PM = 0,
    K_IM = 14.9,
    V_MMAX = 1,
    V_MMIN = -0.87,
    K_G = 1,
    K_P = 5.5,
    K_I = 8.8,
    V_BMAX = 8.54,
    K_C = 1.8,
    X_L = 0,
    THETAP = 0);
end ESST4B_2;
