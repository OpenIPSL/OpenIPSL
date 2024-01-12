within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords.MachineData;
record MachineParsSTG2 "Machine Parameters for STG 2"
  extends MachineDataTemplate(
    M_b=32000000,
    Tpd0=6.124,
    Tppd0=0.047,
    Tppq0=0.086,
    H=2.43,
    D=0,
    Xd=2.1,
    Xq=1.9,
    Xpd=0.217,
    Xppd=0.155,
    Xppq=0.155,
    Xl=0.099,
    S10=0.153,
    S12=0.899,
    R_a=0,
    Xpq=0.574,
    Tpq0=0.32,
    Xpp=Xppd);
end MachineParsSTG2;
