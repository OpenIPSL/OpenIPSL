within OpenIPSL.DataSets.IEEE421.ES_Data.DC;
record DC3A_2
  "Type DC3A ES Sample Data (Table H.3 in IEEE Std 421.5-2005 / Table H.6 in IEEE Std 421.5-2016)"
  extends ES_Data.DC.DCxA_Template(
    Type="DC3A",
    T_R=0,
    K_A=0,
    T_A=0,
    T_B=0,
    T_C=0,
    V_RMAX=5.7,
    V_RMIN=-1.1,
    K_E=1.0,
    T_E=1.45,
    K_F=0.05,
    T_F1=0,
    E_1=4.5,
    E_2=3.38,
    S_EE_1=0.27,
    S_EE_2=0.07,
    T_RH=20);
end DC3A_2;
