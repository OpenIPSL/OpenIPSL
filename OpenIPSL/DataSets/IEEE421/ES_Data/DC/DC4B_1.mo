within OpenIPSL.DataSets.IEEE421.ES_Data.DC;
record DC4B_1
  "Type DC4B ES Sample Data (Table H.4 in IEEE Std 421.5-2005 / Table H.7 in IEEE Std 421.5-2016)"
  extends ES_Data.DC.DCxB_Template(
    Type="DC4B",
    K_P=80,
    K_I=20,
    K_D=20,
    T_D=0.01,
    T_R=0,
    K_A=1,
    T_A=0.2,
    T_B=0,
    T_C=0,
    V_RMAX=2.7,
    V_RMIN=0,
    K_E=1.0,
    T_E=0.8,
    K_F=0,
    T_F1=0,
    E_1=1.75,
    E_2=2.33,
    S_EE_1=0.08,
    S_EE_2=0.27,
    T_RH=0);
end DC4B_1;
