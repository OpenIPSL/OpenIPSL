within OpenIPSL.Tests.GFCs.GFMs.REGFMA1withPQLimEncapsulate;
model FlagsQV0V1
  "REGFMA1wPQLimiters on the SMIB with QVFlag = false, VFlag = true: steady start, Pref and Vref steps, a short fault"
  extends FlagsQV1V1(QVFlag=false, VFlag=true);
  annotation (experiment(
      StopTime=12,
      __Dymola_NumberOfIntervals=6000,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>
As <code>FlagsQV1V1</code>, with <code>QVFlag = false</code> and <code>VFlag = true</code>.
</p>
</html>"));
end FlagsQV0V1;
