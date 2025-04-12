within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords.ESData;
record ESST4BCTG1 "Type ST4B ES for CTG1"
  extends ESSTxBTemplate(
    T_R=0,
    K_PR=40,
    K_IR=9.2,
    V_RMAX=4.5,
    V_RMIN=-4.03,
    T_A=0.02,
    K_PM=1,
    K_IM=0,
    V_MMAX=4.5,
    V_MMIN=-4.03,
    K_G=0,
    K_P=1,
    K_I=0,
    V_BMAX=1.25,
    K_C=0.094,
    X_L=0,
    THETAP=0);
end ESST4BCTG1;
