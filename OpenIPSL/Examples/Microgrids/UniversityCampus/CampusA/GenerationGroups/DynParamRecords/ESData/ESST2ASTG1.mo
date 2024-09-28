within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords.ESData;
record ESST2ASTG1 "Type ST2A ES for STG1"
  extends ESSTxATemplate(
    Type = "ESST2A",
    T_R = 0.01,
    V_IMAX = 99,
    V_IMIN = -99,
    T_C = 1,
    T_B = 1,
    T_C1 = 0,
    T_B1 = 0,
    K_A = 240,
    T_A = 0.01,
    V_AMAX = 99,
    V_AMIN = -99,
    V_RMAX = 4.5,
    V_RMIN = -4.5,
    K_C = 0.03,
    K_F = 0.05,
    T_F = 0.7,
    K_LR = 0,
    I_LR = 0,
    K_P = 0.7,
    K_I = 1,
    K_E = 1,
    T_E = 0.5,
    EFD_MAX = 5);
end ESST2ASTG1;
