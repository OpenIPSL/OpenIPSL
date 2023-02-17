within OpenIPSL.DataSets.IEEE421.ES_Data.AC;
record AC7B_2
  "Type AC7B ES Sample Data (Table H.11 in IEEE Std 421.5-2005 / Table H.17 in IEEE Std 421.5-2016)"
  extends ES_Data.AC.ACxB_Template(
    Type = "AC7B",
    T_R = 0,
    K_PR = 170,
    K_IR = 130,
    K_DR = 60,
    T_DR = 0.03,
    K_PA = 1,
    K_IA = 0,
    V_AMAX = 10,
    V_AMIN = 0,
    K_P = 1,
    T_E = 1,
    V_FEMAX = 99,
    K_L = 0,
    K_F1 = 0,
    K_F2 = 0,
    K_F3 = 0,
    T_F3 = 0,
    K_C = 0,
    K_D = 0,
    K_E = 1,
    E_1 = 4.5,
    E_2 = 3.38,
    S_EE_1 = 1.5,
    S_EE_2 = 1.36,
    V_RMAX = 10,
    V_RMIN = 0,
    V_EMIN = -99);
end AC7B_2;
