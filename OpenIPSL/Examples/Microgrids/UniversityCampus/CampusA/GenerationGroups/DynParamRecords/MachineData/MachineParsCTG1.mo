within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords.MachineData;
record MachineParsCTG1 "Machine Parameters for CTG 1"
  extends MachineDataTemplate(
    M_b=53900000,
    Tpd0=6.01,
    Tppd0=0.06,
    Tppq0=0.098,
    H=1.5,
    D=0,
    Xd=2.328,
    Xq=2.26,
    Xpd=0.267,
    Xppd=0.185,
    Xppq=0.185,
    Xl=0.16,
    S10=0.1210,
    S12=0.4210,
    R_a=0,
    Xpq=0.58,
    Tpq0=0.67,
    Xpp=Xppd);

end MachineParsCTG1;
