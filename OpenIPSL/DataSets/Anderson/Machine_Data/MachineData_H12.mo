within OpenIPSL.DataSets.Anderson.Machine_Data;
record MachineData_H12
  extends MachineData_Template(M_b = 125000000,
    V_b = 13800,
    P_f = 0.90,
    SCR = 1.155,
    Xppd=0.205,
    Xpd=0.300,
    Xd=1.050,
    Xppq=0.221,
    Xpq=0.686,
    Xq=0.686,
    R_a=0.0023,
    Xl=0.218,
    Tppd0=Modelica.Constants.small,
    Tpd0=6.170,
    Tppq0=0.080,
    Tpq0=Modelica.Constants.small,
    H=3.13672,
    S10=0.200,
    S12=0.612,
    Efdfl=2.200,
    D=2.000);
end MachineData_H12;
