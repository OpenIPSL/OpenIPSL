within OpenIPSL.DataSets.IEEE421.ES_Data.DC;
record DC3A_1
  "Type DC3A ES Sample Data (Table H.3 in IEEE Std 421.5-2005 / Table H.6 in IEEE Std 421.5-2016)"
  extends ES_Data.DC.DCxA_Template(
    Type="DC3A",
    T_R=0,
    K_A=0,
    T_A=0,
    T_B=0,
    T_C=0,
    V_RMAX=1.0,
    V_RMIN=0.0,
    K_E=0.05,
    T_E=0.5,
    K_F=0.05,
    T_F1=0,
    E_1=3.375,
    E_2=3.15,
    S_EE_1=0.267,
    S_EE_2=0.068,
    T_RH=20);
end DC3A_1;
