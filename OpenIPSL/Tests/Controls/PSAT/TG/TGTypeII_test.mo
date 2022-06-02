within OpenIPSL.Tests.Controls.PSAT.TG;
model TGTypeII_test "Simple system to test functionality of TG type II model"
  extends BaseClasses.TGTestBase;
  extends Modelica.Icons.Example;
  Electrical.Controls.PSAT.TG.TGTypeII tGtypeII(S_b=SysData.S_b)
             annotation (Placement(transformation(extent={{-68,-24},{-40,4}})));
equation
  connect(tGtypeII.pm, gen.pm) annotation (Line(points={{-38.6,-10},{-24,-10}}, color={0,0,127}));
  connect(tGtypeII.w, gen.w) annotation (Line(points={{-70.8,-10},{-80,-10},{-80,40},{30,40},{30,18},{22,18}}, color={0,0,127}));
  connect(tGtypeII.pm0, gen.pm0) annotation (Line(points={{-54,6.8},{-54,20},{-90,20},{-90,-32},{-16,-32},{-16,-22}}, color={0,0,127}));
  annotation (experiment(StopTime=10));
end TGTypeII_test;
