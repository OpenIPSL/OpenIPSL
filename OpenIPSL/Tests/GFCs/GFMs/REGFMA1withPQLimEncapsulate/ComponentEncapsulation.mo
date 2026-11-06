within OpenIPSL.Tests.GFCs.GFMs.REGFMA1withPQLimEncapsulate;
model ComponentEncapsulation "Test the REGFM_A1 model within a power system"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=1e-4,
      X=1e-3,
      t1=40.0,
      t2=43.0));
  Modelica.Blocks.Sources.Ramp Vref_up(
    height=0.1,
    duration=1,
    offset=0,
    startTime=30)
    annotation (Placement(transformation(extent={{-220,38},{-200,58}})));
  Modelica.Blocks.Sources.Ramp Vref_down(
    height=0.1,
    duration=1.0,
    offset=0,
    startTime=36)
    annotation (Placement(transformation(extent={{-220,0},{-200,20}})));
  Modelica.Blocks.Math.Add3 add "Vref = Vref0 of the initial operating point plus the two ramps"
    annotation (Placement(transformation(extent={{-180,20},{-160,40}})));
  Electrical.GFCs.GFMs.REGFMA1.REGFMA1wPQLimiters GFC(angle_0=0.0706207995986839)
    annotation (Placement(transformation(extent={{-140,-28},{-80,32}})));
  Modelica.Blocks.Math.Add3 add3_1_Pref annotation (Placement(
        transformation(extent={{-180,-40},{-160,-20}})));
  Modelica.Blocks.Math.Add addPref0 "Pref = Pref0 of the initial operating point plus the changes"
    annotation (Placement(transformation(extent={{-160,-60},{-150,-50}})));
  Modelica.Blocks.Sources.Ramp Pramp(
    height=0.2,
    duration=2.5,
    offset=0,
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
          10},{-194,30},{-182,30}}, color={0,0,127}));
  connect(add.y, GFC.Vref) annotation (Line(points={{-159,30},{-154,30},{-154,
          20},{-144.8,20}}, color={0,0,127}));
  connect(Pramp.y, add3_1_Pref.u1)
    annotation (Line(points={{-219,-22},{-182,-22}}, color={0,0,127}));
  connect(P_lim_test_1.y, add3_1_Pref.u2) annotation (Line(points={{-219,
          -70},{-208,-70},{-208,-30},{-182,-30}}, color={0,0,127}));
  connect(add3_1_Pref.y, addPref0.u1) annotation (Line(points={{-159,-30},{-162,
          -30},{-162,-52},{-161,-52}}, color={0,0,127}));
  connect(addPref0.y, GFC.Pref) annotation (Line(points={{-149.5,-55},{-148,-55},{-148,
          -16},{-144.8,-16}}, color={0,0,127}));
  connect(GFC.Pref0, addPref0.u2) annotation (Line(points={{-116,-31},{-116,-64},{-164,
          -64},{-164,-58},{-161,-58}}, color={0,0,127}));
  connect(GFC.Vref0, add.u3) annotation (Line(points={{-128,-31},{-128,-40},{-190,-40},
          {-190,22},{-182,22}}, color={0,0,127}));
  connect(P_lim_test_2.y, add3_1_Pref.u3) annotation (Line(points={{-219,
          -110},{-194,-110},{-194,-38},{-182,-38}}, color={0,0,127}));
  connect(GFC.p, GEN1.p)
    annotation (Line(points={{-74,2},{-52,2},{-52,0},{-30,0}},
                                               color={0,0,255}));
  annotation (experiment(
      StopTime=60,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"), Diagram(
        coordinateSystem(extent={{-260,-120},{100,100}}, initialScale=0.5)),
    Documentation(info="<html>
<p>
Illustrates how to use the
<code>REGFMA1PQLimiters</code> model.
</p>

<p>
Simulate and plot the <code>pwLine.P12</code> and <code>pwLine.Q12</code>, which represent the active and reactive powers being injected, and the terminal voltage <code>GFC.V</code>.
</p>

<p>
The active power reference is ramped up by 0.2 pu from 5 to 7.5 sec. and gets two pulses of 1 sec., of 8 pu at 10 sec. and of 20 pu at 20 sec., which drive it against the P limits; the voltage magnitude reference is ramped up by 0.1 pu at 30 sec. and again at 36 sec.
</p>
<p>
The references start from the outputs <code>GFC.Pref0</code> and <code>GFC.Vref0</code>, the references of the initial operating point, so the model starts in steady state.
</p>

</html>"));
end ComponentEncapsulation;
