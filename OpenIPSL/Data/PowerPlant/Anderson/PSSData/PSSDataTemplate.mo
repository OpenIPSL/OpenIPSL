within OpenIPSL.Data.PowerPlant.Anderson.PSSData;
partial record PSSDataTemplate "Power System Stabilizer Data Record Template"
  extends Modelica.Icons.Record;
  parameter String PSS "PSS feedback: N = no PSS, F = frequency, S = speed, P = accelarating power";
  parameter Types.PerUnit K_QV "PSS voltage gain";
  parameter Types.PerUnit K_QS "PSS speed gain";
  parameter Types.Time T_Q "PSS reset time constant";
  parameter Types.Time Tp_Q1 "First lead time constant";
  parameter Types.Time T_Q1 "First lag time constant";
  parameter Types.Time Tp_Q2 "Second lead time constant";
  parameter Types.Time T_Q2 "Second lag time constant";
  parameter Types.Time Tp_Q3 "Third lead time constant";
  parameter Types.Time T_Q3 "Third lag time constant";
  parameter Types.PerUnit V_SLIM "PSS output limit setting";

end PSSDataTemplate;
