within OpenIPSL.DataSets.Anderson.Machine_Data;
record MachineData_SC2
  extends MachineData_Template(M_b = 40000000,
    V_b = 13800,
    P_f = 0,
    SCR = 0.558,
    Xppd=0.231,
    Xpd=0.343,
    Xd=2.373,
    Xppq=0.231,
    Xpq=1.172,
    Xq=1.172,
    R_a=Modelica.Constants.small,
    Xl=0.132,
    Tppd0=0.058,
    Tpd0=11.600,
    Tppq0=0.201,
    Tpq0=Modelica.Constants.small,
    H=1.52,
    S10=0.295,
    S12=0.776,
    Efdfl=4.180,
    D=Modelica.Constants.small);
end MachineData_SC2;
