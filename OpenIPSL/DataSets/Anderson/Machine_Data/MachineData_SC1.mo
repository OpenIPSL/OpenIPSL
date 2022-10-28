within OpenIPSL.DataSets.Anderson.Machine_Data;
record MachineData_SC1
  extends MachineData_Template(M_b = 26000000,
    V_b = 13800,
    P_f = 0,
    SCR = Modelica.Constants.small,
    Xppd=0.2035,
    Xpd=0.304,
    Xd=1.769,
    Xppq=0.199,
    Xpq=0.5795,
    Xq=0.855,
    R_a=0.0025,
    Xl=0.1045,
    Tppd0=0.0525,
    Tpd0=8.000,
    Tppq0=0.0151,
    Tpq0=Modelica.Constants.small,
    H=1.2,
    S10=0.304,
    S12=0.666,
    Efdfl=3.560,
    D=Modelica.Constants.small);
end MachineData_SC1;
