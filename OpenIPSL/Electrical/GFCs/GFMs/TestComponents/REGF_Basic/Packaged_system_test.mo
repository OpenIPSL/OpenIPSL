within OpenIPSL.Electrical.GFCs.GFMs.TestComponents.REGF_Basic;
model Packaged_system_test "Test the packaged REGF_A1_Light model"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=1e-6,
      X=1e-3,
      t1=62.0,
      t2=62.15));
  Modelica.Blocks.Sources.Ramp Pstep(
    height=-0.1,
    duration=5,
    offset=0.4,
    startTime=20)
    annotation (Placement(transformation(extent={{-180,-28},{-160,-8}})));
  Modelica.Blocks.Sources.Ramp Vref_up(
    height=0.1,
    duration=1,
    offset=0.5,
    startTime=46)
    annotation (Placement(transformation(extent={{-220,38},{-200,58}})));
  Modelica.Blocks.Sources.Ramp Vref_down(
    height=0.1,
    duration=1.0,
    offset=0.5,
    startTime=40)
    annotation (Placement(transformation(extent={{-220,0},{-200,20}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-180,20},{-160,40}})));
  REGFM_A1_Light GFC(
    M_b=5,
    R_a=1e-12,
    X_d=0.001,
    mp=0.02,
    Tr=0.099,
    qTr=0.098,
    EMax=1.2,
    EMin=0,
    kpv=0.05,
    kiv=5.0,
    mq=0.015)
    annotation (Placement(transformation(extent={{-140,-30},{-80,30}})));
equation
  connect(Vref_up.y, add.u1) annotation (Line(points={{-199,48},{-192,48},
          {-192,36},{-182,36}}, color={0,0,127}));
  connect(Vref_down.y, add.u2) annotation (Line(points={{-199,10},{-194,
          10},{-194,24},{-182,24}}, color={0,0,127}));
  connect(Pstep.y, GFC.Pref)
    annotation (Line(points={{-159,-18},{-144.8,-18}}, color={0,0,127}));
  connect(add.y, GFC.Vref) annotation (Line(points={{-159,30},{-154,30},{
          -154,18},{-144.8,18}}, color={0,0,127}));
  connect(GFC.p1, GEN1.p)
    annotation (Line(points={{-74,0},{-30,0}}, color={0,0,255}));
  annotation (experiment(
      StopTime=60,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"),                                 Diagram(
        coordinateSystem(extent={{-240,-100},{100,100}}, initialScale=0.5)));
end Packaged_system_test;
