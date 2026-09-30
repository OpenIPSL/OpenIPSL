within OpenIPSL.Tests.Controls.PSAT.TG;
model TGTypeI_test "Simple system to test functionality of TG type I model"
  extends BaseClasses.TGTestBase;
  extends Modelica.Icons.Example;
  parameter OpenIPSL.Types.PerUnit pm0(fixed=false)
    "Initial mechanical power of the machine, on the system base";
  OpenIPSL.Electrical.Controls.PSAT.TG.TGTypeI tGTypeI(
    wref=1,
    pref=pm0,
    R=0.2,
    pmax=1,
    pmin=0,
    Ts=0.1,
    Tc=1,
    T3=0.04,
    T4=5,
    T5=0.04) annotation (Placement(transformation(extent={{-68,-24},{-40,4}})));
initial equation
  pm0 = gen.pm0;
equation

  connect(tGTypeI.pm, gen.pm) annotation (Line(points={{-38.6,-10},{-24,-10}}, color={0,0,127}));
  connect(tGTypeI.w, gen.w) annotation (Line(points={{-70.8,-10},{-80,-10},{-80,40},{30,40},{30,18},{22,18}}, color={0,0,127}));
  annotation (experiment(StopTime=60));
end TGTypeI_test;
