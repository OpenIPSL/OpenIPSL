within OpenIPSL.Data.PowerPlant.Anderson.ESData;
record ExcSystemDataN7
  extends ExcSystemDataTemplate( VR_type = "C",
    IEEE_type = "AC2x",
    Name = "BRLS",
    RR = 2.23,
    T_R = 0.000,
    K_A = 400.000,
    T_A1 = 0.020,
    T_A2 = 0.000,
    V_RMAX = 6.960,
    V_RMIN = -6.960,
    K_E = 1.000,
    T_E = 0.015,
    E_1 = 3.345,
    E_2 = 4.460,
    S_EE_1 = 0.3400,
    S_EE_2 = 0.5600,
    A_ex = 0.0761,
    B_ex = 0.4475,
    Efd_max = 4.460,
    Efd_min = 0.000,
    K_F = 0.040,
    T_F1 = 0.050,
    T_F2 = 0.000);
end ExcSystemDataN7;