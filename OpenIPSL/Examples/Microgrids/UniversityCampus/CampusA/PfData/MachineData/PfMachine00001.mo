within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.PfData.MachineData;
record PfMachine00001 "Machine Power for Atila's data"
  extends MachineTemplate(
    PG1=1e06*(-1.649),
    QG1=1e06*(0.015),
    PG2=1e06*(37.36),
    QG2=1e06*(10.91),
    PG3=1e06*(0),
    QG3=1e06*(0),
    PG4=1e06*(0),
    QG4=1e06*(0),
    PG5=1e06*(11.47),
    QG5=1e06*(3.441));

  // MACHINE: '1_1'
  // Bus: AENA'

  // MACHINE: '7_2'
  // Bus: A1W'

  // MACHINE: '9_3'
  // Bus: W1W'

  // MACHINE: '10_4'
  // Bus: W2E'

  // MACHINE: '12_5'
  // Bus: W4S'

end PfMachine00001;
