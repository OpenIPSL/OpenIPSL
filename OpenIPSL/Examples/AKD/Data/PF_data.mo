within OpenIPSL.Examples.AKD.Data;
record PF_data "PSSE complete data record"
  extends Modelica.Icons.Record;
  /* PSSE voltages from power flow solution */
  replaceable record Voltages = Data.AKD_PF_voltages constrainedby
    Data.AKD_PF_voltages "PSSE voltages from power flow solution" annotation (choicesAllMatching);
  Voltages voltages;
  /* PSSE powers from power flow solution */
  replaceable record Powers = Data.AKD_PF_powers constrainedby
    Data.AKD_PF_powers "PSSE powers from power flow solution"
                       annotation (choicesAllMatching);
  Powers powers;
  annotation (Documentation(info="<html>
<p>This record package contains two templates that can be used as replaceable records for changing the operating point in which the system is initialized. The templates are: </p>
<ul>
<li><strong>Voltages</strong>: composed of voltage magnitude, in per unit, and angles, in radians.</li>
<li><strong>Powers</strong>: composed of active and reactive power values in VA and Var, respectively, that are injected in the node.</li>
</ul>
</html>"));
end PF_data;
