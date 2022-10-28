within OpenIPSL.DataSets.IEEE421.Machine_Data;
record Machine_1 "Synchronous Generator Sample Data Set (Table H.1 in IEEE Std 421.5-2016)"
  extends MachineData_Template(
    M_b = 100e6,
    Tpd0 = 6.35,
    Tppd0 = 0.06,
    Tppq0 = 0.077,
    H = 3.25,
    D = 0,
    Xd = 1.071,
    Xq = 0.704,
    Xpd = 0.351,
    Xppd = 0.296,
    Xppq = 0.296,
    Xl = 0.154,
    S10 = 0.07,
    S12 = 0.203,
    R_a = 0.004);
end Machine_1;
