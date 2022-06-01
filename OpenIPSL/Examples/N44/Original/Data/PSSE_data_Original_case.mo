within OpenIPSL.Examples.N44.Original.Data;
record PSSE_data_Original_case "PSSE complete data record"
  extends Modelica.Icons.Record;
  /* PSSE voltages from power flow solution */
  replaceable record Voltages_OC = PSSE_voltages_Original_case
    constrainedby PSSE_voltages_Original_case "PSSE voltages from power flow solution" annotation (
      choicesAllMatching);
  Voltages_OC voltages;
  /* PSSE powers from power flow solution */
  replaceable record Powers_OC = PSSE_powers_Original_case constrainedby
    PSSE_powers_Original_case "PSSE powers from power flow solution" annotation (choicesAllMatching);
  Powers_OC powers;
end PSSE_data_Original_case;
