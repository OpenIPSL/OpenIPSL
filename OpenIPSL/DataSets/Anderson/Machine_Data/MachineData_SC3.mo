within OpenIPSL.DataSets.Anderson.Machine_Data;
record MachineData_SC3
  extends MachineData_Template(M_b = 50000000,
    V_b = 12700,
    P_f = 0,
    SCR = 1.004,
    Xppd=0.141,
    Xpd=0.244,
    Xd=1.083,
    Xppq=0.170,
    Xpq=0.720,
    Xq=0.720,
    R_a=Modelica.Constants.small,
    Xl=0.132,
    Tppd0=0.050,
    Tpd0=6.000,
    Tppq0=Modelica.Constants.small,
    Tpq0=0.150,
    H=2.1,
    S10=0.0873,
    S12=0.310,
    Efdfl=2.338,
    D=Modelica.Constants.small);
end MachineData_SC3;
