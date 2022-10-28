within OpenIPSL.DataSets.Anderson.Machine_Data;
record MachineData_F16
  extends MachineData_Template(M_b = 512000000,
    V_b = 24000,
    P_f = 0.90,
    SCR = 0.580,
    Xppd=0.200,
    Xpd=0.270,
    Xd=1.700,
    Xppq=0.200,
    Xpq=0.470,
    Xq=1.650,
    R_a=0.004,
    Xl=0.160,
    Tppd0=Modelica.Constants.small,
    Tpd0=3.800,
    Tppq0=Modelica.Constants.small,
    Tpq0=0.480,
    H=2.6312,
    S10=0.090,
    S12=0.400,
    Efdfl=2.700,
    D=2.000);
end MachineData_F16;
