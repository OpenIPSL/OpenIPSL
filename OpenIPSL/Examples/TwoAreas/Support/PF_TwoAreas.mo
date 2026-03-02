within OpenIPSL.Examples.TwoAreas.Support;
partial record PF_TwoAreas "Template data record used to store powr flow results for initialization of power networks"
  extends Modelica.Icons.Record;
  record Voltages "Template data record for voltage magnitudes and angles"
    extends Modelica.Icons.Record;
    // Bus number 1
    parameter Real V1;
    parameter Real A1;
    // Bus number 2
    parameter Real V2;
    parameter Real A2;
    // Bus number 3
    parameter Real V3;
    parameter Real A3;
    // Bus number 4
    parameter Real V4;
    parameter Real A4;
    // Bus number 5
    parameter Real V5;
    parameter Real A5;
    // Bus number 6
    parameter Real V6;
    parameter Real A6;
    // Bus number 7
    parameter Real V7;
    parameter Real A7;
    // Bus number 8
    parameter Real V8;
    parameter Real A8;
    // Bus number 9
    parameter Real V9;
    parameter Real A9;
    // Bus number 10
    parameter Real V10;
    parameter Real A10;
    // Bus number 11
    parameter Real V11;
    parameter Real A11;

  end Voltages;

  record Machines "Template data record for active and reactive power from generation units"
    extends Modelica.Icons.Record;
    // Gen at bus 1
    parameter Real P1_1;
    parameter Real Q1_1;
    // Gen at bus 2
    parameter Real P2_1;
    parameter Real Q2_1;
    // Gen at bus 3
    parameter Real P3_1;
    parameter Real Q3_1;
    // Gen at bus 4
    parameter Real P4_1;
    parameter Real Q4_1;

  end Machines;

  record Loads "Template data record for active and reactive power consumed by loads"
    extends Modelica.Icons.Record;
    // Gen at bus 1
    parameter Real PL7_1;
    parameter Real QL7_1;
    // Gen at bus 2
    parameter Real PL9_1;
    parameter Real QL9_1;

  end Loads;

  Voltages voltages;
  Machines machines;
  Loads loads;
  annotation (Documentation(info="<html>

</html>"));
end PF_TwoAreas;