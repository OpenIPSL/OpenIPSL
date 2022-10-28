within OpenIPSL.DataSets.Anderson.Machine_Data;
record MachineData_H14
  extends MachineData_Template(M_b = 145000000,
    V_b = 14400,
    P_f = 0.90,
    SCR = 1.200,
    Xppd=0.273,
    Xpd=0.312,
    Xd=0.953,
    Xppq=0.402,
    Xpq=0.573,
    Xq=0.573,
    R_a=Modelica.Constants.small,
    Xl=0.280,
    Tppd0=0.041,
    Tpd0=7.070,
    Tppq0=0.071,
    Tpq0=Modelica.Constants.small,
    H=3.2345,
    S10=0.220,
    S12=0.725,
    Efdfl=2.230,
    D=2.000);
end MachineData_H14;
