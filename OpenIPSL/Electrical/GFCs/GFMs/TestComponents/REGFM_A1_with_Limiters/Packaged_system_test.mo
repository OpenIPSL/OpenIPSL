within OpenIPSL.Electrical.GFCs.GFMs.TestComponents.REGFM_A1_with_Limiters;
model Packaged_system_test "Test the REGFM_A1 model within a power system"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=1e-4,
      X=1e-3,
      t1=40.0,
      t2=43.0));
  Modelica.Blocks.Sources.Ramp Vref_up(
    height=0.1,
    duration=1,
    offset=0.5,
    startTime=30)
    annotation (Placement(transformation(extent={{-220,38},{-200,58}})));
  Modelica.Blocks.Sources.Ramp Vref_down(
    height=0.1,
    duration=1.0,
    offset=0.5,
    startTime=36)
    annotation (Placement(transformation(extent={{-220,0},{-200,20}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-180,20},{-160,40}})));
  REGFM_A1_incl_Limiters GFC(angle_0=0.070492225331847)
    annotation (Placement(transformation(extent={{-140,-28},{-80,32}})));
  Modelica.Blocks.Math.Add3 add3_1_Pref annotation (Placement(
        transformation(extent={{-180,-40},{-160,-20}})));
  Modelica.Blocks.Sources.Ramp Pramp(
    height=0.2,
    duration=2.5,
    offset=0.4,
    startTime=5.0)
    annotation (Placement(transformation(extent={{-240,-32},{-220,-12}})));
  Modelica.Blocks.Sources.Pulse P_lim_test_1(
    amplitude=8,
    period=2,
    nperiod=1,
    offset=0,
    startTime=10.0) annotation (Placement(transformation(extent={{-240,
            -80},{-220,-60}})));
  Modelica.Blocks.Sources.Pulse P_lim_test_2(
    amplitude=20,
    period=2,
    nperiod=1,
    offset=0,
    startTime=20.0)
    annotation (Placement(transformation(extent={{-240,-120},{-220,-100}})));
equation
  connect(Vref_up.y, add.u1) annotation (Line(points={{-199,48},{-192,48},
          {-192,36},{-182,36}}, color={0,0,127}));
  connect(Vref_down.y, add.u2) annotation (Line(points={{-199,10},{-194,
          10},{-194,24},{-182,24}}, color={0,0,127}));
  connect(add.y, GFC.Vref) annotation (Line(points={{-159,30},{-154,30},{-154,
          20},{-144.8,20}},      color={0,0,127}));
  connect(Pramp.y, add3_1_Pref.u1)
    annotation (Line(points={{-219,-22},{-182,-22}}, color={0,0,127}));
  connect(P_lim_test_1.y, add3_1_Pref.u2) annotation (Line(points={{-219,
          -70},{-208,-70},{-208,-30},{-182,-30}}, color={0,0,127}));
  connect(add3_1_Pref.y, GFC.Pref) annotation (Line(points={{-159,-30},{-154,
          -30},{-154,-16},{-144.8,-16}},      color={0,0,127}));
  connect(P_lim_test_2.y, add3_1_Pref.u3) annotation (Line(points={{-219,
          -110},{-194,-110},{-194,-38},{-182,-38}}, color={0,0,127}));
  connect(GFC.p, GEN1.p)
    annotation (Line(points={{-74,2},{-52,2},{-52,0},{-30,0}},
                                               color={0,0,255}));
  annotation (experiment(
      StopTime=60,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"),                                 Diagram(
        coordinateSystem(extent={{-260,-120},{100,100}}, initialScale=0.5)));
end Packaged_system_test;
