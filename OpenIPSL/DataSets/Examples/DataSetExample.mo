within OpenIPSL.DataSets.Examples;
model DataSetExample "SMIB system to learn how to use the data set records"
  extends OpenIPSL.Tests.BaseClasses.SMIB;
  Generation_Group.Generator1 generator1 annotation (Placement(transformation(
          rotation=0, extent={{-60,-10},{-40,10}})));
equation
  connect(generator1.pwPin, GEN1.p)
    annotation (Line(points={{-39,0},{-30,0}}, color={0,0,255}));
  annotation (
experiment(StopTime=10));
end DataSetExample;
