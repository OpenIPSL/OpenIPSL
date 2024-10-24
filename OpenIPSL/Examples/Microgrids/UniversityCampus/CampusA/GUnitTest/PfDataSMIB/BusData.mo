within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GUnitTest.PfDataSMIB;
package BusData "Records with power flow solutions for buses"
  extends Modelica.Icons.RecordsPackage;

  partial record BusTemplate "Record template for power flow solutions in buses"

    parameter OpenIPSL.Types.PerUnit v1 "FAULT"
      annotation (Dialog(enable=false));
    parameter OpenIPSL.Types.Angle A1 "FAULT" annotation (Dialog(enable=false));

    parameter OpenIPSL.Types.PerUnit v2 "GEN1"
      annotation (Dialog(enable=false));
    parameter OpenIPSL.Types.Angle A2 "GEN1" annotation (Dialog(enable=false));

    parameter OpenIPSL.Types.PerUnit v3 "GEN2"
      annotation (Dialog(enable=false));
    parameter OpenIPSL.Types.Angle A3 "GEN2" annotation (Dialog(enable=false));

    parameter OpenIPSL.Types.PerUnit v4 "LOAD"
      annotation (Dialog(enable=false));
    parameter OpenIPSL.Types.Angle A4 "LOAD" annotation (Dialog(enable=false));

    parameter OpenIPSL.Types.PerUnit v5 "SHUNT"
      annotation (Dialog(enable=false));
    parameter OpenIPSL.Types.Angle A5 "SHUNT" annotation (Dialog(enable=false));

  end BusTemplate;

  record PfBusCTG1 "Record for power flow solutions in buses - CTG1"
    extends BusTemplate(
      v1=1.000000000000,
      A1=0.0351335730883302,
      v2=1.000000000000,
      A2=0.000000000000,
      v3=0.9962938904832637,
      A3=-0.00500433127679407,
      v4=0.9981438211590149,
      A4=-0.00249752321899275,
      v5=0.9981438211590149,
      A5=-0.00249752321899275);

    // Bus: 'B01' (PV bus)

    // Bus: 'B02' (slack bus)

    // Bus: 'B03' (PQ bus)

    // Bus: 'B04' (PQ bus)

    // Bus: 'B05' (PQ bus)

  end PfBusCTG1;

  record PfBusCTG2 "Record for power flow solutions in buses - CTG2"
    extends BusTemplate(
      v1=1.000000000000,
      A1=0.028082878029775,
      v2=1.000000000000,
      A2=0.000000000000,
      v3=0.9970818338868578,
      A3=-0.00399985804022414,
      v4=0.9985389202207743,
      A4=-0.00199700783930364,
      v5=0.9985389202207743,
      A5=-0.00199700783930364);

    // Bus: 'B01' (PV bus)

    // Bus: 'B02' (slack bus)

    // Bus: 'B03' (PQ bus)

    // Bus: 'B04' (PQ bus)

    // Bus: 'B05' (PQ bus)

  end PfBusCTG2;

  record PfBusSTGx
    "Record for power flow solutions in buses - STGs 1 and 2"
    extends BusTemplate(
      v1=0.9999999999999999,
      A1=0.0200458055147281,
      v2=1.000000000000,
      A2=0.000000000000,
      v3=0.9977066303828163,
      A3=-0.00399933569283056,
      v4=0.9988513182764066,
      A4=-0.00199737273742058,
      v5=0.9988513182764066,
      A5=-0.00199737273742058);

    // Bus: 'B01' (PV bus)

    // Bus: 'B02' (slack bus)

    // Bus: 'B03' (PQ bus)

    // Bus: 'B04' (PQ bus)

    // Bus: 'B05' (PQ bus)

  end PfBusSTGx;
end BusData;
