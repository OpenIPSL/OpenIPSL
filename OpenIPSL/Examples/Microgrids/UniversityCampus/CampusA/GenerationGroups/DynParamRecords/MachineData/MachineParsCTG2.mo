within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords.MachineData;
record MachineParsCTG2 "Machine Parameters for CTG 2"
  extends MachineDataTemplate(
    M_b=40470000,
    Tpd0=8.3,
    Tppd0=0.05,
    Tppq0=0.05,
    H=1.486,
    D=0,
    Xd=2.34,
    Xq=2.14,
    Xpd=0.293,
    Xppd=0.206,
    Xppq=0.206,
    Xl=0.133,
    S10=1.08,
    S12=1.770,
    R_a=0,
    Xpq=0.35,
    Tpq0=2.5,
    Xpp=Xppd);
end MachineParsCTG2;
