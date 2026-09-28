within OpenIPSL.Tests.Controls.PSAT.TG;
model TGTypeIII_test "Simple system to test functionality of TG type III model"
  extends Modelica.Icons.Example;
  extends BaseClasses.TGTestBase;
  parameter OpenIPSL.Types.PerUnit pm0(fixed=false)
    "Initial mechanical power of the machine, on the system base";
  OpenIPSL.Electrical.Controls.PSAT.TG.TGTypeIII tGTypeIII(
    Tg=0.2,
    Tp=0.04,
    delta=0.3,
    sigma=0.04,
    Tr=5,
    vmin=-0.1,
    vmax=0.1,
    gmax=1,
    gmin=0,
    Tw=1,
    a11=0.5,
    a13=1,
    a21=1.5,
    a23=1,
    int3=3*pm0,
    P_0=pm0) annotation (Placement(transformation(extent={{-68,-24},{-40,4}})));
initial equation
  pm0 = gen.pm0;
equation

  connect(tGTypeIII.pm, gen.pm) annotation (Line(points={{-38.6,-10},{-24,-10}}, color={0,0,127}));
  connect(tGTypeIII.w, gen.w) annotation (Line(points={{-70.8,-10},{-80,-10},{-80,40},{30,40},{30,18},{22,18}}, color={0,0,127}));
  annotation (experiment(StopTime=10));
end TGTypeIII_test;
