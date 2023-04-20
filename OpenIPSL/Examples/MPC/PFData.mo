within OpenIPSL.Examples.MPC;
package PFData
  record PowerFlowTemplate "Template Record for Power Flow Results"
    extends Modelica.Icons.Record;

    annotation (Documentation(info="<html>
<p>Template Record for Power Flow Results.</p>
</html>"));
  end PowerFlowTemplate;

  record PowerFlow "Record containing replaceable record with power flow results"
    extends Modelica.Icons.Record;

    replaceable record PowerFlow =
        PowerFlowTemplate constrainedby PowerFlowTemplate "Replaceable power flow record"
                                                    annotation (
        choicesAllMatching);

    PowerFlow powerflow;

    annotation (Documentation(info="<html>
<p>Instantiable record containing the replaceable record with power flow results.</p>
</html>"));
  end PowerFlow;

  extends Modelica.Icons.RecordsPackage;

  package BusData
    extends Modelica.Icons.RecordsPackage;

    partial record BusTemplate "Record template for power flow solutions in buses"

      parameter OpenIPSL.Types.PerUnit V1 "Voltage magnitude at G1"
        annotation (Dialog(enable=false));
      parameter OpenIPSL.Types.Angle A1 "Voltage angle at G1" annotation (Dialog(enable=false));

      parameter OpenIPSL.Types.PerUnit V2 "Voltage magnitude at bus 2"
        annotation (Dialog(enable=false));
      parameter OpenIPSL.Types.Angle A2 "Voltage angle at bus 2" annotation (Dialog(enable=false));

      parameter OpenIPSL.Types.PerUnit V3 "Voltage magnitude at bus 3"
        annotation (Dialog(enable=false));
      parameter OpenIPSL.Types.Angle A3 "Voltage angle at bus 3" annotation (Dialog(enable=false));

      parameter OpenIPSL.Types.PerUnit V4 "Voltage magnitude at bus 4"
        annotation (Dialog(enable=false));
      parameter OpenIPSL.Types.Angle A4 "Voltage angle at bus 4" annotation (Dialog(enable=false));

      parameter OpenIPSL.Types.PerUnit V5 "Voltage magnitude at bus 5"
        annotation (Dialog(enable=false));
      parameter OpenIPSL.Types.Angle A5 "Voltage angle at bus 5" annotation (Dialog(enable=false));
     parameter OpenIPSL.Types.PerUnit V6 "Voltage magnitude at G2"
        annotation (Dialog(enable=false));
      parameter OpenIPSL.Types.Angle A6 "Voltage angle at G2" annotation (Dialog(enable=false));

    end BusTemplate;

    record PFBus01
      "Record for power flow solutions in buses - Microgrid Load = 5 MW"
      import Modelica.Constants.pi;
      extends BusTemplate(
      V1 = 1.0000,
      V2 = 0.9903815,
      V3 = 0.9927449,
      V4 = 1.0000,
      V5 = 0.9978245,
      V6 = 1.0000,
      A1 = 12.69018*pi/180,
      A2 = 6.426857*pi/180,
      A3 = 0.117574*pi/180,
      A4 = 0*pi/180,
      A5 = -0.4589332*pi/180,
      A6 = -0.1773913*pi/180);

        // Voltage Magnitudes

      // Angle

      // Bus: 'B01' (PV bus)

      // Bus: 'B02' (slack bus)

      // Bus: 'B03' (PQ bus)

      // Bus: 'B04' (PQ bus)

      // Bus: 'B05' (PQ bus)

    end PFBus01;

    record PFBus02
      "Record for power flow solutions in buses - Microgrid Load = 10 MW"
      import Modelica.Constants.pi;
      extends BusTemplate(
      V1 = 1.0000,
      V2 = 0.9910569,
      V3 = 0.9929926,
      V4 = 1.0000,
      V5 = 0.997748,
      V6 = 0.9999999,
      A1 = 12.02401*pi/180,
      A2 = 6.055835*pi/180,
      A3 = 0.04538411*pi/180,
      A4 = 0*pi/180,
      A5 = -0.1719799*pi/180,
      A6 = 0.2532443*pi/180);

        // Voltage Magnitudes

      // Angle

      // Bus: 'B01' (PV bus)

      // Bus: 'B02' (slack bus)

      // Bus: 'B03' (PQ bus)

      // Bus: 'B04' (PQ bus)

      // Bus: 'B05' (PQ bus)

    end PFBus02;

    record PFBus03
      "Record for power flow solutions in buses - Microgrid Load = 10 MW"
      import Modelica.Constants.pi;
      extends BusTemplate(
      V1 = 1.0000,
      V2 = 0.9916971,
      V3 = 0.9932263,
      V4 = 1.0000,
      V5 = 0.9976591,
      V6 = 1.0000,
      A1 = 11.35992*pi/180,
      A2 = 5.686001*pi/180,
      A3 = -0.02673999*pi/180,
      A4 = 0*pi/180,
      A5 = 0.1149386*pi/180,
      A6 = 0.6838229*pi/180);

        // Voltage Magnitudes

      // Angle

      // Bus: 'B01' (PV bus)

      // Bus: 'B02' (slack bus)

      // Bus: 'B03' (PQ bus)

      // Bus: 'B04' (PQ bus)

      // Bus: 'B05' (PQ bus)

    end PFBus03;

    record PFBus04
      "Record for power flow solutions in buses - Microgrid Load = 10 MW"
      import Modelica.Constants.pi;
      extends BusTemplate(
      V1 = 1.0000,
      V2 = 0.9926503,
      V3 = 0.9935721,
      V4 = 1.0000,
      V5 = 0.9985361,
      V6 = 1.0000,
      A1 = 10.30002*pi/180,
      A2 = 5.095809*pi/180,
      A3 = -0.1421618*pi/180,
      A4 = 0*pi/180,
      A5 = 0.5736473*pi/180,
      A6 = 1.144547*pi/180);

        // Voltage Magnitudes

      // Angle

      // Bus: 'B01' (PV bus)

      // Bus: 'B02' (slack bus)

      // Bus: 'B03' (PQ bus)

      // Bus: 'B04' (PQ bus)

      // Bus: 'B05' (PQ bus)

    end PFBus04;

    record PFBus05
      "Record for power flow solutions in buses - Microgrid Load = 10 MW"
      import Modelica.Constants.pi;
      extends BusTemplate(
      V1 = 1.0000,
      V2 = 0.9920654,
      V3 = 0.9933603,
      V4 = 1.0000,
      V5 = 0.9986383,
      V6 = 1.0000,
      A1 = 10.96133*pi/180,
      A2 = 5.464046*pi/180,
      A3 = -0.07010145*pi/180,
      A4 = 0*pi/180,
      A5 = 0.2869359*pi/180,
      A6 = 0.714334*pi/180);

        // Voltage Magnitudes

      // Angle

      // Bus: 'B01' (PV bus)

      // Bus: 'B02' (slack bus)

      // Bus: 'B03' (PQ bus)

      // Bus: 'B04' (PQ bus)

      // Bus: 'B05' (PQ bus)

    end PFBus05;

    record PFBus06
      "Record for power flow solutions in buses - Microgrid Load = 10 MW"
      import Modelica.Constants.pi;
      extends BusTemplate(
      V1 = 0.9999999,
      V2 = 0.9914459,
      V3 = 0.9931347,
      V4 = 1.0000,
      V5 = 0.998728,
      V6 = 1.0000,
      A1 = 11.62454*pi/180,
      A2 = 5.833365*pi/180,
      A3 = 0.002017891*pi/180,
      A4 = 0*pi/180,
      A5 = 0.0002148477*pi/180,
      A6 = 0.2840931*pi/180);

        // Voltage Magnitudes

      // Angle

      // Bus: 'B01' (PV bus)

      // Bus: 'B02' (slack bus)

      // Bus: 'B03' (PQ bus)

      // Bus: 'B04' (PQ bus)

      // Bus: 'B05' (PQ bus)

    end PFBus06;

    record PFBus07
      "Record for power flow solutions in buses - Microgrid Load = 10 MW"
      import Modelica.Constants.pi;
      extends BusTemplate(
      V1 = 1.0000000,
      V2 = 0.9914461,
      V3 = 0.9931349,
      V4 = 1.0000,
      V5 = 0.9993664,
      V6 = 0.9999999,
      A1 = 11.62429*pi/180,
      A2 = 5.833227*pi/180,
      A3 = 0.001990927*pi/180,
      A4 = 0*pi/180,
      A5 = 0.0001441713*pi/180,
      A6 = 0.142008*pi/180);

    end PFBus07;

    record PFBus08
      "Record for power flow solutions in buses - Microgrid Load = 10 MW"
      import Modelica.Constants.pi;
      extends BusTemplate(
      V1 = 1.0000000,
      V2 = 0.9914461,
      V3 = 0.9931349,
      V4 = 1.0000,
      V5 = 0.9993664,
      V6 = 0.9999999,
      A1 = 11.62453*pi/180,
      A2 = 5.83336*pi/180,
      A3 = 0.00201686*pi/180,
      A4 = 0*pi/180,
      A5 = 0.0002148475*pi/180,
      A6 = 0.2840931*pi/180);

    end PFBus08;

    record PFBus09
      "Record for power flow solutions in buses - Microgrid Load = 10 MW"
      import Modelica.Constants.pi;
      extends BusTemplate(
      V1 = 1.0000000,
      V2 = 0.9914455,
      V3 = 0.9931346,
      V4 = 1.0000,
      V5 = 0.9980846,
      V6 = 1.0000,
      A1 = 11.62498*pi/180,
      A2 = 5.833611*pi/180,
      A3 = 0.002065807*pi/180,
      A4 = 0*pi/180,
      A5 = 0.0002116913*pi/180,
      A6 = 0.4262582*pi/180);

    end PFBus09;

    record PFBus10
      "Record for power flow solutions in buses - Microgrid Load = 10 MW"
      import Modelica.Constants.pi;
      extends BusTemplate(
      V1 = 1.0000000,
      V2 = 0.9914451,
      V3 = 0.9931345,
      V4 = 1.0000,
      V5 = 0.9976962,
      V6 = 1.0000,
      A1 = 11.62533*pi/180,
      A2 = 5.833803*pi/180,
      A3 = 0.002103247*pi/180,
      A4 = 0*pi/180,
      A5 = 0.0001742224*pi/180,
      A6 = 0.5115968*pi/180);

    end PFBus10;

    record PFBus11
      "Record for power flow solutions in buses - Microgrid Load = 1 MW"
      import Modelica.Constants.pi;
      extends BusTemplate(
      V1 = 1.0000000,
      V2 = 0.9903815,
      V3 = 0.9927449,
      V4 = 1.0000,
      V5 = 0.9978246,
      V6 = 1.0000,
      A1 = 12.69018*pi/180,
      A2 = 6.426857*pi/180,
      A3 = 0.117574*pi/180,
      A4 = 0*pi/180,
      A5 = -0.4589332*pi/180,
      A6 = -0.177391*pi/180);

    end PFBus11;

    record PFBus12
      "Record for power flow solutions in buses - Microgrid Load = 1 MW"
      import Modelica.Constants.pi;
      extends BusTemplate(
      V1 = 1.0000000,
      V2 = 0.9903815,
      V3 = 0.9927449,
      V4 = 1.0000,
      V5 = 0.9978246,
      V6 = 1.0000,
      A1 = 12.69018*pi/180,
      A2 = 6.426857*pi/180,
      A3 = 0.117574*pi/180,
      A4 = 0*pi/180,
      A5 = -0.4589332*pi/180,
      A6 = -0.177391*pi/180);

    end PFBus12;
    annotation (Documentation(info="<html>
<p>Records with power flow solutions for buses.</p>
</html>"));


  end BusData;

  package LoadData "Records with power flow solutions for loads"
    extends Modelica.Icons.RecordsPackage;

    partial record LoadTemplate
      "Record template for power flow solutions in loads"

      parameter OpenIPSL.Types.ActivePower PL1 "Load: constantLoad"
        annotation (Dialog(enable=false));
      parameter OpenIPSL.Types.ReactivePower QL1 "Load: constantLoad"
        annotation (Dialog(enable=false));
      parameter OpenIPSL.Types.ActivePower PL2 "Load: constantLoad"
        annotation (Dialog(enable=false));
      parameter OpenIPSL.Types.ReactivePower QL2 "Load: constantLoad"
        annotation (Dialog(enable=false));

    end LoadTemplate;

    record PFLoad01
      "{PL1  = 50MW, QL1 = 10MVar, PL2 = 9MW, QL2 = 2.9582 MVar}"
      extends LoadTemplate(
       PL1=50e6,
       QL1=10e6,
       PL2=9e6,
       QL2=2.9582e6);
      // Load 1

      // Load 2

      // Load: '3_1'

    end PFLoad01;

    record PFLoad02
      "{PL1  = 50MW, QL1 = 10MVar, PL2 = 9MW, QL2 = 2.9582 MVar}"
      extends LoadTemplate(
       PL1=50e6,
       QL1=10e6,
       PL2=9e6,
       QL2=2.9582e6);
      // Load 1

      // Load 2

      // Load: '3_1'

    end PFLoad02;

    record PFLoad03 "{PL1  = 50MW, QL1 = 10MVar, PL2 = 9MW, QL2 = 2.9582 MVar}"
      extends LoadTemplate(
       PL1=50e6,
       QL1=10e6,
       PL2=9e6,
       QL2=2.9582e6);
      // Load 1

      // Load 2

      // Load: '3_1'

    end PFLoad03;

    record PFLoad04
      "{PL1  = 50MW, QL1 = 10MVar, PL2 = 5MW, QL2 = 1.6434 MVar}"
      extends LoadTemplate(
       PL1=50e6,
       QL1=10e6,
       PL2=5e6,
       QL2=1.643421e6);
      // Load 1

      // Load 2

      // Load: '3_1'

    end PFLoad04;

    record PFLoad05 "{PL1  = 50MW, QL1 = 10MVar, PL2 = 5MW, QL2 = 1.6434 MVar}"
      extends LoadTemplate(
       PL1=50e6,
       QL1=10e6,
       PL2=5e6,
       QL2=1.643421e6);
      // Load 1

      // Load 2

      // Load: '3_1'

    end PFLoad05;

    record PFLoad06 "{PL1  = 50MW, QL1 = 10MVar, PL2 = 5MW, QL2 = 1.6434 MVar}"
      extends LoadTemplate(
       PL1=50e6,
       QL1=10e6,
       PL2=5e6,
       QL2=1.643421e6);
      // Load 1

      // Load 2

      // Load: '3_1'

    end PFLoad06;

    record PFLoad07
      "{PL1  = 50MW, QL1 = 10MVar, PL2 = 2.5MW, QL2 = 0.8217 MVar}"
      extends LoadTemplate(
       PL1=50e6,
       QL1=10e6,
       PL2=2.5e6,
       QL2=0.82171e6);
      // Load 1

      // Load 2

      // Load: '3_1'

    end PFLoad07;

    record PFLoad08
      "{PL1  = 50MW, QL1 = 10MVar, PL2 = 5MW, QL2 = 1.6434 MVar}"
      extends LoadTemplate(
       PL1=50e6,
       QL1=10e6,
       PL2=5e6,
       QL2=1.64342e6);
      // Load 1

      // Load 2

      // Load: '3_1'

    end PFLoad08;

    record PFLoad09
      "{PL1  = 50MW, QL1 = 10MVar, PL2 = 7.5MW, QL2 = 2.4651 MVar}"
      extends LoadTemplate(
       PL1=50e6,
       QL1=10e6,
       PL2=7.5e6,
       QL2=2.46513e6);
      // Load 1

      // Load 2

      // Load: '3_1'

    end PFLoad09;

    record PFLoad10
      "Record for power flow solutions in loads - Pload = 10 MW"
      extends LoadTemplate(
       PL1=50e6,
       QL1=10e6,
       PL2=9e6,
       QL2=2.9582e6);
      // Load 1

      // Load 2

      // Load: '3_1'

    end PFLoad10;

    record PFLoad11
      "{PL1  = 50MW, QL1 = 10MVar, PL2 = 9MW, QL2 = 2.9582 MVar}"
      extends LoadTemplate(
       PL1=50e6,
       QL1=10e6,
       PL2=9e6,
       QL2=2.9582e6);

    end PFLoad11;

    record PFLoad12 "{PL1  = 50MW, QL1 = 10MVar, PL2 = 9MW, QL2 = 2.9582 MVar}"
      extends LoadTemplate(
       PL1=50e6,
       QL1=10e6,
       PL2=9e6,
       QL2=2.9582e6);

    end PFLoad12;
    annotation (Documentation(info="<html>
<p>Records with power flow solutions for loads.</p>
</html>"));
  end LoadData;

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
         parameter OpenIPSL.Types.ActivePower Pinf "machine: infinite bus"
        annotation (Dialog(enable=false));
      parameter OpenIPSL.Types.ReactivePower Qinf "machine: infinite bus"
        annotation (Dialog(enable=false));

    end MachineTemplate;

    record PFMachine01
      "Machine Record - [L2 10MW/3.28684MVar]; [G2 5MW/2.1669MVar]"
      extends MachineTemplate(
       PG1=54.0618e6,
       QG1=7.494723e6,
       PG2=5.00000e6,
       QG2=1.93757e6,
       Pinf=-4.524317e-05,
       Qinf=15.61806e6);
        // Machine G1

      // Machine G2

      // Machine Inf

    end PFMachine01;

    record PFMachine02
      "Record for power flow solutions in machines - Pload = 10 MW"
      extends MachineTemplate(
       PG1=51.5576e6,
       QG1=6.899646e6,
       PG2=7.5e6,
       QG2=1.904409e6,
       Pinf=4.163468e-05,
       Qinf=15.14367e6);
        // Machine G1

      // Machine G2

      // Machine Inf

    end PFMachine02;

    record PFMachine03
      "Record for power flow solutions in machines - Pload = 10 MW"
      extends MachineTemplate(
       PG1=49.0546e6,
       QG1=6.335524e6,
       PG2=10e6,
       QG2=1.890087e6,
       Pinf=-5.40828e-06,
       Qinf=14.71908e6);
        // Machine G1

      // Machine G2

      // Machine Inf

    end PFMachine03;

    record PFMachine04
      "Record for power flow solutions in machines - Pload = 10 MW"
      extends MachineTemplate(
       PG1=45.047e6,
       QG1=5.495558e6,
       PG2=10e6,
       QG2=1.013569e6,
       Pinf=-3.016484e-05,
       Qinf=13.61904e6);
        // Machine G1

      // Machine G2

      // Machine Inf

    end PFMachine04;

    record PFMachine05
      "Record for power flow solutions in machines - Pload = 10 MW"
      extends MachineTemplate(
       PG1=47.5493e6,
       QG1=6.010928e6,
       PG2=7.5e6,
       QG2=1.01453e6,
       Pinf=2.667061e-05,
       Qinf=13.96811e6);
        // Machine G1

      // Machine G2

      // Machine Inf

    end PFMachine05;

    record PFMachine06
      "Record for power flow solutions in machines - Pload = 10 MW"
      extends MachineTemplate(
       PG1=50.05274e6,
       QG1=6.556822e6,
       PG2=5e6,
       QG2=1.03429e6,
       Pinf=6.032772e-06,
       Qinf=14.36652e6);
        // Machine G1

      // Machine G2

      // Machine Inf

    end PFMachine06;

    record PFMachine07
      "Record for power flow solutions in machines - Pload = 10 MW"
      extends MachineTemplate(
       PG1=50.0518e6,
       QG1=6.556613e6,
       PG2=2.5000e6,
       QG2=0.5116372e6,
       Pinf=-4.105587e-05,
       Qinf=14.04712e6);
        // Machine G1

      // Machine G2

      // Machine Inf

    end PFMachine07;

    record PFMachine08
      "Record for power flow solutions in machines - Pload = 10 MW"
      extends MachineTemplate(
       PG1=50.0527e6,
       QG1=6.556815e6,
       PG2=5e6,
       QG2=1.03429e6,
       Pinf=4.172131e-05,
       Qinf=14.36652e6);
        // Machine G1

      // Machine G2

      // Machine Inf

    end PFMachine08;

    record PFMachine09
      "Record for power flow solutions in machines - Pload = 10 MW"
      extends MachineTemplate(
       PG1=50.0544e6,
       QG1=6.557196e6,
       PG2=7.5e6,
       QG2=1.56799e6,
       Pinf=-1.641935e-05,
       Qinf=14.68852e6);
        // Machine G1

      // Machine G2

      // Machine Inf

    end PFMachine09;

    record PFMachine10
      "Record for power flow solutions in machines - Pload = 10 MW"
      extends MachineTemplate(
       PG1=50.0557e6,
       QG1=6.557487e6,
       PG2=9e6,
       QG2=1.893555e6,
       Pinf=-1.516062e-05,
       Qinf=14.88296e6);
        // Machine G1

      // Machine G2

      // Machine Inf

    end PFMachine10;

    record PFMachine11
      "Record for power flow solutions in machines - Pload = 1 MW"
      extends MachineTemplate(
       PG1=54.0618e6,
       QG1=7.494723e6,
       PG2=5e6,
       QG2=1.937436e6,
       Pinf=-4.527057e-05,
       Qinf=15.618e6);
        // Machine G1

      // Machine G2

      // Machine Inf

    end PFMachine11;

    record PFMachine12
      "Record for power flow solutions in machines - Pload = 1 MW"
      extends MachineTemplate(
       PG1=54.0618e6,
       QG1=7.494723e6,
       PG2=5e6,
       QG2=1.937436e6,
       Pinf=-4.527057e-05,
       Qinf=15.618e6);
        // Machine G1

      // Machine G2

      // Machine Inf

    end PFMachine12;
    annotation (Documentation(info="<html>
<p>Records with power flow solutions for machines.</p>
</html>"));
  end MachineData;

  record PF01 "Microgrid Load Scenario: [L2 10MW/3.28684MVar]; [G2 5MW/2.1669MVar]"
    extends PowerFlowTemplate;

    replaceable record Bus =
        BusData.PFBus01   constrainedby BusData.BusTemplate
      "Power flow results for buses";
    Bus bus;

    replaceable record Loads =
        LoadData.PFLoad01    constrainedby LoadData.LoadTemplate
      "Power flow results for loads";
    Loads loads;

    replaceable record Machines =
        MachineData.PFMachine01    constrainedby MachineData.MachineTemplate
      "Power flow results for machines";
    Machines machines;

  end PF01;

  record PF02 "Microgrid Load Scenario: [L2 10MW/3.28684MVar]; [G2 7.5MW/2.1304MVar]"
    extends PowerFlowTemplate;

    replaceable record Bus =
        BusData.PFBus02   constrainedby BusData.BusTemplate
      "Power flow results for buses";
    Bus bus;

    replaceable record Loads =
        LoadData.PFLoad02    constrainedby LoadData.LoadTemplate
      "Power flow results for loads";
    Loads loads;

    replaceable record Machines =
        MachineData.PFMachine02    constrainedby MachineData.MachineTemplate
      "Power flow results for machines";
    Machines machines;

  end PF02;

  record PF03
    "Microgrid Load Scenario: [L2 10MW/3.28684MVar]; [G2 10MW/2.1127MVar]"
    extends PowerFlowTemplate;

    replaceable record Bus =
        BusData.PFBus03   constrainedby BusData.BusTemplate
      "Power flow results for buses";
    Bus bus;

    replaceable record Loads =
        LoadData.PFLoad03    constrainedby LoadData.LoadTemplate
      "Power flow results for loads";
    Loads loads;

    replaceable record Machines =
        MachineData.PFMachine03    constrainedby MachineData.MachineTemplate
      "Power flow results for machines";
    Machines machines;

  end PF03;

  record PF04
    "Microgrid Load Scenario: [L2 5MW/1.6434MVar]; [G2 10MW/1.0135MVar]"
    extends PowerFlowTemplate;

    replaceable record Bus =
        BusData.PFBus04   constrainedby BusData.BusTemplate
      "Power flow results for buses";
    Bus bus;

    replaceable record Loads =
        LoadData.PFLoad04    constrainedby LoadData.LoadTemplate
      "Power flow results for loads";
    Loads loads;

    replaceable record Machines =
        MachineData.PFMachine04    constrainedby MachineData.MachineTemplate
      "Power flow results for machines";
    Machines machines;

  end PF04;

  record PF05
    "Microgrid Load Scenario: [L2 5MW/1.6434MVar]; [G2 7.5MW/1.0145MVar]"
    extends PowerFlowTemplate;

    replaceable record Bus =
        BusData.PFBus05   constrainedby BusData.BusTemplate
      "Power flow results for buses";
    Bus bus;

    replaceable record Loads =
        LoadData.PFLoad05    constrainedby LoadData.LoadTemplate
      "Power flow results for loads";
    Loads loads;

    replaceable record Machines =
        MachineData.PFMachine05    constrainedby MachineData.MachineTemplate
      "Power flow results for machines";
    Machines machines;

  end PF05;

  record PF06
    "Microgrid Load Scenario: [L2 5MW/1.6434MVar]; [G2 5MW/1.0342MVar]"
    extends PowerFlowTemplate;

    replaceable record Bus =
        BusData.PFBus06   constrainedby BusData.BusTemplate
      "Power flow results for buses";
    Bus bus;

    replaceable record Loads =
        LoadData.PFLoad06    constrainedby LoadData.LoadTemplate
      "Power flow results for loads";
    Loads loads;

    replaceable record Machines =
        MachineData.PFMachine06    constrainedby MachineData.MachineTemplate
      "Power flow results for machines";
    Machines machines;

  end PF06;

  record PF07
    "Microgrid Load Scenario: [L2 2.5MW/0.8217MVar]; [G2 2.5MW/6.6782MVar]"
    extends PowerFlowTemplate;

    replaceable record Bus =
        BusData.PFBus07   constrainedby BusData.BusTemplate
      "Power flow results for buses";
    Bus bus;

    replaceable record Loads =
        LoadData.PFLoad07    constrainedby LoadData.LoadTemplate
      "Power flow results for loads";
    Loads loads;

    replaceable record Machines =
        MachineData.PFMachine07    constrainedby MachineData.MachineTemplate
      "Power flow results for machines";
    Machines machines;

  end PF07;

  record PF08
    "Microgrid Load Scenario: [L2 2.5MW/0.8217MVar]; [G2 2.5MW/6.6782MVar]"
    extends PowerFlowTemplate;

    replaceable record Bus =
        BusData.PFBus08   constrainedby BusData.BusTemplate
      "Power flow results for buses";
    Bus bus;

    replaceable record Loads =
        LoadData.PFLoad08    constrainedby LoadData.LoadTemplate
      "Power flow results for loads";
    Loads loads;

    replaceable record Machines =
        MachineData.PFMachine08    constrainedby MachineData.MachineTemplate
      "Power flow results for machines";
    Machines machines;

  end PF08;

  record PF09
    "Microgrid Load Scenario: [L2 2.5MW/0.8217MVar]; [G2 2.5MW/6.6782MVar]"
    extends PowerFlowTemplate;

    replaceable record Bus =
        BusData.PFBus09   constrainedby BusData.BusTemplate
      "Power flow results for buses";
    Bus bus;

    replaceable record Loads =
        LoadData.PFLoad09    constrainedby LoadData.LoadTemplate
      "Power flow results for loads";
    Loads loads;

    replaceable record Machines =
        MachineData.PFMachine09    constrainedby MachineData.MachineTemplate
      "Power flow results for machines";
    Machines machines;

  end PF09;

  record PF10
    "Microgrid Load Scenario: [L2 2.5MW/0.8217MVar]; [G2 2.5MW/6.6782MVar]"
    extends PowerFlowTemplate;

    replaceable record Bus =
        BusData.PFBus10   constrainedby BusData.BusTemplate
      "Power flow results for buses";
    Bus bus;

    replaceable record Loads =
        LoadData.PFLoad10    constrainedby LoadData.LoadTemplate
      "Power flow results for loads";
    Loads loads;

    replaceable record Machines =
        MachineData.PFMachine10    constrainedby MachineData.MachineTemplate
      "Power flow results for machines";
    Machines machines;

  end PF10;

  record PF11
    "Microgrid Load Scenario: [L2 1MW/0.328MVar]; [G2 10MW/0.1599MVar]"
    extends PowerFlowTemplate;

    replaceable record Bus =
        BusData.PFBus11   constrainedby BusData.BusTemplate
      "Power flow results for buses";
    Bus bus;

    replaceable record Loads =
        LoadData.PFLoad11    constrainedby LoadData.LoadTemplate
      "Power flow results for loads";
    Loads loads;

    replaceable record Machines =
        MachineData.PFMachine11    constrainedby MachineData.MachineTemplate
      "Power flow results for machines";
    Machines machines;

  end PF11;
end PFData;
