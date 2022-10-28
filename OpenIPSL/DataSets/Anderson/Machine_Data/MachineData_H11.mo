within OpenIPSL.DataSets.Anderson.Machine_Data;
record MachineData_H11
  extends MachineData_Template(M_b = 115000000,
    V_b = 12500,
    P_f = 0.85,
    SCR = 1.05,
    Xppd=0.250,
    Xpd=0.315,
    Xd=1.060,
    Xppq=0.287,
    Xpq=0.610,
    Xq=0.610,
    R_a=0.0024,
    Xl=0.147,
    Tppd0=0.040,
    Tpd0=8.680,
    Tppq0=0.080,
    Tpq0=Modelica.Constants.small,
    H=3.8174,
    S10=0.178,
    S12=0.592,
    Efdfl=2.200,
    D=2.000);
end MachineData_H11;
