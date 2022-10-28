within OpenIPSL.DataSets.Anderson.PSS_Data;
partial record PSSData_Template "Power System Stabilizer Data"
  parameter String PSS "PSS feedback: N = no PSS, F = frequency, S = speed, P = accelarating power";
  parameter OpenIPSL.Types.PerUnit K_QV "PSS voltage gain";
  parameter OpenIPSL.Types.PerUnit K_QS "PSS speed gain";
  parameter OpenIPSL.Types.Time T_Q "PSS reset time constant";
  parameter OpenIPSL.Types.Time Tp_Q1 "First lead time constant";
  parameter OpenIPSL.Types.Time T_Q1 "First lag time constant";
  parameter OpenIPSL.Types.Time Tp_Q2 "Second lead time constant";
  parameter OpenIPSL.Types.Time T_Q2 "Second lag time constant";
  parameter OpenIPSL.Types.Time Tp_Q3 "Third lead time constant";
  parameter OpenIPSL.Types.Time T_Q3 "Third lag time constant";
  parameter OpenIPSL.Types.PerUnit V_SLIM "PSS output limit setting";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PSSData_Template;
