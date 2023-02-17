within OpenIPSL.DataSets.IEEE421.ES_Data.ST;
record ESST4B_1
  "Type ST4B ES Sample Data (Table H.16 in IEEE Std 421.5-2005 / Table H.31 in IEEE Std 421.5-2016)"
  extends ES_Data.ST.ESSTxB_Template(
    T_R = 0,
    K_PR = 10.75,
    K_IR = 10.75,
    V_RMAX = 1,
    V_RMIN = -0.87,
    T_A = 0.02,
    K_PM = 1,
    K_IM = 0,
    V_MMAX = 99,
    V_MMIN = -99,
    K_G = 0,
    K_P = 9.3,
    K_I = 0,
    V_BMAX = 11.63,
    K_C = 0.113,
    X_L = 0.124,
    THETAP = 0);
end ESST4B_1;
