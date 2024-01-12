within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords.MachineData;
record MachineParsSTG1 "Machine Parameters for STG 1"
  extends MachineDataTemplate(
    M_b=32e6,
    Tpd0=3.42,
    Tppd0=0.034,
    Tppq0=0.086,
    H=2.43,
    D=0,
    Xd=1.819,
    Xq=1.747,
    Xpd=0.3,
    Xppd=0.205,
    Xppq=0.205,
    Xl=0.165,
    S10=0.107,
    S12=0.451,
    R_a=0,
    Xpq=0.574,
    Tpq0=0.32,
    Xpp=Xppd);
end MachineParsSTG1;
