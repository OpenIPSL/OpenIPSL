within OpenIPSL.DataSets.Anderson.Machine_Data;
record MachineData_H5
  extends MachineData_Template(M_b = 40000000,
    V_b = 13800,
    P_f = 0.90,
    SCR = 1.180,
    Xppd=0.288,
    Xpd=0.318,
    Xd=0.990,
    Xppq=0.306,
    Xpq=0.615,
    Xq=0.615,
    R_a=0.0029,
    Xl=0.224,
    Tppd0=Modelica.Constants.small,
    Tpd0=5.300,
    Tppq0=Modelica.Constants.small,
    Tpq0=Modelica.Constants.small,
    H=2.6975,
    S10=0.194,
    S12=0.685,
    Efdfl=2.030,
    D=2.000);
end MachineData_H5;
