within OpenIPSL.Examples.TwoAreas.Data;
record PF1 "Power flow data record, designed for test system assembled with PSAT models"
  extends Support.PF_TwoAreas(
    voltages(
      V1=1.03,
      A1=0.353381617759011,
      V2=1.01,
      A2=0.183079867930759,
      V3=1.03,
      A3=-0.118682400000000,
      V4=1.01,
      A4=-0.296314118513724,
      V5=1.0069,
      A5=0.24064774259,
      V6=0.97914,
      A6=0.06483200039,
      V7=0.96283,
      A7=-0.0815909472281613,
      V8=0.94828,
      A8=-0.32311454975,
      V9=0.973864710338689,
      A9=-0.560256955944523,
      V10=0.98486,
      A10=-0.41387167085,
      V11=1.0088,
      A11=-0.23424936555),
    machines(
      P1_1=700000000,
      Q1_1=182450226.027067,
      P2_1=700000000,
      Q2_1=228434194.888742,
      P3_1=718906215.107731,
      Q3_1=172421333.322957,
      P4_1=700000000,
      Q4_1=193556043.309309),
    loads(
      PL7_1=967000000,
      QL7_1=-100000000,
      PL9_1=1767000000,
      QL9_1=-250000000));
  annotation (Documentation);
end PF1;