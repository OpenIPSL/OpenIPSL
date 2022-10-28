within OpenIPSL.DataSets.Anderson.Machine_Data;
record MachineData_H3
  extends MachineData_Template(M_b = 25000000,
    V_b = 13200,
    P_f = 0.95,
    SCR = 2.280,
    Xppd=0.310,
    Xpd=Modelica.Constants.small,
    Xd=1.020,
    Xppq=0.310,
    Xpq=0.650,
    Xq=0.650,
    R_a=0.0032,
    Xl=0.924,
    Tppd0=Modelica.Constants.small,
    Tpd0=7.2,
    Tppq0=Modelica.Constants.small,
    Tpq0=Modelica.Constants.small,
    H=7.320,
    S10=0.064,
    S12=1.018,
    Efdfl=2.130,
    D=2.000);
end MachineData_H3;
