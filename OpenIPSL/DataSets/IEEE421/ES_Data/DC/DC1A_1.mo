within OpenIPSL.DataSets.IEEE421.ES_Data.DC;
record DC1A_1
  "Type DC1A ES Sample Data (Table H.1 in IEEE Std 421.5-2005 / Table H.2 in IEEE Std 421.5-2016)"
  extends ES_Data.DC.DCxA_Template(
    Type="DC1A",
    T_R=0,
    K_A=46.0,
    T_A=0.06,
    T_B=0,
    T_C=0,
    V_RMAX=1.0,
    V_RMIN=-0.9,
    K_E=0,
    T_E=0.46,
    K_F=0.1,
    T_F1=1.0,
    E_1=3.1,
    E_2=2.3,
    S_EE_1=0.33,
    S_EE_2=0.10,
    T_RH=0);
end DC1A_1;
