within OpenIPSL.DataSets.IEEE421.PSS_Data;
record PSS1A_ND "PSS Data Set Not Available"
  extends PSS_Data.PSS1A_Template(
    K_S=Modelica.Constants.small,
    T_1=Modelica.Constants.small,
    T_2=Modelica.Constants.small,
    T_3=Modelica.Constants.small,
    T_4=Modelica.Constants.small,
    T_5=Modelica.Constants.small,
    T_6=Modelica.Constants.small,
    V_STMAX=Modelica.Constants.small,
    V_STMIN=Modelica.Constants.small);
end PSS1A_ND;
