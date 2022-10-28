within OpenIPSL.DataSets.IEEE421.ES_Data.AC;
record AC1A_1
  "Type AC1A ES Sample Data (Table H.5 in IEEE Std 421.5-2005 / Table H.8 in IEEE Std 421.5-2016)"
  extends ES_Data.AC.ACxA_Template(
    Type = "AC1A",
    T_R = 0,
    T_B = 0,
    T_C = 0,
    K_A = 400,
    T_A = 0.02,
    V_AMAX = 14.5,
    V_AMIN = -14.5,
    K_B = 0,
    T_E = 0.8,
    V_FEMAX = 999,
    K_H = 0,
    K_F = 0.03,
    T_F = 1.0,
    K_C = 0.2,
    K_D = 0.38,
    K_E = 1.0,
    E_1 = 4.18,
    E_2 = 3.14,
    S_EE_1 = 0.1,
    S_EE_2 = 0.03,
    V_RMAX = 6.03,
    V_RMIN = -5.43);
end AC1A_1;
