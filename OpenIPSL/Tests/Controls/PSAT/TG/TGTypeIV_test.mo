within OpenIPSL.Tests.Controls.PSAT.TG;
model TGTypeIV_test "Simple system to test functionality of TG type VI model"
  extends BaseClasses.TGTestBase;
  extends Modelica.Icons.Example;
  parameter OpenIPSL.Types.PerUnit pm0(fixed=false)
    "Initial mechanical power of the machine, on the system base";
  OpenIPSL.Electrical.Controls.PSAT.TG.TGTypeIV tGTypeIV(
    Ki=0.105,
    Tg=0.2,
    Tp=0.04,
    delta=1.15,
    sigma=0.05,
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
    Kp=1.163,
    Pref=pm0,
    wref=1) annotation (Placement(transformation(extent={{-68,-24},{-40,4}})));
initial equation
  pm0 = gen.pm0;
equation

  connect(tGTypeIV.Pm, gen.pm) annotation (Line(points={{-38.6,-10},{-24,-10}}, color={0,0,127}));
  connect(tGTypeIV.w, gen.w) annotation (Line(points={{-70.8,-10},{-80,-10},{-80,40},{30,40},{30,18},{22,18}}, color={0,0,127}));
  annotation (experiment(StopTime=60));
end TGTypeIV_test;
