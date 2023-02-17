within OpenIPSL.DataSets.IEEE421.ES_Data.DC;
record DC2A_1
  "Type DC2A ES Sample Data (Table H.2.1 in IEEE Std 421.5-2005 / Table H.4 in IEEE Std 421.5-2016)"
  extends ES_Data.DC.DCxA_Template(
    Type="DC2A",
    T_R=0,
    K_A=300.0,
    T_A=0.01,
    T_B=0,
    T_C=0,
    V_RMAX=4.95,
    V_RMIN=-4.9,
    K_E=1.0,
    T_E=1.33,
    K_F=0.02,
    T_F1=0.675,
    E_1=3.05,
    E_2=2.29,
    S_EE_1=0.279,
    S_EE_2=0.117,
    T_RH=0);
end DC2A_1;
