within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GUnitTest.PfDataSMIB;
package TrafoData "Records with power flow solutions for machines"
  extends Modelica.Icons.RecordsPackage;

  partial record TrafoTemplate
    "Record template for power flow solutions in transformers"

  end TrafoTemplate;

  record PfTrafoCTG1 "Record for power flow solutions in trafos - CTG1"
    extends TrafoTemplate;

  end PfTrafoCTG1;

  record PfTrafoCTG2 "Record for power flow solutions in trafos - CTG2"
    extends TrafoTemplate;

  end PfTrafoCTG2;

  record PfTrafoSTGx "Record for power flow solutions in trafos - STGs 1 and 2"
    extends TrafoTemplate;

  end PfTrafoSTGx;
end TrafoData;
