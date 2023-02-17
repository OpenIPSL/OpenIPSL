within OpenIPSL.DataSets.IEEE421.ES_Data.AC;
record AC8B_1
  "Type AC8B ES Sample Data (Table H.12 in IEEE Std 421.5-2005 / Table H.18 in IEEE Std 421.5-2016)"
  extends ES_Data.AC.ACxB_Template(
    Type = "AC8B",
    T_R = 0,
    K_PR = 80,
    K_IR = 5,
    K_DR = 10,
    T_DR = 0.02,
    K_PA = 0,
    K_IA = 0,
    V_AMAX = 99,
    V_AMIN = -99,
    K_P = 1,
    T_E = 1.2,
    V_FEMAX = 6,
    K_L = 0,
    K_F1 = 0,
    K_F2 = 0,
    K_F3 = 0,
    T_F3 = 0,
    K_C = 0.55,
    K_D = 1.1,
    K_E = 1,
    E_1 = 9,
    E_2 = 6.5,
    S_EE_1 = 3,
    S_EE_2 = 0.3,
    V_RMAX = 35,
    V_RMIN = 0,
    V_EMIN = -99);
end AC8B_1;
