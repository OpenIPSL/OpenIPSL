within OpenIPSL.DataSets.Anderson.Machine_Data;
record MachineData_F3
  extends MachineData_Template(M_b = 51200000,
    V_b = 13800,
    P_f = 0.80,
    SCR = 0.90,
    Xppd=0.105,
    Xpd=0.209,
    Xd=1.270,
    Xppq=0.116,
    Xpq=0.850,
    Xq=1.240,
    R_a=Modelica.Constants.small,
    Xl=0.108,
    Tppd0=Modelica.Constants.small,
    Tpd0=6.600,
    Tppq0=Modelica.Constants.small,
    Tpq0=Modelica.Constants.small,
    H=5.0781,
    S10=0.2067,
    S12=0.724,
    Efdfl=2.310,
    D=2.000);
end MachineData_F3;
