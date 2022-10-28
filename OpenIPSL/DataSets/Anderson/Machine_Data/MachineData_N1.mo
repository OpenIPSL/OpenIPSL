within OpenIPSL.DataSets.Anderson.Machine_Data;
record MachineData_N1
  extends MachineData_Template(M_b = 76800000,
    V_b = 13800,
    P_f = 0.85,
    SCR = 0.650,
    Xppd=0.190,
    Xpd=0.302,
    Xd=1.660,
    Xppq=0.120,
    Xpq=0.470,
    Xq=1.580,
    R_a=Modelica.Constants.small,
    Xl=0.150,
    Tppd0=0.032,
    Tpd0=4.780,
    Tppq0=Modelica.Constants.small,
    Tpq0=Modelica.Constants.small,
    H=3.668,
    S10=0.0857,
    S12=0.3244,
    Efdfl=2.587,
    D=2.000);
end MachineData_N1;
