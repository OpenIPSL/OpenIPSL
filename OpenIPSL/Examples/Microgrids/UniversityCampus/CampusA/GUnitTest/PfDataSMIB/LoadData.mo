within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GUnitTest.PfDataSMIB;
package LoadData "Records with power flow solutions for loads"
  extends Modelica.Icons.RecordsPackage;

  partial record LoadTemplate
    "Record template for power flow solutions in loads"

    parameter OpenIPSL.Types.ActivePower PL1 "Load: constantLoad"
      annotation (Dialog(enable=false));
    parameter OpenIPSL.Types.ReactivePower QL1 "Load: constantLoad"
      annotation (Dialog(enable=false));

  end LoadTemplate;

  record PfLoadCTG1 "Record for power flow solutions in loads - CTG1"
    extends LoadTemplate(  PL1=1e06*(24.999963726394313), QL1=1e06*(4.999871114142722));

    // Load: '3_1'

  end PfLoadCTG1;

  record PfLoadCTG2 "Record for power flow solutions in loads - CTG2"
    extends LoadTemplate(  PL1=1e06*(19.99998553308777), QL1=1e06*(3.999947489386742));

    // Load: '3_1'

  end PfLoadCTG2;

  record PfLoadSTGx
    "Record for power flow solutions in loads - STGs 1 and 2"
    extends LoadTemplate(  PL1=1e06*(15.999994571217577), QL1=1e06*(3.1999826291098503));

    // Load: '3_1'

  end PfLoadSTGx;
end LoadData;
