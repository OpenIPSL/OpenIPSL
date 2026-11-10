within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components;
model GridFrequencyStep "Three-phase grounded voltage source whose frequency steps at a given time"
  parameter Modelica.Units.SI.Voltage Vbase=6500 "Base voltage, line-to-line RMS";
  parameter Modelica.Units.SI.Time FstepTime=6 "Time of the frequency step";
  parameter Modelica.Units.SI.Frequency fnorm=60 "Source frequency before the step";
  parameter Modelica.Units.SI.Frequency deltaF=-0.5 "Frequency change at the step";
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-64,-78})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,-48})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage2 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-14,-18})));
  Modelica.Electrical.Analog.Basic.Ground ground4
    annotation (Placement(transformation(extent={{-70,-106},{-58,-94}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin C "Phase C" annotation (Placement(
        transformation(rotation=0, extent={{-110,50},{-90,70}}),
        iconTransformation(extent={{-110,50},{-90,70}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin B "Phase B" annotation (
      Placement(transformation(rotation=0, extent={{-110,-10},{-90,10}}),
        iconTransformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin A "Phase A" annotation (
      Placement(transformation(rotation=0, extent={{-110,-70},{-90,-50}}),
        iconTransformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=1e6) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-76,-78})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R=1e6) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-46,-48})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R=1e6) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-24,-18})));
  Modelica.Blocks.Sources.SineVariableFrequencyAndAmplitude sineA(
    useConstantAmplitude=true,
    constantAmplitude=sqrt(2)*Vbase/sqrt(3),
    phi(fixed=true, start=2.0943951023932)) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={26,-18})));
  Modelica.Blocks.Sources.Step f(
    height=deltaF,
    offset=fnorm,
    startTime=FstepTime)
    annotation (Placement(transformation(extent={{74,-22},{54,-2}})));
  Modelica.Blocks.Sources.SineVariableFrequencyAndAmplitude sineA1(
    useConstantAmplitude=true,
    constantAmplitude=sqrt(2)*Vbase/sqrt(3),
    phi(fixed=true, start=0)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={26,-48})));
  Modelica.Blocks.Sources.Step f1(
    height=deltaF,
    offset=fnorm,
    startTime=FstepTime)
    annotation (Placement(transformation(extent={{74,-52},{54,-32}})));
  Modelica.Blocks.Sources.SineVariableFrequencyAndAmplitude sineA2(
    useConstantAmplitude=true,
    constantAmplitude=sqrt(2)*Vbase/sqrt(3),
    phi(fixed=true, start=-2.0943951023932)) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={26,-78})));
  Modelica.Blocks.Sources.Step f2(
    height=deltaF,
    offset=fnorm,
    startTime=FstepTime)
    annotation (Placement(transformation(extent={{74,-82},{54,-62}})));
equation
  connect(C, signalVoltage.p)
    annotation (Line(points={{-100,60},{-64,60},{-64,-68}}, color={0,0,255}));
  connect(B, signalVoltage1.p) annotation (Line(points={{-100,0},{-30,0},
          {-30,-38}}, color={0,0,255}));
  connect(A, signalVoltage2.p) annotation (Line(points={{-100,-60},{-78,-60},
          {-78,-4},{-14,-4},{-14,-8}}, color={0,0,255}));
  connect(signalVoltage2.n, ground4.p)
    annotation (Line(points={{-14,-28},{-14,-94},{-64,-94}}, color={0,0,255}));
  connect(signalVoltage1.n, ground4.p)
    annotation (Line(points={{-30,-58},{-30,-94},{-64,-94}}, color={0,0,255}));
  connect(signalVoltage.n, ground4.p)
    annotation (Line(points={{-64,-88},{-64,-94}}, color={0,0,255}));
  connect(resistor.n, signalVoltage.n)
    annotation (Line(points={{-76,-88},{-64,-88}}, color={0,0,255}));
  connect(resistor.p, signalVoltage.p)
    annotation (Line(points={{-76,-68},{-64,-68}}, color={0,0,255}));
  connect(resistor1.p, signalVoltage1.p)
    annotation (Line(points={{-46,-38},{-30,-38}}, color={0,0,255}));
  connect(resistor1.n, signalVoltage1.n)
    annotation (Line(points={{-46,-58},{-30,-58}}, color={0,0,255}));
  connect(resistor2.n, signalVoltage2.n)
    annotation (Line(points={{-24,-28},{-14,-28}}, color={0,0,255}));
  connect(resistor2.p, signalVoltage2.p)
    annotation (Line(points={{-24,-8},{-14,-8}}, color={0,0,255}));
  connect(sineA.f, f.y)
    annotation (Line(points={{38,-12},{53,-12}},  color={0,0,127}));
  connect(sineA1.f, f1.y)
    annotation (Line(points={{38,-42},{53,-42}},  color={0,0,127}));
  connect(sineA2.f, f2.y)
    annotation (Line(points={{38,-72},{53,-72}},  color={0,0,127}));
  connect(signalVoltage.v, sineA2.y)
    annotation (Line(points={{-52,-78},{15,-78}}, color={0,0,127}));
  connect(signalVoltage1.v, sineA1.y)
    annotation (Line(points={{-18,-48},{15,-48}}, color={0,0,127}));
  connect(signalVoltage2.v, sineA.y)
    annotation (Line(points={{-2,-18},{15,-18}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>
Ideal three-phase source, grounded wye, with constant amplitude <code>sqrt(2)*Vbase/sqrt(3)</code> and a frequency that
steps from <code>fnorm</code> to <code>fnorm + deltaF</code> at <code>FstepTime</code>. Each phase is a
<code>Modelica.Blocks.Sources.SineVariableFrequencyAndAmplitude</code> (initial phase angles +120 degrees for A, 0 for B,
-120 degrees for C), so the phase angle stays continuous through the step; each source has a 1 MOhm shunt resistor.
</p>
<p>
Ported from <code>GridComponents.GridFStep</code> of <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a>: renamed, the four unused fault parameters
(<code>Vgrid</code>, <code>FaultVoltage</code>, <code>FaultTime</code>, <code>FaultDuration</code>) removed and the
copied descriptions corrected.
</p>
</html>"),
    Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
            lineColor={0,0,255}), Text(
          extent={{-64,58},{100,-52}},
          textColor={0,0,255},
          textString="Grid"),
        Text(
          extent={{-94,74},{-66,44}},
          textColor={28,108,200},
          textString="C"),
        Text(
          extent={{-94,14},{-66,-16}},
          textColor={28,108,200},
          textString="B"),
        Text(
          extent={{-94,-46},{-66,-76}},
          textColor={28,108,200},
          textString="A")}));
end GridFrequencyStep;
