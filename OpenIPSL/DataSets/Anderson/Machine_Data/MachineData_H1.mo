within OpenIPSL.DataSets.Anderson.Machine_Data;
record MachineData_H1
  extends MachineData_Template(M_b = 9000000,
    V_b = 6900,
    P_f = 0.90,
    SCR = 1.250,
    Xppd=0.329,
    Xpd=0.408,
    Xd=0.911,
    Xppq=0.329,
    Xpq=0.580,
    Xq=0.580,
    R_a=Modelica.Constants.small,
    Xl=Modelica.Constants.small,
    Tppd0=Modelica.Constants.small,
    Tpd0=4.200,
    Tppq0=Modelica.Constants.small,
    Tpq0=Modelica.Constants.small,
    H=2.611,
    S10=0.160,
    S12=0.446,
    Efdfl=2.080,
    D=2.000);
end MachineData_H1;
