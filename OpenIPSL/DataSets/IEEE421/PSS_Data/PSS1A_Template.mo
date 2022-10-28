within OpenIPSL.DataSets.IEEE421.PSS_Data;
partial record PSS1A_Template "Type PSS-A Power System Stabilizer"
  parameter Real K_S "PSS gain";
  parameter Real T_1 "Lead-lag time constant 1";
  parameter Real T_2 "Lead-lag time constant 2";
  parameter Real T_3 "Lead-lag time constant 3";
  parameter Real T_4 "Lead-lag time constant 4";
  parameter Real T_5 "Washout time constant";
  parameter Real T_6 "Transducer time constant";
  parameter Real V_STMAX "PSS output max. limit";
  parameter Real V_STMIN "PSS output min. limit";
end PSS1A_Template;
