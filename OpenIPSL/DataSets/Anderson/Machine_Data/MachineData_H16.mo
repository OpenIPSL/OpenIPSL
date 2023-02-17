within OpenIPSL.DataSets.Anderson.Machine_Data;
record MachineData_H16
  extends MachineData_Template(M_b = 231600000,
    V_b = 13800,
    P_f = 0.95,
    SCR = 1.175,
    Xppd=0.245,
    Xpd=0.302,
    Xd=0.930,
    Xppq=0.270,
    Xpq=Modelica.Constants.small,
    Xq=0.690,
    R_a=0.0021,
    Xl=0.340,
    Tppd0=0.030,
    Tpd0=8.000,
    Tppq0=0.060,
    Tpq0=Modelica.Constants.small,
    H=3.3838,
    S10=0.120,
    S12=0.400,
    Efdfl=1.850,
    D=2.000);
end MachineData_H16;
