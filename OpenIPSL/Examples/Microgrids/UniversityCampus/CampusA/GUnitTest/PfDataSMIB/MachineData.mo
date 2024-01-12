within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GUnitTest.PfDataSMIB;
package MachineData "Records with power flow solutions for machines"
  extends Modelica.Icons.RecordsPackage;

  partial record MachineTemplate
    "Record template for power flow solutions in machines"

    parameter OpenIPSL.Types.ActivePower PG1 "machine: generator1"
      annotation (Dialog(enable=false));
    parameter OpenIPSL.Types.ReactivePower QG1 "machine: generator1"
      annotation (Dialog(enable=false));

    parameter OpenIPSL.Types.ActivePower PG2 "machine: generator2"
      annotation (Dialog(enable=false));
    parameter OpenIPSL.Types.ReactivePower QG2 "machine: generator2"
      annotation (Dialog(enable=false));

  end MachineTemplate;

  record PfMachineCTG1 "Record for power flow solutions in machines - CTG1"
    extends MachineTemplate(
      PG1=1e06*(19.999977521718698),
      QG1=1e06*(2.1542711599214925),
      PG2=1e06*(5.004237367929214),
      QG2=1e06*(3.693562535981343));

    // MACHINE: '1_1'
    // Bus: B01'

    // MACHINE: '2_1'
    // Bus: B02'

  end PfMachineCTG1;

  record PfMachineCTG2
    "Record for power flow solutions in machines - CTG2"
    extends MachineTemplate(
      PG1=1e06*(15.999991106518504),
      QG1=1e06*(1.6356356639820249),
      PG2=1e06*(4.002708093375343),
      QG2=1e06*(2.9061282301263702));

    // MACHINE: '1_1'
    // Bus: B01'

    // MACHINE: '2_1'
    // Bus: B02'

  end PfMachineCTG2;

  record PfMachineSTGx
    "Record for power flow solutions in machines - STGs 1 and 2"
    extends MachineTemplate(
      PG1=1e06*(11.999997026332537),
      QG1=1e06*(1.230888590639907),
      PG2=1e06*(4.00156083338845),
      QG2=1e06*(2.2813405568836487));

    // MACHINE: '1_1'
    // Bus: B01'

    // MACHINE: '2_1'
    // Bus: B02'

  end PfMachineSTGx;
end MachineData;
