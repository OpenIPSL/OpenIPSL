within OpenIPSL.Tests.GFCs.GFMs.REGFMA1withPQLimEncapsulate;
model FlagsQV1V0
  "REGFMA1wPQLimiters on the SMIB with QVFlag = true, VFlag = false: steady start, Pref and Vref steps, a short fault"
  extends FlagsQV1V1(QVFlag=true, VFlag=false);
  annotation (experiment(
      StopTime=12,
      __Dymola_NumberOfIntervals=6000,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>
As <code>FlagsQV1V1</code>, with <code>QVFlag = true</code> and <code>VFlag = false</code>.
</p>
</html>"));
end FlagsQV1V0;
