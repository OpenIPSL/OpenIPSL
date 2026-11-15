within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.Variants.PQLims;
model FlagsQV0V0
  "Variants.PQLims on the SMIB with QVFlag = false, VFlag = false: steady start, Pref and Vref steps, a short fault"
  extends FlagsQV1V1(QVFlag=false, VFlag=false);
  annotation (experiment(
      StopTime=12,
      __Dymola_NumberOfIntervals=6000,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>
As <code>FlagsQV1V1</code>, with <code>QVFlag = false</code> and <code>VFlag = false</code>.
</p>
</html>"));
end FlagsQV0V0;
